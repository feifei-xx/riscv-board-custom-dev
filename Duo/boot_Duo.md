# 环境准备

## 系统准备

### 烧录镜像

#### 下载并解压镜像
从[下载链接](https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/download/v2.0.1/milkv-duo-musl-riscv64-sd_v2.0.1.img.zip)下载你所需镜像。
**解压相关文件**
```shell
unzip milkv-duo-musl-riscv64-sd_v2.0.1.img.zip
```

#### 向 microSD 卡烧录系统镜像
可使用 `dd` 命令
```shell
sudo dd if=milkv-duo-musl-riscv64-sd_v2.0.1.img of=/dev/mmcblkX bs=1M
```

Log:
```log
输入了 896+1 块记录
输出了 896+1 块记录
939524608 字节 (940 MB, 896 MiB) 已复制，31.3784 s，29.9 MB/s
```

### 登录系统
#### 通过串口连接
将 microSD 卡插入 Milk-V Duo，重启。

开发板GND->调试器GND，开发板TX->调试器RX，开发板RX->调试器TX，如图所示（图中开发板一侧线序从左到右依次为TX、RX、GND）
![uart](./images/uart.png)

#### 打开终端，使用 minicom 或 tio 连接串口

```
minicom -D /dev/ttyACM0 -c on

默认用户名：`root`
默认密码：`milkv`
```
重新给开发板上电，连接网口，等待开机

![startup](./images/startup.png)

## RuyiSDK 环境初始化
### 安装 ruyi

安装依赖包
```
sudo apt update; sudo apt install -y wget tar zstd xz-utils git build-essential
```

安装 ruyi 包管理器
```
wget https://mirror.iscas.ac.cn/ruyisdk/ruyi/tags/0.41.0/ruyi-0.41.0.riscv64

chmod +x ruyi-0.41.0.riscv64

sudo cp -v ruyi-0.41.0.riscv64 /usr/local/bin/ruyi
```

### 使用 ruyi 安装工具链

使用 Ruyi 安装 GCC 和 LLVM 工具链
```
ruyi update

ruyi install gnu-plct llvm-plct
```
