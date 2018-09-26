---
layout: post
title: NetBSD使用pkgin管理二进制包
date:   2018-02-24 11:07
description: netbsd pkgsrc pkgin binary
comments: true
---

![pkgin](https://raw.githubusercontent.com/luhux/images/master/netbsd-pkgin.png)

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------

pkgin 是一个像apt/yum一样的包管理工具,来管理pkgsrc的包

# 安装pkgin

```
# PKG_PATH="http://cdn.NetBSD.org/pub/pkgsrc/packages/$(uname -s)/$(uname -m)/$(uname -r|cut -f '1 2' -d.)/All/"
# export PKG_PATH
# pkg_add pkgin
```

# 使用pkgin安装一个包

```
# pkgin install 包名
```

# 使用pkgin卸载一个包

```
# pkgin remove 包名
```

# 使用pkgin搜索一个包

```
# pkgin search 包名
```

# 使用pkgin显示系统已安装包

```
$ pkgin list
```

