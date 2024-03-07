project "NativeFileDialog"
	kind "StaticLib"
	language "C++"
    staticruntime "on"
	systemversion "latest"
	cppdialect "C++17"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "src/*.h",
        "src/include/*.h",
		"src/include/*.hpp",
        -- "src/nfd_common.c",
        "src/nfd_gtk.cpp",
	}

    buildoptions {"`pkg-config --cflags gtk+-3.0`"}
	includedirs {"src/include/"}

	links { "gtk-3", "glib-2.0", "gobject-2.0" } 


	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Development"
		runtime "Release"
		optimize "off"

	filter "configurations:Ship"
		runtime "Release"
		optimize "off"
