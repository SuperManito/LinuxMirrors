# ![LinuxMirrors](./docs/img/logo.png)

- __GNU/Linux 一键更换国内软件源脚本__
- __本项目旨在为从事计算机相关行业的朋友们提供便利__
- __理论支持所有架构的环境，ARM64 环境已经过测试__

***

- ### 适配系统 <img src="./docs/img/icon/linux.svg" width="16" height="16" style="vertical-align: -0.15em" alt="Linux Logo"/>

  <table>
  <tr>
      <td rowspan="11"> 支持<br/>版本<br/>
  </tr>
  <tr>
      <td><a href="https://www.debian.org" target="_blank"><img src="./docs/img/icon/debian.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Debian</td>
      <td align="center">8.0 ~ 11</td>
  </tr>
  <tr>
      <td><a href="https://cn.ubuntu.com" target="_blank"><img src="./docs/img/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Ubuntu</td>
      <td align="center">16.04 ~ 23</td>
  </tr>
  <tr>
      <td><a href="https://www.kali.org" target="_blank"><img src="./docs/img/icon/kali.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Kali Linux</td>
      <td align="center">2.0 ~ 2023</td>
  </tr>
  <tr>
      <td><a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="./docs/img/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Red Hat Enterprise Linux</td>
      <td align="center">7.0 ~ 8.5</td>
  </tr>
  <tr>
      <td><a href="https://www.centos.org/centos-linux" target="_blank"><img src="./docs/img/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;CentOS</td>
      <td align="center">7.0 ~ 8.5</td>
  </tr>
  <tr>
      <td><a href="https://www.centos.org/centos-stream" target="_blank"><img src="./docs/img/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;CentOS Stream</td>
      <td align="center">8 ~ 9</td>
  </tr>
  <tr>
      <td><a href="https://rockylinux.org" target="_blank"><img src="./docs/img/icon/rocky.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Rocky Linux</td>
      <td align="center">8.0 ~ 9</td>
  </tr>
  <tr>
      <td><a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="./docs/img/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Fedora</td>
      <td align="center">28 ~ 37</td>
  </tr>
  <tr>
      <td><a href="https://www.openeuler.org/zh" target="_blank"><img src="./docs/img/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;openEuler</td>
      <td align="center">21.03 ~ 23</td>
  </tr>
  <tr>
      <td><a href="https://www.opensuse.org" target="_blank"><img src="./docs/img/icon/opensuse.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;openSUSE</td>
      <td align="center">Leep 15 / Tumbleweed</td>
  </tr>
  </table>

  当前支持上述基于 Debian、RedHat、openEuler、openSUSE 的发行版和及其部分衍生版本，不再此支持范围内的操作系统请勿运行本脚本

