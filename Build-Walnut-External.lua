-- WalnutExternal.lua

VULKAN_SDK = os.getenv("VULKAN_SDK")

IncludeDir = {}
LibraryDir = {}
Library = {}

IncludeDir["glm"] = "../vendor/glm"
IncludeDir["spdlog"] = "../vendor/spdlog/include"

if _TARGET_OS == "windows" then
    IncludeDir["VulkanSDK"] = "%{VULKAN_SDK}/Include"
    LibraryDir["VulkanSDK"] = "%{VULKAN_SDK}/Lib"
    Library["Vulkan"] = "%{LibraryDir.VulkanSDK}/vulkan-1.lib"
else
    IncludeDir["VulkanSDK"] = "%{VULKAN_SDK}/include"
    LibraryDir["VulkanSDK"] = "%{VULKAN_SDK}/lib"
    Library["Vulkan"] = "vulkan"
end

group "Dependencies"
    include "vendor/imgui"
    include "vendor/GLFW"
    include "vendor/yaml-cpp"
group ""

group "Core"
    include "Walnut/Build-Walnut.lua"

    -- Optional modules
    if os.isfile("Walnut-Modules/Walnut-Networking/Build-Walnut-Networking.lua") then
        include "Walnut-Modules/Walnut-Networking/Build-Walnut-Networking.lua"
    end
group ""
