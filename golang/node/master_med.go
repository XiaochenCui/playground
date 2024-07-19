package node

import log "github.com/sirupsen/logrus"

type interval struct {
	mix, max, count int
}

// Median calculate the median of all pods' numbers
func (master *Master) Median() {
	for {
		if len(master.workers) >= master.workersThreshold {
			//currentTime := time.Now()
			//log.Info("Start time of task: ", currentTime.Format("2006-01-02 15:04:05.000000"))
			//startTime := currentTime.UnixNano()
			//log.Debugf("Current workers: %v", master.workers)

			master.successedJobs = 0
			averageArgs := AverageArgs{
				DoTaskArgs: DoTaskArgs{
					JobName: "average",
				},
			}
			averageResult := AverageResult{}
			sum := 0.0
			size := 0
			for _, workerAddr := range master.workers {
				go func(workerAddr string) {
					success := call(workerAddr, "Worker.Average", &averageArgs, &averageResult)
					if success {
						log.Debugf("Size: %d, average: %e", averageResult.Size,
							averageResult.Average)
						master.mutex.Lock()
						master.successedJobs++
						sum += float64(averageResult.Size) * averageResult.Average
						size += averageResult.Size
						master.mutex.Unlock()
						log.Infof("Task %s on worker %s success", averageArgs.JobName, workerAddr)
					} else {
						log.Errorf("Task %s on worker %s failed", averageArgs.JobName, workerAddr)
					}
				}(workerAddr)
			}
			for master.successedJobs < master.workersThreshold {
			}

			//log.Infof("Sum: %e, size: %d, average: %e", sum, size, float64(sum)/float64(size))
			//endTime := time.Now().UnixNano()
			//duration := float64(endTime-startTime) / float64(math.Pow10(9))
			//log.Infof("Get average in %f seconds", duration)
			master.shutdown()
		}
	}
}
