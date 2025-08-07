---
title: 一鍵腳本讓換源更簡單
description: GNU/Linux 更換系統軟體源腳本及 Docker 安裝與換源腳本
comments: true
glightbox: false
comments_description: 此評論區僅用於展示項目使用評估和經驗分享，回饋問題或建議請前往<a href="/community">社群</a>或<a href="https://github.com/SuperManito/LinuxMirrors/issues" target="_blank">Issues</a>
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
  <figcaption>GNU/Linux 更換系統軟體源腳本及 Docker 安裝與換源腳本</figcaption>
  <figcaption>一鍵腳本讓換源更簡單</figcaption>
</figure>
<figure class="home-cmd no-select" style="margin: 0; display: flex; flex-direction: column; justify-content: center" markdown>
=== "GNU/Linux"

    <img src="/assets/images/brand/command/linux-light.png#only-light" style="width: 560px; box-shadow: var(--md-shadow-z2)" alt="command-linux" />
    <img src="/assets/images/brand/command/linux-dark.png#only-dark" style="width: 560px; box-shadow: var(--md-shadow-z2)" alt="command-linux" />

    <button class="md-clipboard" data-clipboard-text="bash &lt;(curl -sSL https://linuxmirrors.cn/main.sh)" title="複製"></button>

=== "Docker"

    <img src="/assets/images/brand/command/docker-light.png#only-light" style="width: 560px; box-shadow: var(--md-shadow-z2)" alt="command-docker" />
    <img src="/assets/images/brand/command/docker-dark.png#only-dark" style="width: 560px; box-shadow: var(--md-shadow-z2)" alt="command-docker" />

    <button class="md-clipboard" data-clipboard-text="bash &lt;(curl -sSL https://linuxmirrors.cn/docker.sh)" title="複製"></button>

</figure>
</div>

<div class="grid" markdown>

<div class="grid cards" style="height: fit-content" markdown>

-   :material-thumb-up-outline:{ .lg .middle } __輕鬆使用__

    ---

    只需要一行指令就能直接運行，零技術門檻，無需安裝任何依賴  
    文檔整合了 AI 搜尋與聊天，提供各種使用場景的解決方案

-   :material-vector-polyline:{ .lg .middle } __系統支援廣泛__

    ---

    已適配高達 `25+` 作業系統，涵蓋各類版本，精準辨識系統類型  
    腳本相容性高，不支援的系統會有對應提示並無操作跳出

-   :material-vector-triangle:{ .lg .middle } __多元軟體源適配__

    ---

    深入考察了中國大陸鏡像站的系統適配狀況，專為中國寶寶打造  
    也提供全網蒐集的國內教育網和海外鏡像站供用戶選擇

-   :material-rocket-launch-outline:{ .lg .middle } __快，且高效__

    ---

    最快僅需 10 秒即可完成軟體源的更換，高效能維運，節省大量時間成本  
    項目經過數年的迭代與最佳化，腳本效能卓越運作穩定，場景判斷完善

-   :octicons-globe-24:{ .lg .middle } __全球網絡，執行無憂__

    ---

    本網站提供全球邊緣網路加速，不畏各種網路環境，輕鬆訪問  
    同時提供了多個備用地址以確保項目腳本始終可用，並真正做到使用無憂

-   :material-arm-flex-outline:{ .lg .middle } __功能強大，無與倫比__

    ---

    腳本透過方向鍵互動逐步引導使用者選擇軟體來源配置，讓換源更簡單  
    此外腳本提供了豐富的命令選項，支援 CI/CD 整合與自動化維運

-   :material-pencil-ruler-outline:{ .lg .middle } __高度可自定義__

    ---

    腳本命令選項遵循正式應用程式規範設計，能夠滿足各種進階需求  
    程式碼結構清晰，易於閱讀和修改，支援克隆後定制

-   :material-scale-balance:{ .lg .middle } __自由，開源__

    ---

    項目已設立 MIT 開源授權協議，腳本程式碼完全開源且免費使用  
    請尊重作者的知識成果，傳播時請在顯著位置標註來源或項目地址

</div>

<div style="text-align: center" markdown>

