superbuild_add_project(openimagedenoise
  DEPENDS tbb cxx11 ispc python
  CMAKE_ARGS
    -DOIDN_APPS:BOOL=OFF
    -DCMAKE_INSTALL_NAME_DIR:PATH=<INSTALL_DIR>/lib
    -DCMAKE_INSTALL_LIBDIR:STRING=lib
)
