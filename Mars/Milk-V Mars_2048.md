# Milk-V Mars 2048 终端应用离线部署与运行实战手册

## 1. 概述
在 Windows Subsystem for Linux (WSL) 环境下，使用 RuyiSDK 交叉编译 C 语言终端游戏 `2048.c`，并通过 U 盘物理转移，最终在搭载 Debian 系统的 Milk-V Mars 开发板上成功运行的全过程。

## 2. 环境与依赖要求
* **编译宿主机环境**：Windows Subsystem for Linux (WSL) - Ubuntu
* **交叉编译工具链**：RuyiSDK (采用 `gnu-plct` 工具链)
* **目标硬件**：Milk-V Mars 开发板 (RISC-V 64 架构)
* **目标操作系统**：Milk-V 官方 Debian 镜像
* **物理媒介**：FAT32 格式的普通 U 盘

---

## 3. 交叉编译环节 (WSL 端)

### 3.1 激活编译虚拟环境
确保您已经安装了 RuyiSDK 及其 GNU 工具链。进入工作目录并激活针对 RISC-V 64 的虚拟环境：

```bash
cd ~/mars-venv
source ./bin/ruyi-activate
```
![激活环境截图]([https://github.com/feifei-xx/plct-works/blob/main/%E5%90%84%E7%A7%8D/2048/images/1.png](https://github.com/feifei-xx/plct-works/blob/main/%E5%90%84%E7%A7%8D/2048/images/2.png))

### 3.2 获取源码并编译
创建项目专属目录，下载纯 C 语言无依赖的 2048 源码，并调用交叉编译器进行编译：

```bash
# 创建并进入目录
mkdir -p ~/projects/2048 && cd ~/projects/2048

# 下载源码 (注意：直接复制纯链接，避免带有 Markdown 括号导致语法错误)
wget [https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c](https://raw.githubusercontent.com/mevdschee/2048.c/master/2048.c)

# 交叉编译，输出为 2048_riscv
riscv64-plct-linux-gnu-gcc 2048.c -o 2048_riscv
```

![编译结果截图](https://github.com/feifei-xx/plct-works/blob/main/%E5%90%84%E7%A7%8D/2048/images/1.png)

### 3.3 物理转移程序 (宿主机操作)
1. 在 WSL 终端执行 `explorer.exe .` 直接在 Windows 资源管理器中打开当前编译目录。
2. 将生成的 `2048_riscv` 文件复制并粘贴到您的物理 U 盘中。
3. 从电脑端安全弹出 U 盘。

---

## 4. 离线部署与测试 (Milk-V Mars 端)

将包含 `2048_riscv` 的 U 盘插入 Milk-V Mars 开发板的 USB 接口，通过串口登录开发板终端。

### 4.1 确认 U 盘设备名 (关键步骤)
由于 Linux 的设备挂载顺序不同，U 盘不一定是 `/dev/sda1`。先执行以下命令查找 U 盘的“真实名称”：

```bash
lsblk
```
*操作提示：在输出的列表中寻找容量与您 U 盘相符的设备，找到其对应的分区名（例如 `sdb1` 或 `sdc1`）。


### 4.2 挂载 U 盘
创建挂载点并将 U 盘挂载到系统目录（**注意：`/dev/sdb1` 和 `/mnt/usb` 之间必须有一个空格**）：

```bash
sudo mkdir -p /mnt/usb
sudo mount /dev/sdb1 /mnt/usb
```

### 4.3 拷贝与赋权
将程序从 U 盘拷贝至系统主目录，并赋予可执行权限：

```bash
cp /mnt/usb/2048_riscv ~/
cd ~/
chmod +x 2048_riscv
```

### 4.4 运行游戏
执行程序，验证终端 I/O 与 ANSI 渲染是否正常：

```bash
./2048_riscv
```

![游戏运行画面截图](https://github.com/feifei-xx/plct-works/blob/main/%E5%90%84%E7%A7%8D/2048/images/3.png)

* **操作方式**：使用键盘方向键（或 `W、A、S、D`）合并数字。
* **退出方式**：按下 `q` 键退出游戏并返回终端界面。

