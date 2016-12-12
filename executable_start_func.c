#include "executable_start_func.h"

extern const void __executable_start;

const void* exec_start_addr() {
  return &__executable_start;
}
