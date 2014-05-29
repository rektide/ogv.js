#!/bin/bash

dir=`pwd`

# set up the build directory
mkdir build
cd build

mkdir js
cd js

mkdir root
mkdir libopus
cd libopus
  
# finally, run configuration script
emconfigure ../../../libopus/configure --disable-shared --disable-asm --disable-oggtest --disable-doc --disable-extra-programs --prefix="$dir/build/js/root"

# compile libopus
emmake make
emmake make install

cd ..

emcc -O2 -s ASM_JS=1 -s EXPORTED_FUNCTIONS="['_opus_decoder_create', '_opus_decode_float', '_opus_decoder_destroy', '_opus_encoder_init', '_opus_encode_float', '_opus_encoder_destroy']" libopus/.libs/libopus.a -o libopus.js

cd ..
cd ..
