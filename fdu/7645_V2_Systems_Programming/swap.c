#include <stdio.h>
#include <string.h>

void swapIntegers(int *first, int *second) {
  int temp;
  temp = *first;
  *first = *second;
  *second = temp;
}

typedef struct {
  char firstName[20];
  char lastName[20];
} Person;

void swapPersons(Person *first, Person *second) {
  Person temp;
  temp = *first;
  *first = *second;
  *second = temp;
}

int main() {
  int first, second, temp;

  first = 4;
  second = 6;

  printf("BEFORE swap: first = %d, second = %d\n", first, second);
  temp = first;
  first = second;
  second = temp;
  printf("AFTER swap: first = %d, second = %d\n", first, second);

  swapIntegers(&first, &second);
  printf("AFTER swap: first = %d, second = %d\n", first, second);

  Person firstPerson, secondPerson;

  strcpy(firstPerson.firstName, "John");
  strcpy(firstPerson.lastName, "Doe");

  strcpy(secondPerson.firstName, "Jane");
  strcpy(secondPerson.lastName, "Smith");

  printf("BEFORE swap: firstPerson = %s %s, secondPerson = %s %s\n",
         firstPerson.firstName, firstPerson.lastName, secondPerson.firstName,
         secondPerson.lastName);

  swapPersons(&firstPerson, &secondPerson);

  printf("AFTER swap: firstPerson = %s %s, secondPerson = %s %s\n",
         firstPerson.firstName, firstPerson.lastName, secondPerson.firstName,
         secondPerson.lastName);
}
