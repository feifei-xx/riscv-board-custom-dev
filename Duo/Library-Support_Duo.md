# 常用库支持
## wiringX：GPIO 基础能力验证

`wiringX` 是一个开源的 GPIO 控制库，旨在为不同的嵌入式平台提供通用且统一的 GPIO 控制接口。它基于 WiringPi 库进行了改进和扩展，并支持多种嵌入式平台，对`Milk-V Duo`也进行了适配。使用`wiringX`，开发者可以使用相同的代码来控制不同平台上的 GPIO 引脚，简化了跨平台开发的工作，使得开发嵌入式应用程序更加方便和灵活。

Duo 固件中已经包含编译好的 wiringX 库（/usr/lib/libwiringx.so），可以直接使用。wiringX 为 Milk-V Duo 平台的板级 GPIO 库，由系统镜像提供并维护。本示例仅验证 Ruyi 工具链对 wiringX 应用程序的编译与运行支持，不涉及 wiringX 库本身的构建与分发。

本示例演示如何在 Milk-V Duo 开发板上，  使用 **RuyiSDK 提供的编译工具链** 构建并运行一个
基于 **wiringX** 的 GPIO 控制程序。

创建并激活ruyi虚拟环境（GCC）
```
ruyi venv -t toolchain/gnu-plct manual venv-gnu-plct

. ~/venv-gnu-plct/bin/ruyi-activate
```

验证GCC版本

```
riscv64-plct-linux-gnu-gcc -v
```

位于 [hello-world](https://github.com/milkv-duo/duo-examples/tree/main/hello-world) 中，使用 ruyi 工具链编译获得产物 `helloworld-ruyi` 

```
riscv64-plct-linux-gnu-gcc hello-world.c -o hello-world-ruyi -lwiringx
```


  将GCC构建的二进制传输至开发板

```
scp ../hello-world-ruyi root@192.168.42.1:~
```

返回上级目录并退出ruyi GCC虚拟环境

```
cd ..; ruyi-deactivate
```

SSH连接到开发板并执行编译好的二进制

```
ssh root@192.168.42.1

#如提示Host key verification failed：

#打开当前用户目录下的 .ssh/known_hosts目录，删除192.168.42.1对应行

#登录密码为milkv，提示Are you sure you want to continue connecting时输入yes回车即可

./hello-world-ruyi
```


运行后输出如下。

```
Hello, World!
```


返回上级目录并退出ruyi GCC虚拟环境

```
cd ..; ruyi-deactivate
```

