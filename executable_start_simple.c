#include <stdio.h>

extern const void __executable_start;

void main() {
  printf("__executable_start = %p\n", &__executable_start);
}
