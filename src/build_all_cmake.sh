#!/bin/sh

set -eux
source ./machine-setup.sh > /dev/null 2>&1


module use ../modulefiles
module load $target
module list

#Explicitly pass to linker that executable stack is not needed 
USE_NOEXECSTACK=${USE_NOEXECSTACK:-ON}

if [ $target = hera ] || [ $target = orion ] || [ $target = jet ] || [ $target = hercules ]; then
  export USE_NOEXECSTACK=OFF
fi

cd ..
if [ -d "build" ]; then
   rm -rf build
fi
mkdir build
cd build
cmake .. -DCMAKE_Fortran_COMPILER=${CMAKE_Fortran_COMPILER} -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER} -DUSE_NOEXECSTACK=${USE_NOEXECSTACK} -DCMAKE_BUILD_TYPE=${BUILD_TYPE}
make -j 8 VERBOSE=1
make install

cd ..

exit