| 作業系統 | 適配版本 |
| --- | :---: |
| <a href="https://www.debian.org" title="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.35em"></a> **Debian** | _8～13_ |
| <a href="https://ubuntu.com" title="https://ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"></a> **Ubuntu** :material-information-outline:{ title="支援烏班圖家族衍生作業系統，例如 <code>優麒麟</code> <code>Kubuntu</code> 等<br/>由於迭代速度較快並不直接支援所有非 LTS 的版本，因此具體詳見文檔" } | _14～25_ |
| <a href="https://www.kali.org" title="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> **Kali Linux** | _all_ |
| <a href="https://linuxmint.com" title="https://linuxmint.com" target="_blank"><img src="/assets/images/icon/linux-mint.ico" width="16" height="16" style="vertical-align: -0.2em"></a> **Linux Mint** | _19～22 / LMDE 6_ |
| <a href="https://www.deepin.org" title="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.png" width="16" height="16" style="vertical-align: -0.2em"></a> **Deepin** | _all_ |
| <a href="https://zorin.com/os" title="https://zorin.com/os" target="_blank"><img src="/assets/images/icon/zorin-os.png" width="16" height="16" style="vertical-align: -0.15em"></a> **Zorin OS** | _all_ |
| <a href="https://www.armbian.com" title="https://www.armbian.com" target="_blank"><img src="/assets/images/icon/armbian.png" width="16" height="16" style="vertical-align: -0.2em"></a> **Armbian** | _all_ |
| <a href="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" title="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" target="_blank"><img src="/assets/images/icon/proxmox.svg" width="16" height="16" style="vertical-align: -0.2em"></a> **Proxmox VE** | _all_ |
| <a href="https://www.raspberrypi.com/software" title="https://www.raspberrypi.com/software" target="_blank"><img src="/assets/images/icon/raspberry-pi.png" width="16" height="16" style="vertical-align: -0.2em"></a> **Raspberry Pi OS** | _all_ |
| <a href="https://access.redhat.com/products/red-hat-enterprise-linux" title="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.1em"></a> **Red Hat Enterprise Linux** :material-information-outline:{ title="使用 <code>CentOS Stream</code> 或 <code>CentOS</code> 源" } | _7～10_ |
| <a href="https://fedoraproject.org" title="https://fedoraproject.org" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"></a> **Fedora** | _30～42_ |
| <a href="https://www.centos.org" title="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.125em"></a> **CentOS** | _7～8 / Stream 8～10_ |
| <a href="https://rockylinux.org" title="https://rockylinux.org" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.2em"></a> **Rocky Linux** | _8～10_ |
| <a href="https://almalinux.org" title="https://almalinux.org" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.15em"></a> **AlmaLinux** | _8～10_ |
| <a href="https://www.oracle.com/linux" title="https://www.oracle.com/linux" target="_blank"><img src="/assets/images/icon/oracle-linux.png" width="16" height="16" style="vertical-align: -0.25em"></a> **Oracle Linux** :material-information-outline:{ title="使用 <code>CentOS Stream</code> 源" } | _8～10_ |
| <a href="https://www.openeuler.org/zh" title="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.2em"></a> **openEuler** | _20～25_ |
| <a href="https://www.opencloudos.org" title="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> **OpenCloudOS** | _8.6～9 / Stream 23_ |
| <a href="https://www.openkylin.top" title="https://www.openkylin.top" target="_blank"><img src="/assets/images/icon/openkylin.ico" width="16" height="16" style="vertical-align: -0.25em"></a> **openKylin** | _all_ |
| <a href="https://openanolis.cn" title="https://openanolis.cn" target="_blank"><img src="/assets/images/icon/anolis.png" width="16" height="16" style="vertical-align: -0.1em"></a> **Anolis OS** | _8 / 23_ |
| <a href="https://www.opensuse.org" title="https://www.opensuse.org" target="_blank"><img src="/assets/images/icon/opensuse.svg" width="16" height="16"></a> **openSUSE** | _Leap 15 / Tumbleweed_ |
| <a href="https://archlinux.org" title="https://archlinux.org" target="_blank"><img src="/assets/images/icon/arch-linux.ico" width="16" height="16" style="vertical-align: -0.15em"></a> **Arch Linux** | _all_ |
| <a href="https://manjaro.org" title="https://manjaro.org" target="_blank"><img src="/assets/images/icon/manjaro.svg" width="16" height="16" style="vertical-align: -0.2em"></a> **Manjaro** | _all_ |
| <a href="https://www.alpinelinux.org" title="https://www.alpinelinux.org" target="_blank"><img src="/assets/images/icon/alpine.png" width="16" height="16" style="vertical-align: -0.15em"></a> **Alpine Linux** | _v3 / edge_ |
| <a href="https://www.gentoo.org" title="https://www.gentoo.org" target="_blank"><img src="/assets/images/icon/gentoo.svg" width="16" height="16" style="vertical-align: -0.2em"></a> **Gentoo** | _all_ |
| <a href="https://nixos.org" title="https://nixos.org" target="_blank"><img src="/assets/images/icon/nixos.svg" width="16" height="16" style="vertical-align: -0.15em"></a> **NixOS** | _19～25_ |

</div>
</div>

<div style="text-align: center; padding: 1rem 0" markdown>
[開 始 使 用](use/index.md){ .md-button .md-button--primary } &nbsp; [查看軟體源列表](mirrors/index.md){ .md-button }
</div>

--8<-- "docs/sponsor/main.html"

