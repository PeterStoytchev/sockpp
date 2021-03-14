project "sockpp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	characterset "MBCS"

	targetdir ("%{prj.location}/bin/%{prj.name}-%{cfg.system}-%{cfg.architecture}/")
	objdir ("%{prj.location}/bin-int/%{prj.name}-%{cfg.system}-%{cfg.architecture}/")

	includedirs
	{
		"%{prj.location}/include"
	}
	
	filter "system:windows"
		systemversion "latest"
		files
		{
			"src/acceptor.cpp",
			"src/connector.cpp",
			"src/datagram_socket.cpp",
			"src/exception.cpp",
			"src/inet_address.cpp",
			"src/inet6_address.cpp",
			"src/socket.cpp",
			"src/stream_socket.cpp",
		}
		
	filter "system:not_windows"
		files
		{
			"src/acceptor.cpp",
			"src/connector.cpp",
			"src/datagram_socket.cpp",
			"src/exception.cpp",
			"src/inet_address.cpp",
			"src/inet6_address.cpp",
			"src/socket.cpp",
			"src/stream_socket.cpp",
			"src/unix/unix_address.cpp"
		}

	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "NDEBUG"
		runtime "Release"
		optimize "on"