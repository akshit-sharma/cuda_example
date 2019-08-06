#include "header_with_function.hpp"
#include "header_with_kernel.hpp"

#include <iostream>

void some_function() {
  std::cout << "some_function in file_with_kernel.cu" << std::endl;
}

__global__ void set_value_via_kernel(int *dest, int value) { dest[0] = value; }

void SomeClass::set_value(int value) {
  set_value_via_kernel<<<1, 1>>>(data, value);
  cudaDeviceSynchronize();
}

int SomeClass::get_value() {
  int return_value = 0;
  cudaMemcpy(&return_value, data, sizeof(int),
             cudaMemcpyKind::cudaMemcpyDeviceToHost);
  cudaDeviceSynchronize();
  return return_value;
}
