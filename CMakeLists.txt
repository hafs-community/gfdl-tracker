#=======================================================================
#$$$ CMAKEFILE DOCUMENTATION BLOCK
# Biju Thomas
# Email: biju.thomas@noaa.gov
#=======================================================================

cmake_minimum_required(VERSION 3.15)
project( 
  HAFS_TOOLS
  LANGUAGES C Fortran)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/")

message(CMAKE_MODULE_PATH " ${CMAKE_MODULE_PATH}")
if(NOT CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel|GNU)$")
  message(WARNING "Compiler not officially supported: ${CMAKE_Fortran_COMPILER_ID}")
endif()

if(NOT CMAKE_C_COMPILER_ID MATCHES "^(Intel|GNU)$")
  message(WARNING "Compiler not officially supported: ${CMAKE_C_COMPILER_ID}")
endif()


find_package(NetCDF REQUIRED C Fortran)
#find_package(HDF5 REQUIRED)
find_package(PNG REQUIRED)
find_package(Jasper REQUIRED)
find_package(ZLIB REQUIRED)
find_package(g2 REQUIRED)
find_package(bacio REQUIRED)
find_package(w3nco REQUIRED)
find_package(w3emc REQUIRED)

add_subdirectory(src/vint.fd)
add_subdirectory(src/tave.fd)
add_subdirectory(src/supvit.fd)
add_subdirectory(src/gettrk.fd)
