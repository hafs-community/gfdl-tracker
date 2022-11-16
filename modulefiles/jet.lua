help([[
loads hafs_tracker modulefile and related set environment veriables on Jet
]])

prepend_path("MODULEPATH", "/contrib/sutils/modulefiles")
load("sutils")
load("hpss")

cmake_ver=os.getenv("cmake_ver") or "3.20.1"
load(pathJoin("cmake", cmake_ver))

prepend_path("MODULEPATH", "/lfs4/HFIP/hfv3gfs/nwprod/hpc-stack/libs/modulefiles/stack")

hpc_ver=os.getenv("hpc_ver") or "1.2.0"
load(pathJoin("hpc", hpc_ver))

hpc_intel_ver=os.getenv("hpc_intel_ver") or "2022.1.2"
load(pathJoin("hpc-intel", hpc_intel_ver))

hpc_impi_ver=os.getenv("hpc_impi_ver") or "2022.1.2"
load(pathJoin("hpc-impi", hpc_impi_ver))

jasper_ver=os.getenv("jasper_ver") or "2.0.25"
load(pathJoin("jasper", jasper_ver))

zlib_ver=os.getenv("zlib_ver") or "1.2.11"
load(pathJoin("zlib", zlib_ver))

libpng_ver=os.getenv("libpng_ver") or "1.6.37"
load(pathJoin("libpng", libpng_ver))

hdf5_ver=os.getenv("hdf5_ver") or "1.10.6"
load(pathJoin("hdf5", hdf5_ver))

netcdf_ver=os.getenv("netcdf_ver") or "4.7.4"
load(pathJoin("netcdf", netcdf_ver))

bacio_ver=os.getenv("bacio_ver") or "2.4.1"
load(pathJoin("bacio", bacio_ver))

g2_ver=os.getenv("g2_ver") or "3.4.5"
load(pathJoin("g2", g2_ver))

g2tmpl_ver=os.getenv("g2tmpl_ver") or "1.10.0"
load(pathJoin("g2tmpl", g2tmpl_ver))

w3emc_ver=os.getenv("w3emc_ver") or "2.9.2"
load(pathJoin("w3emc", w3emc_ver))

w3nco_ver=os.getenv("w3nco_ver") or "2.4.1"
load(pathJoin("w3nco", w3nco_ver))

sigio_ver=os.getenv("sigio_ver") or "2.3.2"
load(pathJoin("sigio", sigio_ver))

setenv("CMAKE_C_COMPILER", "mpiicc")
setenv("CMAKE_CXX_COMPILER", "mpiicpc")
setenv("CMAKE_Fortran_COMPILER", "mpiifort")
setenv("CMAKE_Platform", "jet.intel")

whatis("Description: HAFS Application environment")
