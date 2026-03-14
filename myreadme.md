# use build_root.sh to build uboot as using make
# find_node.sh is to find a node in a .dts file and its headers
## usage
./build_uboot.sh -C uboot/ O=../output/ mx6ull_14x14_evk_emmc_defconfig
cd output
../build_uboot.sh

then copy u-boot.bin and uuu it:
uuu u-boot.bin

./find_node.sh [node name] [the path to the dts]
For example:
./find_node.sh "clks" arch/arm/dts/imx6ull-14x14-evk-emmc.dts