#!/bin/bash
set -ex

# Change directory to project root
pushd "$(dirname "$0")/.."

git clone -b link-grammar-5.8.1 https://github.com/opencog/link-grammar link-grammar
pushd link-grammar
./autogen.sh
popd

popd
