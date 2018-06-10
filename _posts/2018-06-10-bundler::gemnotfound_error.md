---
layout: post
title: "ruby_Bundler::GemNotFound_error"
date: 2018-06-10 13:21:24
image: 'https://raw.githubusercontent.com/luhux/images/master/ruby_Bundler_GemNotFound_Error.png'
description:
category: ''
tags:linux ruby
twitter_text:
introduction:
---

启动jeklly时报了以下错误:
```
luhux@localhost:~/blog$ jekyll serve
/var/lib/gems/2.3.0/gems/bundler-1.16.2/lib/bundler/resolver.rb:289:in `block in verify_gemfile_dependencies_are_found!': Could not find gem 'minima (~> 2.0)' in any of the gem sources listed in your Gemfile. (Bundler::GemNotFound)
```

根据字面意思理解得出是依赖缺失，于是安装缺失的依赖：

    # gem install minima

