#!/bin/bash
set -ex

# Change directory to project root
pushd "$(dirname "$0")/.."

git clone https://github.com/opencog/link-grammar link-grammar
pushd link-grammar
git checkout dcec4933e784368bde731907848ce09c81207458
./autogen.sh
popd

popd
