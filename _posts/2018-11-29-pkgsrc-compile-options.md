---
layout: post
title: pkgsrc 软件包选项
date:   2018-11-29 11:07
description: pkgsrc compile netbsd options
comments: true
---

![picture](https://raw.githubusercontent.com/luhux/images/master/netbsd-pkgsrc-compile-options.png)

---------------------------------------------

环境: NetBSD 8 amd64 

---------------------------------------------

1. 确认自己要用到的选项
2. 写入配置文件
3. 编译


# 确认自己要用到的选项

进入要编译的软件包文件夹

    # cd /usr/pkgsrc/分类/软件
	
查看支持的选项

    # bmake show-options
	

我要编译 emacs26.1 :


    # cd /usr/pkgsrc/editors/emacs26/
	# bmake show-options
	Any of the following general options may be selected:
		dbus	 Enable dbus (desktop bus) support.
		gconf	 Use GConf to store preferences.
		gnutls	 Enable GNU TLS support.
		imagemagick	 Use ImageMagick as imaging library.
		svg	 Enable SVG support.
		xaw3d	 Enable Xaw3D support.
		xft2	 Enable Xft support.
		xml	 Enable XML support.
	At most one of the following window-system options may be selected:
		nextstep	 Enable Cocoa or GNUstep support.
		x11	 Enable X11 support.
	At most one of the following toolkit options may be selected:
		gtk	 Enable support for GTK.
		gtk2	 Enable support for GTK2.
		gtk3	 Enable support for GTK3.
		lucid	
		motif	 Enable motif support.
		xaw	 Enable Xaw support.

	These options are enabled by default:
		dbus gconf gnutls gtk3 svg x11 xaw3d xft2
		xml

	These options are currently enabled:
		dbus gconf gnutls imagemagick svg x11 xaw
		xaw3d xft2 xml

	You can select which build options to use by setting PKG_DEFAULT_OPTIONS
	or PKG_OPTIONS.emacs.

我要用到

    gtk gtk2 gtk3 xaw lucid motif 

# 写入配置文件

	# echo 'PKG_OPTIONS.包名+= 选项' >> /usr/pkg/etc/mk.conf

我的emacs:

    # echo 'PKG_OPTIONS.emacs+=     gtk gtk2 gtk3 xaw lucid motif' >> /usr/pkg/etc/mk.conf


# 编译

	# bmake


------------

参考:

http://www.netbsd.org/docs/pkgsrc/configuring.html
