#!/bin/bash
set -ex

# Change directory to project root
pushd "$(dirname "$0")/.."

# Activate emscripten sdk if not done already
[ ! $EMSDK ] && pushd emsdk && source ./emsdk_env.sh && popd

npm link
echo The needs of the many outweigh the needs of the few. | link-parser-js en -constituents=1
npm unlink

popd
