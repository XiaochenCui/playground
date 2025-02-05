run: build/hello build/swap
	./build/hello
	./build/swap

build/hello: hello.c
	mkdir -p build
	gcc -o build/hello hello.c

build/swap: swap.c
	mkdir -p build
	gcc -o build/swap swap.c
