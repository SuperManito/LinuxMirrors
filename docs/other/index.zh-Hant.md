---
hide:
  - navigation
  - footer
---

# :simple-docker:{style="color: #1d63ed"} Docker 安裝與換源腳本

## 一鍵執行命令

=== "安裝"

    !!! quote ""

        === ":linuxmirrors: 官網（推薦）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh) --zh-hant
            ```

        === ":simple-gitee: Gitee 碼雲 (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --zh-hant
            ```
            > 即時同步、無延遲，中國大陸網路環境建議使用

        === ":simple-gitcode: GitCode (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --zh-hant
            ```
            > 同步存在1小時延遲

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --zh-hant
            ```

        === ":tencent-cloud: 騰訊雲 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh) --zh-hant
            ```
            > 不建議在中國大陸網路環境下使用

        整合安裝 [`Docker Engine`](https://docs.docker.com/engine) 和 [`Docker Compose`](https://docs.docker.com/compose)，支援選擇或更換軟體源（Docker 軟體倉庫）以及映像倉庫、安裝指定版本、重裝等功能，支援 ARM 架構

        腳本參考[官方文件](https://docs.docker.com/engine/install)使用系統套件管理工具進行安裝，不存在相容性、安全性等問題，可安裝的版本由 Docker CE 倉庫決定

=== "僅更換鏡像加速器"

    !!! quote ""

        === ":linuxmirrors: 官網（推薦）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --only-registry
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh) --zh-hant --only-registry
            ```

        === ":simple-gitee: Gitee 碼雲 (映像倉庫)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --zh-hant --only-registry
            ```
            > 即時同步、無延遲，中國大陸網路環境建議使用

        === ":simple-gitcode: GitCode (映像倉庫)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --zh-hant --only-registry
            ```
            > 同步存在1小時延遲

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --zh-hant --only-registry
            ```

        === ":tencent-cloud: 騰訊雲 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh) --zh-hant --only-registry
            ```
            > 不建議在中國大陸網路環境下使用

<div class="grid cards" markdown>

