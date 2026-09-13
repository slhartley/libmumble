#!/bin/bash
# NOTE:  These are modified from the repository for a special project and are copied before compiling.
# /altproject, /bin IS NOT NEEDED to compile the original distro and can be deleted
# To restore the originals, back up altproject and re-clone the repository
# Copying modified client source files
cp altproject/examples/ExampleClient/main.cpp			examples/ExampleClient/ || true
# Copying modified server source files
cp altproject/examples/ExampleServer/CMakeLists.txt 		examples/ExampleServer/ || true
cp altproject/examples/ExampleServer/main.cpp			examples/ExampleServer/ || true
cp altproject/examples/ExampleServer/Node.cpp			examples/ExampleServer/ || true
# Copying misc
cp altproject/examples/ExampleServer/*.pem			examples/ExampleServer/ || true
cp build/debug/*.*						build/example/Debug/ || true
# Copying libmumble include files
cp altproject/include/mumble/*.*				include/mumble/ || true
# Copying libmumble source files
cp altproject/src/*.*						src/ || true
