package main

import (
	"fmt"

	"github.com/prometheus/procfs"
)

func main() {
	if _, err := procfs.NewStat(); err == nil {
		fmt.Println("OK")
	} else {
		fmt.Println("process metrics not supported on this platform")
	}
}
