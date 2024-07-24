package main

import (
	"fmt"
	"math"
)

func main() {
	binarys := []byte{50, 57, 52, 50, 55, 54, 45, 49, 50, 45, 51, 49, 32, 49, 54, 58, 48, 48, 58, 48, 48, 32, 45, 48, 56, 48, 48, 32, 80, 83, 84}
	str := string(binarys)
	fmt.Printf("Binary to string: %s\n", str)

	str = "infinity"
	fmt.Printf("String to binary: %v\n", []byte(str))

	str = "-infinity"
	fmt.Printf("String to binary: %v\n", []byte(str))

	n := math.MinInt64
	// to little endian binary
	binarys = make([]byte, 8)
	for i := 0; i < 8; i++ {
		binarys[i] = byte(n >> uint(i*8))
	}
	fmt.Printf("Int64 to binary: %v\n", binarys)
}
