package node

import (
	"net"
	"net/rpc"
	"os"
	"os/signal"
	"time"

	log "github.com/sirupsen/logrus"
)

// Worker run task and communicationi with master
type Worker struct {
	name       string
	addr       string
	masterAddr string
	l          net.Listener
	originFile string
	tmpFile    string
	resFile    string
}

func (wk *Worker) register() {
	args := new(RegisterArgs)
	args.Worker = wk.addr
	for {
		call(wk.masterAddr, "Master.Register", args, new(struct{}))
		time.Sleep(3 * time.Second)
	}
}

func (wk *Worker) unregister() {
	args := new(UnregisterArgs)
	args.Worker = wk.addr
	ok := call(wk.masterAddr, "Master.Unregister", args, new(struct{}))
	if ok == false {
		log.Printf("Unregister: RPC %s unregister error", wk.masterAddr)
	}
}

func (wk *Worker) shutdown() {
	wk.unregister()
	os.Exit(0)
}

// Shutdown by master
func (wk *Worker) Shutdown(_ *struct{}, _ *struct{}) error {
	log.Infof("Shutdown command received from master, worker going to quit 2 seconds later")
	go func() {
		os.Exit(0)
	}()
	return nil
}

// RunWorker sets up a connection with the master, registers its address,
// and waits for tasks to be scheduled.
func RunWorker(masterAddr string, addr string) {
	log.Infof("RunWorker %s", addr)

	wk := new(Worker)

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	go func(wk *Worker) {
		for sig := range c {
			log.Infof("Signal %v received, program is going to quit gracefully", sig)
			wk.shutdown()
		}
	}(wk)

	hostname, err := os.Hostname()
	if err != nil {
		log.Fatal(err)
	}
	wk.name = hostname
	wk.addr = hostname + addr
	wk.masterAddr = masterAddr
	wk.originFile = "chaos-" + wk.addr
	rpcs := rpc.NewServer()
	rpcs.Register(wk)
	l, e := net.Listen("tcp", addr)
	if e != nil {
		log.Fatal("RunWorker: worker ", addr, " error: ", e)
	}
	wk.l = l
	go wk.register()

	for {
		conn, err := wk.l.Accept()
		if err != nil {
			break
		}
		go rpcs.ServeConn(conn)
	}
	wk.l.Close()
	log.Infof("RunWorker %s exit", addr)
}
