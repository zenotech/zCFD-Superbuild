![ParaView-Superbuild](Documentation/img/paraview100.png)

# Introduction

ParaView-Superbuild is a project to build ParaView. ParaView itself can be
easily built using CMake. However, ParaView has several external dependencies,
e.g. Qt, CGNS, FFMPEG, etc. and it can be very tedious to build all those
dependencies. Also, if you want to generate redistributable binaries, you need to
take extra case building and packaging these dependencies. To make our lives
easier in supporting both these use-cases, the ParaView-Superbuild project was born.

Although primarily designed to build the official ParaView binaries,
ParaView-Superbuild has since been regularly used to build ParaView packages
on various supercomputing systems.

# Building

The superbuild may be built with a Makefiles or Ninja CMake generator. The IDE
generators (Xcode and Visual Studio) are not supported.

## Projects and Features

``TODO``

## CMake Variables

### Build Variables

  * `superbuild_download_location` (default `${CMAKE_BINARY_DIR}/downloads`):
    The location to store downloaded source artifacts. Usually, it is changed
    so that it is preserved across a wipe of the build directory.
  * `SUPERBUILD_PROJECT_PARALLELISM` (default based on the number of available
    processors): When using a Makefiles generator, subproject builds use `-j`
    explicitly with this number.
  * `ENABLE_xxx` (generally, default `OFF`): If selected, the `xxx` project
    will be built within the superbuild. See above for descriptions of the
    various projects. `ENABLE_` flags are not shown for projects which must be
    enabled due to a project depending on it (e.g., `qt4` requires `png`, so
    enabling `qt4` will hide the `ENABLE_png` option).
  * `USE_SYSTEM_xxx` (default `OFF`): If selected, the `xxx` project from the
    build environment is used instead of building it within the superbuild.
    Not all projects support system copies (the flag is not available if so).

The following flags affect ParaView directly:

  * `paraview_FROM_GIT` (default `ON`): If set, ParaView is built from the git
    repository (see also `PARAVIEW_GIT_REPOSITORY` and `PARAVIEW_GIT_TAG`).
  * `paraview_FROM_SOURCE_DIR` (default `OFF`): If set, ParaView is built from
    an existing source tree (use `PARAVIEW_SOURCE_DIR` to set the path).
  * `paraview_FROM_SOURCE_DIR` (default `OFF`): If set, ParaView is built from
    an existing source tree (use `PARAVIEW_SOURCE_DIR` to set the path).
  * `CMAKE_BUILD_TYPE_paraview` (default is the same as the superbuild):
    ParaView may be built with a different build type (e.g., `Release` vs.
    `RelWithDebInfo`) as the rest of the superbuild using this variable.
  * `PARAVIEW_RENDERING_BACKEND` (default `OpenGL2`): The rendering backend to
    use with ParaView.
  * `PARAVIEW_BUILD_WEB_DOCUMENTATION` (default `OFF`): Have ParaView build
    its HTML documentation.
  * `MESA_SWR_ENABLED` (default `ON`): If `mesa` is enabled, this enables
    Intel's software rasterization backend (x86 only).

The following flags affect Catalyst:

  * `PARAVIEW_CATALYST_EDITION` (default `Essentials`): The edition of
    Catalyst to build (also available: `Extras` and `Rendering-Base`).
  * `PARAVIEW_CATALYST_PYTHON` (default `ON`): Enable Python support in
    Catalyst.

### Packaging Variables

  * `PARAVIEW_PACKAGE_SUFFIX` (default based on selected options): The suffix
    for the name generated by the package.

# Packaging

The packages may be built using the `cpack-paraview` tests via `ctest`. The
easiest way to build all available packages is to run `ctest -R cpack`.

# Learning Resources

* General information is available at the [ParaView Homepage][].

* Community discussion takes place on the [ParaView Mailing Lists][].

* Commercial [support][Kitware Support] and [training][Kitware Training]
  are available from [Kitware][].

[ParaView Homepage]: http://www.paraview.org
[ParaView Mailing Lists]: http://www.paraview.org/mailing-lists/
[Kitware]: http://www.kitware.com/
[Kitware Support]: http://www.kitware.com/products/support.html
[Kitware Training]: http://www.kitware.com/products/protraining.php

# Reporting Bugs

If you have found a bug:

1. If you have a patch, please read the [CONTRIBUTING.md][] document.

2. Otherwise, please join the one of the [ParaView Mailing Lists][] and ask
   about the expected and observed behaviors to determine if it is
   really a bug.

3. Finally, if the issue is not resolved by the above steps, open
   an entry in the [ParaView Issue Tracker][].

[ParaView Issue Tracker]: http://www.paraview.org/Bug

# License

Like ParaView, ParaView-Superbuild is distributed under the OSI-approved BSD 3-clause License.
See [Copyright.txt][] for details. For additional licenses, refer to
[ParaView Licenses][].

[Copyright.txt]: Copyright.txt
[ParaView Licenses]: http://www.paraview.org/paraview-license/

# Contributing

See [CONTRIBUTING.md][] for instructions to contribute.

[CONTRIBUTING.md]: CONTRIBUTING.md
