package main

import (
	"log"
)

// bigBytes allocates 100 megabytes
func bigBytes() *[]byte {
	s := make([]byte, 100000000)
	return &s
}

func main() {
	for i := 0; i < 10; i++ {
		s := bigBytes()
		if s == nil {
			log.Println("oh noes")
		}
	}
}
