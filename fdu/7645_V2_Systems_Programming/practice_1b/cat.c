#include <stdio.h>   // perror, fprintf
#include <fcntl.h>   // open, O_RDONLY
#include <unistd.h>  // read, write, close, STDOUT_FILENO

#define BUFFER_SIZE 1024

void cat_file(const char *filename) {
    int fd = open(filename, O_RDONLY);
    if (fd == -1) {
        perror("Error opening file");
        return;
    }
    
    char buffer[BUFFER_SIZE];
    ssize_t bytes_read;
    while ((bytes_read = read(fd, buffer, BUFFER_SIZE)) > 0) {
        if (write(STDOUT_FILENO, buffer, bytes_read) == -1) {
            perror("Error writing to stdout");
            close(fd);
            return;
        }
    }
    
    if (bytes_read == -1) {
        perror("Error reading file");
    }
    
    close(fd);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file1> <file2> ...\n", argv[0]);
        return 1;
    }
    
    for (int i = 1; i < argc; i++) {
        cat_file(argv[i]);
    }
    
    return 0;
}
