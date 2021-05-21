package main

import (
	"fmt"
	"time"
	"unsafe"
)

func main() {
	buffer := NewRingBuffer(42)
	buffer.list = make([]interface{}, 1, 2)
	fmt.Println(unsafe.Offsetof(buffer.mask))       // 0
	fmt.Println(unsafe.Offsetof(buffer.readOffset)) // 8
	fmt.Println(unsafe.Offsetof(buffer.endOffset))  // 16
	fmt.Println(unsafe.Offsetof(buffer.end))        // 24
	fmt.Println(unsafe.Offsetof(buffer.list))       // 32
	fmt.Println(unsafe.Sizeof(buffer))              // 8
	fmt.Println(unsafe.Sizeof(*buffer))             // 56
	fmt.Println(unsafe.Sizeof(buffer.end))          // 1
	fmt.Println(unsafe.Sizeof(buffer.list))         // 24

	// 56: unsafe.Sizeof(*buffer)
	dataBytes := (*[56]byte)(unsafe.Pointer(buffer))
	fmt.Printf("Bytes are %#v\n", dataBytes)
}

var (
	// invalid memory address or nil pointer dereference
	sleepDuration = time.Microsecond

	// sleepDuration = 50 * time.Microsecond
)

type Entity struct {
	ID int
	V  interface{}
}

type RingBuffer struct {
	mask       int
	readOffset int
	endOffset  int
	end        bool
	list       []interface{}
}

func NewRingBuffer(size int) *RingBuffer {
	return &RingBuffer{
		mask:       size,
		readOffset: 0,
		endOffset:  10000 * 10000,
		end:        false,
		list:       make([]interface{}, size),
	}
}

func (b *RingBuffer) SetEnd(id int) {
	b.end = true
	b.endOffset = id
}

func (b *RingBuffer) Put(e Entity) {
	for e.ID >= b.readOffset+b.mask {
		time.Sleep(sleepDuration)
	}
	b.list[e.ID%b.mask] = e.V
}

// return nil for end
func (b *RingBuffer) Get() interface{} {
	if b.end && b.readOffset == b.endOffset {
		return nil
	}

	index := b.readOffset % b.mask
	v := b.list[index]
	for v == nil {
		time.Sleep(sleepDuration)
		v = b.list[index]
	}
	b.list[index] = nil
	b.readOffset++
	return v
}

func (b *RingBuffer) Clear() {
	b.list = nil
}
