# Milk-V Duo x RuyiSDK 极速开发指南

## 1.  Milk-V Duo 概述

- [概述](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/overview_Duo.md#%E6%A6%82%E8%BF%B0)
- [硬件规格（处理器、内存、存储、接口、电源）](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/overview_Duo.md#%E7%A1%AC%E4%BB%B6%E8%A7%84%E6%A0%BC)

## 2. 环境准备

### 2.1 系统准备
- [烧录 Buildroot 镜像](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/boot_Duo.md#%E7%83%A7%E5%BD%95%E9%95%9C%E5%83%8F)
- [串口 / SSH 登录](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/boot_Duo.md#%E7%99%BB%E5%BD%95%E7%B3%BB%E7%BB%9F)

### 2.2 RuyiSDK 环境初始化
- [安装 Ruyi](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/boot_Duo.md#%E5%AE%89%E8%A3%85-ruyi)
- [使用 Ruyi 安装工具链](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/boot_Duo.md#%E4%BD%BF%E7%94%A8-ruyi-%E5%AE%89%E8%A3%85%E5%B7%A5%E5%85%B7%E9%93%BE)
	- 使用 Ruyi 安装 LLVM 工具链
	- 使用 Ruyi 安装 GCC 工具链

## 3. RuyiSDK 示例 01：Hello World

- [Hello World (GCC版) ](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/HelloWorld_Duo.md#hello-world-gcc%E7%89%88)
- [Hello World (LLVM版)](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/HelloWorld_Duo.md#hello-world-llvm%E7%89%88)

## 4. RuyiSDK 示例 02：Coremark

- [Coremark (GCC版) ](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/Coremark_Duo.md#coremark-gcc%E7%89%88)
- [Coremark (LLVM版)](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/Coremark_Duo.md#coremark-gcc%E7%89%88)
- 跑分结果与解读：从夯到拉在 RISC-V 阵营处于什么水平？

## 5. RuyiSDK 示例 03：常用库支持

- [wiringX](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/Library-Support_Duo.md#wiringxgpio-%E5%9F%BA%E7%A1%80%E8%83%BD%E5%8A%9B%E9%AA%8C%E8%AF%81)
- pinpong
- opencv-mobile

## 6. RuyiSDK 示例 04：应用级实战

- 实战 1：[GPIO](https://github.com/DuoQilai/riscv-board-custom-dev/blob/docs/add/Duo/application-development_Duo.md#%E4%BD%BF%E7%94%A8-wiringx-%E5%9C%A8-duo-%E4%B8%8A%E5%BC%80%E5%8F%91%E5%BA%94%E7%94%A8)
- 实战 2：简易Web服务器
- 实战 3：图像识别示例

## 7. 常见问题 (FAQ)

- 常见问题Q&A
- 错误代码对照表