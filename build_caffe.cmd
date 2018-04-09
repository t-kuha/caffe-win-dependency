:: Usage
:: >..\caffe-win-dependency\build_caffe.cmd <Root directory in full path>/caffe-win-dependency/_install

@echo off

:: Setting
set CMAKE_GENERATOR=Visual Studio 15 2017 Win64
set DEPEND_DIR=%1
set HDF5_ROOT=%DEPEND_DIR%


:: Configuration
cmake ../caffe ^
    -G"%CMAKE_GENERATOR%" ^
    -DCMAKE_INSTALL_PREFIX=_install ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DBUILD_STATIC_CRT_LIBS=ON ^
    -DCPU_ONLY=ON ^
    -DCUDA_ARCH_NAME:STRING=Pascal ^
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
    -DGFlags_DIR=%DEPEND_DIR%/lib/cmake/gflags ^
    -DGFLAGS_INCLUDE_DIR=%DEPEND_DIR%/include ^
    -DGLOG_DIR=%DEPEND_DIR%/lib/cmake/glog ^
    -DGLOG_INCLUDE_DIR=%DEPEND_DIR%/include ^
    -DGLOG_LIBRARY=%DEPEND_DIR%/lib/glog.lib ^
    -DProtobuf_DIR=%DEPEND_DIR%/cmake ^
    -DLMDB_DIR=%DEPEND_DIR% ^
    -DOpenCV_DIR=%DEPEND_DIR% ^
    -DHDF5_DIR=%DEPEND_DIR%/cmake ^
    -DHDF5_USE_STATIC_LIBRARIES=ON ^
    -DOpenBLAS_INCLUDE_DIR=%DEPEND_DIR%/include ^
    -DOpenBLAS_LIB=%DEPEND_DIR%/lib/libopenblas.lib ^
    -DLEVELDB_ROOT=%DEPEND_DIR% ^
    -DSNAPPY_ROOT_DIR=%DEPEND_DIR% ^
    -DBOOST_ROOT=%DEPEND_DIR% ^
    -DBoost_USE_STATIC_LIBS=ON ^
    -DBoost_USE_STATIC_RUNTIME=ON

:: Build
cmake --build . --config Release --target install