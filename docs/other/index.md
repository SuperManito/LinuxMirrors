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
    <td><a href="https://www.centos.org" target="_blank"><img src="/../assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;CentOS</td>
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

!!! node ""

    脚本集成安装 [`Docker Engine`](https://docs.docker.com/engine)，可手动选择安装版本、下载软件源、镜像加速器，支持海内外服务器环境和 `arm` 架构处理器环境使用

    `Docker CE` 软件镜像仓库，全称 Docker Community Edition ，用于下载并安装 Docker 相关软件包  
    `Docker Hub` 容器镜像仓库，默认为官方提供的公共库，用于控制下载镜像的来源存储仓库，又称镜像加速器

### 命令选项

| 名称 | 含义 | 选项值 |
| :-: | :-: | :-: |
| `--source` | 指定 `Docker CE` 源地址 | 地址 |
| `--source-registry` | 指定 Docker Hub 源地址 | 地址 |
| `--install-latested` | 控制是否安装最新版本的 Docker Engine | 地址 |
| `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |

??? quote "原始执行脚本方法"

    ``` bash
    bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
    ```
