file(GLOB_RECURSE sources CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/Source/**.cpp)

add_library(${PROJECT_NAME} STATIC)
set_target_properties(${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE TRUE)

target_include_directories(${PROJECT_NAME}
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Source>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/vendor/glm>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/vendor/stb_image>)

if (WL_HEADLESS)
    message("Headless Mode Selected")
    file(GLOB_RECURSE platform CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/Platform/Headless/**.cpp)
    target_sources(${PROJECT_NAME} PRIVATE ${sources} ${platform})
    target_include_directories(${PROJECT_NAME}
      PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Platform/Headless>)
else()
    message("GUI Mode Selected")
    file(GLOB_RECURSE platform CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/Platform/GUI/**.cpp)
    target_sources(${PROJECT_NAME} PRIVATE ${sources} ${platform})
    target_include_directories(${PROJECT_NAME}
      PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Platform/GUI>)
endif()

target_compile_options(${PROJECT_NAME} PUBLIC
    $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -pedantic>
    $<$<CXX_COMPILER_ID:MSVC>:/WX /W4>)

target_compile_definitions(${PROJECT_NAME} PRIVATE
    $<$<CONFIG:Debug>:WL_DEBUG>
    $<$<CXX_COMPILER_ID:MSVC>:WL_PLATFORM_WINDOWS>
    $<$<CXX_COMPILER_ID:Clang>:WL_COMPILER_CLANG>)

target_link_libraries(${PROJECT_NAME} PUBLIC Vulkan::Vulkan glfw imgui spdlog)
