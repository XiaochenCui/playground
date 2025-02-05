#include <stdio.h>

int main() {
    int first, second, temp;

    first = 4;
    second = 6;

    printf("BEFORE swap: first = %d, second = %d\n", first, second);
    temp = first;
    first = second;
    second = temp;
    printf("AFTER swap: first = %d, second = %d\n", first, second);
}
