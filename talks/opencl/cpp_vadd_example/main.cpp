#define CL_HPP_ENABLE_EXCEPTIONS
#define CL_HPP_TARGET_OPENCL_VERSION 300

#include <CL/opencl.hpp>
#include <iostream>
#include <iterator>

std::string vadd_source = R"d(
__kernel void vadd(__global float *a, __global float *b, __global float *out) {
  uint i = get_global_id(0);
  printf("Hello from %u\n", i);
  out[i] = a[i] + b[i];
}
)d";

int main(int argc, char *argv[]) {
  cl::Context context(CL_DEVICE_TYPE_GPU);
  auto t = context.getInfo<CL_CONTEXT_DEVICES>()[0];
  std::cout << t.getInfo<CL_DEVICE_NAME>() << std::endl;
  cl::Program program(context, vadd_source);

  try {
    program.build();
  } catch (...) {
    // Print build info for all devices
    cl_int buildErr = CL_SUCCESS;
    auto buildInfo = program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(&buildErr);
    for (auto &pair : buildInfo) {
      std::cerr << pair.second << std::endl << std::endl;
    }

    return 1;
  }

  auto vadd =
      cl::KernelFunctor<cl::Buffer, cl::Buffer, cl::Buffer>(program, "vadd");

  std::vector<float> vec = {1, 2, 3, 4, 5, 6, 7, 8};
  auto size = vec.size();
  cl::Buffer a(context, std::begin(vec), std::end(vec), true);
  cl::Buffer b(context, std::begin(vec), std::end(vec), true);
  cl::Buffer out(context, CL_MEM_READ_WRITE, size * sizeof(float));

  cl::CommandQueue q(context);

  vadd(cl::EnqueueArgs(q, cl::NDRange(size)), a, b, out);

  std::vector<float> result(size);
  cl::copy(q, out, std::begin(result), std::end(result));

  std::copy(std::begin(result), std::end(result),
            std::ostream_iterator<float>(std::cout, ", "));
  std::cout << std::endl;
}
