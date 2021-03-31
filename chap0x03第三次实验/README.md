第三次实验报告

实验环境

虚拟机：Virtualbox Ubuntu 20.04 Server 64bit

软件环境：asciinema，Windows10--cmd

录制的操作视频：

命令篇（一. 由来，二. Systemd 概述）：[![asciicast](https://asciinema.org/a/7YsYGjf3gCH2a7TqyraSNJw4i.svg)](https://asciinema.org/a/7YsYGjf3gCH2a7TqyraSNJw4i)

命令篇（3.2， 3.3， 3.4）：[![asciicast](https://asciinema.org/a/qy51ifT4hLL0NpNOar4BwwJJa.svg)](https://asciinema.org/a/qy51ifT4hLL0NpNOar4BwwJJa)

命令篇（3.5， 3.6）：[![asciicast](https://asciinema.org/a/PW4N95L785EtJNhgehtYHu0s4.svg)](https://asciinema.org/a/PW4N95L785EtJNhgehtYHu0s4)

命令篇（4.1， 4.2）：[![asciicast](https://asciinema.org/a/xGnkQjpxCta2A5ZpvheFp7WnG.svg)](https://asciinema.org/a/xGnkQjpxCta2A5ZpvheFp7WnG)

命令篇（4.3， 4.4）：[![asciicast](https://asciinema.org/a/1iRz6QvIf1zsOVjRpXKeXHHKN.svg)](https://asciinema.org/a/1iRz6QvIf1zsOVjRpXKeXHHKN)

命令篇 （5.1， 5.2，5.3，5.4）:[![asciicast](https://asciinema.org/a/O5yPdhIRvPZR8ASRofr2F5k7k.svg)](https://asciinema.org/a/O5yPdhIRvPZR8ASRofr2F5k7k)

命令篇（6）:[![asciicast](https://asciinema.org/a/KTXO9LIi09uFDMrUaQ9XDaEqk.svg)](https://asciinema.org/a/KTXO9LIi09uFDMrUaQ9XDaEqk)

命令篇（7）:[![asciicast](https://asciinema.org/a/ACt7210BzAu2w74868Uv4g5t1.svg)](https://asciinema.org/a/ACt7210BzAu2w74868Uv4g5t1)

实战篇:[![asciicast](https://asciinema.org/a/UfILbAixmN8Pf5xEn6mlEBmK9.svg)](https://asciinema.org/a/UfILbAixmN8Pf5xEn6mlEBmK9)

自查清单

1.如何添加一个用户并使其具备sudo执行程序的权限？

先用adduser命令创建用户，然后把新建的用户加入到sudo组里面,就可以看到新建用户在sudo组里面了

sudo adduser xzl

sudo usermod -G sudo -a xzl

2.如何将一个用户添加到一个用户组？

usermod -a -G groupname username

3.如何查看当前系统的分区表和文件系统详细信息？

df -hT 只可以查看已经挂载的分区和文件系统类型。

fdisk -l和gsidk -l 可以显示出所有挂载和未挂载的分区，但不显示文件系统类型。

parted -l 可以查看未挂载的文件系统类型，以及哪些分区尚未格式化。大于2TB分区支持使用此

lsblk -f 也可以查看未挂载的文件系统类型

4.如何实现开机自动挂载Virtualbox的共享目录分区？

在windows下创建一个共享文件夹

配置共享文件夹（不点击自动挂载）

在虚拟机中新建共享文件夹 /mnt/share

执行挂载命令 sudo mount -t vboxsf [Windows共享文件夹名称] /mnt/dirname

修改 /etc/fstab 文件 在文末添加[Windows共享文件夹名称] /mnt/dirname/ vboxsf 

defaults 0 0即可完成开机自动挂载

5.基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？

分区扩容

lvresize --size +{{120G}} --resizefs {{volume_group}}/{{logical_volume}}

lvresize --size {{100}}%FREE {{volume_group}}/{{logical_volume}}

lvextend -L size

分区缩减（可能会由于缩减后存储容量不足导致数据丢失）

lvresize --size -{{120G}} --resizefs {{volume_group}}/{{logical_volume}}

lvreduce -L size

6.如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？

写一个脚本用于网络连通时运行,然后设置开机启动

vim /usr/lib/systemd/system/after_networking.service

修改systemd-networkd.service的配置文件

[Service]

ExecStartPost = <sh 脚本位置>

ExecStopPost = <sh 脚本位置>

重载

sudo systemctl daemon-reload

重启服务

sudo systemctl restart systemd-neworkd.service

7.如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？

修改配置文件[service]区块，将restart设置为always

[Service]

Restart = always

然后重新加载配置文件sudo systemctl daemon-reload

重新启动服务sudo systemctl restart ××××

实验中遇到的问题；

1.当你的虚拟机内没有bluetooth.service或是httpd.service,我们自己可以灵活运用我们虚拟机内的其他service文件，比如说：ufw.service等。

2.在写设置时区与时间的代码时，要记得关闭计算机系统的自动校验时间功能，否者代码会无法运行。

参考资料

Linux 的启动流程

Systemd 入门教程：命令篇

Systemd 入门教程：实战篇

在Virtualbox下为Ubuntu20.04开机自动挂载共享目录的方法