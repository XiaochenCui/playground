run: build/hello build/swap build/practice_1a build/practice_1b
	# ./build/hello
	# ./build/swap
	# ./build/practice_1a
	# ./build/practice_1b
	./build/copy ./text/a.txt ./text/b.txt -a
	./build/cat ./text/a.txt ./text/c.txt

build/hello: hello.c
	mkdir -p build
	gcc -o build/hello hello.c

build/swap: swap.c
	mkdir -p build
	gcc -o build/swap swap.c

build/practice_1a: ./practice_1a/swap.c
	mkdir -p build
	gcc -o build/practice_1a ./practice_1a/swap.c

build/practice_1b: ./practice_1b/modify.c ./practice_1b/copy.c ./practice_1b/cat.c
	mkdir -p build
	gcc -o build/practice_1b ./practice_1b/modify.c
	gcc -o build/copy ./practice_1b/copy.c
	gcc -o build/cat ./practice_1b/cat.c
