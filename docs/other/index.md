---
hide:
  - navigation
  - feedback
  - footer
---

!!! tip inline end "已被众多流行项目使用，广受社区用户好评"

## :simple-docker:{style="color: #1d63ed"} Docker 安装与换源脚本

<table>
<tr>
    <td><a href="https://www.debian.org" title="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.35em"></a> Debian</td>
    <td><a href="https://access.redhat.com/products/red-hat-enterprise-linux" title="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Red Hat Enterprise Linux</td>
</tr>
<tr>
    <td><a href="https://ubuntu.com" title="https://ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"></a> Ubuntu</td>
    <td><a href="https://fedoraproject.org/zh-Hans" title="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Fedora</td>
</tr>
<tr>
    <td><a href="https://www.kali.org" title="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> Kali Linux</td>
    <td><a href="https://www.centos.org" title="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.1em"></a> CentOS</td>
</tr>
<tr>
    <td><a href="https://linuxmint.com" title="https://linuxmint.com" target="_blank"><img src="/assets/images/icon/linux-mint.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Linux Mint</td>
    <td><a href="https://rockylinux.org" title="https://rockylinux.org" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Rocky Linux</td>
</tr>
<tr>
    <td><a href="https://www.deepin.org" title="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.png" width="16" height="16" style="vertical-align: -0.2em"></a> Deepin（深度）</td>
    <td><a href="https://almalinux.org/zh-hans" title="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.15em"></a> AlmaLinux</td>
</tr>
<tr>
    <td><a href="https://zorin.com/os" title="https://zorin.com/os" target="_blank"><img src="/assets/images/icon/zorin-os.png" width="16" height="16" style="vertical-align: -0.1em"></a> Zorin OS</td>
    <td><a href="https://www.openeuler.org/zh" title="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.2em"></a> openEuler（开源欧拉）</td>
</tr>
<tr>
    <td><a href="https://www.armbian.com" title="https://www.armbian.com" target="_blank"><img src="/assets/images/icon/armbian.png" width="16" height="16" style="vertical-align: -0.2em"></a> Armbian</td>
    <td><a href="https://www.opencloudos.org" title="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> OpenCloudOS（鸥栖）</td>
</tr>
<tr>
    <td><a href="https://www.proxmox.com" title="https://www.proxmox.com" target="_blank"><img src="/assets/images/icon/proxmox.svg" width="16" height="16" style="vertical-align: -0.2em"></a> Proxmox VE</td>
    <td><a href="https://openanolis.cn" title="https://openanolis.cn" target="_blank"><img src="/assets/images/icon/anolis.png" width="16" height="16" style="vertical-align: -0.1em"></a> Anolis OS（龙蜥）</td>
</tr>
<tr>
    <td><a href="https://www.raspberrypi.com" title="https://www.raspberrypi.com" target="_blank"><img src="/assets/images/icon/raspberry-pi.png" width="16" height="16" style="vertical-align: -0.2em"></a> Raspberry Pi OS</td>
    <td></td>
</tr>
</table>

### 一键执行命令

