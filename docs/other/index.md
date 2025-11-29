---
hide:
  - navigation
  - footer
---

# :simple-docker:{style="color: #1d63ed"} Docker 安装与换源脚本

## 一键执行命令

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

        === ":simple-gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
            ```
            > 同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh)
            ```

        === ":tencent-cloud: 腾讯云 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh)
            ```
            > 不建议在国内网络环境下使用

        集成安装 [`Docker Engine`](https://docs.docker.com/engine) 和 [`Docker Compose`](https://docs.docker.com/compose)，支持选择或更换软件源（Docker 软件仓库）以及镜像仓库、安装指定版本、重装等功能，支持 ARM 架构

        脚本参考[官方文档](https://docs.docker.com/engine/install)使用系统包管理工具进行安装，不存在兼容性、安全性等问题，可安装的版本由 Docker CE 仓库决定

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

        === ":simple-gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --only-registry
            ```
            > 同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --only-registry
            ```

        === ":tencent-cloud: 腾讯云 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh) --only-registry
            ```
            > 不建议在国内网络环境下使用

<div class="grid cards" markdown>

-   :material-shimmer:{ .lg .middle } __完全替代官方安装脚本__

    ---

    与 [get.docker.com](https://get.docker.com) 逻辑一致，融合了本项目换源架构以及特性

-   :material-graph:{ .lg .middle } __支持国产衍生操作系统__

    ---

    兼容大量不受官方安装脚本支持的衍生操作系统 :material-information-outline:{ title="除官网首页展示的系统外还支持下方等特制系统</br><ul><li>Kylin Server</li><li>Huawei Cloud EulerOS</li><li>TencentOS Server</li><li>Alibaba Cloud Linux</li></ul>" }

-   :material-weight-lifter:{ .lg .middle } __功能强大、无与伦比__

    ---

    全网最实用的开源运维脚本之一，性能卓越

-   :material-compass-rose:{ .lg .middle } __精妙绝伦的交互设计__

    ---

    易于理解和使用的交互式命令行界面，遥遥领先

</div>

<div style="display: flex; align-items: center; gap: 8px;">
    <p>✨ 经过了数年的技术沉淀与生产环境检验，广受社区好评，深得开发者喜爱，大厂都在使用</p>
    <div class="icon-brand-section">
      <div class="icon-brand-container no-select">
        <a class="icon-brand-button" target="_blank" rel="noopener noreferrer" href="https://1panel.cn" title="1Panel">
          <img src="/assets/images/sponsor/1panel.png" alt="1panel" />
        </a>
        <a class="icon-brand-button" target="_blank" rel="noopener noreferrer" href="https://www.bt.cn" title="宝塔面板" style="padding: 0 !important">
          <img src="/assets/images/other/bt.svg" alt="BT" />
        </a>
      </div>
    </div>
</div>

</br>

!!! tip "Docker Compose 不再需要独立安装"

    Docker Compose 自 V2 版本起开始作为 Docker CLI（命令行）的一部分，脚本默认集成安装该[插件](https://docs.docker.com/compose/install/linux)，请使用 `docker compose` 命令替代 `docker-compose`

!!! node "软件源说明"

    <div class="grid cards" markdown>

    -   __Docker CE 软件仓库__

        ---

        Docker CE 全称 Docker Community Edition（Docker 社区版），是 Docker Engine 的别称，该仓库用于下载并安装 Docker 相关软件包

    -   __Docker Registry 镜像仓库__

        ---

        用于控制拉取镜像的默认来源存储仓库，又称镜像加速器，默认为官方容器镜像仓库 [Docker Hub](https://hub.docker.com) 

    </div>

    由于一些不可抗力的因素，国内网络环境下目前无法访问 [Docker Hub](https://hub.docker.com) 因此不能正常拉取镜像，建议使用下方提到的国内可用镜像仓库源

    注：脚本内的指定 Web 协议交互仅用于控制 `Docker CE` 软件源，`Docker Registry` 强制使用 `HTTPS` 协议


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
    | 阿里云（河源） | [registry.cn-heyuan.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-heyuan.aliyuncs.com") | 阿里云（阿联酋-迪拜） | [registry.me-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.me-east-1.aliyuncs.com") |
    | 阿里云（广州） | [registry.cn-guangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-guangzhou.aliyuncs.com") | 谷歌云（北美） | [gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://gcr.io") |
    | 阿里云（成都） | [registry.cn-chengdu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-chengdu.aliyuncs.com") | 谷歌云（亚洲） | [asia.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://asia.gcr.io") |
    | 阿里云（香港） | [registry.cn-hongkong.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hongkong.aliyuncs.com") | 谷歌云（欧洲） | [eu.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://eu.gcr.io") |
    | 腾讯云 | [mirror.ccs.tencentyun.com](https://cloud.tencent.com/document/product/1207/45596 "https://mirror.ccs.tencentyun.com") | Docker Hub | [registry.hub.docker.com](https://hub.docker.com/ "registry.hub.docker.com") |

    <blockquote style="border-left: none !important">注：国内云计算企业的镜像仓库源仅针对其业务，境内实例可能仍无法访问 Docker Hub</blockquote>

    </div>

## 命令选项（高级用法）

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --help 

命令选项(名称/含义/值)：

  --source                  指定 Docker CE 软件源地址(域名或IP)        地址
  --source-registry         指定 Docker 镜像仓库地址(域名或IP)         地址
  --branch                  指定 Docker CE 软件源仓库(路径)            仓库名
  --branch-version          指定 Docker CE 软件源仓库版本              版本号
  --designated-version      指定 Docker Engine 安装版本                版本号
  --codename                指定 Debian 系操作系统的版本代号            代号名称
  --protocol                指定 Docker CE 软件源的 Web 协议           http 或 https
  --use-intranet-source     是否优先使用内网 Docker CE 软件源地址       true 或 false
  --install-latest          是否安装最新版本的 Docker Engine           true 或 false
  --close-firewall          是否关闭防火墙                             true 或 false
  --clean-screen            是否在运行前清除屏幕上的所有内容             true 或 false
  --lang                    指定脚本输出的语言                          语言
  --only-registry           仅更换镜像仓库模式                          无
  --ignore-backup-tips      忽略覆盖备份提示                            无
  --pure-mode               纯净模式，精简打印内容                      无
  --help                    查看帮助菜单                               无
```

| 名称 | 含义 | 选项值 |
| :-: | :-: | :-: |
| `--source` | 指定 `Docker CE` 源地址(域名或IP) | `地址` |
| `--source-registry` | 指定 `Docker` 镜像仓库地址(域名或IP) | `地址（多个用英文逗号分割）` |
| `--branch` | 指定 `Docker CE` 软件源仓库(路径) | `仓库名（详见下方文档）` |
| `--branch-version` | 指定 `Docker CE` 软件源仓库版本 | `版本号（详见下方文档）` |
| `--designated-version` | 指定 `Docker Engine` 安装版本 | `版本号（详见下方文档）` |
| `--codename` | 指定 `Debian` 系操作系统的版本代号 | `代号名称` |
| `--protocol` | 指定 `Docker CE` 源的 Web 协议 | `http` 或 `https` |
| `--use-intranet-source` | 是否优先使用内网 `Docker CE` 软件源地址 | `true` 或 `false` |
| `--install-latest` | 是否安装最新版本的 `Docker Engine` | `true` 或 `false` |
| `--close-firewall` | 是否关闭防火墙 | `true` 或 `false` |
| `--clean-screen` | 是否在运行前清除屏幕上的所有内容 | `true` 或 `false` |
| `--lang` | 指定脚本输出的语言 | `语言ID（详见下方文档）` |
| `--only-registry` | 仅更换镜像仓库模式 | 无 |
| `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |
| `--pure-mode` | 纯净模式，精简打印内容 | 无 |
| `--help` | 查看帮助菜单 | 无 |

> 软件源完整格式 `<WEB协议>://<软件源地址(域名或IP)>/<软件源仓库(路径)>`

- ### 指定镜像仓库地址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --source-registry registry.example.com
    ```

    可以同时指定多个地址，需使用英文逗号进行分割

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) \
      --source-registry "registry-1.example.com,registry-2.example.com"
    ```

- ### 仅更换镜像仓库

    === "使用脚本一键替换"

        仅更换镜像加速器，当检测到未安装 Docker 时会报错跳出

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --only-registry
        ```

        懒人一键命令（使用多个地址）

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) \
          --only-registry \
          --source-registry "docker.1ms.run,docker.1panel.live,docker.m.daocloud.io"
        ```
        > 选项值可以指定多个地址，需使用英文逗号进行分割

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

- ### 指定 Docker CE 软件源地址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --source mirror.example.com/docker-ce
    ```
    > 注意该地址路径需要包含镜像站的 Docker CE 软件源仓库路径即 `docker-ce`

- ### 指定 Docker CE 软件源仓库

    脚本默认会自动判断一般无需指定，除非你有特殊需求

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --branch centos
    ```
    > 仓库名是固定的，目前只有 [`centos`](https://download.docker.com/linux/centos/) [`debian`](https://download.docker.com/linux/debian/) [`fedora`](https://download.docker.com/linux/fedora/) [`raspbian`](https://download.docker.com/linux/raspbian/) [`rhel`](https://download.docker.com/linux/rhel/) [`sles`](https://download.docker.com/linux/sles/) [`static`](https://download.docker.com/linux/static/) [`ubuntu`](https://download.docker.com/linux/ubuntu/) 这几个  
    > 具体详见 [官方安装文档](https://docs.docker.com/engine/install) 和 [Docker CE 官方仓库](https://download.docker.com/linux)

    ``` { .bash .no-copy title="还可以指定仓库版本号" }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) \
      --branch centos \
      --branch-version 9
    ```
    > 可以使用该选项来控制安装软件包的兼容性（仅适用于红帽系操作系统），具体详见对应仓库目录中代表版本号的路径名称（正整数）。

- ### 指定 Docker Engine 安装版本

    指定安装版本时会忽略 `是否安装最新版本` 的命令选项，格式为 `主版本.次版本.补丁版本`，例如 `28.4.1`。

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --designated-version 28.0.0
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

- ### 国际化（I18n）

    脚本提供多语言支持，当前内置 `简体中文`、`繁體中文`、`English` 共三种显示语言，默认为 `简体中文`

    - #### 指定语言

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang xxx
        ```

        | 类型 | 值 |
        | :-: | :-: |
        | 简体中文 | `zh-hans` `zh-cn` `zh` |
        | 繁體中文 | `zh-hant` `zh-tw` `zh-hk` |
        | English | `en` `en-us` |

        也可以直接作为命令选项使用

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en
        ```
        > `--en` `--en-us` `--zh` `--zh-cn` `--zh-hans` `--zh-hant`

    - #### 通过交互进行选择

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang auto
        ```

- ### 无人值守（自动化）

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

- ### 纯净模式

    推出该功能是为了便于开发以及运维人员使用，启用后会精简脚本内容输出，建议搭配其它命令选项无交互使用

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --pure-mode
    ```

    !!! tip "滚动输出的命令日志可能存在无法预料的显示问题，不过目前暂未发现异常"

## 常见问题

- #### 关于服务报错无法启动

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

- #### 关于不支持的操作系统

    如果提示不支持那么请使用系统自带的包管理工具进行安装。因为这些软件包由 Linux 发行版的软件包维护者构建和维护，可能存在配置差异或由修改后的源代码构建。

    也可以使用 &nbsp; [![Docker Desktop](../assets/images/icon/custom/docker-desktop.svg){ width="140" style="vertical-align: -0.2rem" }](https://www.docker.com/products/docker-desktop)

## 精简版（Lite）

项目额外提供一个精简版本，是主脚本的复制，面向企业产品、大型开源社区项目使用，具有以下特性：

- 单一显示语言 `English`，无 I18n 国际化功能
- 默认使用官方源，去除了交互选择内置软件源功能
- 去除了无关的打印内容
- 保留核心逻辑与命令选项设计

``` bash
bash <(curl -sSL https://linuxmirrors.cn/docker-lite.sh)
```
> 请熟悉本项目后再使用，不建议新手用户使用

## 最佳实践

??? note "适用于企业产品部署以及 CI/CD 等自动化运维场景的代码示例（展开查看）"

    如果你不想让用户进行任何交互，请使用 `完全自动化` 示例

    - #### 完全自动化（推荐）

        --8<-- "docs/other/example1.md"

    - #### 简易方式

        --8<-- "docs/other/example2.md"
        > 注：不指定 `Docker CE 源` 以及 `镜像仓库源` 则会交由用户进行交互选择，届时会自动清屏 `$ clear`，从而导致你脚本的运行日志被清除
