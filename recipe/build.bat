@echo off

cmake -S "%SRC_DIR%\cpp" ^
      -B build\toppra ^
      -G Ninja ^
      -DPYTHON_BINDINGS=OFF ^
      -DBUILD_TESTS=OFF ^
      %CMAKE_ARGS%

if errorlevel 1 exit /b 1

cmake --build build\toppra
if errorlevel 1 exit /b 1

cmake --install build\toppra
if errorlevel 1 exit /b 1