- ### 使用方法

  ```bash
  bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
  ```

  - #### 注意事项 

    1. 完整复制上面的命令到终端按回车键即可执行，若无法安装 `curl` 软件包可复制源码到本地后通过 `bash` 手动执行  
    2. 为了适配所有环境，需要使用 `Root` 用户执行脚本，切换命令为 `su root` ，如遇报错请查看常见问题与帮助  
    3. 如果您使用的环境没有安装或不支持简体中文环境，请通过 `SSH客户端工具` 使用，否则将无法正确选择交互内容  
    4. 执行脚本过程中会自动备份原有源无需手动备份，期间会在终端输出多个主观选择交互内容，可按回车键快速确定  
    5. 脚本支持在原有源配置错误或者不存在的情况下使用，并且可以重复使用；脚本变更的软件源默认使用 `HTTP` 协议

    </br>

    > __未启用的源：__  
    > _Debian 系 Linux 默认禁用了**源码仓库**和**预发布软件源**，若需启用请将 `/etc/apt/sources.list` 文件中相关内容的所在行**取消注释**_  
    > _RedHat 系 Linux 部分仓库**默认没有启用**，若需启用请将 `/etc/yum.repos.d` 目录下相关 **repo** 文件中的 `enabled` 值修改为 `1`_  
    > _openEuler 系 Linux 部分仓库**默认没有启用**，若需启用请将 `/etc/yum.repos.d` 目录下相关 **repo** 文件中的 `enabled` 值修改为 `1`_  
    > _openSUSE 系 Linux 部分仓库**默认没有启用**，若需启用请将 `/etc/zypp/repos.d` 目录下相关 **repo** 文件中的 `enabled` 值修改为 `1`_

  - #### 软件源

    |       |     镜像站名称     |                               镜像站地址                               | IPv6  | Kali Linux | Rocky Linux | Fedora | openEuler | openSUSE | EPEL  |
    | :---: | :---------------: | :------------------------------------------------------------------: | :---: | :--------: | :---------: | :----: | :-------: | :------: | :---: |
    |   1   |        阿里云      |           [mirrors.aliyun.com](https://mirrors.aliyun.com)           |   ✓   |     ✓      |             |   ✓    |     ✓     |    ✓     |   ✓   |
    |   2   |        腾讯云      |          [mirrors.tencent.com](https://mirrors.tencent.com)          |   ✓   |     ✓      |      ✓      |   ✓    |           |    ✓     |   ✓   |
    |   3   |        华为云      |      [mirrors.huaweicloud.com](https://mirrors.huaweicloud.com)      |   ✓   |     ✓      |             |   ✓    |     ✓     |    ✓     |   ✓   |
    |   4   |         网易       |              [mirrors.163.com](https://mirrors.163.com)              |       |            |      ✓      |   ✓    |     ✓    |          |       |
    |   5   |         搜狐       |             [mirrors.sohu.com](https://mirrors.sohu.com)             |       |            |             |   ✓    |          |    ✓     |       |
    |   6   |       清华大学     | [mirrors.tuna.tsinghua.edu.cn](https://mirrors.tuna.tsinghua.edu.cn) |   ✓   |     ✓      |             |   ✓    |     ✓     |    ✓     |   ✓   |
    |   7   |       北京大学     |           [mirrors.pku.edu.cn](https://mirrors.pku.edu.cn/Mirrors)   |   ✓   |            |             |        |     ✓     |    ✓     |   ✓   |
    |   8   |       浙江大学     |           [mirrors.zju.edu.cn](https://mirrors.zju.edu.cn)           |       |     ✓      |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |
    |   9   |       南京大学     |           [mirrors.nju.edu.cn](https://mirrors.nju.edu.cn)           |       |     ✓      |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |
    |  10   |       重庆大学     |           [mirrors.cqu.edu.cn](https://mirrors.cqu.edu.cn)           |       |     ✓      |             |   ✓    |           |    ✓     |   ✓   |
    |  11   |       兰州大学     |            [mirror.lzu.edu.cn](https://mirror.lzu.edu.cn)            |   ✓   |            |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |
    |  12   |     上海交通大学    |           [mirror.sjtu.edu.cn](https://mirror.sjtu.edu.cn)           |   ✓   |     ✓      |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |
    |  13   |    哈尔滨工业大学   |           [mirrors.hit.edu.cn](https://mirrors.hit.edu.cn)           |   ✓   |     ✓      |             |        |     ✓     |    ✓     |   ✓   |
    |  14   |   中国科学技术大学  |          [mirrors.ustc.edu.cn](https://mirrors.ustc.edu.cn)          |   ✓   |     ✓      |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |
    |  15   | 中国科学院软件研究所 |           [mirror.iscas.ac.cn](https://mirror.iscas.ac.cn)           |       |     ✓      |      ✓      |   ✓    |     ✓     |    ✓     |   ✓   |

    以上为脚本当前使用的开源镜像站，所有镜像站均支持 `Debian` `Ubuntu` `CentOS` 软件源  
    如果使用过程中脚本不能正常输出中文内容则可对照此列表使用，顺序与脚本一致，之后一路回车即可  
    华北地区建议优先使用 `中科大`、`腾讯云`、`清华大学`，软件源的速度区分刷新速度和下载速度，具体请结合实际地理位置进行选择尝试

  - #### 常见问题与帮助

    - 如果提示 `Command 'curl' not found` 则说明当前未安装 `curl` 软件包

      ```bash
      yum install -y curl || apt-get install -y curl
      ```

    - 如果提示 `Command 'wget' not found` 则说明当前未安装 `wget` 软件包

      ```bash
      yum install -y wget || apt-get install -y wget
      ```

    - 如果提示 `bash: /proc/self/fd/11: No such file or directory`，请切换至 `Root` 用户执行

    - 如何还原备份？

      - Debian 系

        ```
        cp -rvf /etc/apt/sources.list.bak /etc/apt/sources.list
        ```

      - RedHat 系 / openEuler

        ```
        cp -rvf /etc/yum.repos.d.bak /etc/yum.repos.d
        ```

      - openSUSE

        ```
        cp -rvf /etc/zypp/repos.d.bak /etc/zypp/repos.d
        ```

  - #### 脚本执行流程

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

- ### 其它脚本

  - `Docker` 一键安装脚本

    ```bash
    bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
    ```

    `Docker CE` Docker Community Edition 镜像仓库，用于下载并安装 Docker 相关软件包  
    `Docker Hub` Docker Hub 镜像仓库，默认为官方提供的公共库，用于切换下载镜像时的来源仓库，又称镜像加速器

    > __注意：__  
    > 脚本集成安装 `Docker Engine` 与 `Docker Compose`，可手动选择安装版本和下载源，还可手动选择镜像加速器，支持国内外服务器环境和 `ARM`架构处理器环境使用。

***

### LICENSE

Copyright © 2023, [SuperManito](https://github.com/SuperManito). Released under the [GPL-2.0](https://github.com/SuperManito/LinuxMirrors/blob/main/LICENSE).

项目已设立开源许可协议，传播时需在显著位置标注来源和作者，请尊重作者的知识成果  
建议通过命令直接调用脚本，如有意见与建议您可以提交至 [Issues](https://github.com/SuperManito/LinuxMirrors/issues)

__如果您觉得这个项目不错对您有所帮助的话，方便在右上角给颗 ⭐ 并分享给更多的朋友吗？__