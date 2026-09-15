rmdir /s /q "build"
cmake -S . -B build -A x64 -G "Visual Studio 17 2022"
cmake --build build --config  Debug
REM copy libraries to the executables location
copy build\debug\*.*	build\example\Debug
REM copy altproject\examples\ExampleServer\*.pem build\example\Debug

