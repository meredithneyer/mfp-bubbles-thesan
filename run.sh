#!/bin/bash

export OMP_NUM_THREADS=1
# export OMP_NUM_THREADS=16

# Mac laptops
# brew install openmpi libomp hdf5
CC="/usr/local/bin/mpicxx"
CFLAGS="-Xpreprocessor -fopenmp -std=c++14"
IFLAGS=""
LFLAGS="-lomp -lhdf5"

# # Engaging cluster (gcc)
# module purge
# module load gcc/9.3.0 openmpi/4.0.5
# CC="mpicxx"
# CFLAGS="-fopenmp -std=c++14 -O3"
# IFLAGS=""
# LFLAGS="-lhdf5 -lz"

# Build executable
compile () {
  rm -f $1
  ${CC} ${CFLAGS} ${IFLAGS} -c $1.cc -o $1.o
  ${CC} ${CFLAGS} $1.o ${LFLAGS} -o $1
}

# Run executable
run () {
  compile $1
  # ./$1 [/path/to/Thesan] [output directory] [snapshot number]
  ./$1 ../Thesan-1 output 54    # for example
}

# compile thesan-mfp-hist-grid
run thesan-mfp-hist-grid
