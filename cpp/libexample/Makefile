# Define the compiler and archiver
CC = g++
AR = ar
CFLAGS = -Wall -Werror -O2

# Define the source file and object file
SRC = example.cc
OBJ = $(SRC:.cc=.o)

# Define the target library
TARGET_DIR = ./lib
TARGET = $(TARGET_DIR)/libexample.a

# Default target
all: $(TARGET)

# Ensure the target directory exists
$(TARGET_DIR):
	mkdir -p $(TARGET_DIR)

# Rule to create the static library
$(TARGET): $(OBJ) | $(TARGET_DIR)
	$(AR) rcs $@ $^

# Rule to compile source file into object file
%.o: %.cc
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJ) $(TARGET)

.PHONY: all clean