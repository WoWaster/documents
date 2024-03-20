#include <stdint.h>

uint64_t factorial(int n)
{
    uint64_t result = 1;
    for (uint64_t i = 1; i <= n; ++i)
        result *= i;
    return result;
}
