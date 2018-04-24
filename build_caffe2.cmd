:: Usage:
:: ..\build_caffe2.cmd <Path to caffe-win-dependency>/_vs2017 <Path to Caffe2 source>


@echo off 

set CMAKE_GENERATOR="Visual Studio 15 2017 Win64"
set DEPEND_DIR=%1
set SOURCE_DIR=%2

cmake %SOURCE_DIR% ^
    -G%CMAKE_GENERATOR% ^
    -DCMAKE_INSTALL_PREFIX=_install ^
    -DCMAKE_CONFIGURATION_TYPES=Release ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DUSE_ACL=OFF ^
    -DUSE_ASAN=OFF ^
    -DUSE_ATEN=OFF ^
    -DUSE_CUDA=OFF ^
    -DUSE_FFMPEG=OFF ^
    -DUSE_GFLAGS=ON ^
    -DUSE_GLOG=ON ^
    -DUSE_GLOO=OFF ^
    -DUSE_LEVELDB=ON ^
    -DUSE_LITE_PROTO=OFF ^
    -DUSE_LMDB=ON ^
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
    -DUSE_ROCKSDB=ON ^
    -DUSE_SNPE=OFF ^
    -DUSE_TENSORRT=OFF ^
    -DUSE_ZMQ=OFF ^
    -DUSE_ZSTD=OFF ^
    -DBUILD_BINARY=ON ^
    -DBUILD_CUSTOM_PROTOBUF=ON ^
    -DBUILD_DOCS=OFF ^
    -DBUILD_PYTHON=OFF ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DBUILD_TEST=OFF ^
    -DCPUINFO_RUNTIME_TYPE=static ^
    -Dgflags_DIR=%DEPEND_DIR%/lib/cmake/gflags ^
    -DGFLAGS_ROOT_DIR=%DEPEND_DIR% ^
    -DGLOG_ROOT_DIR=%DEPEND_DIR% ^
    -DLEVELDB_ROOT=%DEPEND_DIR% ^
    -DSNAPPY_ROOT_DIR=%DEPEND_DIR% ^
    -DLMDB_DIR=%DEPEND_DIR% ^
    -DROCKSDB_ROOT_DIR=%DEPEND_DIR% ^
    -DOpenCV_DIR=%DEPEND_DIR% 

:: Start build
cmake --build . --config Release --target install