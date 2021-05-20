package main

import "time"

func main() {
	buffer := NewRingBuffer(42)
	count := 1000 * 10000
	putList := make([]int, count)
	for i := 0; i < count; i++ {
		putList[i] = i
	}
	getList := make([]int, 0)

	put := func() {
		for i := 0; i < count; i++ {
			buffer.Put(Entity{
				ID: i,
				V:  putList[i],
			})
		}
		buffer.SetEnd(count)
	}
	go put()

	for {
		v := buffer.Get()
		if v == nil {
			break
		}
		getList = append(getList, v.(int))
	}
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
