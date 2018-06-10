---
layout: post
title: "ruby的kernel_require.rb:55:in  require错误"
date: 2018-06-10 12:38:23
image: 'https://raw.githubusercontent.com/luhux/images/master/ruby_kernerl_requie_error.png'
description:
category: ''
tags:ruby linux jeklly
twitter_text:
introduction:
---

今天在运行jeklly时遇到了如下错误:
```
/usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- bundler (LoadError)
        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in `require
```
在百度上查了一番，找到了以下解决方案：


1.
将报错中的require通过gem补全

    # gem install bundler