-   :material-shimmer:{ .lg .middle } __完全取代官方安裝腳本__

    ---

    與 [get.docker.com](https://get.docker.com) 邏輯一致，融合了本專案換源架構以及特性

-   :material-graph:{ .lg .middle } __支援衍生作業系統__

    ---

    相容於大量不受官方安裝腳本支援的衍生作業系統 :material-information-outline:{ title="除官網首頁展示的系統外還支援下方等特製系統</br><ul><li>Kylin Server</li><li>Huawei Cloud EulerOS</li><li>TencentOS Server</li><li>Alibaba Cloud Linux</li></ul>" }

-   :material-weight-lifter:{ .lg .middle } __功能強大、無與倫比__

    ---

    全網最實用的開源運維腳本之一，效能卓越

-   :material-compass-rose:{ .lg .middle } __精妙絕倫的互動設計__

    ---

    易於理解和使用的互動式命令列介面，遙遙領先

</div>

<div style="display: flex; align-items: center; gap: 8px;">
    <p>✨ 經過了數年的技術沉澱與生產環境檢驗，廣受社區好評，深得開發者喜愛，大廠都在使用</p>
    <div class="icon-brand-section">
      <div class="icon-brand-container no-select">
        <a class="icon-brand-button" target="_blank" rel="noopener noreferrer" href="https://1panel.pro" title="1Panel">
          <img src="/assets/images/sponsor/1panel.png" alt="1panel" />
        </a>
        <a class="icon-brand-button" target="_blank" rel="noopener noreferrer" href="https://www.aapanel.com" title="aaPanel" style="padding: 0 !important">
          <img src="/assets/images/other/aaPanel.png" alt="aapanel" style="width: 76% !important" />
        </a>
      </div>
    </div>
</div>

</br>

!!! tip "Docker Compose 不再需要獨立安裝"

    Docker Compose 自 V2 版本起開始作為 Docker CLI（命令列）的一部分，腳本預設整合安裝該[插件](https://docs.docker.com/compose/install/linux)，請使用 `docker compose` 指令取代 `docker-compose`

!!! node "軟體源說明"

    <div class="grid cards" markdown>

    -   __Docker CE 軟體倉庫

        ---

        Docker CE 全稱 Docker Community Edition（Docker 社群版），是 Docker Engine 的別稱，該倉庫用於下載並安裝 Docker 相關軟體包

    -   __Docker Registry 映像倉庫__

        ---

        用於控制拉取鏡像的預設軟體源儲存倉庫，又稱為鏡像加速器，預設為官方容器映像倉庫 [Docker Hub](https://hub.docker.com) 

    </div>

    由於一些不可抗力的因素，中國大陸網路環境下目前無法訪問 [Docker Hub](https://hub.docker.com) 因此無法正常拉取鏡像，建議使用下方提到的中國大陸可用映像倉庫源

    註：腳本內的指定 Web 協定互動僅用於控制 `Docker CE` 軟體源，`Docker Registry` 強制使用 `HTTPS` 協定


!!! quote "預設的映像倉庫源"

    <div style="text-align: center" markdown>
    <div style="font-size: 0.8rem"><strong>中國大陸可用</strong></div>

    | 名稱 | 位址 | 說明 |
    | :--: | :--: | :-- |
    | 毫秒鏡像 | [docker.1ms.run](https://1ms.run "docker.1ms.run") | 企業鏡像站，CDN智慧分送速度極快，支援付費定制，推薦使用 |
    | Docker Proxy | [dockerproxy.net](https://dockerproxy.net "dockerproxy.net") | 由 ghproxy 創建，可用性高但速度很慢，支援企業鏡像付費加速 |
    | DaoCloud | [docker.m.daocloud.io](https://docker.m.daocloud.io "docker.m.daocloud.io") | 老牌企業鏡像站，可用性高且速度快，現為白名單模式 |
    | 1Panel 鏡像 | [docker.1panel.live](https://1panel.cn "docker.1panel.live") | 企業產品自用鏡像 |

    <blockquote style="border-left: none !important">本開源專案不適合採集個人自建的鏡像加速器，如有需要可搭配命令選項自行使用</blockquote>

    <div style="font-size: 0.8rem; margin-top: 1rem"><strong>其它</strong></div>

    | 名稱 | 位址 | 名稱 | 位址 |
    | :- | :-: | :- | :-: |
    | Alibaba Cloud (Hangzhou) | [registry.cn-hangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hangzhou.aliyuncs.com") | Alibaba Cloud (Japan - Tokyo) | [registry.ap-northeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-northeast-1.aliyuncs.com") |
    | Alibaba Cloud (Shanghai) | [registry.cn-shanghai.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shanghai.aliyuncs.com") | Alibaba Cloud (Singapore) | [registry.ap-southeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-1.aliyuncs.com") |
    | Alibaba Cloud (Qingdao) | [registry.cn-qingdao.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-qingdao.aliyuncs.com") | Alibaba Cloud (Malaysia - Kuala Lumpur) | [registry.ap-southeast-3.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-3.aliyuncs.com") |
    | Alibaba Cloud (Beijing) | [registry.cn-beijing.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-beijing.aliyuncs.com") | Alibaba Cloud (Indonesia - Jakarta) | [registry.ap-southeast-5.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-5.aliyuncs.com") |
    | Alibaba Cloud (Zhangjiakou) | [registry.cn-zhangjiakou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-zhangjiakou.aliyuncs.com") | Alibaba Cloud (Germany - Frankfurt) | [registry.eu-central-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-central-1.aliyuncs.com") |
    | Alibaba Cloud (Hohhot) | [registry.cn-huhehaote.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-huhehaote.aliyuncs.com") | Alibaba Cloud (UK - London) | [registry.eu-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-west-1.aliyuncs.com") |
    | Alibaba Cloud (Ulanqab) | [registry.cn-wulanchabu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-wulanchabu.aliyuncs.com") | Alibaba Cloud (US Western - Silicon Valley) | [registry.us-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-west-1.aliyuncs.com") |
    | Alibaba Cloud (Shenzhen) | [registry.cn-shenzhen.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shenzhen.aliyuncs.com") | Alibaba Cloud (US Eastern - Virginia) | [registry.us-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-east-1.aliyuncs.com") |
    | Alibaba Cloud (Heyuan) | [registry.cn-heyuan.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-heyuan.aliyuncs.com") | Alibaba Cloud (United Arab Emirates - Dubai) | [registry.me-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.me-east-1.aliyuncs.com") |
    | Alibaba Cloud (Guangzhou) | [registry.cn-guangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-guangzhou.aliyuncs.com") | Google Cloud（North America) | [gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://gcr.io") |
    | Alibaba Cloud (Chengdu) | [registry.cn-chengdu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-chengdu.aliyuncs.com") | Google Cloud（Asia) | [asia.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://asia.gcr.io") |
    | Alibaba Cloud (Hong Kong) | [registry.cn-hongkong.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hongkong.aliyuncs.com") | Google Cloud（Europe) | [eu.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://eu.gcr.io") |
    | Tencent Cloud | [mirror.ccs.tencentyun.com](https://cloud.tencent.com/document/product/1207/45596 "https://mirror.ccs.tencentyun.com") | Docker Hub | [registry.hub.docker.com](https://hub.docker.com/ "registry.hub.docker.com") |

    <blockquote style="border-left: none !important">註：中國大陸雲端運算企業的映像倉庫軟體源僅針對其業務，中國大陸境內實例可能仍無法造訪 Docker Hub</blockquote>

    </div>

## 命令選項（進階用法）

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --help 

命令選項(名稱/含義/值)：

  --source                  指定 Docker CE 軟體源位址(網域名稱或IP)      位址
  --source-registry         指定 Docker 映像倉庫位址 (網域名稱或IP)      位址
  --branch                  指定 Docker CE 軟體源倉庫 (路徑)             倉庫名稱
  --branch-version          指定 Docker CE 軟體源倉庫版本                版本號
  --designated-version      指定 Docker Engine 安裝版本                  版本號
  --codename                指定 Debian 係作業系統的版本代號              代號名稱
  --protocol                指定 Docker CE 源的 Web 協定                 http 或 https
  --use-intranet-source     是否優先使用內部網路 Docker CE 軟體源位址     true 或 false
  --install-latest          是否安裝最新版本的 Docker Engine             true 或 false
  --close-firewall          是否關閉防火牆                               true 或 false
  --clean-screen            是否在運行前清除螢幕上的所有內容              true 或 false
  --lang                    指定腳本輸出的語言                           语言
  --only-registry           僅更換映像倉庫模式                           無
  --ignore-backup-tips      忽略覆蓋備份提示                             無
  --pure-mode               純淨模式，精簡列印內容                        無
  --help                    查看幫助選單                                 無
```

| 名稱 | 意義 | 選項值 |
| :-: | :-: | :-: |
| `--source` | 指定 `Docker CE` 軟體源位址(網域名稱或IP) | `位址` |
| `--source-registry` | 指定 `Docker` 映像倉庫位址(網域名稱或IP) | `位址（多個用英文逗號分割）` |
| `--branch` | 指定 `Docker CE` 軟體源倉庫(路徑) | `倉庫名稱（詳見下方文件）` |
| `--branch-version` | 指定 `Docker CE` 軟體源倉庫版本 | `版本號（詳見下方文件）` |
| `--designated-version` | 指定 `Docker Engine` 安裝版本 | `版本號（詳見下方文件）` |
| `--codename` | 指定 `Debian` 係作業系統的版本代號 | `代號名稱` |
| `--protocol` | 指定 `Docker CE` 源的 Web 協定 | `http` 或 `https` |
| `--use-intranet-source` | 是否優先使用內部網路 `Docker CE` 軟體源位址 | `true` 或 `false` |
| `--install-latest` | 是否安裝最新版本的 `Docker Engine` | `true` 或 `false` |
| `--close-firewall` | 是否關閉防火牆 | `true` 或 `false` |
| `--clean-screen` | 是否在運行前清除螢幕上的所有內容 | `true` 或 `false` |
| `--lang` | 指定腳本輸出的語言 | `語言ID（詳見下方文件）` |
| `--only-registry` | 僅更換映像倉庫模式 | 無 |
| `--ignore-backup-tips` | 忽略覆蓋備份提示（即不覆蓋備份) | 無 |
| `--pure-mode` | 純淨模式，精簡列印內容 | 無 |
| `--help` | 查看幫助選單 | 無 |

> 軟體源完整格式 `<WEB協定>://<軟體源位址(網域名稱或IP)>/<軟體源倉庫(路徑)>`

- ### 指定映像倉庫位址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --source-registry registry.example.com
    ```

    可同時指定多個地址，需使用英文逗號分割

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant \
      --source-registry "registry-1.example.com,registry-2.example.com"
    ```

- ### 僅更換映像倉庫

    === "使用腳本一鍵替換"

        僅更換鏡像加速器，當偵測到未安裝 Docker 時會報錯跳出

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --only-registry
        ```

        懶人一鍵指令（使用多個位址）

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant \
          --only-registry \
          --source-registry "docker.1ms.run,docker.1panel.live,docker.m.daocloud.io"
        ```
        > 選項值可以指定多個位址，需使用英文逗號分割

    === "手動替換"

        - 安裝 `jq` 軟體包

            === "Debian 系 / openKylin"

                ``` bash
                apt-get install -y jq
                ```

                > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

                新裝系統需要先執行一次更新 `apt-get update`

            === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

                ``` bash
                dnf install -y jq || yum install -y jq
                ```

                > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        - 指定映像倉庫位址

            > 請手動替換 `<example.registry.com>` 為映像倉庫位址後在執行，詳見上方 “專案內置的映像倉庫源” 表格中的位址列

            ``` bash
            SOURCE_REGISTRY='"https://<example.registry.com>"'
            ```
            也可以指定多個映像倉庫，如 `SOURCE_REGISTRY='"https://example.registry.com","https://test.registry.com"'`，注意用英文逗號分割

        - 替換映像倉庫位址

            ``` bash
            [ -s "/etc/docker/daemon.json" ] || echo "{}" >/etc/docker/daemon.json
            jq '.["registry-mirrors"] = ['"${SOURCE_REGISTRY}"']' /etc/docker/daemon.json >/etc/docker/daemon.json.tmp && mv /etc/docker/daemon.json.tmp
            ```

        - 重新啟動 Docker 服務

            ``` bash
            systemctl daemon-reload
            [[ $(systemctl is-active docker) == "active" ]] && systemctl restart docker || systemctl enable --now docker
            ```

- ### 指定 `Docker CE` 軟體源位址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --source mirror.example.com/docker-ce
    ```
    > 注意該位址路徑需要包含映像站的 Docker CE 軟體源倉庫路徑即 `docker-ce`

- ### 指定 Docker CE 軟體源倉庫

    腳本預設會自動判斷一般無需指定，除非你有特殊需求

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --branch centos
    ```
    > 倉庫名稱是固定的，目前只有 [`centos`](https://download.docker.com/linux/centos/) [`debian`](https://download.docker.com/linux/debian/) [`fedora`](https://download.docker.com/linux/fedora/) [`raspbian`](https://download.docker.com/linux/raspbian/) [`rhel`](https://download.docker.com/linux/rhel/) [`sles`](https://download.docker.com/linux/sles/) [`static`](https://download.docker.com/linux/static/) [`ubuntu`](https://download.docker.com/linux/ubuntu/) 這幾個  
    > 詳情請見 [官方安裝文件](https://docs.docker.com/engine/install) 及 [Docker CE 官方倉庫](https://download.docker.com/linux)

    ``` { .bash .no-copy title="还可以指定倉庫版本號" }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant \
      --branch centos \
      --branch-version 9
    ```
    > 可以使用此選項來控制安裝軟體套件的相容性（僅適用於紅帽係作業系統），具體詳見對應倉庫目錄中代表版本號的路徑名稱（正整數）。

- ### 指定 Docker Engine 安裝版本

    指定安裝版本時會忽略 `是否安裝最新版本` 的命令選項，格式為 `主版.次版本.補丁版本`，例如 `28.4.1`。

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --designated-version 28.0.0
    ```
    > 如果指定的版本不存在或不支援當前作業系統，屆時腳本會報錯跳出

    ??? quote "查看版本清單的方法"

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

        未出現在該清單中的版本則不支援透過本腳本安裝，如果取得不到版本清單說明你目前的系統環境還沒有正確配置 Docker CE 軟體軟體源（執行腳本時不存在該問題）

- ### 國際化（I18n）

    腳本提供多語言支持，目前內建 `简体中文`、`繁體中文`、`English` 共三種顯示語言，預設為 `简体中文`

    - #### 指定語言

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang xxx
        ```

        | 類型 | 值 |
        | :-: | :-: |
        | 简体中文 | `zh-hans` `zh-cn` `zh` |
        | 繁體中文 | `zh-hant` `zh-tw` `zh-hk` |
        | English | `en` `en-us` |

        也可以直接作為指令選項使用

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en
        ```
        > `--en` `--en-us` `--zh` `--zh-cn` `--zh-hans` `--zh-hant`

    - #### 透過互動進行選擇

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang auto
        ```

- ### 無人值守（自動化）

    不透過交互完成安裝操作，至少需要使用以下命令選項來實現，建議熟悉後再使用

    ``` { .bash .no-copy title="参考命令" }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant \
      --source mirror.example.com/docker-ce \
      --source-registry registry.hub.docker.com \
      --protocol http \
      --use-intranet-source false \
      --install-latest true \
      --close-firewall true \
      --ignore-backup-tips
    ```
    > 如果報錯 `命令選項無效` 那麼請檢查選項合法性以及空格字元編碼，在範例中一行寫一個選項是為了提高命令的可讀性

- ### 純淨模式

    推出此功能是為了方便開發以及运维人員使用，啟用後會精簡腳本內容輸出，建議搭配其它指令選項無互動使用

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant --pure-mode
    ```

    !!! tip "滾動輸出的命令日誌可能有無法預料的顯示問題，不過目前暫未發現異常"

## 常見問題

- #### 關於服務報錯無法啟動

    !!! quote ""

        非新裝環境可能會在執行腳本後遇到 `Docker` 服務無法啟動的情況，建議重新安裝來解決，卸載不會刪除本機映像和容器資料

        卸載指令如下：

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

        卸載完成後重新執行腳本安裝即可

- #### 關於不支援的作業系統

    如果提示不支援那麼請使用系統自備的套件管理工具進行安裝。因為這些軟體包由 Linux 發行版的軟體包維護者建構和維護，可能存在配置差異或由修改後的原始碼建構。

    也可以使用 &nbsp; [![Docker Desktop](../assets/images/icon/custom/docker-desktop.svg){ width="140" style="vertical-align: -0.2rem" }](https://www.docker.com/products/docker-desktop)

## 精簡版（Lite）

專案額外提供一個精簡版本，是主腳本的複製，面向企業產品、大型開源社群專案使用，具有以下特性：

- 單一顯示語言 `English`，無 I18n 國際化功能
- 預設使用官方來源，去除了互動選擇內建軟體源功能
- 去除了無關的列印內容
- 保留核心邏輯與指令選項設計

``` bash
bash <(curl -sSL https://linuxmirrors.cn/docker-lite.sh)
```
> 請熟悉本項目後再使用，不建議新手使用者使用

- ## 最佳實踐

??? note "適用於企業產品部署以及 CI/CD 等自動化維運場景的程式碼範例（展開檢視）"

    如果你不想讓用戶進行任何交互，請使用 `完全自動化` 範例

    - #### 完全自動化（建議）

        --8<-- "docs/other/example1.md"

    - #### 簡易方式

        --8<-- "docs/other/example2.md"
        > 註：不指定 `Docker CE 源` 以及 `映像倉庫源` 則會交由使用者進行互動選擇，屆時會自動清屏 `$ clear`，從而導致你腳本的運行日誌被清除
