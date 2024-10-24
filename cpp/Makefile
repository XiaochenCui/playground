# Variables
CXX = g++
CXXFLAGS = -std=c++20 -Wall
TARGET = build/iterator
SRC = iterator.cpp

# Default rule: compile and run
all: $(TARGET) run

# Rule to compile the program
$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SRC)

# Rule to run the program
run: $(TARGET)
	./$(TARGET)

# Clean up compiled files
clean:
	rm -f $(TARGET)

# Phony targets (to avoid filename conflicts)
.PHONY: all clean run
