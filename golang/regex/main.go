package main

import (
	"fmt"
	"regexp"
)

func main() {
	s := `"statement_time": {"wall_time": 1721509190748945569}, "tables"`

	re := regexp.MustCompile(`.+"wall_time": (\d+).+`)
	m := re.FindStringSubmatch(s)
	for i, v := range m {
		fmt.Printf("i: %v, v: %v\n", i, v)
	}
}
