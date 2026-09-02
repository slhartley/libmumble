# This file is part of libmumble.
# Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file at the root of the
# Mumble source tree or at <https://www.mumble.info/LICENSE>.

message(STATUS ">>>/CMakeLists.txt<<< Processing root CMakeLists.txt")

cmake_minimum_required(VERSION 3.5)
cmake_policy(SET CMP0079 NEW)

if(DEFINED ENV{VCPKG_ROOT})
    message(STATUS ">>>/CMakeLists.txt<<< vcpkg installed. VCPKG_ROOT: $ENV{VCPKG_ROOT}")
else()
	message(WARNING ">>>/CMakeLists.txt<<< Is vcpkg installed?")
	message(WARNING ">>>/CMakeLists.txt<<< The environment variable VCPKG_ROOT is not set and dependencies may not be downloaded.")
endif()

set(CMAKE_WARN_DEPRECATED OFF CACHE BOOL "" FORCE)
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" CACHE STRING "Vcpkg toolchain file")
set(CMAKE_POLICY_VERSION_MINIMUM "3.5")

if(EXISTS "${CMAKE_TOOLCHAIN_FILE}")
	message(STATUS ">>>/CMakeLists.txt<<< Using vcpkg toolchain file '${CMAKE_TOOLCHAIN_FILE}'.")
  	message(STATUS ">>>/CMakeLists.txt<<< Dependencies in vcpkg.json will be downloaded.")
else()
    	message(WARNING ">>>/CMakeLists.txt<<< Toolchain file (CMAKE_TOOLCHAIN_FILE) '${CMAKE_TOOLCHAIN_FILE}' not found.")
	message(WARNING ">>>/CMakeLists.txt<<< Dependencies will not be downloaded.")
endif()

project(libmumble
	VERSION "0.1.0"
	DESCRIPTION "The official Mumble library."
	HOMEPAGE_URL "https://www.mumble.info"
	LANGUAGES "C" "CXX"
)

option(LIBMUMBLE_BUILD_EXAMPLES "Build example client and server" OFF)
option(LIBMUMBLE_BUILD_TESTS "Build tests" ON)
option(LIBMUMBLE_BUNDLED_GSL "Use the bundled GSL version instead of looking for one on the system" ON)
option(LIBMUMBLE_STATIC "Build the library as static instead of shared" OFF)
option(LIBMUMBLE_WARNINGS_AS_ERRORS "Treat warnings as errors" OFF)

message(STATUS ">>>/CMakeLists.txt<<< including setup_depedencies")
include(setup_dependencies)
message(STATUS ">>>/CMakeLists.txt<<< including compiler_utilities")
include(compiler_utilities)

set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_FIND_PACKAGE_PREFER_CONFIG ON)

if(WIN32)
	add_definitions(
		"-DOS_WINDOWS"
		"-DNOMINMAX"
		"-DWIN32_LEAN_AND_MEAN"
		"-D_CRT_SECURE_NO_WARNINGS"
	)
else()
	add_definitions(
		"-DOS_UNIX"
	)
endif()

if(MSVC)
	add_compile_options(
		# https://devblogs.microsoft.com/cppblog/msvc-now-correctly-reports-__cplusplus
		"/Zc:__cplusplus"
	)
endif()

message(STATUS ">>>/CMakeLists.txt<<< adding /src")
add_subdirectory(src)


if (LIBMUMBLE_BUILD_EXAMPLES)
	message(STATUS ">>>/CMakeLists.txt<<< adding /examples")
	add_subdirectory(examples)
endif()

if (LIBMUMBLE_BUILD_TESTS)
	message(STATUS ">>>/CMakeLists.txt<<< including /tests")
	include(CTest)
	add_subdirectory(tests)
endif()

message(STATUS ">>>/CMakeLists.txt<<< end")
