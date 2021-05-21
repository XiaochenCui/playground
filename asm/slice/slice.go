package main

func main() {
	s := make([]int, 1, 10)
	assign(s, 3)
}

func assign(s []int, i int) {
	s[i] = i
}