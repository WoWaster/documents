vuint32m1_t product_hi = vmulhu(data_key, data_key_lo, VL);
vuint32m1_t product_lo = vmul(data_key, data_key_lo, VL);
vuint32m1_t product_hi_sl = vrgather(product_hi, xlshift_mask, VL);
vuint32m1_t product = vmerge(xmerge_mask, product_hi_sl, product_lo, VL);
