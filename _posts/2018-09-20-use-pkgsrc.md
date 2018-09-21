---
layout: post
title: 在NetBSD上使用包管理器pkgsrc
date:   2018-09-20 11:10
description: netbsd pkgsrc binary
comments: true
---
![pkgsrc](https://raw.githubusercontent.com/luhux/images/master/pkg_add_del_info.png)
---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------


> NetBSD 默认安装 pkgsrc

## 安装已经编译好的软件包

1. 指定源地址

2. 将源地址加入环境变量

3. 安装需要的包

*在NetBSD root用户下的shell运行(默认为sh)*

```
# PKG_PATH="http://cdn.NetBSD.org/pub/pkgsrc/packages/$(uname -s)/$(uname -m)/$(uname -r|cut -f '1 2' -d.)/All/"
# export PKG_PATH
# pkg_add 包名
```

## 卸载已经安装好的软件包

*在NetBSD root用户下运行*

```
# pkg_delete 包名
```

## 查看已经安装好的软件包列表

*非必需root*

```
$ pkg_info
```

## 通过包名搜索一个包

*这里使用的是我自己的一种方式:*

1. 通过*安装已经编译好的软件包*的方法安装w3m

2. 通过w3m下载包列表(源下所有文件的文件名组成的列表)

3. 通过grep筛选并输出包名 

```
# PKG_PATH="http://cdn.NetBSD.org/pub/pkgsrc/packages/$(uname -s)/$(uname -m)/$(uname -r|cut -f '1 2' -d.)/All/"
# export PKG_PATH
# pkg_add w3m
```

```
$ w3m -dump "http://cdn.NetBSD.org/pub/pkgsrc/packages/$(uname -s)/$(uname -m)/$(uname -r|cut -f '1 2' -d.)/All/" > pkg_list
```

```
$ cat pkg_list | grep 包名
```

## 默认安装到的目录

```
/usr/pkg/
```

它可能是这样:

```
$ ls /usr/pkg/
bin  emul  etc include  lib  libdata  libexec  man  sbin  share  var
```
