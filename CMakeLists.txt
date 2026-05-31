cmake_minimum_required(VERSION 3.4)
project(print)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(print STATIC sources/print.cpp)
include_directories(include)

option(BUILD_TESTS "Build tests" OFF)

if(BUILD_TESTS)
    enable_testing()
    add_subdirectory(third-party/gtest)
    file(GLOB TEST_SOURCES tests/*.cpp)
    add_executable(check ${TEST_SOURCES})
    target_link_libraries(check print gtest_main)
    add_test(NAME check COMMAND check)
endif()

add_executable(demo demo/main.cpp)
target_link_libraries(demo print)
install(TARGETS demo RUNTIME DESTINATION bin)

add_executable(demo demo/main.cpp)
target_link_libraries(demo print)
install(TARGETS demo RUNTIME DESTINATION bin)
