#!/bin/bash
if [ "$#" -ne 0 ]; then
  echo ignoring command-line arguments ...
fi
if [ -f `which mpicc` ]; then
  echo found mpicc = `which mpicc`
  compiler=`mpicc --version | head -n 1 | cut -b 1-3`
  if [ "$compiler" != "gcc" ]; then
    echo please set the mpicc command to use gcc as the C compiler and re-run ./configure.sh 
    echo example: "export OMPI_CC=gcc; or export MPICH_CC=gcc" ... exiting
  else
   cp makefile.in makefile
   echo " "
   echo type \"make\" to build libmpitrace.so
  fi
else
  echo ensure that mpicc is in your PATH and re-run ./config.sh ... exiting
fi
