#!/bin/bash
set -ex

# Change directory to project root
pushd "$(dirname "$0")/.."

# Activate emscripten sdk if not done already
[ ! $EMSDK ] && pushd emsdk && source ./emsdk_env.sh && popd

# Compile LLVM bitcode
pushd link-grammar
emconfigure ./configure --disable-editline --disable-sat-solver --disable-java-bindings --disable-python-bindings
emmake make
popd

# Create empty `dist` folder
rm -rf dist
mkdir dist

# Compile link-parser.js
cp link-grammar/link-parser/.libs/link-parser link-parser.bc
emcc -O3 link-parser.bc link-grammar/link-grammar/.libs/liblink-grammar.so \
	--pre-js src/pre.js \
	--memory-init-file 0 \
	-s WASM=0 \
	-s ALLOW_MEMORY_GROWTH=1 \
    -o dist/link-parser.js
rm link-parser.bc

# Copy contents of `data` dir
cp -r link-grammar/data dist/data

popd
