package main

import (
	"fmt"
	"math"
	"strconv"
	"strings"
	"time"
)

func main() {
	dismantleTime("294277-01-01 00:00:00 +0000 UTC")
	dismantleTime("294277-01-01 23:59:59.999999 +0000 UTC")

	dismantleTime("-4714-11-23 23:59:59.999999 +0000 UTC")
	dismantleTime("-4714-11-23 00:00:00 +0000 UTC")

	return

	TimeInfinity := time.Unix(9224318016000, 0).UTC()
	TimeInfinitySec := float64(TimeInfinity.Unix())
	TimeNegativeInfinity := time.Unix(-210866803201, 999999000).UTC()
	TimeNegativeInfinitySec := float64(TimeNegativeInfinity.Unix())

	fmt.Printf("TimeInfinity: %v\n", TimeInfinity)
	fmt.Printf("TimeInfinitySec: %f\n", TimeInfinitySec)
	fmt.Printf("TimeNegativeInfinity: %v\n", TimeNegativeInfinity)
	fmt.Printf("TimeNegativeInfinitySec: %f\n", TimeNegativeInfinitySec)

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

// Given a time.Time or a string, demonstrate:
//   - How to construct it using the "time.Unix" api.
func dismantleTime(v interface{}) {
	switch t := v.(type) {
	case string:
		formats := []string{
			"2006-01-02 15:04:05.999999999 -0700 MST",
		}

		for _, format := range formats {
			tm, err := time.Parse(format, t)
			if err != nil {
				continue
			}
			dismantleTime(tm)
			return
		}

		tm, err := parseSpecialYear(t)
		if err == nil {
			dismantleTime(tm)
			return
		}
		fmt.Printf("err: %v\n", err)

		panic("invalid time format")

	case time.Time:
		if t.Location() != time.UTC {
			panic("time must be in UTC")
		}

		unix := t.Unix()
		nano := t.UnixNano()
		nano -= unix * 1000000000

		fmt.Printf("t: %v\n", t)
		fmt.Printf("t = time.Unix(%d, %d).UTC()\n", unix, nano)

		// verify
		t2 := time.Unix(unix, nano).UTC()
		if t2 != t {
			panic("verification failed")
		}
	}
}

func parseSpecialYear(timeStr string) (t time.Time, err error) {
	// Split the string to extract the year and the rest
	var year, rest string
	if strings.HasPrefix(timeStr, "-") {
		parts := strings.SplitN(timeStr, "-", 3)
		year = "-" + parts[1]
		rest = parts[2]
	} else {
		parts := strings.SplitN(timeStr, "-", 2)
		year = parts[0]
		rest = parts[1]
	}

	// Parse the rest of the time string
	suffix, err := time.Parse("01-02 15:04:05 -0700 MST", rest)
	if err != nil {
		return time.Time{}, err
	}

	yearInt, err := strconv.Atoi(year)
	if err != nil {
		return time.Time{}, err
	}

	t = time.Date(yearInt, suffix.Month(), suffix.Day(), suffix.Hour(), suffix.Minute(), suffix.Second(), suffix.Nanosecond(), suffix.Location())

	fmt.Println("Year:", year)
	fmt.Println("Parsed time:", t)
	return t, err
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
