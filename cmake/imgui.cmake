file(GLOB imgui_sources CONFIGURE_DEPENDS ${PROJECT_SOURCE_DIR}/vendor/imgui/*.cpp)

add_library(imgui STATIC)
set_target_properties(imgui PROPERTIES POSITION_INDEPENDENT_CODE TRUE)

target_sources(imgui PRIVATE ${imgui_sources})

target_include_directories(imgui
  PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/vendor/imgui>)
