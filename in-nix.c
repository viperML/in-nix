#include "stdlib.h"

static void before_main(void) __attribute__((constructor));

static void before_main(void)
{
  setenv("IN_NIX", "1", 1);
}
