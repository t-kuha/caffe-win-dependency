:: ..\build_caffe2_gpu.cmd <Path to caffe-win-dependency>/_vs2017 <Path to Caffe2 source>

@echo off 

set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"
set DEPEND_DIR=%1
set SOURCE_DIR=%2

:: Note
::   OpenCV - Error ?
:: 
cmake %SOURCE_DIR% ^
    -G%CMAKE_GENERATOR% ^
    -DCMAKE_INSTALL_PREFIX=_install ^
    -DCMAKE_CONFIGURATION_TYPES=Release ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DUSE_ACL=OFF ^
    -DUSE_ASAN=OFF ^
    -DUSE_ATEN=OFF ^
    -DUSE_CUDA=ON ^
    -DUSE_FFMPEG=OFF ^
    -DUSE_GFLAGS=OFFmkgir ^
    -DUSE_GLOG=OFF ^
    -DUSE_GLOO=OFF ^
    -DUSE_LEVELDB=OFF ^
    -DUSE_LITE_PROTO=OFF ^
    -DUSE_LMDB=OFF ^
    -DUSE_METAL=OFF ^
    -DUSE_MOBILE_OPENGL=OFF ^
    -DUSE_MPI=OFF ^
    -DUSE_NATIVE_ARCH=OFF ^
    -DUSE_NCCL=OFF ^
    -DUSE_NERVANA_GPU=OFF ^
    -DUSE_NNAPI=OFF ^
    -DUSE_NNPACK=OFF ^
    -DUSE_NUMA=OFF ^
    -DUSE_OBSERVERS=OFF ^
    -DUSE_OPENCV=OFF ^
    -DUSE_OPENMP=OFF ^
    -DUSE_PROF=OFF ^
    -DUSE_REDIS=OFF ^
    -DUSE_ROCKSDB=OFF ^
    -DUSE_SNPE=OFF ^
    -DUSE_TENSORRT=OFF ^
    -DUSE_ZMQ=OFF ^
    -DUSE_ZSTD=OFF ^
    -DBUILD_BINARY=ON ^
    -DBUILD_CUSTOM_PROTOBUF=ON ^
    -DBUILD_DOCS=OFF ^
    -DBUILD_PYTHON=ON ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DBUILD_TEST=OFF ^
    -DCUDA_ARCH_NAME=Pascal ^
    -DCPUINFO_RUNTIME_TYPE=static ^
    -Dgflags_DIR=%DEPEND_DIR%/lib/cmake/gflags ^
    -DGFLAGS_ROOT_DIR=%DEPEND_DIR% ^
    -DGLOG_ROOT_DIR=%DEPEND_DIR% ^
    -DLEVELDB_ROOT=%DEPEND_DIR% ^
    -DSNAPPY_ROOT_DIR=%DEPEND_DIR% ^
    -DLMDB_DIR=%DEPEND_DIR% ^
    -DOpenCV_DIR=%DEPEND_DIR% 

:: Start build
cmake --build . --config Release --target install