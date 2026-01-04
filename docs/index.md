---
title: 一键脚本使换源更简单
description: GNU/Linux 更换系统软件源脚本及 Docker 安装与换源脚本
comments: true
glightbox: false
comments_description: 该评论区仅用于展示项目使用评价和经验分享，反馈问题或建议请前往<a href="/community">社区</a>或<a href="https://github.com/SuperManito/LinuxMirrors/issues" target="_blank" rel="noopener noreferrer">Issues</a>
hide:
  - navigation
  - toc
  - footer
---

<div class="grid" markdown>
<figure style="margin: 0 auto" markdown>
  <div class="hero">
    <span class="hero-background">
    </span>
  </div>
  <img src="/assets/images/brand/light/2.png#only-light" alt="LinuxMirrors" style="width: 300px" />
  <img src="/assets/images/brand/dark/2.png#only-dark" alt="LinuxMirrors" style="width: 300px" />
  <figcaption>GNU/Linux 更换系统软件源脚本及 Docker 安装与换源脚本</figcaption>
  <figcaption>一键脚本使换源更简单</figcaption>
</figure>
<figure class="home-cmd no-select" style="margin: 0 auto; display: flex; flex-direction: column; justify-content: center" markdown>
=== ":linux:{ .middle } GNU/Linux"

    <img src="/assets/images/brand/command/linux-light.png#only-light" alt="command-linux" />
    <img src="/assets/images/brand/command/linux-dark.png#only-dark" alt="command-linux" />

    <button class="md-clipboard" data-clipboard-text="bash &lt;(curl -sSL https://linuxmirrors.cn/main.sh)" title="复制"></button>

=== ":simple-docker:{ .lg .middle style="color: #1d63ed"} Docker"

    <img src="/assets/images/brand/command/docker-light.png#only-light" alt="command-docker" />
    <img src="/assets/images/brand/command/docker-dark.png#only-dark" alt="command-docker" />

    <button class="md-clipboard" data-clipboard-text="bash &lt;(curl -sSL https://linuxmirrors.cn/docker.sh)" title="复制"></button>

</figure>
</div>

<div class="grid" markdown>

<div class="grid cards" style="height: fit-content" markdown>

-   :material-thumb-up-outline:{ .lg .middle } __轻松使用__

    ---

    只需要一行命令就能直接运行，零技术门槛，无需安装任何依赖  
    文档集成了 AI 搜索与聊天，提供各种使用场景的解决方案

-   :material-vector-polyline:{ .lg .middle } __系统支持广泛__

    ---

    已适配高达 `26+` 操作系统，涵盖各类版本，精准识别系统类型  
    脚本兼容性高，不支持的系统会有相应提示并无操作跳出

-   :material-vector-triangle:{ .lg .middle } __多元软件源适配__

    ---

    深入考察了国内镜像站的系统适配情况，专为中国用户打造  
    还提供全网搜集的国内教育网和海外镜像站供用户选择

-   :material-rocket-launch-outline:{ .lg .middle } __快，且高效__

    ---

    最快仅需 10 秒即可完成软件源的更换，高效运维，节省大量时间成本  
    项目经过数年的迭代与优化，脚本性能卓越运行稳定，场景判断完善

-   :octicons-globe-24:{ .lg .middle } __全球网络，调用无忧__

    ---

    本网站提供全球边缘网络加速，不惧各种网络环境，国内轻松访问  
    同时提供了多个备用地址以确保项目脚本始终可用，真正做到使用无忧

-   :material-arm-flex-outline:{ .lg .middle } __功能强大，无与伦比__

    ---

    脚本通过方向键交互逐步引导用户选择软件源配置，使换源更简单  
    此外脚本提供了丰富的命令选项，支持 CI/CD 集成与自动化运维

-   :material-pencil-ruler-outline:{ .lg .middle } __高度可定制__

    ---

    脚本命令选项遵循正式应用程序规范设计，能够满足各种高级需求  
    代码结构清晰，易于阅读和修改，支持克隆后定制，支持多语言打印

-   :material-scale-balance:{ .lg .middle } __自由，开源__

    ---

    项目已设立 MIT 开源许可协议，脚本代码完全开源且免费使用  
    请尊重作者的知识成果，传播时请在显著位置标注来源或项目地址

</div>

<div class="home-table" style="text-align: center" markdown>

