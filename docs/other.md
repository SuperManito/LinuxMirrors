---
hide:
  - navigation
  - toc
---

## :fontawesome-brands-docker: Docker 一键安装脚本

``` bash
bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh)
```

!!! node "定义"
    `Docker CE` 软件镜像仓库，全称 Docker Community Edition ，用于下载并安装 Docker 相关软件包。  
    `Docker Hub` 容器镜像仓库，默认为官方提供的公共库，用于控制下载镜像的来源存储仓库，又称镜像加速器。

脚本集成安装 `Docker Engine`，可手动选择安装版本、下载源、镜像加速器，支持海内外服务器环境和 `arm` 架构处理器环境使用
