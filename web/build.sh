#!/bin/bash
set -ex
pushd "$(dirname "$0")"

pushd emsdk
source ./emsdk_env.sh
popd

pushd ..
emconfigure configure --disable-sat-solver --disable-java-bindings --disable-python-bindings
emmake make
emcc -O3 /usr/local/lib/liblink-grammar.so -o liblink-grammar.js
cat liblink-grammar.js
popd

# file PATHTO/.libs/link-parser # result: LLVM IR bitcode
# mv link-parser link-parser.bc
# emcc -O3 link-parser.bc PATHTO/liblink-grammar.so -o link-parser.js
# emcc -O3 link-parser.bc PATHTO/liblink-grammar.so -o link-parser.html

popd
