package node

import (
	"net/rpc"

	log "github.com/sirupsen/logrus"
)

// RegisterArgs is the argument passed when a worker registers with the master.
type RegisterArgs struct {
	Worker string
}

// UnregisterArgs is the argument passed when a worker unregisters with the master.
type UnregisterArgs struct {
	Worker string
}

// DoTaskArgs holds the arguments that are passed to a worker when a job is
// scheduled on it.
type DoTaskArgs struct {
	JobName string
}

func call(srv string, rpcname string,
	args interface{}, reply interface{}) bool {
	c, errx := rpc.Dial("tcp", srv)
	if errx != nil {
		log.Error(errx)
		return false
	}
	defer c.Close()

	err := c.Call(rpcname, args, reply)
	if err == nil {
		return true
	}

	log.Error(err)
	return false
}