| 操作系统 | 适配版本 |
| --- | :---: |
| <a href="https://www.debian.org" title="https://www.debian.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/debian.svg" alt="Debian" width="16" height="16" style="vertical-align: -0.35em"></a> **Debian** | _8～13_ |
| <a href="https://ubuntu.com" title="https://ubuntu.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/ubuntu.svg" alt="Ubuntu" width="16" height="16" style="vertical-align: -0.15em"></a> **Ubuntu** :material-information-outline:{ title="支持乌班图家族衍生操作系统，例如 <code>优麒麟</code> <code>Kubuntu</code> 等<br/>由于迭代速度较快并不直接支持所有非 LTS 的版本，具体详见文档" } | _14～25_ |
| <a href="https://www.kali.org" title="https://www.kali.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/kali-linux.png" alt="Kali Linux" width="16" height="16"></a> **Kali Linux** | _all_ |
| <a href="https://linuxmint.com" title="https://linuxmint.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/linux-mint.svg" alt="Linux Mint" width="16" height="16" style="vertical-align: -0.2em"></a> **Linux Mint** | _17～22 / LMDE 2～7_ |
| <a href="https://www.deepin.org" title="https://www.deepin.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/deepin.png" alt="Deepin" width="16" height="16" style="vertical-align: -0.2em"></a> **Deepin（深度）** | _all_ |
| <a href="https://zorin.com/os" title="https://zorin.com/os" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/zorin-os.png" alt="Zorin OS" width="16" height="16" style="vertical-align: -0.15em"></a> **Zorin OS** | _all_ |
| <a href="https://www.armbian.com" title="https://www.armbian.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/armbian.png" alt="Armbian" width="16" height="16" style="vertical-align: -0.2em"></a> **Armbian** | _all_ |
| <a href="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" title="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/proxmox.svg" alt="Proxmox VE" width="16" height="16" style="vertical-align: -0.2em"></a> **Proxmox VE** | _all_ |
| <a href="https://www.raspberrypi.com/software" title="https://www.raspberrypi.com/software" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/raspberry-pi.png" alt="Raspberry Pi OS" width="16" height="16" style="vertical-align: -0.2em"></a> **Raspberry Pi OS** | _all_ |
| <a href="https://access.redhat.com/products/red-hat-enterprise-linux" title="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/redhat.svg" alt="Red Hat Enterprise Linux" width="16" height="16" style="vertical-align: -0.1em"></a> **Red Hat Enterprise Linux** :material-information-outline:{ title="使用 <code>CentOS Stream</code> 或 <code>CentOS</code> 源" } | _7～10_ |
| <a href="https://fedoraproject.org" title="https://fedoraproject.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/fedora.ico" alt="Fedora" width="16" height="16" style="vertical-align: -0.15em"></a> **Fedora** | _30～43_ |
| <a href="https://www.centos.org" title="https://www.centos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/centos.svg" alt="CentOS" width="16" height="16" style="vertical-align: -0.125em"></a> **CentOS** | _7～8 / Stream 8～10_ |
| <a href="https://rockylinux.org" title="https://rockylinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/rocky-linux.svg" alt="Rocky Linux" width="16" height="16" style="vertical-align: -0.2em"></a> **Rocky Linux** | _8～10_ |
| <a href="https://almalinux.org" title="https://almalinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/almalinux.svg" alt="AlmaLinux" width="16" height="16" style="vertical-align: -0.15em"></a> **AlmaLinux** | _8～10_ |
| <a href="https://www.oracle.com/linux" title="https://www.oracle.com/linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/oracle-linux.png" alt="Oracle Linux" width="16" height="16" style="vertical-align: -0.25em"></a> **Oracle Linux** :material-information-outline:{ title="使用 <code>CentOS Stream</code> 源" } | _8～10_ |
| <a href="https://www.openeuler.org" title="https://www.openeuler.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openeuler.ico" alt="openEuler" width="16" height="16" style="vertical-align: -0.2em"></a> **openEuler（开源欧拉）** | _20～25_ |
| <a href="https://www.opencloudos.org" title="https://www.opencloudos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opencloudos.png" alt="OpenCloudOS" width="16" height="16" style="vertical-align: -0.25em"></a> **OpenCloudOS（鸥栖）** | _8.6～9 / Stream 23_ |
| <a href="https://www.openkylin.top" title="https://www.openkylin.top" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openkylin.ico" alt="openKylin" width="16" height="16" style="vertical-align: -0.25em"></a> **openKylin（开放麒麟）** | _all_ |
| <a href="https://openanolis.cn" title="https://openanolis.cn" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/anolis.png" alt="Anolis OS" width="16" height="16" style="vertical-align: -0.1em"></a> **Anolis OS（龙蜥）** | _8 / 23_ |
| <a href="https://www.opensuse.org" title="https://www.opensuse.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opensuse.svg" alt="openSUSE" width="16" height="16"></a> **openSUSE** | _Leap 15 ~ 16 / Tumbleweed_ |
| <a href="https://archlinux.org" title="https://archlinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/arch-linux.ico" alt="Arch Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Arch Linux** | _all_ |
| <a href="https://manjaro.org" title="https://manjaro.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/manjaro.svg" alt="Manjaro" width="16" height="16" style="vertical-align: -0.2em"></a> **Manjaro** | _all_ |
| <a href="https://endeavouros.com" title="https://endeavouros.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/endeavouros.png" alt="EndeavourOS" width="16" height="16" style="vertical-align: -0.1em"></a> **EndeavourOS** | _all_ |
| <a href="https://www.alpinelinux.org" title="https://www.alpinelinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/alpine.png" alt="Alpine Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Alpine Linux** | _v3 / edge_ |
| <a href="https://www.gentoo.org" title="https://www.gentoo.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/gentoo.svg" alt="Gentoo" width="16" height="16" style="vertical-align: -0.2em"></a> **Gentoo** | _all_ |
| <a href="https://nixos.org" title="https://nixos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/nixos.svg" alt="NixOS" width="16" height="16" style="vertical-align: -0.15em"></a> **NixOS** | _19～25_ |

</div>
</div>

<div style="text-align: center; padding: 1rem 0" markdown>
[开 始 使 用](use/index.md){ .md-button .md-button--primary } &nbsp; [软件源列表](mirrors/index.md){ .md-button }
</div>

--8<-- "docs/sponsor/main.html"

