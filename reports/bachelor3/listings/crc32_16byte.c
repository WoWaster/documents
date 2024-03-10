#include <stdbool.h>
#include <stdint.h>
const uint32_t P = 0x04c11db7;
uint32_t tbl[];
uint32_t crc32(const uint32_t *M, uint32_t len_m) {
  uint32_t R = 0;
  while (len_m) {
    R ^= *M++;
    const uint32_t R2 = *M++;
    const uint32_t R3 = *M++;
    const uint32_t R4 = *M++;
    R = tbl[0 * 256 + (uint8_t)(R4 >> 24)] ^
        tbl[1 * 256 + (uint8_t)(R4 >> 16)] ^ 
        tbl[2 * 256 + (uint8_t)(R4 >> 8)] ^
        tbl[3 * 256 + (uint8_t)(R4 >> 0)] ^ 
        tbl[4 * 256 + (uint8_t)(R3 >> 24)] ^
        tbl[5 * 256 + (uint8_t)(R3 >> 16)] ^ 
        tbl[6 * 256 + (uint8_t)(R3 >> 8)] ^
        tbl[7 * 256 + (uint8_t)(R3 >> 0)] ^ 
        tbl[8 * 256 + (uint8_t)(R2 >> 24)] ^
        tbl[9 * 256 + (uint8_t)(R2 >> 16)] ^
        tbl[10 * 256 + (uint8_t)(R2 >> 8)] ^
        tbl[11 * 256 + (uint8_t)(R2 >> 0)] ^
        tbl[12 * 256 + (uint8_t)(R >> 24)] ^
        tbl[13 * 256 + (uint8_t)(R >> 16)] ^ 
        tbl[14 * 256 + (uint8_t)(R >> 8)] ^
        tbl[15 * 256 + (uint8_t)(R >> 0)];
    len_m -= 16;
  }
  return R;
}