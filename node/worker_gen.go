package node

import (
	"playground/fileops"

	log "github.com/sirupsen/logrus"
)

// GenerateArgs used for send generate request
type GenerateArgs struct {
	DoTaskArgs
	Min, Max, Size int
}

// Generate api
func (wk *Worker) Generate(arg *GenerateArgs, _ *struct{}) error {
	log.Infof("Generate file: %s", wk.originFile)
	fileops.GenerateFile(arg.Min, arg.Max, arg.Size, wk.originFile)
	return nil
}
