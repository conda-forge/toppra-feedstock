@echo off

if not defined PYTHON_BINDINGS set "PYTHON_BINDINGS=OFF"
if "%PYTHON_BINDINGS%"=="ON" set "CMAKE_ARGS=%CMAKE_ARGS% -DPython_EXECUTABLE=%PYTHON%"

cmake -S "%SRC_DIR%\cpp" ^
      -B build\toppra ^
      -G Ninja ^
      -DPYTHON_BINDINGS=%PYTHON_BINDINGS% ^
      -DBUILD_TESTS=OFF ^
      %CMAKE_ARGS%

if errorlevel 1 exit /b 1

cmake --build build\toppra
if errorlevel 1 exit /b 1

cmake --install build\toppra
if errorlevel 1 exit /b 1

rem Upstream CMake has no install rule for the bindings module; it places the
rem built module in <src>\toppra\toppra\cpp\ (LIBRARY_OUTPUT_DIRECTORY).
if "%PYTHON_BINDINGS%"=="ON" (
    copy "%SRC_DIR%\toppra\toppra\cpp\toppra_int*" "%SP_DIR%\"
    if errorlevel 1 exit /b 1
)
