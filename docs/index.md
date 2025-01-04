---
title: 一键脚本使换源更简单
description: GNU/Linux 更换系统软件源脚本及 Docker 安装脚本
comments: true
glightbox: false
comments_description: 该评论区仅用于展示项目使用评价和经验分享，反馈问题或提出建议请前往<a href="/community">社区</a>
hide:
  - navigation
  - toc
  - feedback
  - footer
---

<div class="grid" markdown>
<figure style="margin: 0 auto" markdown>
  ![](assets/images/brand/light/2.png#only-light){ width="300" }
  ![](assets/images/brand/dark/2.png#only-dark){ width="300" }
  <figcaption>GNU/Linux 更换系统软件源脚本及 Docker 安装脚本</figcaption>
  <figcaption>一键脚本使换源更简单</figcaption>
</figure>
<figure class="home-cmd" style="margin: 0; display: flex; flex-direction: column; justify-content: center" markdown>
=== "GNU/Linux"

    ``` { .bash title="一键命令" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh)
    ```

=== "Docker"

    ``` { .bash title="一键命令" }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh)
    ```
</figure>
</div>

<div class="grid" markdown>

<div class="grid cards" style="height: fit-content" markdown>

-   :material-thumb-up-outline:{ .lg .middle } __轻松使用__

    ---

    只需要一行命令就能直接运行，无需安装任何依赖  
    文档提供了各种场景的解决方案，Linux 初学者也能轻松上手

-   :material-source-branch:{ .lg .middle } __多元软件源适配__

    ---

    深入考察了国内镜像站的系统适配情况，测试了下载速度与IPv6兼容性  
    另外提供全网搜集的国内教育网镜像站和海外镜像站供用户选择

-   :material-rocket-launch-outline:{ .lg .middle } __零技术门槛__

    ---

    无需了解相关技术，文档提供了全面的知识储备和操作指引  
    文档还提供了一些常见问题的解决方法以及一些高级用法的示例

-   :material-vector-polyline:{ .lg .middle } __广泛的系统支持__

    ---

    适配众多操作系统，涵盖主流版本，精准识别系统类型及其版本  
    脚本兼容性较高，不支持的系统会有相应提示并无操作跳出

-   :material-arm-flex-outline:{ .lg .middle } __脚本功能强大__

    ---

    脚本使换源变得更简单，默认交互运行，逐步引导用户选择软件源配置  
    同时提供了强大的命令选项，可实现各种高级定制需求

-   :material-pencil-ruler-outline:{ .lg .middle } __高度可定制__

    ---

    脚本命令选项设计遵循正式应用程序规范，能够满足各种高级需求  
    代码结构清晰，易于阅读和修改，可克隆后根据需求自行定制

-   :material-scale-balance:{ .lg .middle } __开源，MIT__

    ---

    项目已设立开源许可协议，脚本代码完全开源且免费使用  
    请尊重作者的知识成果，传播时请在显著位置标注来源和作者

-   :material-information-variant-box-outline:{ .lg .middle } __意见与建议__

    ---

    如有适配请求或意见与建议请提交至 [Issues](https://github.com/SuperManito/LinuxMirrors/issues) 或直接在 [社区](./community/index.md) 中参与讨论  
    若愿意贡献代码，请前往 GitHub 仓库提交 [Pull Requests](https://github.com/SuperManito/LinuxMirrors/pulls)

</div>

| 操作系统 | 适配版本 |
| --- | :---: |
| <a href="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.35em"></a> Debian | _8 ~ 13_ |
| <a href="https://cn.ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Ubuntu :material-information-outline:{ title="支持乌班图家族衍生操作系统，例如 <code>优麒麟</code> <code>Kubuntu</code> 等<br/>由于迭代速度较快并不直接支持所有非 LTS 的版本，具体详见使用文档中的高级用法" } | _14 ~ 24_ |
| <a href="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> Kali Linux | _all_ |
| <a href="https://linuxmint.com" target="_blank"><img src="/assets/images/icon/linux-mint.ico" width="16" height="16" style="vertical-align: -0.2em"></a> Linux Mint | _19 ~ 22 / LMDE 6_ |
| <a href="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.png" width="16" height="16" style="vertical-align: -0.25em"></a> Deepin（深度） | _all_ |
| <a href="https://zorin.com/os" target="_blank"><img src="/assets/images/icon/zorin-os.png" width="16" height="16" style="vertical-align: -0.15em"></a> Zorin OS | _all_ |
| <a href="https://www.armbian.com" target="_blank"><img src="/assets/images/icon/armbian.png" width="16" height="16" style="vertical-align: -0.2em"></a> Armbian | _all_ |
| <a href="https://www.proxmox.com" target="_blank"><img src="/assets/images/icon/proxmox.svg" width="16" height="16" style="vertical-align: -0.2em"></a> Proxmox | _all_ |
| <a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Red Hat Enterprise Linux :material-information-outline:{ title="使用 <code>CentOS Stream</code> 或 <code>CentOS</code> 源" } | _7 ~ 9_ |
| <a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Fedora | _30 ~ 41_ |
| <a href="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.1em"></a> CentOS | _7 ~ 8 / Stream 8 ~ 9_ |
| <a href="https://rockylinux.org" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Rocky Linux | _8 ~ 9_ |
| <a href="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.15em"></a> AlmaLinux | _8 ~ 9_ |
| <a href="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.2em"></a> openEuler（开源欧拉） | _21 ~ 24_ |
| <a href="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> OpenCloudOS（鸥栖） | _8.6 ~ 9 / Stream 23_ |
| <a href="https://www.openkylin.top" target="_blank"><img src="/assets/images/icon/openkylin.ico" width="16" height="16" style="vertical-align: -0.25em"></a> openKylin（开放麒麟） | _all_ |
| <a href="https://openanolis.cn" target="_blank"><img src="/assets/images/icon/anolis.png" width="16" height="16" style="vertical-align: -0.1em"></a> Anolis OS（龙蜥） | _8 / 23_ |
| <a href="https://www.opensuse.org" target="_blank"><img src="/assets/images/icon/opensuse.svg" width="16" height="16"></a> openSUSE | _Leep 15 / Tumbleweed_ |
| <a href="https://archlinux.org" target="_blank"><img src="/assets/images/icon/arch-linux.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Arch Linux | _all_ |
| <a href="https://www.alpinelinux.org" target="_blank"><img src="/assets/images/icon/alpine.png" width="16" height="16" style="vertical-align: -0.15em"></a> Alpine Linux | _v3 / edge_ |
| <a href="https://www.gentoo.org" target="_blank"><img src="/assets/images/icon/gentoo.svg" width="16" height="16" style="vertical-align: -0.2em"></a> Gentoo | _all_ |

</div>

[开 始 使 用](use/index.md){ .md-button .md-button--primary } &nbsp; [查看软件源列表](mirrors/index.md){ .md-button }

<div class="md-nav__sponsor-bottom" style="border-top: none; margin-top: 0">
  <div class="sponsor-label">
    <strong>赞助商</strong>
  </div>
  <div class="sponsor-wrapper sponsor-flex-wrapper">
    <a class="sponsor-item sponsor-flex-item" target="_blank" href="https://www.dkdun.cn/aff/VAWGETUL" title="林枫云">
      <img src="/assets/images/sponsor/linfengyun-light.png#only-light" alt="林枫云" style="width: 60%" />
      <img src="/assets/images/sponsor/linfengyun-dark.png#only-dark" alt="林枫云" style="width: 60%" />
    </a>
    <a class="sponsor-item sponsor-flex-item" target="_blank" href="https://arcadia.cool" title="Arcadia 一站式代码运维平台">
      <img src="/assets/images/sponsor/arcadia-light.png#only-light" alt="Arcadia 一站式代码运维平台" style="width: 60%" />
      <img src="/assets/images/sponsor/arcadia-dark.png#only-dark" alt="Arcadia 一站式代码运维平台" style="width: 60%" />
    </a>
  </div>
</div>
