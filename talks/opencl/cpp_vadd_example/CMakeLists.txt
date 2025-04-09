cmake_minimum_required(VERSION 3.25)

project(openCL_examples LANGUAGES CXX)

find_package(OpenCL REQUIRED)

add_executable(vadd main.cpp)

target_link_libraries(vadd PRIVATE OpenCL::OpenCL)
