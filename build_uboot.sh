#!/bin/bash

set -e
set -x

export ARCH=arm
export CROSS_COMPILE=/home/chao/study/linux_toolchain/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-



make $@