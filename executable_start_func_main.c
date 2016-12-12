#include <stdio.h>

#include "executable_start_func.h"

void main() {
  printf("__executable_start = %p\n", exec_start_addr());
}

