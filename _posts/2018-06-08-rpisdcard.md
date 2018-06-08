--- 
layout: 
post title: "RPIsdcard" 
date: 2018-06-08 01:01:06 
image: 'https://raw.githubusercontent.com/luhux/images/master/raspberrypi3.jpg' 
description: 
category: '' 
tags: linux,raspberrypi,sdcard
twitter_text: 
introduction: 
--- 

翻译自：

    https://elinux.org/RPi_SD_cards
    
## SD Cards

----- 

SD卡是Raspberry Pi的关键部分; 它为操作系统和文件提供初始存储.存储可以通过多种类型的USB连接的外设进行扩展。 

当树莓派“开机”时，即连接到电源时，会执行一段称为引导加载程序的特殊代码，它从用于启动树莓派的SD卡读取更多特殊代码。 

如果没有插入SD卡，则无法启动。 当Raspberry Pi连接到电源时不要推入或拉出SD卡，因为这可能会损坏SD卡数据（您可能会忽略它，但最好不要）。 

SD卡必须以特殊方式进行格式化或写入，这意味着树莓派可以读取正确启动所需的数据。 

如果您是新手，请查看说明，或购买预先格式化的SD卡。 

使用SD卡的一个优点是可以有多个SD卡，每个SD卡具有不同的操作系统或不同的用途。 只需关闭电源，切换卡并重新连接电源即可。 你就有一台不同的电脑可以玩。 

请记住，Raspberry Pi读卡器的最大吞吐量为25 MB / s，最大可能的读写速度不会超过22 MB / s。

## 选哪个sd卡？

---- 

SD卡有三种物理尺寸（见图片)

https://raw.githubusercontent.com/luhux/images/master/SD_Card_dimensions.png

树莓派A和B使用的是最大的; 
miniSD卡和MicroSD卡可用于这些型号，但您需要一个适配器/支架才能安装它。 
Raspberry Pi B +和Raspberry Pi 2 Model B（第二代）需要最小的MicroSD。 
SD卡有多种存储尺寸。 您可能需要超过2 GB。 
这里没有介绍SD卡的其他特性。 
阅读维基百科文章了解这些细节。


## 预装SD卡

----

您可能会考虑购买预安装的卡; 
可以使用预装有操作系统的各种品牌SD卡。 
如果您不购买预装卡，则必须自己创建一张。 
检查SD卡设置页面以帮助您做出此决定。 
该页面还显示了这些卡可以从哪里购买。


## 验证

----

用户在这里列出了工作卡和非工作卡。 
SD卡协会表示，有数十种产品类别和超过8000种型号的品牌超过400种。 
这些才一点点。
## 这可靠吗？

--- 

不幸的是，下面给出的失败分析的余地很小。有几个原因可能导致卡无法工作。您会注意到同一张卡片可能会显示为正在工作而不工作;卡片上的型号似乎很混乱. 
早期Raspberry Pi板上的固件/引导程序在Class 
10高速卡上有问题。这已被修复.
 自最初发布以来，一些Linux发行版中的驱动程序得到了改进
 
如果外围设备从电源获得太多的电力，树莓派可能会遇到性能问题;其中一个后果就是来自SD卡的错误 

除非使用预安装的卡，否则用户必须将镜像写入到SD卡。这可能被认为比用户以前经历的技术更多，导致SD卡出现故障 

市面上有许多廉价的（品牌名称）SD卡的中国副本，此外，他们经常被误认为拥有比他们真正拥有的容量更大的容量，请参阅SanDisk仿冒卡 

...当然，他们也可能是错误的！


## 技术信息


--- 


请注意，制造商会随着时间的推移改变他们的设计，即使规格保持不变。 
（例如，2011年生产的ACME 8 GB 
4类卡可能有效，而2012年生产的可能不会。） 
出于这个原因，请尽可能在下面的列表中指定产品编号。 
您还可以附加卡的CID中的以下字段：


    cd /sys/class/mmc_host/mmc?/mmc?:*
    echo "man:$(cat manfid) oem:$(cat oemid) name:$(cat name) hwrev:$(cat hwrev) fwrev:$(cat fwrev)" 

## 工作/非工作的SD卡列表 


该表可以使用顶行中的三角形排序。 
请在正确的位置添加条目，以便按照制造商，类型，大小和类别进行初始排序。 为工作和非工作保留单独的条目。
把你的用户名和日期放在最后一列中，这样人们可以判断问题是否仍然存在。 

**好吧，访问原来页面的那个吧，我这个静态博客实现不了**

    https://elinux.org/RPi_SD_cards

## 性能

----

用户已经报告了以下结果。 

**终端命令** 

要获得表中的结果，请在命令提示符处键入以下几行。 
如果您正在运行GUI窗口，请打开终端应用程序。 
dd命令是Linux块拷贝命令。 它从if=文件中读取数据，在第一种情况下读取一个零数据块，然后写入of=文件，第一种情况是在您的HOME目录（〜/表示您的HOME目录）中名为test.tmp的文件。 
bs=给出数据的大小，count=给出重复的次数。 
同步确保文件系统缓存刷新以获得更真实的数据。 
请多次运行，一个结果不够准确。

写入速度：

    sync; dd if=/dev/zero of=~/test.tmp bs=500K count=1024 

读取速度：

    sync; echo 3 | sudo tee /proc/sys/vm/drop_caches

    sync; time dd if=~/test.tmp of=/dev/null bs=500K count=1024 

删除临时测试文件：

    rm ~/test.tmp 

内核版本：

     uname -a 

**扩展测试**
    http://www2.sakoman.com/OMAP/microsd-card-perfomance-test-results.html
    http://www.raspberrypi.org/phpBB3/viewtopic.php?f=2&t=4076
## 这可靠的吗？

--- 

SD卡由制造商给予评级（等级）; 
等级越高，卡的速度越快。 SD卡通常用在相机中。 
摄像机通常会写入一个数据块（一张图片），然后写入另一个数据块。 
SD卡针对此类使用进行了调整。 在Raspberry 
Pi中使用时，数据会被更频繁地写入和读取，并且会从卡上的不同位置读取。 
这种使用差异意味着制造商的评级可能不适用于RaspberrPi。
## SD卡性能

---

该表可以使用顶行中的三角形排序。 
请在正确的位置添加条目，以便按照制造商，尺寸，类型和类别进行初始排序 
表：
    https://elinux.org/RPi_SD_cards


