#include <stdio.h>

void modifyString(char *item[], int numItems, int (*visitor)(int)) {
    for (int i = 0; i < numItems; i++) {
        char *p = item[i];
        while (*p != '\0') {
            *p = visitor(*p);
            p++;
        }
    }
}

int toupper(int c) {
    if (c >= 'a' && c <= 'z') {
        return c - 'a' + 'A';
    }
    return c;
}

int tolower(int c) {
    if (c >= 'A' && c <= 'Z') {
        return c - 'A' + 'a';
    }
    return c;
}

int main() {
char str1[] = "Hello";
char str2[] = "Linux";
char str3[] = "Programming";

// Use modifiable character arrays
char *item[] = {str1, str2, str3};
    printf("sizeof(item) = %lu\n", sizeof(item));
    printf("sizeof(item[0]) = %lu\n", sizeof(item[0]));
    int numItems = sizeof(item) / sizeof(item[0]);

    modifyString(item, numItems, toupper);
    for (int i = 0; i < numItems; i++) {
        printf("%s\n", item[i]);
    }

    modifyString(item, numItems, tolower);
    for (int i = 0; i < numItems; i++) {
        printf("%s\n", item[i]);
    }

    return 0;
}
