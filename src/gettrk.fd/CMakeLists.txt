#=======================================================================
#$$$ CMAKEFILE DOCUMENTATION BLOCK
# Biju Thomas
# Email: biju.thomas@noaa.gov
#=======================================================================

set(fortran_srcs
  gettrk_modules.f 
  module_waitfor.f 
  cwaitfor.c
  gettrk_main.f)

set(exe_name gettrk.x) 
set(exec_dir ${CMAKE_SOURCE_DIR}/exec)

if(NOT CMAKE_BUILD_TYPE)                                                                             
    set(CMAKE_BUILD_TYPE "RELEASE")                                                                  
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel)$")
  set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -O2 -traceback -fp-model precise -i4 -r8")
  set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}  -O0 -g -traceback -check all -ftrapuv  -fp-model precise -i4 -r8")
endif()

add_executable(${exe_name} ${fortran_srcs})

IF(DEFINED hwrf_g2_inc)
  target_include_directories(
  ${exe_name} PUBLIC
  ${hwrf_g2_inc})
ELSE()
  target_include_directories(
  ${exe_name} PUBLIC
  w3emc_d
  g2_d
  sigio_4)
ENDIF()

IF(DEFINED hwrf_g2_lib)
  target_link_libraries(
  ${exe_name}
  NetCDF::NetCDF_Fortran
  w3emc::w3emc_d
  bacio::bacio_4
  ${hwrf_g2_lib}
  ${JASPER_LIBRARIES}
  ${PNG_LIBRARIES})
ELSE()
  target_link_libraries(
  ${exe_name}
  NetCDF::NetCDF_Fortran
  w3emc::w3emc_d
  g2::g2_d
  bacio::bacio_4
  ${JASPER_LIBRARIES}
  ${PNG_LIBRARIES})
ENDIF()


install(TARGETS ${exe_name} DESTINATION ${exec_dir})
