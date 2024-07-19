package fileops

import (
	"encoding/binary"
	"flag"
	"os"
	"playground/algorithm"
	"testing"

	fn "github.com/onrik/logrus/filename"
	log "github.com/sirupsen/logrus"
)

func init() {
	filenameHook := fn.NewHook()
	log.AddHook(filenameHook)
	log.SetLevel(log.DebugLevel)
}

const (
	min      = 1
	max      = 1000000000 // 10^9
	filename = "chaos-test"
)

var size = flag.Int("size", 10, "number of numbers")
var chunkSize = flag.Int("chunkSize", 4, "number of bytes written to dist at one time")

func generate(filename string, size int) (array []int) {
	GenerateFile(min, max, size, filename)

	fi, e := os.Stat(filename)
	fileSize := fi.Size()
	log.Debugf("File size: %d", fileSize)
	if e != nil {
		log.Error(e)
	}
	buffer := make([]byte, fileSize)

	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	bytesread, err := file.Read(buffer)
	if err != nil {
		log.Debug(err)
	}
	array = make([]int, 0, bytesread/4)
	for i := 0; i+3 < bytesread; i += 4 {
		bs := buffer[i : i+4]
		data := binary.BigEndian.Uint32(bs)
		array = append(array, int(data))
	}
	return array
}

func TestGenerate(t *testing.T) {
	log.Info("start...")
	GenerateFile(min, max, *size, filename)
	fi, e := os.Stat(filename)
	log.Debugf("File size: %d", fi.Size())
	if e != nil {
		t.Error(e)
	}
	if int(fi.Size()) != *size*4 {
		t.Errorf("File size (%d) does not meet expectations (%d)", fi.Size(), *size*4)
	}
}

func BenchmarkGenerate(b *testing.B) {
	log.Info("start...")
	if b.N < 5 {
		b.N = 5
	}
	for i := 0; i < b.N; i++ {
		generateFile(min, max, *size, *chunkSize, filename)
		fi, e := os.Stat(filename)
		log.Debugf("File size: %d", fi.Size())
		if e != nil {
			b.Error(e)
		}
		if int(fi.Size()) != *size*4 {
			b.Errorf("File size (%d) does not meet expectations (%d)", fi.Size(), *size*4)
		}
	}
}

func TestAverage(t *testing.T) {
	array := generate(filename, *size)
	log.Debugf("Array: %v", array)
	sum := algorithm.SumInt(array)

	resultSize, ave := Average(filename)
	if resultSize != *size {
		t.Errorf("Result size %d does not match desired size %d", resultSize, *size)
	}
	resultSum := float64(resultSize) * ave
	if float64(resultSum) != resultSum {
		t.Errorf("Sum %d does not match result sum %v", sum, resultSum)
	}
}
