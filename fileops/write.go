package fileops

import (
	"encoding/binary"
	"os"

	log "github.com/sirupsen/logrus"
)

// WriteArrayUint32 write array to dist
func WriteArrayUint32(filename string, array []int) {
	file, err := os.Create(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	bs := make([]byte, 4)
	chunk := make([]byte, 0, optimalBufferSize+4)
	for _, number := range array {
		binary.BigEndian.PutUint32(bs, uint32(number))
		chunk = append(chunk, bs...)
		if len(chunk) >= optimalBufferSize {
			file.Write(chunk)
			chunk = chunk[:0]
		}
	}
	file.Write(chunk)
}
