# use build_root.sh to build uboot as using make
# find_node.sh is to find a node in a .dts file and its headers
## usage
./build_uboot.sh mx6ull_defconfig
cd output
../build_uboot.sh

# build_uboot.sh will copy dts and defconfig to uboot folder then config it.

then copy u-boot-dtb.imx and uuu it:
uuu u-boot-dtb.imx
or use uuu script in buildroot

// to update defconfig
make savedconfig
cp defconfig ../override/configs/mx6ull_defconfig
<!-- cp defconfig uboot/configs/mx6ull_14x14_evk_emmc_defconfig -->


./find_node.sh [node name] [the path to the dts]
For example:
./find_node.sh "clks" arch/arm/dts/imx6ull-14x14-evk-emmc.dts