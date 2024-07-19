package main

import "fmt"

type s1 struct {
	i int
	s []byte
}

func main() {
	o := s1{
		i: 1,
		s: []byte("hi"),
	}
	fmt.Println(o)
	modify(o)
	fmt.Println(o)
	modifyReference(&o)
	fmt.Println(o)
}

func modify(s s1) {
	s.i++
	s.s = append(s.s, []byte(" modify")...)
}

func modifyReference(s *s1) {
	s.i++
	s.s = append(s.s, []byte(" modifyReference")...)
}
