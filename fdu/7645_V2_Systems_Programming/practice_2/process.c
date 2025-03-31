#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void create_child(int sleep_time, char process_name) {
    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        exit(EXIT_FAILURE);
    } else if (pid == 0) {
        // Child process
        printf("Child process %c going to sleep for %d seconds\n", process_name, sleep_time);
        sleep(sleep_time);
        printf("Exiting child process %c\n", process_name);
        exit(EXIT_SUCCESS);
    } else {
        // Parent process
        printf("Parent process %d created child process %c with pid %d\n", getpid(), process_name, pid);
    }
}

int main() {
    pid_t x_pid, y_pid, z_pid;
    
    x_pid = fork();
    if (x_pid == 0) {
        // printf("Child process x going to sleep for 10 seconds\n");
        // sleep(10);

        execlp("ls", "ls", "-al", NULL);
        perror("execlp");

        printf("Exiting child process x\n");
        exit(EXIT_SUCCESS);
    } else {
        printf("Parent process %d created child process x with pid %d\n", getpid(), x_pid);
    }
    
    y_pid = fork();
    if (y_pid == 0) {
        // printf("Child process y going to sleep for 5 seconds\n");
        // sleep(5);

        execlp("cc", "cc", "--version", NULL);
        perror("execlp");

        printf("Exiting child process y\n");
        exit(EXIT_SUCCESS);
    } else {
        printf("Parent process %d created child process y with pid %d\n", getpid(), y_pid);
    }
    
    z_pid = fork();
    if (z_pid == 0) {
        // printf("Child process z going to sleep for 2 seconds\n");
        // sleep(2);

        execlp("cal", "cal", "2024", NULL);
        perror("execlp");

        printf("Exiting child process z\n");
        exit(EXIT_SUCCESS);
    } else {
        printf("Parent process %d created child process z with pid %d\n", getpid(), z_pid);
    }
    
    // Uncomment the following block for different waiting scenarios
    
    /* (a) Parent does not wait */
    // exit(EXIT_SUCCESS);
    
    /* (b) Parent waits for all children using wait */
    while (wait(NULL) > 0);
    
    /* (c) Parent waits for each child in order using waitpid */
    // waitpid(x_pid, NULL, 0);
    // waitpid(y_pid, NULL, 0);
    // waitpid(z_pid, NULL, 0);
    
    printf("Parent process %d exiting\n", getpid());
    return EXIT_SUCCESS;
}
