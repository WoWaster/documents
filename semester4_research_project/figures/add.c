vbool32_t carry_bits = vmadc(prod_even, prod_odd, xzero_mask, VL); // Вычисляем маску битов переноса
carry_bits = vmand(carry_bits, xmerge_mask, VL);                   // Оставляем в маске только биты на 0 и 2 местах
vuint32m1_t prod = vadd(prod_even, prod_odd, VL);                  // Складываем числа без переноса
prod = vrgather(prod, xswap_mask32, VL);                           // Меняем попарно местами элементы вектора
prod = vadc(prod, xzero_vector, carry_bits, VL);                   // Прибавляем биты переноса
prod = vrgather(prod, xswap_mask32, VL);                           // Возвращаем элементы вектора на свои места
