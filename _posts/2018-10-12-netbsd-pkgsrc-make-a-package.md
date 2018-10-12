---
layout: post
title: netbsd pkgsrc 使用源码构建一个二进制包
date:   2018-10-12 11:07
description: netbsd pkgsrc binary source tgz
comments: true
---

![netbsd-pkgsrc-create-binary](https://raw.githubusercontent.com/luhux/images/master/netbsd-create-binary-packge.png)
---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------


1. 进入需要编译的软件的目录

2. 编译

3. 打包

# 进入需要编译的软件的目录

```
# cd /usr/pkgsrc/分类/软件名
```

我要编译游戏中的2048-cli

```
# cd /usr/pkgsrc/games/2048-cli
```

# 编译

```
# bmake
```

# 打包

```
# bmake package
```

我的2048-cli打包输出

```
# bmake package
=> Bootstrap dependency digest>=20010302: found digest-20160304
===> Checking for vulnerabilities in 2048-cli-0.9.1
===> Installing for 2048-cli-0.9.1
=> Generating pre-install file lists
=> Creating installation directories
/usr/bin/install -c -s -o root -g wheel -m 755 /usr/pkgsrc/games/2048-cli/work/2048-cli-0.9.1/2048 /usr/pkgsrc/games/2048-cli/work/.destdir/usr/pkg/bin
/usr/bin/install -c -o root -g wheel -m 644 /usr/pkgsrc/games/2048-cli/work/2048-cli-0.9.1/man/2048.1 /usr/pkgsrc/games/2048-cli/work/.destdir/usr/pkg/man/man1
=> Automatic manual page handling
=> Generating post-install file lists
=> Checking file-check results for 2048-cli-0.9.1
=> Creating binary package /usr/pkgsrc/games/2048-cli/work/.packages/2048-cli-0.9.1.tgz
===> Building binary package for 2048-cli-0.9.1
=> Creating binary package /usr/pkgsrc/packages/All/2048-cli-0.9.1.tgz
```

可以看出软件包被创建在 /usr/pkgsrc/packages/All/的目录下

-------------
http://www.netbsd.org/docs/pkgsrc/binary.html
