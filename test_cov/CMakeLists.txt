cmake_minimum_required(VERSION 3.13)

project(test_cov)

add_executable(run main.cpp)
target_link_libraries(run gcov)
target_compile_options(run PRIVATE -fprofile-arcs -ftest-coverage -O0 -g -pg)

add_custom_target(launch COMMAND ${CMAKE_BINARY_DIR}/run && gcovr -r ..)
add_dependencies(launch run)

