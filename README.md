# caffe-win-dependency


***Note: This repo is under development***


***Note: For how to build Caffe for Windows, please refer to the Wiki (https://github.com/t-kuha/caffe-win-dependency/wiki)***


***
#### LMDB
- Based onf ver. 0.9.21
  - https://github.com/LMDB/lmdb
- How to build: Use included CMake file


#### Snappy
- Based on ver. 1.1.7
  - https://github.com/google/snappy
- Required for LevelDB
- How to build: Use CMake


#### LevelDB
- Based on Bureau 14 LevelDB branch (915d663292b2b288cb27ed9cb82818bb75fc37b4)
  - https://github.com/bureau14/leveldb

- Note: current original code in Google's repo (https://github.com/google/leveldb) doesn't compile for Windows.


#### ffmpeg
- Based on n3.4.2
  - https://ffmpeg.org/
  - https://github.com/FFmpeg/FFmpeg

- Reference: https://qiita.com/omochimetaru/items/35df0524594255354885

```bash
# In msys
mkdir _build
cd _build
../configure --toolchain=msvc --prefix=<Destination> --enable-static --disable-programs
make install
```


#### glog
- Based on ver 0.3.5
  - https://github.com/google/glog

  - Build gflag first
  - Use CMake (With "-Dgflags_DIR=_install/lib/gflags/cmake")
  - Open the generated project in Visual Studio GUI
  - Change "Runtime Library" from "/MD" to "/MT" 


#### gflags
- Based on ver 2.2.1
  - https://github.com/gflags/gflags

  - Use CMake
  - Open the generated project in Visual Studio GUI
  - Change "Runtime Library" from "/MD" to "/MT" 


#### protobuf
- Based on v3.5.1
  - https://github.com/google/protobuf
  - How to build: Use CMake
  - Without test (thus without gmock & gtest)
  

#### HDF5
- HDF5-1.8.20
  - https://www.hdfgroup.org/
  - https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.20.zip
  - For Caffe (1.0) only


#### Boost
- 1.65.1
  - https://github.com/boostorg
  - https://github.com/boostorg/boost

  ```PowerShell
  .\bootstrap.bat
  .\b2 install -j8 --prefix=<Destination> toolset=msvc address-model=64 runtime-link=static link=static variant=release --with-filesystem
  .\b2 install -j8 --prefix=<Destination> toolset=msvc address-model=64 runtime-link=static link=static variant=release --with-system
  .\b2 install -j8 --prefix=<Destination> toolset=msvc address-model=64 runtime-link=static link=static variant=release --with-thread
  .\b2 install -j8 --prefix=<Destination> toolset=msvc address-model=64 runtime-link=static link=static variant=release --with-python
  .\b2 install -j8 --prefix=<Destination> toolset=msvc address-model=64 runtime-link=static link=static variant=release --with-date_time
  ```

#### OpenCV
- 3.4.0
  - https://opencv.org/
  - https://github.com/opencv/opencv.git
