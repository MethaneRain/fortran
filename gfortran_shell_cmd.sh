#!/bin/sh

# Run gfortran compiler script. I haven't memorized the necessary flags
# yet for compiling Fortran with netcdf package so this script will
# document the flags...

filename=${1}
exename=${2}

gfortran $filemame -o $exename -I/usr/local/Cellar/netcdf/4.7.3_2/include -L/usr/local/Cellar/netcdf/4.7.3_2/lib -lnetcdff -lnetcdf