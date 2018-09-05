package node

import (
	"playground/fileops"

	log "github.com/sirupsen/logrus"
)

// AverageArgs for send arverage request
type AverageArgs struct {
	DoTaskArgs
}

// AverageResult holds the result of average action
type AverageResult struct {
	Size    int
	Average float64
}

// Average api
func (wk *Worker) Average(arg *AverageArgs, res *AverageResult) error {
	log.Infof("Calculate average for numbers in %s", wk.originFile)
	res.Size, res.Average = fileops.Average(wk.originFile)
	return nil
}
