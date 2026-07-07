cmake_minimum_required(VERSION 3.16)

project(Walnut LANGUAGES CXX)

# Set the C++ Standard to C++20
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_DISABLE_IN_SOURCE_BUILD ON CACHE BOOL "Prevents cmake -S. -B.")
set(CMAKE_DISABLE_SOURCE_CHANGES ON CACHE BOOL "Prevent writing files to CMAKE_SOURCE_DIR under configure")

# Walnut options/features
option(WL_HEADLESS "Compile Walnut without GUI support" OFF)
option(WL_BUILD_EXAMPLE "Build the example application" OFF)

# Find vulkan
find_package(Vulkan REQUIRED)

# Add glfw
set(BUILD_SHARED_LIBS OFF)
set(GLFW_BUILD_EXAMPLES OFF)
set(GLFW_BUILD_TESTS OFF)
set(GLFW_BUILD_DOCS OFF)
set(GLFW_INSTALL OFF)
set(GLFW_VULKAN_STATIC OFF)
add_subdirectory(${PROJECT_SOURCE_DIR}/vendor/glfw EXCLUDE_FROM_ALL)

# Add spdlog
add_subdirectory(${PROJECT_SOURCE_DIR}/vendor/spdlog EXCLUDE_FROM_ALL)

# Add imgui
include(${PROJECT_SOURCE_DIR}/cmake/imgui.cmake)

# Add Walnut library
add_subdirectory(${PROJECT_SOURCE_DIR}/Walnut)

# Add optional WalnutApp
if(WL_BUILD_EXAMPLE)
    add_subdirectory(${PROJECT_SOURCE_DIR}/WalnutApp)
endif()
