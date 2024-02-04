---
hide:
  - navigation
  - feedback
  - footer
---

## :fontawesome-brands-docker:{style="color: #086dd7"} Docker 一键安装脚本

<table>
<tr>
    <td><a href="https://www.debian.org" target="_blank"><img src="/../assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.45em"/></a>&nbsp;Debian</td>
    <td><a href="https://www.centos.org" target="_blank"><img src="/../assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;CentOS</td>
</tr>
<tr>
    <td><a href="https://cn.ubuntu.com" target="_blank"><img src="/../assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Ubuntu</td>
    <td><a href="https://rockylinux.org" target="_blank"><img src="/../assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;Rocky Linux</td>
</tr>
<tr>
    <td><a href="https://www.kali.org" target="_blank"><img src="/../assets/images/icon/kali-linux.svg" width="16" height="16"/></a>&nbsp;Kali Linux</td>
    <td><a href="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;AlmaLinux</td>
</tr>
<tr>
    <td><a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/../assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Red Hat Enterprise Linux</td>
    <td><a href="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;OpenCloudOS</td>
</tr>
<tr>
    <td><a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/../assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Fedora</td>
    <td><a href="https://www.openeuler.org/zh" target="_blank"><img src="/../assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;openEuler</td>
</tr>
</table>

``` bash
bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
```

??? quote "原始执行脚本方法"

    === ":simple-github: GitHub"

        ``` bash
        bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh)
        ```

    === ":simple-gitee: Gitee"

        ``` bash
        bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
        ```

!!! node ""

    脚本集成安装 [`Docker Engine`](https://docs.docker.com/engine) 和 [`Docker Compose`](https://docs.docker.com/compose)，可选择安装版本、下载软件源、镜像加速器，支持海内外服务器环境和 `arm` 架构处理器环境使用

    `Docker CE` 软件仓库，全称 Docker Community Edition (Docker 社区版)，用于下载并安装 Docker 相关软件包  
    `Docker Registry` 镜像仓库，用于控制下载镜像的默认来源存储仓库，又称镜像加速器，默认为官方的 Docker Hub 仓库

### 命令选项

| 名称 | 含义 | 选项值 |
| :-: | :-: | :-: |
| `--source` | 指定 `Docker CE` 源地址(域名或IP) | 地址 |
| `--source-registry` | 指定镜像仓库地址(域名或IP) | 地址 |
| `--codename` | 指定 Debian 系操作系统的版本代号 | 代号名称 |
| `--install-latested` | 控制是否安装最新版本的 Docker Engine | `true` 或 `false` |
| `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |

> 软件源格式 `<指定WEB协议>://<软件源地址>/<软件源分支>`

### 关于服务报错无法启动

!!! quote ""

    非新装环境可能会在运行脚本后遇到 `Docker` 服务无法启动的情况，建议重新安装来解决，卸载不会删除镜像和容器数据

    卸载命令如下：

    === "Debian 系"

        ``` bash
        apt-get remove -y docker* containerd.io runc && apt-get autoremove
        ```

        > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Deepin` &nbsp; `Armbian`

    === "RedHat 系 / OpenCloudOS / openEuler"

        ``` bash
        yum remove -y docker* containerd.io podman* runc
        ```

        > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `OpenCloudOS` &nbsp; `openEuler`

    卸载完成后重新执行脚本安装即可
