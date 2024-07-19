package node

import (
	"net"
	"net/rpc"
	"os"
	"os/signal"
	"sync"

	log "github.com/sirupsen/logrus"
)

// Master schedule tasks
type Master struct {
	addr             string
	workers          []string // each worker's socket name -- its RPC address
	workersThreshold int
	chunkSize        int
	l                net.Listener
	mutex            *sync.Mutex
	successedJobs    int
}

// Register is an RPC method that is called by workers after they have started
// up to report that they are ready to receive tasks.
func (master *Master) Register(args *RegisterArgs, _ *struct{}) error {
	log.Debugf("Register: worker %s", args.Worker)
	master.workers = append(master.workers, args.Worker)
	log.Debugf("Current workers count: %d", len(master.workers))
	return nil
}

// Unregister is an RPC method that is called by workers to unregist themselfs
func (master *Master) Unregister(args *UnregisterArgs, _ *struct{}) error {
	log.Debugf("Unregister: worker %s", args.Worker)
	for i, addr := range master.workers {
		if addr == args.Worker {
			master.workers = append(master.workers[:i], master.workers[i+1:]...)
			log.Debugf("Current workers count: %d", len(master.workers))
			return nil
		}
	}
	log.Errorf("Not found worker %s during unregistion", args.Worker)
	return nil
}

func (master *Master) shutdown() {
	os.Exit(0)
}

// NewMaster create master add achieve initial actions
func NewMaster(addr string, workers int, chunkSize int) (master *Master) {
	master = new(Master)

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	go func(master *Master) {
		for sig := range c {
			log.Infof("Signal %v received, program is going to quit gracefully", sig)
			master.shutdown()
		}
	}(master)

	master.addr = addr
	master.workersThreshold = workers
	master.chunkSize = chunkSize
	master.mutex = &sync.Mutex{}
	master.startRPCServer()
	return
}

func (master *Master) distribute(doTaskArgs *DoTaskArgs) {
}

func (master *Master) startRPCServer() {
	rpcs := rpc.NewServer()
	rpcs.Register(master)
	l, e := net.Listen("tcp", master.addr)
	if e != nil {
		log.Fatal("RegstrationServer: ", master.addr, " error: ", e)
	}
	log.Infof("Master run with rpc port %s", master.addr)
	master.l = l

	go func() {
		for {
			conn, err := master.l.Accept()
			if err != nil {
				log.Error("RegistrationServer: accept error", err)
			}
			go func() {
				rpcs.ServeConn(conn)
				conn.Close()
			}()
		}
	}()
}

// Wait blocks until the currently scheduled work has completed.
func (master *Master) wait() {
}
