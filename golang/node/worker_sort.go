package node

// SortArgs for send arverage request
type SortArgs struct {
	DoTaskArgs
}

// Sort api
func (wk *Worker) Sort(arg *SortArgs, _ struct{}) error {
	return nil
}
