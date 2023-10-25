// Код без использования "перегрузки"
vbool32_t carry_bits = vmadc_vvm_u32m1_b32(prod_even, prod_odd, xzero_mask, VL);
// Код с использованием "перегрузки"
vbool32_t carry_bits = vmadc(prod_even, prod_odd, xzero_mask, VL);
