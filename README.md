Forked to update (as of 08/2026):
cmake (4.4.2) environment 
vcpkg (2026-07-27-98d7cb0cf1f4686a3e43aa5672b6230c1d56bce8) dependencies

changed CMakeLists.txt to reflect cmake minimum version 3.5 
changed vcpkg.cmake to reflect new baseline 127402f1c75bb3d5ff6bce04b285faa4930a5aca (08/24/2026)
bug fixes:
src/key.hpp + #include <string>

used Visual Studio 2022 without cmake extension.  Compiled using externally installed cmake-gui and custom build presets
creating CppProperties.json and a .sln for VS.
