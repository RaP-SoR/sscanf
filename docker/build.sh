#!/bin/bash

# Available configs: Debug, [RelWithDebInfo], Release
[[ -z "$CONFIG" ]] \
&& config=RelWithDebInfo \
|| config="$CONFIG"
# Available versions: 22.04, [24.04], 26.04
[[ -z "$UBUNTU_VERSION" ]] \
&& ubuntu_version=24.04 \
|| ubuntu_version="$UBUNTU_VERSION"

docker build \
    -t sscanf/build:ubuntu-${ubuntu_version} \
    build_ubuntu-${ubuntu_version}/ \
|| exit 1

if [[ ! -d "./build" ]]; then
    mkdir build &&
    chown 1000:1000 build || exit 1
fi

docker run \
    --rm \
    -t \
    -w /code \
    -v $PWD/..:/code \
    -v $PWD/build:/code/build \
    -e CONFIG=${config} \
    sscanf/build:ubuntu-${ubuntu_version}
