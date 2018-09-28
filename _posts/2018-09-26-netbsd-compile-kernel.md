---
layout: post
title: NetBSD编译内核
date:   2018-09-26 11:07
description: netbsd make kernel compile boot
comments: true
---

![netbsd-kernel](https://raw.githubusercontent.com/luhux/images/master/netbsd-kernel.png)
---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------

1. 确认内核源码是否安装 
2. 复制创建编缉内核配置文件
3. 配置,生成依赖并编译内核
4. 备份原内核并安装内核
5. 内核失败的挽救


# 确认内核源码是否安装 

在安装NetBSD时内核源码是可选选项

检查源码是否安装

```
# ls /usr/src/sys/arch
```

已安装:

```
# ls /usr/src/sys/arch
/usr/src/sys/arch
```

未安装:

```
# ls /usr/src/sys/arch
ls: /usr/src/sys/arch: No such file or directory
```


## 安装源码:

下载源码

```
# wget http://cdn.netbsd.org/pub/NetBSD/NetBSD-release-$(uname -r | head -c 1)/tar_files/src/sys.tar.gz
```

解压安装

```
# tar zxvf sys.tar.gz -C /usr
```

# 复制并编缉配置

进入源码目录

```
# cd /usr/src/sys/arch/($uname -m)/
```

进入配置文件目录

```
# cd conf
```

复制标准配置

```
# cp GENERIC 你的配置文件名
```

我的配置文件为 MY_SERVER

```
# cp GENERIC MY_SERVER
```

编缉配置

```
# vim 你的配置文件名
```

编缉请参考man的 config 手册和 options 手册

* config(1)

* options(4)

编缉后保存退出 

# 配置,生成依赖并编译内核

## 依靠配置生成编译工作文件夹

```
# config 你的配置文件名
```

我的配置文件名为MY_SERVER

```
# config MY_SERVER
```

它会检查你的配置文件

如果配置出错它会停止并报错 请根据提示更改配置文件

如果配置文件通过检测则生成 ../compile/你的配置文件名/ 的文件夹

## 生成依赖

进入已生成的文件夹

```
# cd ../compile/你的配置文件名/
```

我的文件夹为MY_SERVER

```
# cd ../compile/MY_SERVER/
```

生成依赖

```
# make depend
```

它会再一步检查配置文件并检查依赖

如果检查通过它会生成所需文件

如果检查不通过它会报错并停止,请根据报错修改配置文件并重新生成文件夹:

删除旧文件夹

```
# cd ..
# rm -rf 你的配置文件名/
```

我的文件夹为 MY_SERVER

```
# cd ..
# rm -rf MY_SERVER/
```

重新进入conf文件夹

根据报错修改配置文件

并再次
```
# config 你的配置文件名
# cd ../compile/你的配置文件名/
# make depend
```

直到成功为止

## 编译内核

在工作文件夹

```
# make
```

等待编译完成


如果编译失败请:

* 重新生成工作目录再编译

* 检查内核配置文件的不合理处,并修改,重新生成工作目录编译

# 备份原内核并安装内核

编译完成后工作文件夹会有一个netbsd文件.

看起来是这样:

```
# ls -lh netbsd
-rwxr-xr-x  1 root  wheel   21M Sep 27 11:06 netbsd
# file netbsd 
netbsd: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, for NetBSD 8.0, not stripped
```


## 备份原内核

```
# cp /netbsd /netbsd.old
```

## 安装编译好的内核

```
# cp ./netbsd /netbsd
```

重启应用内核

```
# reboot
```

# 安装失败的挽救

由于各种原因可能会造成新内核启动失败

挽救的方法:

* 使用原来的内核启动,并尝试解决错误

* 使用原来的内核启动,并尝试解决错误无果,恢复原来内核


## 使用原来的内核启动的方法

由于启动管理器有很多,这里我只说默认启动器的方法.

重启进入启动选择器

按下空格键进入boot prompt(启动提示符)  boot:

输入 boot netbsd.old -s 回车 (使用原来内核启动并进入单用户模式)

接下来修复问题 或直接>恢复原来内核


## 恢复原来内核

在(使用原来内核启动并进入单用户模式)中执行:

恢复原内核
```
# fsck /
# mount /
# mv netbsd.old netbsd
```

重启
```
# reboot
```


## 其它引导器

理解后自行操作



---------------------------------

https://www.netbsd.org/docs/guide/en/chap-kernel.html

