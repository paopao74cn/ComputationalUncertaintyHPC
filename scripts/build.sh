#!/bin/bash

source scripts/base-vars.sh

threads=4

spack install -j ${threads} -v "enzo@2.5%${compiler} mode=${optimization_level} ^hdf5@1.8.16%${compiler}~craybuilt+mpi ^openmpi@${mpi_version}%${compiler}"
