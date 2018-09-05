package fileops

import (
	"encoding/binary"
	"math/rand"
	"os"
	"time"

	log "github.com/sirupsen/logrus"
)

const (
	// 64kB
	optimalBufferSize = 64 * 1024
)

// GenerateFile write random int32 to file
// size represents number of numbers
func GenerateFile(min, max, size int, filename string) {
	generateFile(min, max, size, optimalBufferSize, filename)
}

func generateFile(min, max, size, chunkSize int, filename string) {
	rand.Seed(time.Now().UnixNano())
	file, err := os.Create(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	bs := make([]byte, 4)
	chunk := make([]byte, 0, chunkSize+4)
	var number uint32
	for i := 0; i < size; i++ {
		number = uint32(rand.Intn(max-min) + min)
		binary.BigEndian.PutUint32(bs, number)
		chunk = append(chunk, bs...)
		if len(chunk) >= chunkSize {
			file.Write(chunk)
			chunk = chunk[:0]
		}
	}
	file.Write(chunk)
}
