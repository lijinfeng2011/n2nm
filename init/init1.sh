#!/bin/bash

yum -y install git autoconf automake libtool
rm -rf tempcode
git clone https://github.com/ntop/n2n tempcode
cd tempcode
./autogen.sh
./configure
make
make install

rm -rf ../tempcode

echo ============= check edge ==================
edge
echo =========== check supernode ===============
supernode
