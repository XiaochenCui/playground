package algorithm

import (
	"math"
	"math/rand"
	"testing"
	"time"

	log "github.com/sirupsen/logrus"
)

func init() {
	log.SetLevel(log.DebugLevel)
}

func TestQuerkSort(t *testing.T) {
	min, max, size := 0, int(math.Pow10(9)), 50
	array := make([]int, size)
	rand.Seed(time.Now().UnixNano())
	var number int
	for i := 0; i < size; i++ {
		number = rand.Intn(max-min) + min
		array[i] = number
	}
	log.Debugf("Origin array: %v", array)
	originSum := SumInt(array)
	QuickSort(array)
	log.Debugf("Sorted array: %v", array)
	newSum := SumInt(array)
	log.Debugf("Sum :%v, %v", originSum, newSum)
	if originSum != newSum {
		t.Errorf("Sum doesn't match: %v, %v", originSum, newSum)
	}
	for i := 1; i < len(array); i++ {
		if array[i-1] > array[i] {
			t.Errorf("Order incorrect: %v[%v], %v[%v]", array[i-1], i-1, array[i], i)
		}
	}
}
