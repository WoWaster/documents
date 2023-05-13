vuint32m1_t product_hi = vmulhu_vv_u32m1(data_key, data_key_lo, VL);
vuint32m1_t product_lo = vmul_vv_u32m1(data_key, data_key_lo, VL);
vuint32m1_t product_hi_sl = vrgather_vv_u32m1(product_hi, xlshift_mask, VL);
vuint32m1_t product = vmerge_vvm_u32m1(xmerge_mask, product_hi_sl, product_lo, VL);
