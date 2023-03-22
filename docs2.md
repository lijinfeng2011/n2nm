# n2n参数

## supernode
```
supernode -l UDP监听端口 
 
#参数说明
-f 前台运行
-u 指定运行所用的UID
-g 指定运行所用的GID
-v 输出比较详细的log
```

## edge
```
edge -d 虚拟网卡名 -a 10.0.0.1 -c testnet -k senrame -l 1.2.3.4:1234
 
#参数说明
-d 虚拟网卡名
-a [static:|dhcp:]虚拟网段(IP)，static模式其实可以不用加那个static: 直接写IP就行
-c 用于区分节点的社区(组)名
-k 用于加密的字符串
-K 用于加密的Key文件，和-k不能共存
-s 子网掩码
-l supernode的IP:端口，可以指定多个supernode的
-i NAT打洞间隔
-b 当使用DHCP时定期刷新IP
-p 指定本地端口
-u 指定运行所用的UID
-g 指定运行所用的GID
-f 前台运行
-m 为虚拟网卡指定MAC地址
-r 启用包转发，当-a指定DHCP时需要启用
-E 接收组播MAC地址
-v 输出比较详细的log
-t 指定用于管理的UDP端口
```
