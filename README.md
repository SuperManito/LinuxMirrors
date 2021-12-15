# LinuxMirrors
<a href="https://github.com/SuperManito/LinuxMirrors"><img src="./icon/github-1.svg" width="34" height="42"></a>
<a href="https://github.com/SuperManito/LinuxMirrors"><img src="./icon/github-2.svg" width="70" height="52"></a>
ㅤ<a href="https://gitee.com/SuperManito/LinuxMirrors"><img src="./icon/gitee.svg" width="100" height="50"/></a>
&nbsp;<a href="https://blog.csdn.net/u013246692/article/details/113124295"><img src="./icon/csdn.png" width="100" height="50"/></a>
- __`GNU/Linux` 一键更换国内软件源脚本__
- __本项目旨在为从事计算机相关行业的朋友们提供便利__
- __理论支持所有架构的环境，`arm64` 环境已经过测试__
> 🏷️点击上方图标可快速跳转至本项目所发布在的其它仓库或博客

### 更新日志
- __2021 / 06 / 05__
ㅤ新增对于 Red Hat Enterprise Linux 的全面适配。
- __2021 / 05 / 30__
ㅤ新增选择软件源的 WEB 协议功能，修复了一些错误。
- __2021 / 05 / 05__
ㅤ新增关闭防火墙功能。
- __2021 / 04 / 24__
ㅤ新增基于 CentOS 的添加 EPEL 扩展源功能，修复了一些错误。
- __2021 / 04 / 22__
ㅤ重新定义了备份原有源功能，可以通过检测判断是否执行覆盖备份操作。

***

### 已适配的 GNU/Linux 发行版 <img src="./icon/linux.svg" width="16" height="16" alt="Linux Logo"/>
<table>
<tr>
    <td rowspan="7"> 支持<br/>版本<br/>
</tr>
<tr>
    <td><a href="https://www.debian.org"><img src="./icon/debian.svg" width="16" height="16"/></a>&nbsp;Debian</td>
    <td align="center">8.0 ~ 11.1</td>
</tr>
<tr>
    <td><a href="https://cn.ubuntu.com"><img src="./icon/ubuntu.svg" width="16" height="16"/></a>&nbsp;Ubuntu</td>
    <td align="center">16.04 ~ 21.10</td>
</tr>
<tr>
    <td><a href="https://www.kali.org"><img src="./icon/kali.svg" width="16" height="16"/></a>&nbsp;Kali Linux</td>
    <td align="center">2.0 ~ 2021.4</td>
</tr>
<tr>
    <td><a href="https://access.redhat.com/products/red-hat-enterprise-linux"><img src="./icon/redhat.svg" width="16" height="16"/></a>&nbsp;RHEL</td>
    <td align="center">7.0 ~ 8.5</td>
</tr>
<tr>
    <td><a href="https://www.centos.org"><img src="./icon/centos.svg" width="16" height="16"/></a>&nbsp;CentOS</td>
    <td align="center">7.0 ~ 8.5</td>
</tr>
<tr>
    <td><a href="https://getfedora.org/zh_Hans_CN"><img src="./icon/fedora.ico" width="16" height="16"/></a>&nbsp;Fedora</td>
    <td align="center">28 ~ 35</td>
</tr>
</table>

