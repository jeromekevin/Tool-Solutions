#!/usr/bin/env bash
set -euo pipefail

cd $PACKAGE_DIR
readonly package=scipy
readonly version=$SCIPY_VERSION
readonly src_host=https://github.com/scipy
readonly src_repo=scipy

git clone ${src_host}/${src_repo}.git
cd ${src_repo}
git checkout v$version -b v$version

envsubst < $PACKAGE_DIR/site.cfg > ./site.cfg
rm $PACKAGE_DIR/site.cfg

export CFLAGS="${BASE_CFLAGS} -O3"
export LDFLAGS="${BASE_LDFLAGS}"

python setup.py install

