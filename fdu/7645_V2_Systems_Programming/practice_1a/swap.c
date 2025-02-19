#include <stdio.h>

void swapIntegerArray(int *x, int *y, unsigned int numIntegers)
{
    for (unsigned int i = 0; i < numIntegers; i++)
    {
        int temp = x[i];
        x[i] = y[i];
        y[i] = temp;
    }
}

void swapCharacterArray(char *x, char *y, unsigned int numCharacters)
{
    for (unsigned int i = 0; i < numCharacters; i++)
    {
        char temp = x[i];
        x[i] = y[i];
        y[i] = temp;
    }
}

// swap two strings with the same length, they both have '\0' at the end
void swapCharacterArray2(char *x, char *y)
{
    while (*x != '\0' && *y != '\0')
    {
        char temp = *x;
        *x = *y;
        *y = temp;
        x++;
        y++;
    }
}

void stringCopy(char* destination, char* source, unsigned int maxCharacters)
{
    for (unsigned int i = 0; i < maxCharacters; i++)
    {
        destination[i] = source[i];
    }
}

void testSwap(int *x, int *y, unsigned int numIntegers)
{
    printf("BEFORE swap: x = ");
    for (unsigned int i = 0; i < numIntegers; i++)
    {
        printf("%d ", x[i]);
    }
    printf(", y = ");
    for (unsigned int i = 0; i < numIntegers; i++)
    {
        printf("%d ", y[i]);
    }
    printf("\n");

    swapIntegerArray(x, y, numIntegers);

    printf("AFTER swap: x = ");
    for (unsigned int i = 0; i < numIntegers; i++)
    {
        printf("%d ", x[i]);
    }
    printf(", y = ");
    for (unsigned int i = 0; i < numIntegers; i++)
    {
        printf("%d ", y[i]);
    }
    printf("\n");
}

int main()
{
    int x1[] = {1, 2, 3, 4, 5};
    int y1[] = {6, 7, 8, 9, 10};
    testSwap(x1, y1, 5);

    int x2[] = {1, 2, 3};
    int y2[] = {4, 5, 6};
    testSwap(x2, y2, 3);

    char x3[] = "hello";
    char y3[] = "world";
    printf("BEFORE swap: x = %s, y = %s\n", x3, y3);
    swapCharacterArray(x3, y3, 5);
    printf("AFTER swap: x = %s, y = %s\n", x3, y3);

    int x4[] = {1, 3, 5, 7};
    int y4[] = {2, 4, 6, 8};
    swapCharacterArray((char *)x4, (char *)y4, 4 * sizeof(int));
    printf("AFTER swap: x = ");
    for (unsigned int i = 0; i < 4; i++)
    {
        printf("%d ", x4[i]);
    }
    printf(", y = ");
    for (unsigned int i = 0; i < 4; i++)
    {
        printf("%d ", y4[i]);
    }
    printf("\n");

    char x5[] = "hello";
    char y5[] = "world";
    printf("BEFORE swap: x = %s, y = %s\n", x5, y5);
    swapCharacterArray2(x5, y5);
    printf("AFTER swap: x = %s, y = %s\n", x5, y5);

    return 0;
}