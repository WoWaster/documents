__kernel void vadd(__global float *a, __global float *b, __global float *out) {
  uint i = get_global_id(0);
  printf("Hello from %u\n", i);
  out[i] = a[i] + b[i];
}
