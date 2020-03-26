#!/bin/bash
set -ex

pushd "$(dirname "$0")"

npm link
echo The needs of the many outweigh the needs of the few. | link-parser-js
npm unlink

popd
