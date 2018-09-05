package main

import (
	"flag"
	"playground/node"
	"testing"

	"github.com/onrik/logrus/filename"
	log "github.com/sirupsen/logrus"
)

func init() {
	filenameHook := filename.NewHook()
	log.AddHook(filenameHook)
	log.SetLevel(log.DebugLevel)
}

var size = flag.Int("size", 10, "")

func TestGen(t *testing.T) {
	workers := 2
	masterAddr := "0.0.0.0:8000"
	go func() {
		node.RunWorker(masterAddr, ":8001")
	}()
	go func() {
		node.RunWorker(masterAddr, ":8002")
	}()
	master := node.NewMaster(masterAddr, workers, *size)
	master.Generate()
}
