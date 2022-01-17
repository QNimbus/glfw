-- anvil/vendor/GLFW/premake5.lua

project "GLFW"

  kind "StaticLib"                                                  -- https://premake.github.io/docs/kind
  staticruntime "off"                                               -- https://premake.github.io/docs/staticruntime

  language "C++"                                                    -- https://premake.github.io/docs/language
  cppdialect "C++17"                                                -- https://premake.github.io/docs/cppdialect

  targetdir ("%{wks.location}/_bin/" .. outputdir .. "/%{prj.name}")
  objdir    ("%{wks.location}/_obj/" .. outputdir .. "/%{prj.name}")

  links                                                             -- https://premake.github.io/docs/links
  {

  }

  files                                                             -- https://premake.github.io/docs/files
  {
    "include/GLFW/glfw3.h",
    "include/GLFW/glfw3native.h",
    "src/glfw_config.h",
    "src/context.c",
    "src/init.c",
    "src/null_joystick.c",
    "src/null_init.c",
    "src/input.c",
    "src/monitor.c",
    "src/null_monitor.c",
    "src/window.c",
    "src/null_window.c",
    "src/vulkan.c",
    "src/platform.c",
  }

  includedirs                                                       -- https://premake.github.io/docs/includedirs
  {

  }

  defines                                                           -- https://premake.github.io/docs/defines
  {
    "_CRT_SECURE_NO_WARNINGS"
  }

  -- https://premake.github.io/docs/filter/
  filter { "system:windows" }
    defines { "_GLFW_WIN32" }
    files
    {
      "src/win32_init.c",
      "src/win32_joystick.c",
      "src/win32_monitor.c",
      "src/win32_time.c",
      "src/win32_thread.c",
      "src/win32_module.c",
      "src/win32_window.c",
      "src/wgl_context.c",
      "src/egl_context.c",
      "src/osmesa_context.c"
    }

  filter { "system:linux"}
    defines { "_GLFW_X11" }
    files
    {
      "src/x11_init.c",
      "src/x11_monitor.c",
      "src/x11_window.c",
      "src/xkb_unicode.c",
      "src/posix_time.c",
      "src/posix_thread.c",
      "src/posix_module.c",
      "src/glx_context.c",
      "src/egl_context.c",
      "src/osmesa_context.c",
      "src/linux_joystick.c"
    }

  filter { "configurations:Debug" }
    defines { }
    symbols "on"                                                    -- https://premake.github.io/docs/symbols/
    runtime "Debug"                                                 -- https://premake.github.io/docs/runtime

  filter { "configurations:Release" }
    defines { }
    optimize "on"                                                   -- https://premake.github.io/docs/optimize
    runtime "Release"                                               -- https://premake.github.io/docs/runtime

  filter { "configurations:Dist" }
    defines { }
    optimize "full"                                                 -- https://premake.github.io/docs/optimize
    runtime "Release"                                               -- https://premake.github.io/docs/runtime

  filter {} -- Reset
