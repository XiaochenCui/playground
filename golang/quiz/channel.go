// https://twitter.com/mlowicki/status/1039993406364237830

package main

import "fmt"

func main() {
	ch := make(chan int, 3)
	ch <- 1
	ch <- 2
	ch <- 3
	for {
		select {
		case n := <-ch:
			fmt.Println(n)
			break
		}
	}
}
