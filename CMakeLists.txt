cmake_minimum_required(VERSION 3.16)

project(Walnut LANGUAGES CXX)

find_package(Vulkan REQUIRED)

if(NOT DEFINED CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 20)
endif()

add_subdirectory(vendor)
add_subdirectory(Walnut)

if(WL_BUILD_EXAMPLE)
  add_subdirectory(WalnutApp)
endif()
