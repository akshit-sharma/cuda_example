CMAKE_MINIMUM_REQUIRED(VERSION 3.8)

project(exec LANGUAGES CXX CUDA)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

find_package(CUDA REQUIRED)

add_executable(exec src/main.cpp
  src/file_with_function.cpp
  src/file_with_kernel.cu
  )

target_include_directories(exec
  PRIVATE include ${CUDA_INCLUDE_DIRS})

