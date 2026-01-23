# 应用开发
## 使用 wiringX 在 Duo 上开发应用

`wiringX` 是一个开源的 GPIO 控制库，旨在为不同的嵌入式平台提供通用且统一的 GPIO 控制接口。它基于 WiringPi 库进行了改进和扩展，并支持多种嵌入式平台，对`Milk-V Duo`也进行了适配。使用`wiringX`，开发者可以使用相同的代码来控制不同平台上的 GPIO 引脚，简化了跨平台开发的工作，使得开发嵌入式应用程序更加方便和灵活。
### 基于 wiringX 的应用程序编译环境配置

创建并激活ruyi虚拟环境（GCC）
```
ruyi venv -t toolchain/gnu-plct manual venv-gnu-plct

. ~/venv-gnu-plct/bin/ruyi-activate
```

验证GCC版本

```
riscv64-plct-linux-gnu-gcc -v
```

#### blink

位于 [blink](https://github.com/milkv-duo/duo-examples/tree/main/blink) 中，使用 ruyi 工具链编译获得产物 `blink-ruyi` 

```
riscv64-plct-linux-gnu-gcc blink.c -o blink-ruyi -lwiringx
```


将GCC构建的二进制传输至开发板

```
scp ../blink-ruyi root@192.168.42.1:~
```

返回上级目录并退出ruyi GCC虚拟环境

```
cd ..; ruyi-deactivate
```

禁用自带的闪烁脚本

```bash

mv /mnt/system/blink.sh /mnt/system/blink.sh_backup && sync && reboot

```

SSH连接到开发板并执行编译好的二进制

```
ssh root@192.168.42.1

#如提示Host key verification failed：

#打开当前用户目录下的 .ssh/known_hosts目录，删除192.168.42.1对应行

#登录密码为milkv，提示Are you sure you want to continue connecting时输入yes回车即可

./blink-ruyi
```

运行后输出如下

```

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

Duo LED GPIO (wiringX) 25: High

Duo LED GPIO (wiringX) 25: Low

```


当电平为高时 LED 灯亮起，电平低时 LED 熄灭。见 [blink.mp4](./blink.mp4)

#### PWM

将 GP3 连接到逻辑分析仪，GND 接 GND。



位于 [pwm](https://github.com/milkv-duo/duo-examples/tree/main/pwm) 中。修改 44 行 `milkv_duo256m` 为 `milkv_duo`，使用 ruyi 工具链编译获得产物 `pwm-ruyi` 


```
riscv64-plct-linux-gnu-gcc pwm.c -o pwm-ruyi -lwiringx
```


  将GCC构建的二进制传输至开发板

```
scp ../pwm-ruyi root@192.168.42.1:~
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

./pwm-ruyi
```

运行后，输入 `3:500` 输出如下

```

PWM Period fixed to 1000ns, please set Duty in range of 0-1000.

Enter -> Pin:Duty

3:500

pin 3 -> duty 500

```


duty cycle 为 50%

![pwm](./images/PWM.png)

  

#### ADC

将电位器的左右两脚连接到 3.3V 和 GND。中间脚位连接到 PIN31。

  

位于 [adc](https://github.com/milkv-duo/duo-examples/tree/main/adc) 中，使用 ruyi 工具链编译获得产物 `adc-ruyi` 

```
riscv64-plct-linux-gnu-gcc adc.c -o adc-ruyi -lwiringx
```

将GCC构建的二进制传输至开发板

```
scp ../adc-ruyi root@192.168.42.1:~
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

./adc-ruyi
```

运行后，输入 `1` 输出如下。

```

BusyBox v1.34.0 (2024-05-28 20:37:57 CST) multi-call binary.

  

Usage: insmod FILE [SYMBOL=VALUE]...

  

Load kernel module

SARADC module loaded.

Define the ADC channel:

1: ADC1 (GP26|PIN31)

2: ADC2 (GP27|PIN32)

3: ???

4: VDDC_RTC

5: PWR_GPIO1

6: PWR_VBAT_V

1

ADC1 value is 0

ADC1 value is 0

ADC1 value is 75

ADC1 value is 0

ADC1 value is 1

ADC1 value is 1267

ADC1 value is 0

ADC1 value is 0

ADC1 value is 1704

ADC1 value is 4035

ADC1 value is 3984

ADC1 value is 3992

ADC1 value is 4001

ADC1 value is 3978

ADC1 value is 4000

ADC1 value is 3744

ADC1 value is 2968

ADC1 value is 2144

ADC1 value is 1670

ADC1 value is 0

ADC1 value is 2

ADC1 value is 4

ADC1 value is 0

ADC1 value is 8

ADC1 value is 0

ADC1 value is 3

ADC1 value is 0

ADC1 value is 0

ADC1 value is 14

ADC1 value is 0

ADC1 value is 3

ADC1 value is 0

ADC1 value is 5

ADC1 value is 3724

ADC1 value is 3688

ADC1 value is 4048

ADC1 value is 4000

ADC1 value is 0

ADC1 value is 0

ADC1 value is 0

ADC1 value is 1353

ADC1 value is 1360

ADC1 value is 3596

ADC1 value is 4016

ADC1 value is 3984

ADC1 value is 4018

ADC1 value is 4040

ADC1 value is 4016

ADC1 value is 4032

ADC1 value is 4000

ADC1 value is 4016

```

  

随着电位器旋转，数值发生变化。

  

#### SSD1306

  

I2C1_SDA 接 SDA，I2C1_SCL 接 SCL，3.3v 接 VCC，GND 接 GND。

  

位于 [ssd1306_i2c](https://github.com/milkv-duo/duo-examples/tree/main/i2c/ssd1306_i2c) 中，使用ruyi工具链编译获得产物 `ssd1306_i2c-ruyi` 上传至 Milk-V Duo 上运行。
```
riscv64-plct-linux-gnu-gcc ssd1306_i2c.c -o ssd1306_i2c-ruyi -lwiringx
```

将GCC构建的二进制传输至开发板

```
scp ../ssd1306_i2c-ruyi root@192.168.42.1:~
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

./ssd1306_i2c-ruyi
```
  

运行无输出。

  

波形如下
![ssd1306wave](./images/ssd1306wave.png)

  

显示屏如下
![ssd1306](./images/ssd1306.jpg)


  

#### LCM1602

  

I2C1_SDA 接 SDA，I2C1_SCL 接 SCL，3.3v 接 VCC，GND 接 GND。

  

位于 [lcm1602_i2c](https://github.com/milkv-duo/duo-examples/blob/main/i2c/lcm1602_i2c) 中。修改 41 行 `0x27` 为 `0x3F`，使用ruyi工具链编译获得产物 `lcm1602_i2c-ruyi` 上传至 Milk-V Duo 上运行。
```
riscv64-plct-linux-gnu-gcc lcm1602_i2c.c -o lcm1602_i2c-ruyi -lwiringx
```

将GCC构建的二进制传输至开发板

```
scp ../lcm1602_i2c-ruyi root@192.168.42.1:~
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

./lcm1602_i2c-ruyi
```


运行无输出。

  

波形如下
![lcm1602wave](./images/lcm1602wave.png)

  

显示屏如下

![lcm1602](./images/lcm1602.jpg)