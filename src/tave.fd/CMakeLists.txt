#=======================================================================
#$$$ CMAKEFILE DOCUMENTATION BLOCK
# Biju Thomas
# Email: biju.thomas@noaa.gov
#=======================================================================

set(fortran_srcs
  tave.f)

set(exe_name tave.x) 
set(exec_dir ${CMAKE_SOURCE_DIR}/exec)

if(NOT CMAKE_BUILD_TYPE)                                                                             
    set(CMAKE_BUILD_TYPE "RELEASE")                                                                  
endif()

if(CMAKE_Fortran_COMPILER_ID MATCHES "^(Intel)$")
  set(CMAKE_Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE} -O2 -fp-model precise -i4 -r8")
  set(CMAKE_Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}  -O0 -g -traceback -check all -fp-model precise -i4 -r8")
endif()

add_executable(${exe_name} ${fortran_srcs})

target_include_directories(
  ${exe_name} PUBLIC
  w3emc::w3emc_d
  g2::g2_d
  sigio::sigio_4)

target_link_libraries(
  ${exe_name}
  w3emc::w3emc_d
  g2::g2_d
  bacio::bacio_4)


install(TARGETS ${exe_name} DESTINATION ${exec_dir})
