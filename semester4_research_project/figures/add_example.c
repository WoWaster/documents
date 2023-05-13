vbool32_t carry_bits = vmadc_vvm_u32m1_b32(prod_even, prod_odd, xzero_mask, VL);
carry_bits = vmand_mm_b32(carry_bits, xmerge_mask, VL);
vuint32m1_t prod = vadd_vv_u32m1(prod_even, prod_odd, VL);
prod = vrgather_vv_u32m1(prod, xswap_mask32, VL);
prod = vadc_vvm_u32m1(prod, xzero_vector, carry_bits, VL);
prod = vrgather_vv_u32m1(prod, xswap_mask32, VL);