> 目前仅支持上述基于 Debian 与 Redhat 系的发行版和及其部分衍生版本 \
> 同样支持上述版本中拥有相同底层核心的其它发行版，例如 [`Armbian`](https://www.armbian.com) [`Kubuntu`](https://kubuntu.org) [`Oracle Linux`](https://www.oracle.com/cn/technical-resources) 等

### 脚本当前使用的开源镜像站
| | 镜像站名称 | 镜像站地址 | IPv6 | Kali Linux | Fedora | EPEL |
| :------: | :------: | :------: | :------: | :------: | :------: | :------: |
| 1 | 阿里云 | [mirrors.aliyun.com](https://developer.aliyun.com/special/mirrors/notice) | √ | √ | √ | √ |
| 2 | 腾讯云 | [mirrors.cloud.tencent.com](https://mirrors.cloud.tencent.com) | √ | √ | √ | √ |
| 3 | 华为云 | [mirrors.huaweicloud.com](https://mirrors.huaweicloud.com) | √ | √ | √ | √ |
| 4 | 网易 | [mirrors.163.com](https://mirrors.163.com) |  |  | √ |  |
| 5 | 搜狐 | [mirrors.sohu.com](https://mirrors.sohu.com) |  |  |  |  |
| 6 | 清华大学 | [mirrors.tuna.tsinghua.edu.cn](https://mirrors.tuna.tsinghua.edu.cn) | √ | √ | √ | √ |
| 7 | 浙江大学 | [mirrors.zju.edu.cn](https://mirrors.zju.edu.cn) |  | √ | √ | √ |
| 8 | 南京大学 | [mirrors.nju.edu.cn](https://mirrors.nju.edu.cn) |  | √ | √ | √ |
| 9 | 重庆大学 | [mirrors.cqu.edu.cn](https://mirrors.cqu.edu.cn) |  | √ | √ | √ |
| 10 | 兰州大学 | [mirror.lzu.edu.cn](https://mirror.lzu.edu.cn) | √ |  | √ | √ |
| 11 | 上海交通大学 | [mirror.sjtu.edu.cn](https://mirror.sjtu.edu.cn) | √ | √ | √ | √ |
| 12 | 哈尔滨工业大学 | [mirrors.hit.edu.cn](https://mirrors.hit.edu.cn) | √ | √ |  | √ |
| 13 | 中国科学技术大学 | [mirrors.ustc.edu.cn](https://mirrors.ustc.edu.cn) | √ | √ | √ | √ |
> 所有镜像站均支持 `Debian` `Ubuntu` `CentOS` 软件源，建议优先选择由企业提供的软件源\
> 如果使用过程中脚本不能正常输出中文内容则可对照此列表使用，顺序与脚本一致

### 脚本执行流程
- └ 选择国内源 `交互`
  - └ 检测如果是 RHEL或CentOS 系统选择是否安装/覆盖 EPEL 扩展国内源 `交互`
- └ 选择软件源使用的 WEB 协议 `交互`
- └ 检测 防火墙 和 SELINUX 如果开启并且系统是 RHEL或CentOS 选择是否关闭 `交互`
- └ 备份原有源
  - └ 检测如果存在重复的备份文件选择是否覆盖 `交互`
- └ 更换国内源
- └ 选择是否更新软件包 `交互`
  - └ 选择是否清理已下载的软件包缓存 `交互`

***

### 如何使用
> 1. 完整复制下面的命令到终端按回车键即可执行，若无法安装 `curl` 软件包可复制源码到本地后手动执行。
> 2. 为了适配所有环境，建议使用 `Root` 用户执行脚本，切换命令为 `sudo -i` ，如遇报错请查看常见问题与帮助。
> 3. 如果您使用的环境没有安装或不支持简体中文环境，请通过 `SSH客户端工具` 使用，否则将无法正确选择交互内容。
> 4. 执行脚本过程中会自动备份原有源无需手动备份，期间会在终端输出多个主观选择交互内容，可按回车键快速确认。
> 5. 脚本支持在原有源配置错误或者不存在的情况下使用，并且可以重复使用；脚本变更的软件源默认使用 `Http 协议`。

- `GNU/Linux` 一键更换国内软件源脚本

      bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
> __注意：__
> - _Debian 系 Linux 默认禁用了源码仓库和预发布软件源，若需启用可将 list 源文件中相关内容的所在行 `取消注释`。_
> - _RedHat 系 Linux 配置了所有可以配置的仓库，但有一些仓库默认没有启用，若需启用可将 repo 源文件中的 `enabled=0`修改成 `enabled=1`。_

***

### 其它脚本
- `Docker` 一键安装脚本

      bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)

> `Docker CE`：Docker Community Edition 镜像仓库，用于下载并安装 Docker 相关软件包。\
> `Docker Hub`：Docker Hub 镜像仓库，默认为官方提供的公共库，用于切换下载镜像时的来源仓库，简称镜像加速器。

> _注意：脚本集成安装 `Docker Engine`与 `Docker Compose`，可手动选择安装版本和下载源，还可手动选择镜像加速器，支持国内外服务器环境和 `ARM`架构处理器环境使用。_

***

### 常见问题与帮助
- 1. 如果提示 `Command 'curl' not found` 则说明当前未安装 `curl` 软件包，安装命令如下：

         sudo apt install -y curl  或  sudo yum install -y curl

- 2. 如果提示 `Command 'wget' not found` 则说明当前未安装 `wget` 软件包，安装命令如下：

         sudo apt install -y wget  或  sudo yum install -y wget

- 3. 如果提示 `bash: /proc/self/fd/11: No such file or directory`，请切换至 `Root` 用户执行。

***

### License
Copyright © 2021, [SuperManito](https://github.com/SuperManito). Released under the [GPL-2.0](https://github.com/SuperManito/LinuxMirrors/blob/main/LICENSE).
> 项目已设立开源许可协议，传播时需在显著位置标注来源和作者，请尊重本人的知识成果\
> 建议通过命令直接调用脚本，如有意见与建议您可以提交至 __Issues__，谢谢

***

__如果您觉得这个项目不错的话可以在右上角给颗⭐吗？方便分享给更多的朋友吗？__