#include "header_with_function.hpp"

#include <cuda_runtime.h>
#include <cuda_runtime_api.h>

SomeClass::SomeClass() { cudaMalloc((void **)&data, sizeof(int)); }

SomeClass::~SomeClass() { cudaFree(data); }

void SomeClass::setValue(int value) { set_value(value); }

int SomeClass::getValue() { return get_value(); }
