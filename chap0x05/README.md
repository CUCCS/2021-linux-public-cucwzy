# 第五章实验：Web服务器

## 实验环境
- Nginx
- VeryNginx
- Wordpress
- WordPress 4.7 | 备用下载地址
- Damn Vulnerable Web Application (DVWA)

## 基本要求
- 安装nginx
```
apt policy nginx
sudo apt install nginx
```
- 配置VeryNginx(按照文档学习安装)
```
# 安装一些依赖项
sudo apt install libpcre3-dev libssl1.0-dev zlib1g-dev python3 unzip gcc make

#下载VeryNginx仓库
wget https://github.com/alexzhou/VeryNginx/archive/master.zip 
unzip master.zip