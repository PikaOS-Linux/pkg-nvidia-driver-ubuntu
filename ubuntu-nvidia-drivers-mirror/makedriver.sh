#! /bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

pushd "${SCRIPT_DIR}"

DRIVER_VERSION_MAJOR="555"
DRIVER_VERSION_FULL="555.58"
DRIVER_ARCH="Linux-x86_64"
DEBIAN_ARCH="$1"
DEBIAN_FRONTEND=noninteractive

mkdir -p "amd64"

pushd "amd64" || exit 1
wget -c \
    https://us.download.nvidia.com/XFree86/$DRIVER_ARCH/$DRIVER_VERSION_FULL/NVIDIA-$DRIVER_ARCH-$DRIVER_VERSION_FULL.run
chmod +x *.run

popd || exit 2

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign -b

popd


