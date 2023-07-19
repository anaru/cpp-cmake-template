
echo off

echo Creating build directory
mkdir build

:: Check CMake is available
where cmake
if %errorlevel%==1 echo CMake not found on the system path

:: Generate the buildsystem files (i.e. VS solution and projects)
cmake -G "Visual Studio 17 2022" -A x64 -B build source

:: Compile the code in Release mode
cmake --build build --config Release

:: Check CTest is available
where ctest
if %errorlevel%==1 echo CTest not found on the system path

:: Run the tests
ctest --test-dir build

echo on
