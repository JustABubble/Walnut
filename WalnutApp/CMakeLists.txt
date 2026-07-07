file(GLOB sources CONFIGURE_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

add_executable(WalnutApp)

target_include_directories(WalnutApp
  PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Walnut/Source>
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/Walnut/Platform/GUI>)

target_sources(WalnutApp PRIVATE ${sources})

target_compile_options(WalnutApp PUBLIC
    $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Wall -Wextra -pedantic>
    $<$<CXX_COMPILER_ID:MSVC>:/WX /W4>)

target_link_libraries(WalnutApp PUBLIC Walnut glfw imgui)
