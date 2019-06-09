#!/bin/bash
set -ex

pushd "$(dirname "$0")"

git clone https://github.com/emscripten-core/emsdk.git
pushd emsdk
git pull
./emsdk install 1.38.34
./emsdk activate 1.38.34
popd

popd
