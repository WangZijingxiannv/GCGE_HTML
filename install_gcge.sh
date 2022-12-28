#!/bin/bash
#download and install petsc
# wget https://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.18.2.tar.gz #源码包版本根据需要可以修改
git clone -b release https://gitlab.com/petsc/petsc.git petsc
cd petsc
cp ./install/install.petsc.sh ./
sh install.petsc.sh
make all
PETSC_DIR=$(pwd)
PETSC_ARCH=
export PETSC_DIR=$PETSC_DIR
export PETSC_ARCH=
echo "export PETSC_DIR=$PETSC_DIR" >> ~/.bashrc
echo "export PETSC_ARCH=" >> ~/.bashrc
source ~/.bashrc
cd ..
slepc_version=slepc-3.18.1 #源码包版本根据需要可以修改
wget https://slepc.upv.es/download/distrib/${slepc_version}.tar.gz 
tar -xvf ${slepc_version}.tar.gz
cd ${slepc_version}
cp ./install/install.slepc.sh ./
sh install.slepc.sh
make
make install
SLEPC_DIR=$(pwd)
export SLEPC_DIR=$SLEPC_DIR
echo "export SLEPC_DIR=$SLEPC_DIR" >> ~/.bashrc
