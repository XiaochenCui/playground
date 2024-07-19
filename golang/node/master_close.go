package node

import log "github.com/sirupsen/logrus"

// CloseWorkers close all workers
func (master *Master) CloseWorkers() {
	for {
		if len(master.workers) >= master.workersThreshold {
			for _, addr := range master.workers {
				ok := call(addr, "Worker.Shutdown", new(struct{}), new(struct{}))
				if ok == false {
					log.Printf("closeWorkers: RPC %s close error", addr)
				}
			}
			master.shutdown()
		}
	}
}
