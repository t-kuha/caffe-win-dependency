# CMakeFile for building Windows version of LMDB
cmake_minimum_required(VERSION 3.0)

set(project_name liblmdb)
project (${project_name})

file(GLOB SRC *.c *.h)

# Allow windows only
if(NOT MSVC)
    message("This CMake file is compatible only with Windows...")
endif()


# Build static library
add_library(liblmdb STATIC
    mdb.c
    midl.c
)

# Destination
set(CMAKE_INSTALL_PREFIX ${PROJECT_BINARY_DIR}/_install)

# Install header files
install(FILES
    ${PROJECT_SOURCE_DIR}/lmdb.h
    ${PROJECT_SOURCE_DIR}/midl.h
    DESTINATION include)
    
install (
    TARGETS liblmdb 
    DESTINATION lib)
