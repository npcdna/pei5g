cmake_minimum_required(VERSION 2.8)

project(pei5g)
find_package(Eigen3 REQUIRED)
include_directories("/usr/include/eigen3")
add_executable(${PROJECT_NAME} "main.cpp")
