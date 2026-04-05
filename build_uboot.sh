#!/bin/bash

set -e
set -x

export ARCH=arm
export CROSS_COMPILE=/home/chao/study/linux_toolchain/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-

configure() {
    # copy override dts and defconfig
    for file in $(find override -type f); do
        dest_dir=uboot/${file#*/}
        cp -vf $file $dest_dir
    done
    make -C uboot/ O=../output/ $1
}
build() {
    make -j8
}
if [[ ! -z $1 ]]; then
    echo "configuring........."
    configure $1
else
    echo "Building............."
    build
fi