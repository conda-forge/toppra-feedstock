cmake -S "${SRC_DIR}/cpp" \
    -B build/toppra \
    -G Ninja \
    -DPYTHON_BINDINGS=OFF \
    -DBUILD_TESTS=OFF \
    ${CMAKE_ARGS}

cmake --build build/toppra

cmake --install build/toppra
