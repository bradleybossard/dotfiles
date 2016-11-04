sudo apt-get install --yes cmake build-essential libboost-all-dev
git clone -b Linux https://github.com/nicehash/nheqminer.git
cd nheqminer/cpu_xenoncat/Linux/asm/
sh assemble.sh
cd ../../../Linux_cmake/nheqminer_cpu
cmake .
make -j $(nproc)

# cd /nheqminer/Linux_cmake/nheqminer_cpu
# ./nheqminer_cpu -l us1-zcash.flypool.org:3333 -u <z-cash-address>.worker1 -t 4
