---
layout: post
title:  在NetBSD上使用包管理器pkgsrc通过源码编译方式安装软件包
date:   2018-09-22 11:07
description: netbsd pkgsrc source
comments: true
---

![pkgsrc-source](https://raw.githubusercontent.com/luhux/images/master/netbsd-pkgsrc-source.png)

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------


1. 下载解压pkgsrc

2. 更新pkgsrc为最新

3. 搜索软件包的目录

4. 进入需要编译的软件包的目录

5. 编译

6. 安装

7. 清理

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

# 搜索软件包的目录

```
# find /usr/pkgsrc/ | grep 软件包名
```

我要编译 w3m

```
# find /usr/pkgsrc/ | grep w3m
/usr/pkgsrc/www/emacs-w3m
/usr/pkgsrc/www/emacs-w3m/CVS
/usr/pkgsrc/www/emacs-w3m/CVS/Repository
/usr/pkgsrc/www/emacs-w3m/CVS/Root
/usr/pkgsrc/www/emacs-w3m/CVS/Entries
/usr/pkgsrc/www/emacs-w3m/CVS/Tag
/usr/pkgsrc/www/emacs-w3m/patches
/usr/pkgsrc/www/emacs-w3m/patches/CVS
/usr/pkgsrc/www/emacs-w3m/patches/CVS/Repository
/usr/pkgsrc/www/emacs-w3m/patches/CVS/Root
/usr/pkgsrc/www/emacs-w3m/patches/CVS/Entries
/usr/pkgsrc/www/emacs-w3m/patches/CVS/Tag
/usr/pkgsrc/www/emacs-w3m/patches/patch-aa
/usr/pkgsrc/www/emacs-w3m/Makefile
/usr/pkgsrc/www/emacs-w3m/DESCR
/usr/pkgsrc/www/emacs-w3m/distinfo
/usr/pkgsrc/www/emacs-w3m/PLIST
/usr/pkgsrc/www/emacs-w3m/buildlink3.mk
/usr/pkgsrc/www/emacs-w3m/options.mk
/usr/pkgsrc/www/emacs-w3m-snapshot
/usr/pkgsrc/www/emacs-w3m-snapshot/CVS
/usr/pkgsrc/www/emacs-w3m-snapshot/CVS/Repository
/usr/pkgsrc/www/emacs-w3m-snapshot/CVS/Root
/usr/pkgsrc/www/emacs-w3m-snapshot/CVS/Entries
/usr/pkgsrc/www/emacs-w3m-snapshot/CVS/Tag
/usr/pkgsrc/www/emacs-w3m-snapshot/patches
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/CVS
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/CVS/Repository
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/CVS/Root
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/CVS/Entries
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/CVS/Tag
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/patch-Makefile.in
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/patch-w3m.el
/usr/pkgsrc/www/emacs-w3m-snapshot/patches/patch-w3mhack.el
/usr/pkgsrc/www/emacs-w3m-snapshot/Makefile
/usr/pkgsrc/www/emacs-w3m-snapshot/DESCR
/usr/pkgsrc/www/emacs-w3m-snapshot/distinfo
/usr/pkgsrc/www/emacs-w3m-snapshot/PLIST
/usr/pkgsrc/www/emacs-w3m-snapshot/buildlink3.mk
/usr/pkgsrc/www/emacs-w3m-snapshot/options.mk
/usr/pkgsrc/www/w3m
/usr/pkgsrc/www/w3m/CVS
/usr/pkgsrc/www/w3m/CVS/Repository
/usr/pkgsrc/www/w3m/CVS/Root
/usr/pkgsrc/www/w3m/CVS/Entries
/usr/pkgsrc/www/w3m/CVS/Tag
/usr/pkgsrc/www/w3m/Makefile.common
/usr/pkgsrc/www/w3m/Makefile
/usr/pkgsrc/www/w3m/DESCR
/usr/pkgsrc/www/w3m/options.mk
/usr/pkgsrc/www/w3m/PLIST
/usr/pkgsrc/www/w3m/distinfo
/usr/pkgsrc/www/w3m-img
/usr/pkgsrc/www/w3m-img/CVS
/usr/pkgsrc/www/w3m-img/CVS/Repository
/usr/pkgsrc/www/w3m-img/CVS/Root
/usr/pkgsrc/www/w3m-img/CVS/Entries
/usr/pkgsrc/www/w3m-img/CVS/Tag
/usr/pkgsrc/www/w3m-img/Makefile
/usr/pkgsrc/www/w3m-img/DESCR
/usr/pkgsrc/www/w3m-img/PLIST
```

软件包的makefile 在/usr/pkgsrc/www/w3m/

# 进入软件包的目录

```
# cd /usr/pkgsrc/软件编译目录
```

我要编译 w3m 
目录在/usr/pkgsrc/www/w3m/

```
# cd /usr/pkgsrc/www/w3m/
```

# 编译

在软件编译目录执行make编译软件包

```
# make
```

make过程:

1. 从远程服务器下载源码并解压
2. 编译软件包

# 安装

在已经编译好的软件编译目录执行

```
# make install
```

# 清理文件

将当前软件包的目录清理,还原pkgsrc的干净目录

```
# make clean 
# make clean-depends
```

> 软件包默认安装在/usr/pkg/

--------------------

http://www.netbsd.org/docs/pkgsrc/getting.html#getting-via-tar

http://www.netbsd.org/docs/pkgsrc/getting.html#uptodate-cvs

http://www.netbsd.org/docs/pkgsrc/using.html#building-packages-from-source
