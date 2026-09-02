Forked to update (as of 08/2026):<br>
cmake.exe (4.4.2) environment <br>
vcpkg.exe (2026-07-27-98d7cb0cf1f4686a3e43aa5672b6230c1d56bce8)<br>
<br>
changed CMakeLists.txt to reflect cmake minimum version 3.5 <br>
changed vcpkg.cmake to reflect new baseline 127402f1c75bb3d5ff6bce04b285faa4930a5aca (08/24/2026)<br>
bug fixes:<br>
src/key.hpp + #include &lt;string&gt;<br>
<br>
Note:  If compiling for x64, You will get a ton of compiler warnings about std::size mismatches with uint_32 types.  std::size will zero out uint_32 vars on x64.  
I have not fixed these yet.</br>
used Visual Studio 2022 without cmake extension.  Compiled using externally installed cmake-gui and custom x64 build presets, 
using toolchain vcpkg/scripts/buildsystems/vcpkg.cmake, creating CppProperties.json and a VS 2022 generator for the .sln<br>
<br>
cmake-gui compile instructions:<br>
git clone &lt;thisrepository&gt;
Where is the source code: &lt;location of cloned repository...libmumble&gt;<br>
Preset: custom<br>
Where to build binaries: &lt;...libmumble/build&gt;<br>
Press Configure<br>
Build directory does not exist.  Should I create it? &lt;Yes&gt;<br>
Specify the generator for this project: &lt;Visual Studio 17 2022&gt; (for the generated .sln, or use another generator such as Ninja)<br>
Optional platform for generator: &lt;x64&gt;<br>
Optional toolset to use &lt;leave blank&gt;<br>
Check "Specify toolchain file for cross compiling"<br>
Specify toolchain file: &lt; I used my vcpkg installation location ...vcpkg/scripts/buildsystems/vcpkg.cmake&gt; (see env variable VCPKG_ROOT)<br>
Press Finish<br>
cmake-gui will configure and present you a list of variables found in the CMake configure files to change. I chose to build the example client/server executables, so I checked LIBMUMBLE_BUILD_EXAMPLES (or you can edit it ON in libmumble/CMakeLists.txt)<br>
Press Generate<br>
CMake should download and compile all the libraries and tests you need<br>
x64 Windows Shared libraries are located in libmumble/builds/vcpkg-installed/x64-windows/bin<br>
<br>
cli cmake instructions:
1. cd to source/root folder ..../libmumble
2. delete any prior /build directory<br>
3. use cmake, specifying source/root folder (windows shells will screw this up) , build directory and architecture<br>
<code>cmake -S . -B build -A x64</code><br>
4. use cmake to compile with Debug/Release configuration<br>
<code>cmake --build build --config  Release</code><br>
