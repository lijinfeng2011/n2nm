

===============================================
安装n2n：

git clone https://github.com/ntop/n2n
cd n2n/
yum  -y install install autoconf automake libtool
./autogen.sh
./configure
make
make install

安装成功后，有supernode 和 edge 两个命令


==============================================
启动suoernode：

supernode -l 6699 -v
新版的是： supernode  -p 6699

注： 在需要被代理的机器上运行一个即可，代理机往这个supernode连接，默认是UDP协议。需要开通ACL。
==============================================
启动edge：

选择一个网段，不要和现在使用的冲突，比如192.168.100.0/24 

然后代理机和被代理的机器各种使用一个上面网段的ip来连接supernode
edge -d edge0 -a 192.168.100.1 -c n2n -k eff5bc1ef8edwedce640fc4davereaew -l xxx.xxx.xxx.xxx:6699 -M 1500 -r

-d 是网卡名
-a 虚拟ip，每个机器选择一个不一样的
-c  起一个相同的名字，一个网络用一个名字。
-k 密码
-l (xxx.xxx.xxx.xxx 是supernode 的ip)


都连接到一个supernode后，机器之间的虚拟ip可以相互ping通

=============================================

代理机开启转发：

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables --append FORWARD --source 192.168.100.0/24 --jump ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.100.0/24 -o eth0 -j MASQUERADE

永久保存：
iptables-save


sysctl -w net.ipv4.ip_forward=1
vi /etc/sysctl.conf --> net.ipv4.ip_forward=1 （永久开启）
================================================

添加代理网段：

route add -net 172.20.31.0 netmask 255.255.255.0 gw 192.168.100.2

永久保存：
 /etc/sysconfig/static-routes 中添加  any  net 172.20.31.0 netmask 255.255.255.0 gw 192.168.100.2

注： 172.20.31.0/24 是被代理的网段， 192.168.100.2 是代理机n2n虚拟出来的ip



===================
###################
或者通过下面命令添加路由
  ip route add xx.xx.xx.xx via 192.168.245.111 dev edge0

