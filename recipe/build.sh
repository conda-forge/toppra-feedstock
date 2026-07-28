PYTHON_BINDINGS=${PYTHON_BINDINGS:-OFF}

if [ "${PYTHON_BINDINGS}" = "ON" ]; then
    CMAKE_ARGS="${CMAKE_ARGS} -DPython_EXECUTABLE=${PYTHON}"
fi

cmake -S "${SRC_DIR}/cpp" \
    -B build/toppra \
    -G Ninja \
    -DPYTHON_BINDINGS=${PYTHON_BINDINGS} \
    -DBUILD_TESTS=OFF \
    ${CMAKE_ARGS}

cmake --build build/toppra

cmake --install build/toppra

# Upstream CMake has no install rule for the bindings module; it places the
# built module in <src>/toppra/toppra/cpp/ (LIBRARY_OUTPUT_DIRECTORY).
if [ "${PYTHON_BINDINGS}" = "ON" ]; then
    cp "${SRC_DIR}"/toppra/toppra/cpp/toppra_int* "${SP_DIR}/"
fi
