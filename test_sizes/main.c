#include <stdlib.h>
#include <stdio.h>

int main(void)
{
  printf("Size of char %zu\n", sizeof(char));
  printf("Size of int %zu\n", sizeof(int));
  printf("Size of short %zu\n", sizeof(short));
  printf("Size of double %zu\n", sizeof(double));
  printf("Size of long %zu\n", sizeof(long));
  printf("Size of long long %zu\n", sizeof(long long));
  printf("Size of size_t %zu\n", sizeof(size_t));
  printf("Size of off_t %zu\n", sizeof(off_t));
}
