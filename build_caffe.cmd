:: Usage
:: >..\caffe-win-dependency\build_caffe.cmd <Root directory in full path>/caffe-win-dependency/_install
:: Use forward slash for the 1st argument
::

@echo off

:: Setting
set CMAKE_GENERATOR=Visual Studio 15 2017 Win64
set DEPEND_DIR=%1
set HDF5_ROOT=%DEPEND_DIR%


:: Configuration
cmake ../caffe ^
    -G"%CMAKE_GENERATOR%" -Thost=x64 ^
    -DCMAKE_INSTALL_PREFIX=_install ^
    -DCMAKE_BUILD_TYPE=Release ^
	-DCMAKE_PREFIX_PATH=%DEPEND_DIR% ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DBUILD_STATIC_CRT_LIBS=ON ^
    -DCPU_ONLY=ON ^
    -DBLAS=Open ^
    -DBUILD_python=ON ^
    -DBUILD_python_layer=ON ^
    -Dpython_version=3 ^
    -DBUILD_matlab=OFF ^
    -DCOPY_PREREQUISITES=OFF ^
    -DINSTALL_PREREQUISITES=OFF ^
    -DUSE_NCCL=OFF ^
    -DUSE_LMDB=ON ^
    -DUSE_LEVELDB=ON ^
    -DUSE_OPENCV=ON ^
    -DUSE_OPENMP=OFF ^
    -DHDF5_ROOT=%DEPEND_DIR% ^
    -DHDF5_DIR=%DEPEND_DIR%/cmake ^
    -DHDF5_USE_STATIC_LIBRARIES=ON ^
    -DOpenBLAS_INCLUDE_DIR=%DEPEND_DIR%/include ^
    -DOpenBLAS_LIB=%DEPEND_DIR%/lib/libopenblas.lib ^
    -DBoost_USE_STATIC_LIBS=ON ^
    -DBoost_USE_STATIC_RUNTIME=ON

:: Build
cmake --build . --config Release --target install
