add_external_project(lapack
  BUILD_IN_SOURCE 0
  CMAKE_ARGS
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
  BUILD_COMMAND
    make
  INSTALL_COMMAND
    make install
)
