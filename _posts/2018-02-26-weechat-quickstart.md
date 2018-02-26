#weechat入门

Weechat 是一个Linux下开源并免费的irc客户端

1. 安装weechat
在Debian系的系统可以使用apt管理器进行安装
```
sudo apt install weechat
```
2. 启动weechat

weechat 是一个五彩缤纷的irc客户端
如果要使用它的颜色功能就需要支持256色的终端设置

启动：
```
$ weechat
```

3. 使用帮助命令
如果在使用过程中遇到了不懂的地方可以使用：
```
/help 参数
```
这个命令的参数可以是命令，也可以是描述
比如要查看/CL命令的帮助:
```
/help CL
```
如果要查看键绑定的帮助
```
/help key
```

4. 设置选项
/set 可以设置weechat的各种选项
命令格式：
```
/set 选项 值
```
例如：将title（标题栏）背景设置为红色：
```
/set weechat.bar.title.color_bg red
```

* 这里的设置会写入配置文件
* 如果命令很长的话，可以用tab补全

5. 添加一个irc服务器
使用/server add命令来添加服务器
命令格式：
```
/server add 名称 地址
```
比如我要添加freenode（一个公共irc服务器）：
```
/server add freenode chat.freenode.net
```
/server命令用来管理服务器，更多选项请看/help server

6. 连接服务器
连接一个已有的服务器请使用/connect 命令
命令格式：
```
/connect 名称
```
比如我要连接刚才添加的freenode
```
/connect freenode
```
断开连接：
```
/disconnect
```
7. 聊天室列表
服务器连接完毕后可以查看服务器聊天室列表:
命令格式：
```
/list
```
不过在freenode这种大型服务器中不建议使用这个命令,因为聊天室太多了，需要刷好几个屏幕才能显示完
我们可以搜索聊天室:
```
/list #聊天室名称
```
比如搜索parrotsec的聊天室：
```
/list #parrotsec
```

8. 加入，创建聊天室
加入聊天室可以使用/join命令
命令格式：
```
/join #聊天室名称
```
* 如果这里加入的聊天室不存在的话会创建一个聊天室
在加入聊天室后可以直接发送消息
退出聊天室:
```
/part
```

8. 缓存区
使用Ctrl+x可在同一序号的缓存区内区切换

使用f5 或者 f6可以在不同序号的缓冲区之间切换
关闭一个缓冲区：
```
/CLOSE
```

关于缓冲区更多请：/help buffer


9. 窗口
窗口用来实现多窗口查看缓冲区
横向分割:
```
/window splith 分子/分母
```
纵向分割:
```
/window splitv 分子/分母
```
例如：

横向分割2／3:
```
/window splith 2/3
```

窗口之间使用f7和f8切换
在窗口中使用缓冲区快捷键可以操作切换显示缓冲区

关闭分割：
```
/window merge
```

更多帮助请查看：/help window

10. 快捷键
这里列举一些默认快捷键
tab 补全变量
pagup / pagdown 滚动屏幕
ctrl+a 跳转至活动的缓冲区


luhux@hotmail.com
未经许可，禁止商业转载
