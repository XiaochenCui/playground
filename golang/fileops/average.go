package fileops

import (
	"encoding/binary"
	"io"
	"os"

	log "github.com/sirupsen/logrus"
)

// Average calculate the average of all the numbers in the file
func Average(filename string) (size int, average float64) {
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	buffer := make([]byte, optimalBufferSize)
	sum := 0
	fi, err := os.Stat(filename)
	if err != nil {
		log.Fatal(err)
	}
	size = int(fi.Size() / 4)
	for {
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
			sum += int(data)
		}
	}
	average = float64(sum) / float64(size)
	log.Debugf("Sum: %d, size: %d, average: %e", sum, size, average)
	return
}

func average(filename string) (size int, average float64, sum int) {
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	buffer := make([]byte, optimalBufferSize)
	sum = 0
	fi, err := os.Stat(filename)
	if err != nil {
		log.Fatal(err)
	}
	size = int(fi.Size() / 4)
	for {
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
			sum += int(data)
		}
	}
	average = float64(sum) / float64(size)
	log.Debugf("[%v]Sum: %d, size: %d, average: %e", filename, sum, size, average)
	return
}
