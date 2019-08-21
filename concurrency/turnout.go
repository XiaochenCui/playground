package main

import "fmt"
import "time"

func main() {
	proA := make(chan int)
	proB := make(chan int)
	conA := make(chan int)
	conB := make(chan int)
	go func(){
		for i := 0; i < 10; i++ {
			proA <- i
			time.Sleep(1 * time.Second)
		}
		close(proA)
		fmt.Println("proA finish")
	}()
	go func(){
		for i := 100; i < 105; i++ {
			proB <- i
			time.Sleep(1 * time.Second)
		}
		close(proB)
		fmt.Println("proB finish")
	}()
	go func(){
		var data int
		for data = range conA {
			fmt.Printf("consume from conA: %d\n", data)
		}
	}()
	go func(){
		var data int
		for data = range conB {
			fmt.Printf("consume from conB: %d\n", data)
		}
	}()

	turnOut(proA, proB, conA, conB)
}

func turnOut(InA, InB <-chan int, OutA, OutB chan<- int) {
	var data int
	var more bool
	for {
		select {
		case data, more = <-InA:
		case data, more = <-InB:
		}

		if !more {
			fmt.Printf("data: %v, more: %v\n", data, more)
			return
		}

		select {
		case OutA <- data:
		case OutB <- data:
		}
	}
}
