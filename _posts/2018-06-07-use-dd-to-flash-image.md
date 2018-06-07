---
layout: post
title: "使用dd命令刷写镜像"
date: 2018-06-07 08:14:12
image: 'https://raw.githubusercontent.com/luhux/images/master/dd_command.jpg    '
description: dd基础用法
category: ''
tags: dd ,linux 
twitter_text:
introduction:
---

dd 命令可以在大多数拥有root的Linux设备上使用它(busybox内置)

1.向一个块设备刷写镜像

    # dd if=镜像文件 of=设备

这个命令会将源文件中的所有内容写入目标设备

如果目标是内存卡之类的设备

则需要指定写入块大小

    # dd bs=块大小 if=镜像文件 of=设备

块大小默认单位为b

在新版的dd里可以指定单位如：K,M,G

不过在不确定是否支持单位的情况下，转换为默认单位较为安全

例如指定块大小为4M:

4m * 1024 * 1024 = 4194304

2,备份一个块设备

    # dd if=设备 of=文件

执行这条命令会将设备的所有数据提取写入到指定的文件

由此可以制作分区镜像备份

由dd提取的数据还可以通过dd写回去

3,硬盘对拷

    # dd if=设备1 of=设备2

只要目标硬盘空间足够就可以进行整个硬盘的对拷

4,数据销毁

    # dd if=填充物 of=设备

“填充物”：
/dev/zero 填0
/dev/random 填随机数据

5,制作虚拟空镜像

    # dd bs=块大小 count=个数 if=/dev/zero of=文件

这条命令可以创建指定大小的空映像文件

指定大小＝块大小＊个数
例如:

1G:
    
    # dd bs=1G count=1 if=/dev/zero of=1.img

128M:

    # dd bs=32M count=4 if=/dev/zero of=2.img

###注意
bs参数不仅指定的是块大小，而且影响着dd命令写入的快慢,以及机器资源的占用

也就是 :

块大小与写入速度和资源占用成正比

在一些性能低下的机器上过大的块大小可能引起机器卡死


