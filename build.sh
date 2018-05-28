wget https://fast.dpdk.org/rel/dpdk-17.05.2.tar.xz
tar vxf dpdk-17.05.2.tar.xz
cp patch/dpdk-stable-17.05.2/*.patch dpdk-stable-17.05.2/
cd dpdk-stable-17.05.2/
patch -p 1 < 0001-PATCH-kni-use-netlink-event-for-multicast-driver-par.patch
make config T=x86_64-native-linuxapp-gcc
make -j40
export RTE_SDK=/root/dpvs/dpdk-stable-17.05.2


