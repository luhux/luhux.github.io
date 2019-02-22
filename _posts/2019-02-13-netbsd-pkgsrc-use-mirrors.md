---
layout: post
title:  pkgsrc 设置源加速 
date:   2019-02-13 11:07
description: pkgsrc mirrors cn distfiles
comments: true
---

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------

外国人估计也没专门考虑过需要一个自定义distfile源这个问题，毕竟人家没有wall.
pkgsrc文档也没写

自己读了读pkgsrc的源码，找到一个方法:


1. 编辑mk.conf


# 编辑mk.conf

加入

``` text
MASTER_SITE_BACKUP= 源地址 源地址 ...    # 覆盖原来的地址列表变量
MASTER_SORT=   域名后缀 域名后缀 ...    # 根据域名后缀排序
```


例如:

``` text
MASTER_SITE_BACKUP= https://mirrors.nju.edu.cn/pkgsrc/distfiles/ https://mirrors.tuna.tsinghua.edu.cn/pkgsrc/distfiles/
MASTER_SORT=    .edu.cn .cn
```

* 我添加了珠江大学开源镜像站和清华大学开源镜像站
* 排序方式是.edu.cn后缀优先级别最高,依次.cn后缀,最后的是国外的源码镜像站
