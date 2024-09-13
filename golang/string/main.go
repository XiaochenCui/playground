package main

import "fmt"

func main() {
	s := fmt.Sprintf("a ", "b ", "c")
	fmt.Printf("s: %v\n", s)
	fmt.Printf("s: %s\n", s)

	bs := []byte{0,0,0,0,10,38,21,120,105,97,111,99,104,101,110,95,100,101,98,117,103,95,105,110,115,101,114,116,22,16,120,105,97,111,99,104,101,110,95,100,101,102,97,117,108,116}
	fmt.Printf("bs: %v\n", bs)
	fmt.Printf("safeString(bs): %s\n", safeString(bs))
}

// Return the string representation of the byte slice, only valid ASCII characters
// and symbols are allowed. Other characters are printed in hex format.
func safeString(bs []byte) string {
	s := ""
	for _, b := range bs {
		if b < 32 || b > 126 {
			s += fmt.Sprintf("\\x%02x", b)
		} else {
			s += string(b)
		}
	}
	return s
}