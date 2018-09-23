---
layout: post
title: NetBSD使用安卓USB共享网络
date:   2018-09-23 10:02
description: netbsd usb network rndis
comments: true
---

![netbsd-androidusbnet](https://raw.githubusercontent.com/luhux/images/master/netbsd-androidusbnet.png)

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------


1. 安卓usb连接NetBSD运行的机器
2. 安卓打开usb共享网络
3. NetBSD确认网卡名
4. 使用dhcpcd获取IP地址


# 安卓usb共享网络

使用rndis

# NetBSD确认网卡名

```
# ifconfig 
```

我的usb rndis网卡名为urndis0
```
# ifconfig
wm0: flags=0x8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	capabilities=7ff80<TSO4,IP4CSUM_Rx,IP4CSUM_Tx,TCP4CSUM_Rx>
	capabilities=7ff80<TCP4CSUM_Tx,UDP4CSUM_Rx,UDP4CSUM_Tx,TCP6CSUM_Rx>
	capabilities=7ff80<TCP6CSUM_Tx,UDP6CSUM_Rx,UDP6CSUM_Tx,TSO6>
	enabled=0
	ec_capabilities=7<VLAN_MTU,VLAN_HWTAGGING,JUMBO_MTU>
	ec_enabled=0
	address: 40:2c:f4:eb:4a:8e
	media: Ethernet autoselect (100baseTX full-duplex,flowcontrol,rxpause,txpause)
	status: active
	inet 0.0.0.0/8 broadcast 255.255.255.255 flags 0x0
	inet 192.168.10.53/24 broadcast 192.168.10.255 flags 0x0
	inet6 fe80::422c:f4ff:feeb:4a8e%wm0/64 flags 0x0 scopeid 0x1
lo0: flags=0x8049<UP,LOOPBACK,RUNNING,MULTICAST> mtu 33624
	inet 127.0.0.1/8 flags 0x0
	inet6 ::1/128 flags 0x20<NODAD>
	inet6 fe80::1%lo0/64 flags 0x0 scopeid 0x2
urndis0: flags=0x8842<BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	address: 02:05:00:04:36:34
```

# 使用dhcpcd获取IP地址

```
# dhcpcd -qM 网卡名
```

我的usb rndis网卡名为urndis0

```
# dhcpcd -qM urndis0
```

# 验证连接

使用ifconfig查看网卡是否获得ip地址

```
# ifconfig 网卡名
```

我的usb rndis网卡名为urndis0

```
# ifconfig urndis0
urndis0: flags=0x8843<UP,BROADCAST,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	address: 02:05:00:04:36:34
	inet 192.168.42.5/24 broadcast 192.168.42.255 flags 0x0
	inet6 fe80::e120:2f0e:5bd5:1bf0%urndis0/64 flags 0x0 scopeid 0x3
```

可以看到IP地址为 192.168.42.5
