#include <stdbool.h>
#include <stdint.h>
const uint32_t P = 0x04c11db7;
uint32_t tbl[];
uint32_t crc32(const uint8_t *M, uint32_t len_m) {
  uint32_t R = 0;
  for (uint32_t i = 0; i < len_m; ++i) {
    R = (R >> 8) ^ tbl[(R ^ M[i]) & 0xFF];
  }
  return R;
}