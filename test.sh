#!/bin/bash
set -ex

pushd "$(dirname "$0")"

echo The needs of the many outweigh the needs of the few. | node dist/link-parser.js

popd
