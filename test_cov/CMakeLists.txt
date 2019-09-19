cmake_minimum_required(VERSION 3.13)

project(test_cov)

add_executable(run main.cpp)
target_link_libraries(run gcov)
target_compile_options(run PUBLIC -fprofile-arcs -ftest-coverage -O0 -g -pg)


