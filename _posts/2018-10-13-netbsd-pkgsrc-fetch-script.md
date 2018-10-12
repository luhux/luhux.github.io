---
layout: post
title: netbsd pkgsrc 创建手动获取源码包脚本
date:   2018-02-09 11:07
description: netbsd pkgsrc fetch script source
comments: true
---

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------

由于地区防火墙的限制

很多在国外的服务器上的源码包下载很慢

pkgsrc提供创建手动下载脚本


1. 进入要编译的软件包目录

2. 创建脚本


# 进入要编译的软件包目录

```
# cd /usr/pkgsrc/分类/软件名
```

# 创建脚本

```
# bmake fetch-list > 脚本名.sh
```

例如

```
# bmake fetch-list > fetch-source.sh
```

## 在创建后在网络好的情况下执行
