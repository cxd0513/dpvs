wget https://fast.dpdk.org/rel/dpdk-17.05.2.tar.xz
tar vxf dpdk-17.05.2.tar.xz
cp patch/dpdk-stable-17.05.2/*.patch dpdk-stable-17.05.2/
cd dpdk-stable-17.05.2/
patch -p 1 < 0001-PATCH-kni-use-netlink-event-for-multicast-driver-par.patch
make config T=x86_64-native-linuxapp-gcc
make
export RTE_SDK=$PWD
echo 1024 > /sys/devices/system/node/node0/hugepages/hugepages-2048kB/nr_hugepages
mkdir /mnt/huge
mount -t hugetlbfs nodev /mnt/huge
modprobe uio
insmod build/kmod/igb_uio.ko
insmod build/kmod/rte_kni.ko

