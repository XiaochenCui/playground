package fileops

import (
	"encoding/binary"
	"io"
	"os"
	"testing"

	log "github.com/sirupsen/logrus"
)

func init() {
	log.SetLevel(log.DebugLevel)
}

func isOrdered(filename string) bool {
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	buffer := make([]byte, optimalBufferSize)
	number := 0
	for chunkIndex := 0; ; chunkIndex++ {
		bytesread, err := file.Read(buffer)
		if err != nil {
			if err != io.EOF {
				log.Debug(err)
			}
			break
		}
		for i := 0; i+3 < bytesread; i += 4 {
			bs := buffer[i : i+4]
			data := binary.BigEndian.Uint32(bs)
			if int(data) < number {
				index := chunkIndex*optimalBufferSize + i
				log.Errorf("Number error in %d: %d", index, data)
				return false
			}
		}
	}

	return true
}

func TestSort(t *testing.T) {
	GenerateFile(min, max, *size, filename)
	outFile := Sort(filename)

	// Check content
	oriSize, oriAve := Average(filename)
	newSize, newAve := Average(outFile)
	if oriSize != newSize {
		t.Errorf("Size not match: %d(origin) vs %d(new)", oriSize, newSize)
	}
	if oriAve != newAve {
		t.Errorf("Average not match: %f(origin) vs %f(new)", oriAve, newAve)
	}

	// Check order
	if !isOrdered(outFile) {
		t.Errorf("Outfile %v not ordered", outFile)
	}
}
