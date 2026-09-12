REM NOTE:  These are modified from the repository for a special project and are copied before compiling.
REM /altproject, /bin IS NOT NEEDED to compile the original distro and can be deleted
REM To restore the originals, back up altproject and re-clone the repository
REM Copying modified client source files
copy altproject\examples\ExampleClient\main.cpp			examples\ExampleClient
REM Copying modified server source files
copy altproject\examples\ExampleServer\CMakeLists.txt 		examples\ExampleServer
copy altproject\examples\ExampleServer\main.cpp			examples\ExampleServer
copy altproject\examples\ExampleServer\Node.cpp			examples\ExampleServer
REM Copying misc
copy altproject\examples\ExampleServer\*.pem			examples\ExampleServer
copy build\debug\*.*						build\example\Debug
REM Copying libmumble include files
copy altproject\include\mumble\*.*				include\mumble
REM Copying libmumble source files
copy altproject\src\*.*						src\
