---
layout: post
title: 如何在安卓上使用chroot体验Linux发行
date: 2018-02-20
categories: blog
tags: [android,chroot,linux]
description: 如何在安卓上使用chroot体验Linux发行

---
#如何在安卓上使用chroot体验Linux发行

chroot是Linux的运行机制,上至系统安全,下至Linux系统的每次启动和系统安装
我的这篇文章给大家说一下利用chroot在安卓上运行Linux发行

有关chroot的更多可以看这篇文章: https://www.ibm.com/developerworks/cn/linux/l-cn-chroot/

首先，你需要一个获得root权限的安卓手机。 以及良好的网络
我的这篇文章里用到的安卓软件

 * linuxdeploy 用来管理，创建和启动chroot用到的rootfs

推荐软件：
 * connetbot 安卓上的一个ssh软件 
 * xserver sdl 一个x服务连接器

这篇文章只会讲如何正确使用linuxdeploy这个软件，并不会过多得讲一些细节
如果你好奇软件的实现方式,我建议你去看看他内置的sh脚本和软件在GitHub的源码

1. 准备

确认手机拥有500MB及以上的存储空间，正常授权root权限以及正常的网络

2. 配置安装环境

打开linuxdeploy  等待程序运行环境的初始化完成

然后进入软件的发行配置界面
选择自己需要的配置

这个教程以我的armv7红米note1s 使用软件安装Linux发行Kali(kali-rolling)为例

这是需要配置的设置

运行模式 chroot
发行 Kali
架构 armhf
版本 kali-rolling
源地址 http://http.kali.org/kali/
安装类型 目录
安装位置 ${ENV\_DIR}/rootfs/kalilinux
用户名 android
密码 12345678
最高权限用户 root
DNS服务器 8.8.8.8
本地化 POSIX
init 未勾选配置
挂载 未勾选配置
ssh 勾选启用
图形界面 未勾选配置

上面所有配置都是面对将要部署的发行的

对于几个配置我需要解释一下
架构应选择自己手机匹配的架构
源地址可以自己配置为国内源
安装类型为目录可以和外部的安卓共享一个存储空间，比起文件（创建虚拟磁盘镜像）安装更省空间
安装位置我设置在了默认环境下
用户名和密码是指一会儿部署的Linux发行内要创建的普通账户的用户名密码
DNS自己选择
本地化是语言选择
勾选ssh以安装ssh
这里没有勾选图形界面是因为这个软件的图形界面配置脚本不怎么靠谱，一会儿我会说一下手动配置

3. 安装

点软件主界面右上角菜单的安装
安装过程会调用发行的自动化部署安装脚本
比如
Debian系安装时的debootstrap
Centos安装时的febootstrap

要是网络不开小差的话，安装进程会正常进行
只附加ssh的话在软件主界面等待15－30分钟差不多就安装好了
要是没有安装好的话，一般就是网络问题了

在看到ssh已经安装完成时,你的Linux发行就已经部署好了
现在把它停止

4. 启动

现在你拥有一个完整的Linux发行rootfs
接下来的日子里，你只需使用启动和关闭这两个操作

点击启动启动Linux发行
点击停止关闭Linux发行

ssh等服务在启动成功的状态下应该是done

5. ssh

这个chroot是在本地运行的,所以和手机共享/dev /proc /sys 和网络
所以连接这个chroot输入手机的地址和ssh的端口就可以了
如果是手机本地连接那就使用localhost或者127.0.0.1来连接
未配置的系统需要使用安装时设置的用户名和密码登录
记得在登录后及时改用户名密码

6. 图形界面

这里的图形界面只讲本地xserver xsdl连接
对于vnc的配置和服务器的vnc配置无多少异样
对于fb显示方式，我也搞不懂，因为我手机并不支持这种显示方式

我这里讲安装启动xfce桌面

安装xfce：

    sudo apt install xfce4

配置启动脚本

    touch startxfce.sh

写入：

```
#!/bin/sh
export DISPLAY=:0
#指定为本地xserver xsdl显示
startxfce4 &
#让xfce在后台运行
```


接下来打开xserver xsdl
对于这个软件我不会过多讲，该怎么好好使用琢磨一下就可以

打开，配置好，等到蓝屏界面,看见export的那个界面

然后登录回ssh执行那个脚本

    bash startx.sh

这样xfce桌面就出现在xsdl上了



祝读者玩的愉快

chroot部署的Linux并不能使用一些过于底层的功能。因为它只是在（监狱）中运行的发行

下面解答一些由于安卓特性导致的问题：
如果你在这上面运行mysql 或者 PostgreSQL 等其他使用套接字的软件时

那么会遇到没有套接字权限的问题
在安卓上跑需要多一个步骤：
将运行用户加入套接字权限组：

mysql:

    sudo usermod -G aid_inet mysql

postgresql:

    sudo usermod -G aid_inet postgres

普通运行socket的用户：

    sudo usermod -G aid_inet username




玩的愉快


严禁商业转载
luhux@hotmail.com
20180220
