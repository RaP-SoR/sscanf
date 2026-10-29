cmake_minimum_required(VERSION 3.19)
project(sscanf LANGUAGES C CXX VERSION 2.15.1)

set(CMAKE_CXX_STANDARD 17)

# open.mp Pawn is 32-bit; apply before SDK so any compiled deps match.
if(UNIX)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32 -fPIC -O2 -w")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32 -fPIC -O2 -w")
endif()

add_subdirectory(open.mp)

set(SSCANF_SOURCES
	amx/amx.c
	amx/amxplugin.c
	subhook/subhook.c
	array.cpp
	data.cpp
	enum.cpp
	kustom.cpp
	specifiers.cpp
	sscanf.cpp
	utils.cpp
	error.cpp
)

if(MSVC)
	list(APPEND SSCANF_SOURCES sscanf.def)
elseif(UNIX)
	list(APPEND SSCANF_SOURCES amx/getch.c)
endif()

add_library(${PROJECT_NAME} SHARED ${SSCANF_SOURCES})

target_include_directories(${PROJECT_NAME} PRIVATE
	amx
	.
	subhook
)

target_compile_definitions(${PROJECT_NAME} PRIVATE
	PROJECT_NAME="sscanf"
	HAVE_STDINT_H=1
	PAWN_CELL_SIZE=32
)

target_link_libraries(${PROJECT_NAME} PRIVATE OMP-SDK)

if(MSVC)
	target_compile_definitions(${PROJECT_NAME} PRIVATE
		WIN32
		_CRT_SECURE_NO_DEPRECATE=1
		WIN32_LEAN_AND_MEAN=1
		SUBHOOK_STATIC
	)
elseif(UNIX)
	target_compile_definitions(${PROJECT_NAME} PRIVATE LINUX=1)
	target_link_options(${PROJECT_NAME} PRIVATE -m32)
endif()

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT sscanf)