=== "安装"

    !!! quote ""

        === ":linuxmirrors: 官网（推荐）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh)
            ```

        === ":simple-gitee: Gitee 码云 (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
            ```
            > 实时同步、无延迟，国内网络环境下推荐使用

        === ":gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/gh_mirrors/li/LinuxMirrors/raw/main/DockerInstallation.sh)
            ```
            > 本项目已加入 GitHub 加速计划，同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh)
            ```

        集成安装 [`Docker Engine`](https://docs.docker.com/engine) 和 [`Docker Compose`](https://docs.docker.com/compose)，支持选择或更换软件源以及镜像仓库、安装指定版本、重装等功能，支持 ARM 架构

        脚本参考[官方文档](https://docs.docker.com/engine/install)使用系统包管理工具进行安装，不存在兼容性、安全性等问题，可安装的版本由 Docker CE 仓库决定。

=== "仅更换镜像加速器"

    !!! quote ""

        === ":linuxmirrors: 官网（推荐）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --only-registry
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh) --only-registry
            ```

        === ":simple-gitee: Gitee 码云 (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --only-registry
            ```
            > 实时同步、无延迟，国内网络环境下推荐使用

        === ":gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/gh_mirrors/li/LinuxMirrors/raw/main/DockerInstallation.sh) --only-registry
            ```
            > 本项目已加入 GitHub 加速计划，同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --only-registry
            ```


!!! node "软件源说明"

    <div class="grid cards" markdown>

    -   __Docker CE 软件仓库__

        ---

        Docker CE 全称 Docker Community Edition（Docker 社区版），是 Docker Engine 的别称，该仓库用于下载并安装 Docker 相关软件包

    -   __Docker Registry 镜像仓库__

        ---

        用于控制拉取镜像的默认来源存储仓库，又称镜像加速器，默认为官方容器镜像仓库 [Docker Hub](https://hub.docker.com) 

    </div>

    由于一些不可抗力的因素，目前国内网络环境一般无法正常访问 Docker Hub 因此无法拉取镜像，建议使用下方提到的国内可用镜像仓库源

    注：脚本内的指定 WEB 协议交互仅用于控制 `Docker CE` 软件源，`Docker Registry` 强制使用 `HTTPS` 协议

!!! tip "Docker Compose 不再需要独立安装"

    Docker Compose 自 V2 版本起开始作为 Docker CLI（命令行）的一部分，脚本默认集成安装该[插件](https://docs.docker.com/compose/install/linux)，请使用 `docker compose` 命令替代 `docker-compose`


!!! quote "内置的镜像仓库源"

    <div style="text-align: center" markdown>
    <div style="font-size: 0.8rem"><strong>国内可用</strong></div>

    | 站点名称 | 地址 | 说明 |
    | :--: | :--: | :-- |
    | 毫秒镜像 | [docker.1ms.run](https://1ms.run "docker.1ms.run") | 企业镜像站，CDN智能分发速度极快，支持付费定制，推荐使用 |
    | Docker Proxy | [dockerproxy.net](https://dockerproxy.net "dockerproxy.net") | 由 ghproxy 创建，可用性高但速度很慢，支持企业镜像付费加速 |
    | DaoCloud 道客 | [docker.m.daocloud.io](https://docker.m.daocloud.io "docker.m.daocloud.io") | 老牌企业镜像站，可用性高且速度快，现为白名单模式 |
    | 1Panel 镜像 | [docker.1panel.live](https://1panel.cn "docker.1panel.live") | 企业产品自用镜像 |

    <blockquote style="border-left: none !important">本开源项目不适合采集个人自建的镜像加速器，如有需要可搭配命令选项自行使用</blockquote>

    <div style="font-size: 0.8rem; margin-top: 1rem"><strong>其它</strong></div>

    | 站点名称 | 地址 | 站点名称 | 地址 |
    | :- | :-: | :- | :-: |
    | 阿里云（杭州） | [registry.cn-hangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hangzhou.aliyuncs.com") | 阿里云（日本-东京） | [registry.ap-northeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-northeast-1.aliyuncs.com") |
    | 阿里云（上海） | [registry.cn-shanghai.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shanghai.aliyuncs.com") | 阿里云（新加坡） | [registry.ap-southeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-1.aliyuncs.com") |
    | 阿里云（青岛） | [registry.cn-qingdao.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-qingdao.aliyuncs.com") | 阿里云（马来西亚-吉隆坡） | [registry.ap-southeast-3.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-3.aliyuncs.com") |
    | 阿里云（北京） | [registry.cn-beijing.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-beijing.aliyuncs.com") | 阿里云（印度尼西亚-雅加达） | [registry.ap-southeast-5.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-5.aliyuncs.com") |
    | 阿里云（张家口） | [registry.cn-zhangjiakou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-zhangjiakou.aliyuncs.com") | 阿里云（德国-法兰克福） | [registry.eu-central-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-central-1.aliyuncs.com") |
    | 阿里云（呼和浩特） | [registry.cn-huhehaote.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-huhehaote.aliyuncs.com") | 阿里云（英国-伦敦） | [registry.eu-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-west-1.aliyuncs.com") |
    | 阿里云（乌兰察布） | [registry.cn-wulanchabu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-wulanchabu.aliyuncs.com") | 阿里云（美国西部-硅谷） | [registry.us-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-west-1.aliyuncs.com") |
    | 阿里云（深圳） | [registry.cn-shenzhen.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shenzhen.aliyuncs.com") | 阿里云（美国东部-弗吉尼亚） | [registry.us-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-east-1.aliyuncs.com") |
    | 阿里云（河源） | [registry.cn-heyuan.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-heyuan.aliyuncs.com") | 阿联酋-迪拜 | [registry.me-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.me-east-1.aliyuncs.com") |
    | 阿里云（广州） | [registry.cn-guangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-guangzhou.aliyuncs.com") | 谷歌云（北美） | [gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://gcr.io") |
    | 阿里云（成都） | [registry.cn-chengdu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-chengdu.aliyuncs.com") | 谷歌云（亚洲） | [asia.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://asia.gcr.io") |
    | 阿里云（香港） | [registry.cn-hongkong.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hongkong.aliyuncs.com") | 谷歌云（欧洲） | [eu.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://eu.gcr.io") |
    | 腾讯云 | [mirror.ccs.tencentyun.com](https://cloud.tencent.com/document/product/1207/45596 "https://mirror.ccs.tencentyun.com") | Docker Hub 官方 | [registry.hub.docker.com](https://hub.docker.com/ "registry.hub.docker.com") |

    <blockquote style="border-left: none !important">注：国内云计算企业的镜像仓库仅针对其业务，境内实例仍无法访问 Docker Hub</blockquote>

    </div>

- ### 命令选项（高级用法）

    <!-- termynal -->
    ```
    $ bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --help 

    命令选项(名称/含义/值)：

      --source                 指定 Docker CE 源地址(域名或IP)     地址
      --source-registry        指定镜像仓库地址(域名或IP)           地址
      --branch                 指定 Docker CE 源仓库(路径)         仓库名
      --codename               指定 Debian 系操作系统的版本代号     代号名称
      --designated-version     指定 Docker CE 安装版本             版本号
      --protocol               指定 Docker CE 源的 WEB 协议        http 或 https
      --install-latest         是否安装最新版本的 Docker Engine    true 或 false
      --close-firewall         是否关闭防火墙                      true 或 false
      --clean-screen           是否在运行前清除屏幕上的所有内容      true 或 false
      --only-registry          仅更换镜像仓库模式                   无
      --ignore-backup-tips     忽略覆盖备份提示                    无
      --pure-mode              纯净模式，精简打印内容               无
    ```

    | 名称 | 含义 | 选项值 |
    | :-: | :-: | :-: |
    | `--source` | 指定 `Docker CE` 源地址(域名或IP) | `地址` |
    | `--source-registry` | 指定镜像仓库地址(域名或IP) | `地址` |
    | `--branch` | 指定 Docker CE 源仓库 | `仓库名（详见下方文档）` |
    | `--codename` | 指定 Debian 系操作系统的版本代号 | `代号名称` |
    | `--designated-version` | 指定 `Docker CE` 安装版本 | `版本号（详见下方文档）` |
    | `--protocol` | 指定 `Docker CE` 源的 WEB 协议 | `http` 或 `https` |
    | `--install-latest` | 是否安装最新版本的 Docker Engine | `true` 或 `false` |
    | `--close-firewall` | 是否关闭防火墙 | `true` 或 `false` |
    | `--clean-screen` | 是否在运行前清除屏幕上的所有内容 | `true` 或 `false` |
    | `--only-registry` | 仅更换镜像仓库模式 | 无 |
    | `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |
    | `--pure-mode` | 纯净模式，精简打印内容 | 无 |

    > 软件源完整格式 `<WEB协议>://<软件源地址(域名或IP)>/<软件源仓库(路径)>`

    - #### 指定 Docker CE 软件源地址

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --source mirror.example.com/docker-ce
        ```
        > 注意该地址路径需要包含镜像站的 Docker CE 软件源仓库路径即 `docker-ce`

    - #### 指定镜像仓库地址

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --source-registry registry.example.com
        ```

    - #### 仅更换镜像仓库

        === "使用脚本一键替换"

            仅更换镜像加速器，当检测到未安装 Docker 时会报错跳出

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --only-registry
            ```

        === "手动替换"
        
            - 安装 `jq` 软件包

                === "Debian 系 / openKylin"

                    ``` bash
                    apt-get install -y jq
                    ```

                    > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

                    新装系统需要先执行一遍更新 `apt-get update`

                === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

                    ``` bash
                    dnf install -y jq || yum install -y jq
                    ```

                    > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

            - 指定镜像仓库地址

                > 请手动替换 `<example.registry.com>` 为镜像仓库地址后在执行，详见上方 “项目内置的镜像仓库源” 表格中的地址列

                ``` bash
                SOURCE_REGISTRY='"https://<example.registry.com>"'
                ```
                还可以指定多个镜像仓库，如 `SOURCE_REGISTRY='"https://example.registry.com","https://test.registry.com"'`，注意用英文逗号分割

            - 替换镜像仓库地址

                ``` bash
                [ -s "/etc/docker/daemon.json" ] || echo "{}" >/etc/docker/daemon.json
                jq '.["registry-mirrors"] = ['"${SOURCE_REGISTRY}"']' /etc/docker/daemon.json >/etc/docker/daemon.json.tmp && mv /etc/docker/daemon.json.tmp
                ```

            - 重启 Docker 服务

                ``` bash
                systemctl daemon-reload
                [[ $(systemctl is-active docker) == "active" ]] && systemctl restart docker || systemctl enable --now docker
                ```

    - #### 指定 Docker CE 软件源仓库

        脚本默认会自动判断一般无需指定，除非你有特殊需求

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --branch centos
        ```
        > 仓库名是固定的，目前只有 `centos` `debian` `fedora` `raspbian` `rhel` `sles` `static` `ubuntu` 这几个  
        > 具体详见 [官方安装文档](https://docs.docker.com/engine/install) 和 [Docker CE 官方仓库](https://download.docker.com/linux)

    - #### 指定 Docker CE 安装版本

        指定安装版本时会忽略 `是否安装最新版本` 的命令选项，格式为 `主版本.次版本.补丁版本`，例如 `27.4.1`。

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --designated-version 27.0.0
        ```
        > 如果指定的版本不存在或者不支持当前系统，届时脚本会报错跳出

        ??? quote "查看版本列表的方法"

            === "Debian 系"

                ``` bash
                apt-cache madison docker-ce | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" | sort -t '.' -k1,1nr -k2,2nr -k3,3nr
                ```

                > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS`

            === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

                ``` bash
                dnf list docker-ce --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" | sort -t '.' -k1,1nr -k2,2nr -k3,3nr
                ```

                > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

            未出现在该列表中的版本则不支持通过本脚本安装，如果获取不到版本列表说明你当前的系统环境还没有正确配置 Docker CE 软件源（运行脚本时不存在该问题）


    - #### 无人值守（自动化）

        不通过交互完成安装操作，至少需要使用如下命令选项来实现，建议熟悉后再使用

        ``` { .bash .no-copy title="参考命令" }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) \
          --source mirror.example.com/docker-ce \
          --source-registry registry.hub.docker.com \
          --protocol http \
          --use-intranet-source false \
          --install-latest true \
          --close-firewall true \
          --ignore-backup-tips
        ```
        > 如果报错 `命令选项无效` 那么请检查选项合法性以及空格字符编码，在示例中一行写一个选项是为了提高命令的可读性

    - #### 纯净模式

        为了便于开发人员使用所推出的功能，启用后会精简脚本内容输出，建议搭配其它命令选项无交互使用

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --pure-mode
        ```

        !!! tip "滚动输出的命令日志可能存在无法预料的显示问题，不过目前暂未发现异常"

- ### 关于服务报错无法启动

    !!! quote ""

        非新装环境可能会在运行脚本后遇到 `Docker` 服务无法启动的情况，建议重新安装来解决，卸载不会删除本地镜像和容器数据

        卸载命令如下：

        === "Debian 系"

            ``` bash
            apt-get remove -y docker* containerd.io runc && apt-get autoremove
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            yum remove -y docker* containerd.io podman* runc
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        卸载完成后重新执行脚本安装即可
