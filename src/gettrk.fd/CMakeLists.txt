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

if(CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel)$")
  set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -O2 -fp-model precise -i4 -r8")
endif()

add_executable(${exe_name} ${fortran_srcs})

IF(DEFINED hwrf_g2_inc)
  target_include_directories(
  ${exe_name} PUBLIC
  w3emc_d
  ${hwrf_g2_inc}
  sigio_4)
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
  w3emc_d
  ${hwrf_g2_lib}
  w3nco_d
  bacio_4
  ${JASPER_LIBRARIES}
  ${PNG_LIBRARIES})
ELSE()
  target_link_libraries(
  ${exe_name}
  NetCDF::NetCDF_Fortran
  w3emc_d
  g2_d
  w3nco_d
  bacio_4
  ${JASPER_LIBRARIES}
  ${PNG_LIBRARIES})
ENDIF()


install(TARGETS ${exe_name} DESTINATION ${exec_dir})
