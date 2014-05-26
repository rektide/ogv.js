#!/bin/bash

dir=`pwd`

# set up the build directory
mkdir build
cd build

mkdir js
cd js

mkdir root
mkdir daala
cd daala

../../../daala/autogen.sh

# finally, run configuration script
emconfigure ../../../daala/configure --prefix="$dir/build/js/root" --with-ogg="$dir/build/js/root" --disable-oggtest --disable-asm --disable-player --disable-unit-tests --disable-doc --disable-dump-images

# compile daala
emmake make
emmake make install

cd ..
cd ..
cd ..
