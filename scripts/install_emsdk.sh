#!/bin/bash
set -ex

# Change directory to project root
pushd "$(dirname "$0")/.."

git clone https://github.com/emscripten-core/emsdk emsdk
pushd emsdk
git pull
./emsdk install 1.38.41
./emsdk activate 1.38.41
popd

popd
