# use build_root.sh to build uboot as using make
# find_node.sh is to find a node in a .dts file and its headers
## usage
./find_node.sh [node name] [the path to the dts]
For example:
./find_node.sh "clks" arch/arm/dts/imx6ull-14x14-evk-emmc.dts