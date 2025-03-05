#include <stdio.h>   // printf, fprintf, perror
#include <stdlib.h>  // EXIT_FAILURE, EXIT_SUCCESS
#include <dirent.h>  // DIR, struct dirent, opendir, readdir, closedir
#include <string.h>  // strcmp
#include <sys/stat.h> // struct stat, stat

void list_contents(const char *path, int level) {
    struct dirent *entry;
    DIR *dir = opendir(path);
    
    if (dir == NULL) {
        perror("opendir");
        return;
    }
    
    while ((entry = readdir(dir)) != NULL) {
        if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
            continue;
        
        for (int i = 0; i < level; i++)
            printf("\t");
        
        printf("%s\n", entry->d_name);
        
        char full_path[1024];
        snprintf(full_path, sizeof(full_path), "%s/%s", path, entry->d_name);
        
        struct stat path_stat;
        stat(full_path, &path_stat);
        
        if (S_ISDIR(path_stat.st_mode)) {
            list_contents(full_path, level + 1);
        }
    }
    closedir(dir);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <directory path>\n", argv[0]);
        return EXIT_FAILURE;
    }
    
    list_contents(argv[1], 0);
    return EXIT_SUCCESS;
}
