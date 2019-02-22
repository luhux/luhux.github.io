---
layout: post
title:  在Linux上使用pkgsrc
date:   2019-02-13 11:07
description: linux pkgsrc source
comments: true
---

---------------------------------------------

环境: Linux

---------------------------------------------


1. 下载解压pkgsrc

2. 更新pkgsrc为最新

3. 在系统安装编译器和工具

4. bootstrap 安装 pkgtools 和 bmake

5. 使用

6. 在pkgsrc安装的服务找不到管理脚本

7. 管理服务

# 下载解压pkgsrc

> 如果已经下载解压 可跳过这一步

```
# ftp ftp://ftp.NetBSD.org/pub/pkgsrc/current/pkgsrc.tar.gz
# tar zxf pkgsrc.tar.gz -C /usr
```

# 更新pkgsrc为最新

```
# cd /usr/pkgsrc && env CVS_RSH=ssh cvs up -dP
```

# 在系统安装编译器和工具

pkgsrc的bootstrap需要一个C编译器和一些工具

* gcc
* gmake 
* automake (可能非必须)

请确保拥有这些编译器和工具

CentOS安装:

    # yum install make automake gcc gcc-c++ 

# bootstrap 安装 pkgtools 和 bmake

```
# cd /usr/pkgsrc/bootstrap/
# ./bootstrap 
```

# 添加目标bin和sbin到PATH环境变量

将下面文件加入你的全局环境变量文件
```
export PATH=${PATH}:/usr/pkg/bin:/usr/pkg/sbin
```

比如加入/etc/profile

```
echo 'export PATH=${PATH}:/usr/pkg/bin:/usr/pkg/sbin' >> /etc/profile
```

然后重新登陆用户

执行bmake

如果命令找到则添加成功

# 使用

NetBSD 上的pkgsrc的决大多数用法在其他平台同样通用

Linux没有pkgsrc源的二进制支持的，所以要自己编译.

# 在pkgsrc安装的服务找不到启动脚本

```
# ls /usr/pkg/share/examples/rc.d/
```

找到需要的服务并复置到 /etc/rc.d/

```
# cp /usr/pkg/shar/examples/rc.d/服务脚本名 /etc/pkgsrc-rc.d/
```

我通过pkgsrc安装了apache24

```
# ls /usr/pkg/share/examples/rc.d/
apache mysqld
```

复制

```
# cp /usr/pkg/share/examples/rc.d/apache /etc/pkgsrc-rc.d/
```

# 管理服务

```
# /路径/服务脚本 操作
```

一般服务操作有

|操作 | 描述   |
| ---- | ----- |
|start | 开启服务(当服务在rc.conf中启用) |
|stop  | 关闭服务(当服务在rc.conf中启用) |
|restart| 重启服务(当服务在rc.conf中启用)|
|onestart| 开启服务(当服务在rc.conf中未启用) |
|onestop |  关闭服务(当服务在rc.conf中未启用) |
|onerestart | 重启服务(当服务在rc.conf中未启用)|
|status| 查看服务运形状态 |

开启apache
```
# /etc/pkgsrc-rc.d/apache start
```
关闭apache
```
# /etc/pkgsrc-rc.d/apache stop
```
重启apache
```
# /etc/pkgsrc-rc.d/apache restart
```


--------------------

http://www.netbsd.org/docs/pkgsrc/getting.html#getting-via-tar

http://www.netbsd.org/docs/pkgsrc/getting.html#uptodate-cvs

https://www.netbsd.org/docs/guide/en/chap-rc.html



