

void modifyString(char *item[], int numItems, int (*visitor)(int))
{
    for (int i = 0; i < numItems; i++)
    {
        char *p = item[i];
        while (*p != '\0')
        {
            *p = visitor(*p);
            p++;
        }
    }
}

int toupper(int c)
{
    if (c >= 'a' && c <= 'z')
    {
        return c - 'a' + 'A';
    }
    return c;
}

int tolower(int c)
{
    if (c >= 'A' && c <= 'Z')
    {
        return c - 'A' + 'a';
    }
    return c;
}

int main()
{
    char *item[] = {"hello", "world", "goodbye", "cruel", "world"};
    int numItems = sizeof(item) / sizeof(item[0]);
    modifyString(item, numItems, toupper);
    for (int i = 0; i < numItems; i++)
    {
        printf("%s\n", item[i]);
    }

    modifyString(item, numItems, tolower);
    for (int i = 0; i < numItems; i++)
    {
        printf("%s\n", item[i]);
    }

    return 0;
}