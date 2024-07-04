help([[
loads hafs_tracker modulefile and related set environment veriables on Cactus and Dogwood
]])

envvar_ver=os.getenv("envvar_ver") or "1.0"
load(pathJoin("envvar", envvar_ver))

PrgEnv_intel_ver=os.getenv("PrgEnv_intel_ver") or "8.3.3"
load(pathJoin("PrgEnv-intel", PrgEnv_intel_ver))

intel_ver=os.getenv("intel_ver") or "19.1.3.304"
load(pathJoin("intel", intel_ver))

craype_ver=os.getenv("craype_ver") or "2.7.17"
load(pathJoin("craype", craype_ver))

cray_mpich_ver=os.getenv("cray_mpich_ver") or "8.1.19"
load(pathJoin("cray-mpich", cray_mpich_ver))

cray_pals_ver=os.getenv("cray_pals_ver") or "1.2.2"
load(pathJoin("cray-pals", cray_pals_ver))

jasper_ver=os.getenv("jasper_ver") or "2.0.25"
load(pathJoin("jasper", jasper_ver))

zlib_ver=os.getenv("zlib_ver") or "1.2.11"
load(pathJoin("zlib", zlib_ver))

libpng_ver=os.getenv("libpng_ver") or "1.6.37"
load(pathJoin("libpng", libpng_ver))

libjpeg_ver=os.getenv("libjpeg_ver") or "9c"
load(pathJoin("libjpeg", libjpeg_ver))
setenv("JPEG_LIBRARIES", "/apps/spack/libjpeg/9c/intel/19.1.3.304/jkr3isi257ktoouprwaxcn4twtye747z/lib")

hdf5_ver=os.getenv("hdf5_ver") or "1.14.0"
load(pathJoin("hdf5-C", hdf5_ver))

netcdf_ver=os.getenv("netcdf_ver") or "4.9.2"
load(pathJoin("netcdf-C", netcdf_ver))

g2_ver=os.getenv("g2_ver") or "3.4.5"
load(pathJoin("g2", g2_ver))

w3emc_ver=os.getenv("w3emc_ver") or "2.9.2"
load(pathJoin("w3emc", w3emc_ver))

bacio_ver=os.getenv("bacio_ver") or "2.4.1"
load(pathJoin("bacio", bacio_ver))

setenv("CMAKE_C_COMPILER", "cc")
setenv("CMAKE_CXX_COMPILER", "CC")
setenv("CMAKE_Fortran_COMPILER", "ftn")
setenv("CMAKE_Platform", "wcoss2")

whatis("Description: HAFS Applicationenvironment")
