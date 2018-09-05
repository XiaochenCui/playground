package algorithm

import (
	"encoding/binary"
)

// SumInt calucate sum of input and return result
func SumInt(input []int) int {
	var sum int

	for i := range input {
		sum += input[i]
	}

	return sum
}

// SumFloat64 calucate sum of input and return result
func SumFloat64(input []float64) float64 {
	var sum float64

	for i := range input {
		sum += input[i]
	}

	return sum
}

// SumBuffer calculate sum of numbers in bytes
func SumBuffer(bytes []byte) (sum int) {
	bytesSize := len(bytes)
	array := make([]int, 0, bytesSize/4)

	// Read numbers to array
	for i := 0; i+3 < bytesSize; i += 4 {
		bs := bytes[i : i+4]
		data := binary.BigEndian.Uint32(bs)
		array = append(array, int(data))
	}
	sum = SumInt(array)
	return
}
