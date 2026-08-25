# This file is part of libmumble.
# Use of this source code is governed by a BSD-style license
# that can be found in the LICENSE file at the root of the
# Mumble source tree or at <https://www.mumble.info/LICENSE>.

message(STATUS ">>>/examples/ExampleServer/CMakeLists.txt<<< started.")

add_executable(ExampleServer
	"main.cpp"

	"Endpoints.hpp"
	"Node.cpp"
	"Node.hpp"
	"User.cpp"
	"User.hpp"
	"UserManager.cpp"
	"UserManager.hpp"
)

message(STATUS ">>>/examples/ExampleServer/CMakeLists.txt<<< end.")
