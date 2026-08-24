Forked to update (as of 08/2026):<br>
cmake.exe (4.4.2) environment <br>
vcpkg.exe (2026-07-27-98d7cb0cf1f4686a3e43aa5672b6230c1d56bce8<br>
<br>
changed CMakeLists.txt to reflect cmake minimum version 3.5 <br>
changed vcpkg.cmake to reflect new baseline 127402f1c75bb3d5ff6bce04b285faa4930a5aca (08/24/2026)<br>
bug fixes:<br>
src/key.hpp + #include &lt;string&gt;<br>
<br>
used Visual Studio 2022 without cmake extension.  Compiled using externally installed cmake-gui and custom x64 build presets, 
using toolchain vcpkg/scripts/buildsystems/vcpkg.cmake, creating CppProperties.json and a VS 2022 generator for the .sln
