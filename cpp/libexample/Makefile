# Define the compiler and archiver
CC = g++
AR = ar
CFLAGS = -Wall -Werror -O2

# Define the source file and object file
SRC = example.cc
OBJ = $(SRC:.cc=.o)

# Define the target library
TARGET = libexample.a

# Default target
all: $(TARGET)

# Rule to create the static library
$(TARGET): $(OBJ)
	$(AR) rcs $@ $^

# Rule to compile source file into object file
%.o: %.cc
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean