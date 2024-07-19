package node

import (
	"math"
	"time"

	log "github.com/sirupsen/logrus"
)

// Generate generate chunkSize numbers in each pod
func (master *Master) Generate() {
	for {
		if len(master.workers) >= master.workersThreshold {
			currentTime := time.Now()
			log.Info("Start time of task: ", currentTime.Format("2006-01-02 15:04:05.000000"))
			startTime := currentTime.UnixNano()
			log.Debugf("Current workers: %v", master.workers)

			args := GenerateArgs{
				DoTaskArgs: DoTaskArgs{
					JobName: "generate",
				},
				Min:  1,
				Max:  int(math.Pow10(9)),
				Size: master.chunkSize,
			}
			for _, workerAddr := range master.workers {
				go func(workerAddr string) {
					success := call(workerAddr, "Worker.Generate", &args, nil)
					if success {
						master.mutex.Lock()
						master.successedJobs++
						master.mutex.Unlock()
						log.Infof("Task %s on worker %s success", args.JobName, workerAddr)
					} else {
						log.Errorf("Task %s on worker %s failed", args.JobName, workerAddr)
					}
				}(workerAddr)
			}
			for master.successedJobs < master.workersThreshold {
			}

			endTime := time.Now().UnixNano()
			total := int(master.chunkSize * len(master.workers))
			duration := float64(endTime-startTime) / float64(math.Pow10(9))
			log.Infof("Generate %e numbers on %d pods in %f seconds", float64(total), len(master.workers), duration)
			master.shutdown()
		}
	}
}
