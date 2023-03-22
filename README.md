# n2nm

# 使用步骤

```
1. 下载项目到 /data/n2nm, 路径随意。
2. 安装mydan，依赖mydan中的perl, 如果安装有c3的agent也可.
   https://raw.githubusercontent.com/MYDan/openapi/master/scripts/mydan/update.sh|bash
3. 安装n2n
   cd init
   ./init0.sh # 使用于centos7 x64系统，如果是其它系统执行./init1.sh进行编译安装

4. 准备conf.yml
   cp conf.example.yml conf.yml ,根据自己的信息进行配置。

5. 启动supernode
  cd supernode && start

  supernode的对应端口(默认: 6699) 的tcp和dup对外开放。

6. 配置本节点的配置
   my.name 中记录本节点的名字，和conf.yml中的对应

6. 启动edge
   cd edge && ./start

7. ping
  在安装edge的节点上相互ping一下虚拟ip，看是否通畅。


8. 添加iptable
   在代理机上添加iptable
   cd iptables && ./add

   比如A需要通过B机器进行网络代理，只需要在B机器上执行即可

9. 添加网络映射

   比如A需要其它机器进行网络转发，在A机器上添加my.net配置

   格式如：
     10.60.77.61: 98
     10.60.77.62: 98
     10.60.77.63: 192.168.100.2
   代理目标可以是ip也可以是节点的名字，通过名字可以在conf.yml中找到ip

   执行同步:
   cd net && ./sync

```

