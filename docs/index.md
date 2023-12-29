---
title: LinuxMirrors · 让换源更简单
comments: true
hide:
  - navigation
  - toc
  - feedback
  - footer
---

# GNU/Linux 一键更换系统软件源脚本

![](assets/images/brand/light/2.png#only-light){ width="300" }
![](assets/images/brand/dark/2.png#only-dark){ width="300" }

## 适配系统及其版本

!!! note inline end "说明"

    当前支持基于 `Debian`、`RedHat`、`OpenCloudOS`、`openEuler`、`openSUSE`、`Arch Linux` 的发行版和及其部分衍生版本  
    点击列表中的图标可快速前往其官网，理论支持所有架构的环境

    暂无计划适配更多系统或版本  
    如果你有需求那么请提交至 [Issues](https://github.com/SuperManito/LinuxMirrors/issues)

<div class="annotate" markdown>

| 名称 | 版本号 |
|---|:---:|
| <a href="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.45em"></a> Debian | 8.0 ~ 12 |
| <a href="https://cn.ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"></a> Ubuntu :material-information-outline:{ title="支持乌班图家族衍生操作系统，例如 <code>优麒麟</code> <code>Kubuntu</code> 等" } | 14.04 ~ 23 |
| <a href="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> Kali Linux | 2.0 ~ 2023 |
| <a href="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Deepin | all |
| <a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16"></a> Red Hat Enterprise Linux :material-information-outline:{ title="使用 <code>Rocky Linux</code> 源" } | 7.0 ~ 9 |
| <a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Fedora | 30 ~ 39 |
| <a href="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"></a> CentOS | 7.0 ~ 8.5 / Stream 8 ~ 9 |
| <a href="https://rockylinux.org/zh_CN" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Rocky Linux | 8 ~ 9 |
| <a href="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> AlmaLinux | 8 ~ 9 |
| <a href="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> OpenCloudOS | 8.6 / 8.8 / 9.0 |
| <a href="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.3em"></a> openEuler | 21.03 ~ 23 |
| <a href="https://www.opensuse.org" target="_blank"><img src="/assets/images/icon/opensuse.svg" width="16" height="16"></a> openSUSE | Leep 15 / Tumbleweed |
| <a href="https://archlinux.org" target="_blank"><img src="/assets/images/icon/arch-linux.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Arch Linux | all |

</div>

[开始使用](use/index.md){ .md-button .md-button--primary } [查看软件源列表](mirrors/index.md){ .md-button }

<div class="grid cards" markdown>

-   :octicons-report-24:{ .lg .middle } __意见与建议__

    ---

    如有意见与建议你可以提交至 [Issues](https://github.com/SuperManito/LinuxMirrors/issues)  
    如果你需要提交代码请前往 GitHub 仓库提交 [Pull Requests](https://github.com/SuperManito/LinuxMirrors/pulls)

    [:octicons-arrow-right-24: Issues](https://github.com/SuperManito/LinuxMirrors/issues)

-   :material-scale-balance:{ .lg .middle } __开源, MIT__

    ---

    项目已设立开源许可协议，传播时请在显著位置标注来源和作者  
    请尊重作者的知识成果，建议通过命令直接调用脚本

    [:octicons-arrow-right-24: License](https://github.com/SuperManito/LinuxMirrors/blob/main/LICENSE)

</div>

> 这是一个开源的非盈利项目，旨在为从事计算机相关行业的朋友们提供便利
