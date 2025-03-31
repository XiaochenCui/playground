#include <stdio.h>   // printf, perror
#include <string.h>  // strcmp
#include <fcntl.h>   // open, O_RDONLY, O_WRONLY, O_CREAT, O_APPEND, O_TRUNC
#include <unistd.h>  // close, read, write

int main(int argc, char *argv[])
{
    if (argc < 3 || strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0)
    {
        printf("Usage:");
        printf("  ./copy <source> <destination>\n");
        printf("  ./copy <source> <destination> -a\n");
        return 1;
    }

    int append = (argc == 4 && strcmp(argv[3], "-a") == 0);
    int src_fd = open(argv[1], O_RDONLY);
    if (src_fd == -1)
    {
        perror("open");
        return 1;
    }

    int dest_fd = open(argv[2], O_WRONLY | O_CREAT | (append ? O_APPEND : O_TRUNC), 0666);
    if (dest_fd == -1)
    {
        perror("open");
        close(src_fd);
        return 1;
    }

    char buffer[4096];
    int bytes_read;
    while (1) {
        bytes_read = read(src_fd, buffer, sizeof(buffer));
        if (bytes_read == -1) {
            perror("read");
            close(src_fd);
            close(dest_fd);
            return 1;
        }
        if (bytes_read == 0) {
            break;
        }
        int bytes_written = write(dest_fd, buffer, bytes_read);
        if (bytes_written != bytes_read) {
            perror("write");
            close(src_fd);
            close(dest_fd);
            return 1;
        }
    }

    close(src_fd);
    close(dest_fd);
}