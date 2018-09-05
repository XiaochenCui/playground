package fileops

import (
	"encoding/binary"
	"fmt"
	"io"
	"os"
	"playground/algorithm"
	"runtime"
	"sync"

	log "github.com/sirupsen/logrus"
)

// Sort sort inFile(uint32) and store the result in outFile in increments.
func Sort(inFilename string) (outFilename string) {
	file, err := os.Open(inFilename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	fi, e := os.Stat(inFilename)
	fileSize := int(fi.Size())
	if e != nil {
		log.Error(e)
	}

	concurrent := runtime.GOMAXPROCS(0)

	chunks := int(fileSize / optimalBufferSize)
	if fileSize%optimalBufferSize != 0 {
		chunks++
	}

	chunkChan := make(chan []byte, 10)

	// Read file's content into chunkChan
	go func() {
		buffer := make([]byte, optimalBufferSize)
		for {
			bytesread, err := file.Read(buffer)
			if err != nil {
				if err != io.EOF {
					log.Debug(err)
				}
				break
			}
			newBuffer := make([]byte, bytesread)
			copy(newBuffer, buffer)
			select {
			case chunkChan <- newBuffer:
			}
		}
	}()

	var wg sync.WaitGroup

	tmpFiles := fileSize/optimalBufferSize + 1
	tmpFileSlice := make([]string, 0, tmpFiles)
	done := false
	receiveTotal := 0
	for i := 0; i < concurrent; i++ {
		wg.Add(1)
		go func(goIndex int) {
			j := 0
			for {
				select {
				case bytes := <-chunkChan:
					bytesSize := len(bytes)
					receiveTotal += bytesSize

					array := make([]int, 0, bytesSize/4)

					// Read numbers to array
					for k := 0; k+3 < bytesSize; k += 4 {
						bs := bytes[k : k+4]
						data := binary.BigEndian.Uint32(bs)
						array = append(array, int(data))
					}

					// Sort
					algorithm.QuickSort(array)

					// Write to disk
					tmpFile := fmt.Sprintf("tmp-sort-%d-chunk-%d", goIndex, j)
					WriteArrayUint32(tmpFile, array)
					tmpFileSlice = append(tmpFileSlice, tmpFile)

					j++

					// Check if we reached end of file
					if receiveTotal == fileSize {
						done = true
						wg.Done()
						return
					}
				default:
					if done {
						wg.Done()
						return
					}
				}
			}
		}(i)
	}

	// Wait for all chunk sorted
	wg.Wait()

	// Merge
	mapNumberFiles := make(map[int][]*os.File)

	// Init bidirectional map
	buffer := make([]byte, 4)
	var number int
	for _, filename := range tmpFileSlice {
		file, err = os.Open(filename)
		if err != nil {
			log.Fatal(err)
		}
		defer file.Close()

		bytesread, err := file.Read(buffer)
		if err != nil {
			log.Error(err)
			continue
		}
		if bytesread != 4 {
			log.Error("Buffer size is not 4")
		}

		number = int(binary.BigEndian.Uint32(buffer))
		mapNumberFiles[number] = append(mapNumberFiles[number], file)
	}

	// Sort
	outFilename = "out-" + inFilename
	outFile, err := os.Create(outFilename)
	if err != nil {
		log.Fatal(err)
	}
	defer outFile.Close()

	bytes := make([]byte, 4)
	readFiles := make([]*os.File, 0, len(tmpFileSlice))
	chunkSize := optimalBufferSize
	chunk := make([]byte, 0, chunkSize+4)
	for len(mapNumberFiles) > 0 {
		min, _ := minMaxKey(mapNumberFiles)
		for _, file = range mapNumberFiles[min] {
			binary.BigEndian.PutUint32(bytes, uint32(min))
			chunk = append(chunk, bytes...)
			if len(chunk) >= chunkSize {
				file.Write(chunk)
				chunk = chunk[:0]
			}
			outFile.Write(bytes)
			readFiles = append(readFiles, file)
		}
		delete(mapNumberFiles, min)

		for _, file = range readFiles {
			bytesread, err := file.Read(buffer)
			if err != nil {
				if err != io.EOF {
					log.Debug(err)
				}
				continue
			}
			if bytesread != 4 {
				log.Error("Buffer size is not 4")
			}

			number = int(binary.BigEndian.Uint32(buffer))
			mapNumberFiles[number] = append(mapNumberFiles[number], file)
		}
		readFiles = readFiles[:0]
	}
	file.Write(chunk)

	return outFilename
}

func minMaxKey(m map[int][]*os.File) (minKey, maxKey int) {
	keys := make([]int, 0, len(m))
	for k := range m {
		keys = append(keys, k)
	}

	algorithm.QuickSort(keys)

	return keys[0], keys[len(m)-1]
}
