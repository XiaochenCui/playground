package main

import (
	"fmt"
	"math"
	"time"
)

func main() {
	var tm time.Time

	tm = time.Now()
	fmt.Printf("tm: %v\n", tm)
	fmt.Printf("tm.UnixNano: %v\n", tm.UnixNano())

	tm = time.Unix(0, 1721506828342255347)
	fmt.Printf("tm: %v\n", tm)

	tm = time.Unix(0, 1721510233961864495)
	fmt.Printf("tm: %v\n", tm)

	tm = time.Unix(9224318016000, 0)
	fmt.Printf("t: %v\n", tm)

	PGEpochJDate := time.Date(2000, 1, 1, 0, 0, 0, 0, time.UTC)

	diff := tm.Sub(PGEpochJDate)
	fmt.Printf("diff: %v\n", diff)
	fmt.Printf("diff: %v\n", diff.Microseconds())

	fmt.Printf("math.MaxInt64: %v\n", math.MaxInt64)

	tm = PGEpochJDate
	for i := 0; i < 1000; i++ {
		tm = tm.Add(time.Duration(math.MaxInt64))
	}
	fmt.Printf("t: %v\n", tm)
	fmt.Printf("t.Unix: %v\n", tm.Unix())
	fmt.Printf("t.UnixNano: %v\n", tm.UnixNano())

	getBinaryStr("2004-10-19 10:23:54")

	getBinaryStr("0216-05-04 01:16:18")

	getBinary(time.Unix(9224318016000, 0).UTC())
	getBinary(time.Unix(-210866803201, 999999000).UTC())

	getBinary(time.Unix(9286454318454, 775807000).UTC())
	getBinary(time.Unix(9224318721654, 775807000).UTC())
}

func getBinaryStr(tStr string) {
	t, err := time.Parse("2006-01-02 15:04:05", tStr)
	if err != nil {
		fmt.Printf("err: %v\n", err)
		return
	}
	getBinary(t)
}

func getBinary(t time.Time) {
	fmt.Printf("=== getBinary, t: %v\n", t)

	tStr := fmt.Sprint(t)

	textAsBinary := []byte(tStr)
	fmt.Printf("textAsBinary: %v\n", textAsBinary)

	PGEpochJDate := time.Date(2000, 1, 1, 0, 0, 0, 0, time.UTC)

	diff := t.Sub(PGEpochJDate).Microseconds()
	fmt.Printf("diff (microseconds): %v\n", diff)

	// get big endian binary representation of diff
	binaryDiff := make([]byte, 8)
	for i := 0; i < 8; i++ {
		binaryDiff[i] = byte(diff >> uint(8*(7-i)))
	}
	fmt.Printf("binaryDiff: %v\n", binaryDiff)
}
