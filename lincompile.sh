#!/bin/bash
rm -rf build
cmake -S . -B build -A x64
cmake --build build --config  Release
