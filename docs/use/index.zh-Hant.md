---
hide:
  - navigation
  - footer
---

## 一鍵執行命令

=== ":material-home-city: 中國大陸"

    !!! quote ""

        === ":linuxmirrors: 官網 (推薦)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --zh-hant
            ```

        === ":simple-gitee: Gitee 碼雲 (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant
            ```
            > 即時同步、無延遲，中國大陸網路環境下推薦使用

        === ":simple-gitcode: GitCode (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant
            ```
            > 同步存在1小時延遲

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --zh-hant
            ```

        === ":tencent-cloud: 騰訊雲 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --zh-hant
            ```
            > 不建議在中國大陸網路環境下使用

=== ":material-earth: 國際地區"

    !!! quote ""

        === ":linuxmirrors: 官網 (推薦)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --abroad
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --zh-hant --abroad
            ```

        === ":simple-gitee: Gitee 碼雲 (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant --abroad
            ```
            > 即時同步、無延遲，中國大陸網路環境下推薦使用

        === ":simple-gitcode: GitCode (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant --abroad
            ```
            > 同步存在1小時延遲


        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --zh-hant --abroad
            ```

        === ":tencent-cloud: 騰訊雲 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --zh-hant --abroad
            ```
            > 不建議在中國大陸網路環境下使用

=== ":material-library: 中國大陸教育網"

    !!! quote ""

        === ":linuxmirrors: 官網 (推薦)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --edu
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --zh-hant --edu
            ```

        === ":simple-gitee: Gitee 碼雲 (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant --edu
            ```
            > 即時同步、無延遲，中國大陸網路環境下推薦使用

        === ":simple-gitcode: GitCode (鏡像倉庫)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --zh-hant --edu
            ```
            > 同步存在1小時延遲


        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --zh-hant --edu
            ```

        === ":tencent-cloud: 騰訊雲 EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --zh-hant --edu
            ```
            > 不建議在中國大陸網路環境下使用



!!! tip "使用幫助"

    選項卡分別代表腳本內建軟體源（鏡像站）類型和獲取腳本途徑，請在使用前檢查目標鏡像站是否支援你所使用的作業系統，可以在[軟體源列表](../mirrors/index.md)中查看。  
    預設自動備份原有軟體源內容，如需了解更多請翻閱下方文件。若使用過程中的某些選項令你疑惑不解，那麼在選擇軟體源後一路回車即是最佳實踐。

    _支援在系統原有軟體源損壞、缺失、無效等異常環境下使用，無需額外安裝任何依賴。_

!!! quote "關於軟體源的選擇（新用戶必讀）"

    如果你不了解這些鏡像站，那麼建議使用 `阿里雲 (相容性高、可用性強)` 或 `中國科學技術大學 (速度快)`，請不要陷入測速焦慮，內建的軟體源一般不會有太大的差異。  
    本專案腳本是一個自動化維運工具，不會對鏡像站進行主觀的優劣排序和客製化適配，使用者的選擇應該是自由的，這也是為了開源軟體精神能夠得到更好的延續。

<div class="grid cards" markdown>

-   :material-numeric-1:{style="color: #5b84f5" .lg} __需要 `ROOT` 權限__

    ---

    請使用 `root` 帳戶執行本腳本，切換指令為 `sudo -i` 或 `su root`，不同系統使用的指令不同。另外注意不要透過 `sudo` 直接執行一鍵指令例如 `sudo bash <(xxx)`。

-   :material-numeric-2:{style="color: #5b84f5" .lg} __建議使用現代化的 `SSH` 用戶端應用__

    ---

    如果系統命令列介面的中文顯示亂碼，將導致無法查看互動內容，此外部分系統 GUI 圖形介面的終端應用可能存在一些無法預料的顯示問題。部分系統會自動開啟 SSH 服務，否則請參考[開啟方法](#關於開啟-ssh-遠端登入的方法)。

-   :material-numeric-3:{style="color: #5b84f5" .lg} __如果是在新裝系統上首次執行腳本__

    ---

    目前依賴 `curl` 指令取得腳本內容，但部分作業系統未預先安裝此軟體包，將會報錯 `Command not found`，安裝方法詳見下方 [_關於報錯 Command not found_](#關於報錯-command-not-found)。腳本本身與 `curl` `wget` 指令無關，不會下載任何內容。

-   :material-numeric-4:{style="color: #5b84f5" .lg} __腳本運行期間需要互動選擇配置__

    ---

    請透過方向鍵 ++arrow-up++++arrow-down++++arrow-left++++arrow-right++ 或 ++w++++a++++s++++d++ 控制選項並按 ++enter++ 回車鍵確認。如果發現互動異常請改變終端軟體的視窗大小後重試，避免視窗鋪滿全螢幕。

</div>

### 常見問題

- #### 關於報錯 Command not found

    !!! quote ""

        此報錯是由於系統沒有安裝 `curl` 軟體包導致，安裝命令如下

        === "Debian 系 / openKylin"

            ``` bash
            apt-get install -y curl
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

            新裝系統需要先執行一遍更新 `apt-get update`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            dnf install -y curl || yum install -y curl
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            ``` bash
            zypper install curl
            ```

        === "Arch Linux / Manjaro"

            ``` bash
            pacman -S curl
            ```

        === "Alpine Linux"

            ``` bash
            apk --no-cache add -f curl bash ncurses
            ```

        === "Gentoo"

            ``` bash
            emerge --ask curl
            ```

        === "NixOS"

            ``` bash
            nix-env -iA nixos.curl
            ```

        ??? question "安裝不上？ （點擊展開查看其它解決方法）"

            假如系統原有軟體源是無效的導致安裝不上 `curl` 軟體包，那麼對於 Linux 初學者來說可能會比較麻煩，這裡提供幾個在線獲取腳本的應急方法

            === "使用 Python 下載"

                適用於大部分作業系統（`Alpine Linux` 除外），`python3` 要是不存在那就再試試 `python` 指令
                ``` bash
                python3 -c "import urllib.request; urllib.request.urlretrieve('https://linuxmirrors.cn/main.sh', 'main.sh')"
                ```

            === "使用 wget 指令下載"

                一般沒有預先安裝 `curl` 軟體包的系統也不會預先安裝 `wget` 軟體包，所以大機率這個方法應該是不行的
                ``` bash
                wget https://linuxmirrors.cn/main.sh
                ```

            === "使用瀏覽器下載"

                如果可以訪問系統 ​​GUI 映像介面和桌面的話那可以直接在瀏覽器中開啟連結下載腳本，許多系統都會預先安裝 Firefox 火狐瀏覽器

            之後再執行腳本即可

            === ":material-home-city: 中國大陸"

                ``` bash
                bash main.sh --zh-hant
                ```

            === ":material-earth: 國際地區"

                ``` bash
                bash main.sh --zh-hant --abroad
                ```

            === ":material-library: 中國大陸教育網"

                ``` bash
                bash main.sh --zh-hant --edu
                ```

            如果以上方法試了都不行，那就複製[原始碼](https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)至本地新建任意名稱的 `.sh` 腳本，貼上原始碼內容後透過 `bash` 指令手動執行。

- #### 備份原有軟體源

    !!! quote ""

        腳本會自動備份原有軟體源內容，備份路徑為原始文件或目錄的絕對路徑加上 `.bak` 後綴，例如 `/etc/apt/sources.list => /etc/apt/sources.list.bak`，檢查已存在備份內容時會詢問是否覆蓋備份。

- #### 還原已備份的軟體源

    ??? quote "點擊展開查看"

        === "Debian 系 / openKylin"

            === "傳統格式"

                ``` bash
                cp -rf /etc/apt/sources.list.bak /etc/apt/sources.list
                apt-get update
                ```

            === "DEB822 格式"

                ``` bash
                system_name="$(lsb_release -is | tr '[:upper:]' '[:lower:]')"
                cp -rf "/etc/apt/sources.list.d/${system_name}.sources.bak" "/etc/apt/sources.list.d/${system_name}.sources"
                apt-get update
                ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            cp -rf /etc/yum.repos.d.bak /etc/yum.repos.d
            yum makecache
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            ``` bash
            cp -rf /etc/zypp/repos.d.bak /etc/zypp/repos.d
            zypper ref
            ```

        === "Arch Linux / Manjaro"

            ``` bash
            cp -rf /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist
            pacman -Sy
            ```

        === "Alpine Linux"

            ``` bash
            cp -rf /etc/apk/repositories.bak /etc/apk/repositories
            apk update -f
            ```

        === "Gentoo"

            ``` bash
            cp -rf /etc/portage/make.conf.bak /etc/portage/make.conf
            [ -d /etc/portage/repos.conf ] && cp -rf /etc/portage/repos.conf/gentoo.conf.bak /etc/portage/repos.conf/gentoo.conf
            emerge --sync --quiet
            ```

        === "NixOS"

            ``` bash
            cp -rf /etc/nix/nix.conf.bak /etc/nix/nix.conf
            ```

- #### 關於開啟 SSH 遠端登入的方法

    ??? quote "點擊展開查看"

        指令以及設定步驟僅供參考，注意靈活變通

        - 驗證是否已安裝 `SSH` 服務

            ``` bash
            ls /etc | grep ssh
            ```

            如果沒有這個資料夾說明系統未安裝 `SSH` 服務，你需要透過套件管理工具安裝 `openssh-server` 軟體包，安裝指令如下：

            === "Debian 系 / openKylin"

                ``` bash
                apt-get install -y openssh-server
                ```

                > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

                新裝系統需要先執行一遍更新 `apt-get update`

            === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

                ``` bash
                dnf install -y openssh-server || yum install -y openssh-server
                ```

                > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

            === "openSUSE"

                ``` bash
                zypper install openssh-server
                ```

            === "Arch Linux / Manjaro"

                ``` bash
                pacman -S openssh
                ```

            === "Alpine Linux"

                ``` bash
                apk --no-cache add -f openssh
                ```

            === "Gentoo"

                ``` bash
                emerge --ask --changed-use --oneshot net-misc/openssh
                ```

            > 不同系統上的軟體包名稱有所差異，如果提示找不到該軟體包可嘗試使用通配符 `openssh*` 進行安裝

        - 設定 `SSH` 服務

            ``` { .bash title="允許 root 帳戶登入" }
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PermitRootLogin " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config || echo -e "\nPermitRootLogin yes" >> /etc/ssh/sshd_config
            ```

            ``` { .bash title="啟用密碼認證" }
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PasswordAuthentication " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config || echo -e "\nPasswordAuthentication yes" >> /etc/ssh/sshd_config
            ```

        - 啟動/重啟 `SSH` 服務

            ``` bash
            for ssh_svc in sshd ssh openssh; do systemctl restart "${ssh_svc}" 2>/dev/null && break ; systemctl enable --now "${ssh_svc}" 2>/dev/null && break ; done
            ```

        !!! tip "友情提示：如果你正在使用公網伺服器，建議關閉 SSH 密碼認證方式並設定金鑰登入。"

- #### 關於未顯示方向鍵交互控制介面

    !!! quote ""

        如果發現互動介面是輸入而非新式的方向鍵控制，那麼請自行安裝 `ncurses` 或 `nano` 軟體包，新式的按鍵互動依賴 `tput` 指令實作。

- #### 關於未啟用的軟體源倉庫

    !!! quote ""

        許多系統的軟體源會啟用多個倉庫，腳本遵循系統預設設置，預設不啟用的軟體源（倉庫）不會在運行完本腳本後被啟用，但是它們也隨腳本更換了目標軟體源位址，具體啟用方法如下：

        === "Debian 系 / openKylin"

            預設禁用了`deb-src`原始碼倉庫和`proposed`預發佈軟體源，若需啟用請將 `/etc/apt/sources.list` 文件中相關內容的所在行取消註釋

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            部分倉庫預設沒有啟用，若需啟用請將 `/etc/yum.repos.d` 目錄下相關 repo 文件中的 `enabled` 值修改為 `1`

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            部分倉庫預設沒有啟用，若需啟用請將 `/etc/zypp/repos.d` 目錄下相關 repo 文件中的 `enabled` 值修改為 `1`

- #### 其它

    ??? quote "關於呼叫腳本的互聯網位置"

        專案利用 [GitHub Action](https://github.com/SuperManito/LinuxMirrors/blob/main/.github/workflows/build-docs.yml#L29) 在每次提交後自動拷貝原始碼到文件目錄作為網站資源發佈，網站託管於 [:netlify: Netlify](https://www.netlify.com)，幾乎沒有使用風險。 

        當然你也可以使用程式碼託管倉庫的原始位址來調用，這裡只是想告訴你為什麼會有幾個不同的位址，預設的官網位址更容易記憶和訪問。

    ??? quote "關於軟體源下載速度問題"

        首先，在[軟體源列表](../mirrors/index.md)的使用幫助處有寫使用推薦，這是根據以往經驗總結出來的，但總有用戶在糾結軟體源速度的問題。 

        軟體源（鏡像站）的網路延遲即 `Ping` 與下載速度沒有太大的關聯，雙方地理位置間隔的遠近不代表實際體驗，有些鏡像站下行總頻寬很高但實際測速卻並不理想，因為這與鏡像站的負載策略有關。 

        網路上也有很多基於 C、Python 編寫的鏡像站測速開源腳本，而本專案腳本基於 Bash Shell 編寫且不依賴任何第三方庫，Bash 是 Linux 運維中最常用的腳本語言並且絕大部分發行版都會預裝，這意味著用戶不需要安裝任何環境就能直接運行，這種便利性是其他高級語言無法替代的，不過目前 Bash 腳本可能不太容易實現精準測速的功能，使用其它高級語言編寫測速功能無疑是造輪子的行為。

    ??? quote "關於軟體源選優"

        很多朋友可能都會有一個疑問：“既然腳本已經如此便捷且實現了高度自動化，為什麼不能實現軟體源自動選優呢？”，不是做不到而是不能。

        「軟體源選優」 在這裡指的是腳本根據客戶端的網路環境、地理位置自動選擇一個體驗最佳的軟體源，這個問題要從多個角度來論證：

        - 速度方面

            其實上面已經解釋過了，總結來說就是追求速度不是普遍需求，對大多數人來說是無感的、能用即可，況且現在很多 Linux 發行版不需要換源就有不錯的速度。

        - 對於鏡像站本身

            舉個最簡單的例子，以前阿里雲鏡像站因為速度快、可用性高幾乎被當成首選，但是隨著用戶越來越多導致速度變的原來越慢甚至可能不足 10 Mbps。  
            長此以往，那些用戶多的鏡像站可能無法承受過高的流量而導致體驗下降，用戶少的鏡像站可能會最終走向關閉，這不利於整個生態的發展。

        - 開發者角度

            本專案站在維運工具的角度致力於開發一個通用的換源腳本，而不是一個解決軟體源需求的具體化工具，要使腳本的預設行為適用於大多數使用者群體。作為維運工具要有明確的功能定位，作為腳本要從擴展性、實用性等多個方面去衡量利弊，軟體源的選擇權應該完全交給使用者。

---

## 命令選項（進階用法）

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --help 

命令選項(名稱/含義/值)：

  --abroad                     使用境外以及海外軟體源                                                 無
  --edu                        使用中國大陸教育網軟體源                                               無
  --source                     指定軟體源地址(網域名稱或IP)                                           位址
  --source-epel                指定 EPEL 附加軟體包倉庫的軟體源地址(網域名稱或IP)                       位址
  --source-security            指定 Debian / Ubuntu 系統 security 倉庫的軟體源地址(網域名稱或IP)       位址
  --source-vault               指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源地址(網域名稱或IP)       位址
  --source-portage             指定 Gentoo 系統 portage 倉庫的軟體源地址(網域名稱或IP)                 位址
  --source-base-system         指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源地址(網域名稱或IP)    位址
  --branch                     指定軟體源倉庫(路徑)                                                   倉庫名稱
  --branch-epel                指定 EPEL 附加軟體包倉庫的軟體源倉庫(路徑)                               倉庫名稱
  --branch-security            指定 Debian 系統 security 倉庫的軟體源倉庫(路徑)                        倉庫名稱
  --branch-vault               指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源倉庫(路徑)               倉庫名稱
  --branch-portage             指定 Gentoo 系統 portage 倉庫的軟體源倉庫(路徑)                         倉庫名稱
  --branch-base-system         指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源倉庫(路徑)            倉庫名稱
  --codename                   指定 Debian 系 / openKylin 系統的版本代號                              代號名稱
  --protocol                   指定 Web 協定                                                         http 或 https
  --use-intranet-source        是否優先使用內部網路軟體源位址                                          true 或 false
  --use-official-source        是否使用目標系統的官方軟體源                                            true 或 false
  --use-official-source-epel   是否使用 EPEL 附加軟體包的官方軟體源                                    true 或 false
  --install-epel               是否安裝 EPEL 附加軟體包                                               true 或 false
  --backup                     是否備份原有軟體源                                                     true 或 false
  --upgrade-software           是否更新軟體包                                                         true 或 false
  --clean-cache                是否在更新軟體包後清理下載快取                                           true 或 false
  --clean-screen               是否在運行前清除螢幕上的所有內容                                         true 或 false
  --lang                       指定腳本輸出的語言                                                      语言
  --only-epel                  僅更換 EPEL 軟體源模式                                                  無
  --ignore-backup-tips         忽略覆蓋備份提示                                                        無
  --print-diff                 是否列印原始文件修改前後差異                                             無
  --pure-mode                  純淨模式，精簡列印內容                                                   無
  --help                       查看幫助選單                                                            無
```

| 名稱 | 含義 | 選項值 |
| - | - | :-: |
| `--abroad` | 使用境外以及海外軟體源 | 無 |
| `--edu` | 使用中國大陸教育網軟體源 | 無 |
| `--source` | 指定軟體源位址（網域名稱或IP） | `位址` |
| `--source-epel` | 指定 EPEL 附加軟體包倉庫的軟體源位址（網域名稱或IP） | `位址` |
| `--source-security` | 指定 Debian / Ubuntu 系統 security 倉庫的軟體源位址（網域名稱或IP） | `位址` |
| `--source-vault` | 指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源位址（網域名稱或IP） | `位址` |
| `--source-portage` | 指定 Gentoo 系統 portage 倉庫的軟體源位址（網域名稱或IP） | `位址` |
| `--source-base-system` | 指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源位址（網域名稱或IP） | `位址` |
| `--branch` | 指定軟體源倉庫（路徑） | `倉庫名稱` |
| `--branch-epel` | 指定 EPEL 附加軟體包倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
| `--branch-security` | 指定 Debian 係統 security 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
| `--branch-vault` | 指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
| `--branch-portage` | 指定 Gentoo 系統 portage 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
| `--branch-base-system` | 指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源倉庫（路徑） | `倉庫名稱` |
| `--codename` | 指定 Debian 系 / openKylin 作業系統的版本代號 | `代號名稱` |
| `--protocol` | 指定 Web 協定 | `http` 或 `https` |
| `--use-intranet-source` | 是否優先使用內部網路軟體源位址 | `true` 或 `false` |
| `--use-official-source` | 是否使用目標作業系統的官方軟體源 | `true` 或 `false` |
| `--use-official-source-epel` | 是否使用 EPEL 附加軟體包的官方軟體源 | `true` 或 `false` |
| `--install-epel` | 是否安裝 EPEL 附加軟體包 | `true` 或 `false` |
| `--backup` | 是否備份原有軟體源 | `true` 或 `false` |
| `--upgrade-software` | 是否更新軟體套件 | `true` 或 `false` |
| `--clean-cache` | 是否在更新軟體包後清理下載快取 | `true` 或 `false` |
| `--clean-screen` | 是否在運行前清除螢幕上的所有內容 | `true` 或 `false` |
| `--lang` | 指定腳本輸出的語言 | `語言ID（詳見下方文件）` |
| `--only-epel` | 僅更換 EPEL 軟體源模式 | 無 |
| `--ignore-backup-tips` | 忽略覆蓋備份提示（即不覆蓋備份） | 無 |
| `--print-diff` | 是否列印原始文件修改前後差異 | 無 |
| `--pure-mode` | 純淨模式，精簡列印內容 | 無 |
| `--help` | 查看幫助選單 | 無 |

> 軟體源完整格式 `<WEB協定>://<軟體源位址(網域名稱或IP)>/<軟體源倉庫(路徑)>`

以下是一些進階用法的舉例

- ### 指定軟體源位址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --source mirror.example.com
    ```

- ### 指定軟體源倉庫目錄

    這裡描述的軟體源倉庫與系統軟體倉庫不同，指的是軟體源（鏡像站）位址後面的路徑即鏡像站的倉庫目錄，雖然名義上都是倉庫但是非常容易混淆

    主要使用情境：目標鏡像站有對應的系統鏡像倉庫但是不符合本專案腳本關於軟體源倉庫設定的預設規則

    ??? note "專案對於各作業系統所使用的預設倉庫名稱（點選展開檢視）"

        專案腳本為了適配大的環境不會針對某一鏡像站獨特的倉庫名稱而單獨適配

        | 系統名稱 | 涉及的名稱 |
        | --- | :---: |
        | <a href="https://www.debian.org" title="https://www.debian.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/debian.svg" alt="Debian" width="16" height="16" style="vertical-align: -0.35em"></a> **Debian** | `debian` `debian-archive` |
        | <a href="https://ubuntu.com" title="https://ubuntu.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/ubuntu.svg" alt="Ubuntu" width="16" height="16" style="vertical-align: -0.15em"></a> **Ubuntu** | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.kali.org" title="https://www.kali.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/kali-linux.png" alt="Kali Linux" width="16" height="16"></a> **Kali Linux** | `kali` |
        | <a href="https://linuxmint.com" title="https://linuxmint.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/linux-mint.svg" alt="Linux Mint" width="16" height="16" style="vertical-align: -0.2em"></a> **Linux Mint** | `linuxmint` `ubuntu` `ubuntu-ports` `debian` |
        | <a href="https://www.deepin.org" title="https://www.deepin.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/deepin.png" alt="Deepin" width="16" height="16" style="vertical-align: -0.2em"></a> **Deepin** | `deepin` |
        | <a href="https://zorin.com/os" title="https://zorin.com/os" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/zorin-os.png" alt="Zorin OS" width="16" height="16" style="vertical-align: -0.15em"></a> **Zorin OS** | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.armbian.com" title="https://www.armbian.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/armbian.png" alt="Armbian" width="16" height="16" style="vertical-align: -0.2em"></a> **Armbian** | `armbian` |
        | <a href="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" title="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/proxmox.svg" alt="Proxmox VE" width="16" height="16" style="vertical-align: -0.2em"></a> **Proxmox VE** | `proxmox` |
        | <a href="https://www.raspberrypi.com/software" title="https://www.raspberrypi.com/software" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/raspberry-pi.png" alt="Raspberry Pi OS" width="16" height="16" style="vertical-align: -0.2em"></a> **Raspberry Pi OS** | `raspberrypi` `raspbian` `debian` `debian-archive` |
        | <a href="https://access.redhat.com/products/red-hat-enterprise-linux" title="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/redhat.svg" alt="Red Hat Enterprise Linux" width="16" height="16" style="vertical-align: -0.1em"></a> **Red Hat Enterprise Linux** :material-information-outline:{ title="9版本使用 <code>CentOS Stream</code>， 7、8版本使用<code>CentOS</code>" } | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://fedoraproject.org" title="https://fedoraproject.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/fedora.ico" alt="Fedora" width="16" height="16" style="vertical-align: -0.15em"></a> **Fedora** | `fedora` `fedora-archive` |
        | <a href="https://www.centos.org" title="https://www.centos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/centos.svg" alt="CentOS" width="16" height="16" style="vertical-align: -0.135em"></a> **CentOS** | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://rockylinux.org" title="https://rockylinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/rocky-linux.svg" alt="Rocky Linux" width="16" height="16" style="vertical-align: -0.2em"></a> **Rocky Linux** | `rocky` |
        | <a href="https://almalinux.org" title="https://almalinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/almalinux.svg" alt="AlmaLinux" width="16" height="16" style="vertical-align: -0.15em"></a> **AlmaLinux** | `almalinux` `almalinux-vault` |
        | <a href="https://www.oracle.com/linux" title="https://www.oracle.com/linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/oracle-linux.png" alt="Oracle Linux" width="16" height="16" style="vertical-align: -0.25em"></a> **Oracle Linux** | `centos-stream` |
        | <a href="https://www.openeuler.org" title="https://www.openeuler.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openeuler.ico" alt="openEuler" width="16" height="16" style="vertical-align: -0.2em"></a> **openEuler** | `openeuler` |
        | <a href="https://www.opencloudos.org" title="https://www.opencloudos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opencloudos.png" alt="OpenCloudOS" width="16" height="16" style="vertical-align: -0.25em"></a> **OpenCloudOS** | `opencloudos` |
        | <a href="https://www.openkylin.top" title="https://www.openkylin.top" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openkylin.ico" alt="openKylin" width="16" height="16" style="vertical-align: -0.25em"></a> **openKylin** | `openkylin` |
        | <a href="https://openanolis.cn" title="https://openanolis.cn" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/anolis.png" alt="Anolis OS" width="16" height="16" style="vertical-align: -0.1em"></a> **Anolis OS** | `anolis` |
        | <a href="https://www.opensuse.org" title="https://www.opensuse.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opensuse.svg" alt="openSUSE" width="16" height="16" style="vertical-align: -0.15em"></a> **openSUSE** | `opensuse` |
        | <a href="https://archlinux.org" title="https://archlinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/arch-linux.ico" alt="Arch Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Arch Linux** | `archlinux` `archlinuxarm` |
        | <a href="https://manjaro.org" title="https://manjaro.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/manjaro.svg" alt="Manjaro" width="16" height="16" style="vertical-align: -0.2em"></a> **Manjaro** | `manjaro` |
        | <a href="https://www.alpinelinux.org" title="https://www.alpinelinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/alpine.png" alt="Alpine Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Alpine Linux** | `alpine` |
        | <a href="https://www.gentoo.org" title="https://www.gentoo.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/gentoo.svg" alt="Gentoo" width="16" height="16" style="vertical-align: -0.2em"></a> **Gentoo** | `gentoo` `gentoo-portage` |
        | <a href="https://nixos.org" title="https://nixos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/nixos.svg" alt="NixOS" width="16" height="16" style="vertical-align: -0.15em"></a> **NixOS** | `nix-channels` |

    請看下面的例子

    ``` { .bash title="使用阿里雲鏡像站的 Rocky Linux 軟體源" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
      --source mirrors.aliyun.com \
      --branch rockylinux
    ```

    阿里雲鏡像站的 Rocky Linux 倉庫目錄名稱為 [`rockylinux`](https://mirrors.aliyun.com/rockylinux)，不符合預設規則 `rocky`，但是可以透過命令選項繞過腳本預設規則來實現。

    > 部分系統會同時配置多個倉庫的軟體源，具體詳見命令選項

    > 由於軟體源倉庫作用在軟體源位址上因此也可以使用多層路徑，例如 `--branch "linux/debian"` -> `https://mirrors.example.com/linux/debian`

- ### 單獨更換 EPEL 源

    !!! info "EPEL (Extra Packages for Enterprise Linux) 是由 Fedora 組織維護的一個附加軟體包倉庫，它主要適用於除 Fedora 作業系統以外的紅帽系 Linux 發行版，配置 EPEL 倉庫已成為廣大用戶的普遍需求，建議預設安裝它"

    有些時候你會發現想使用的鏡像站沒有 EPEL 倉庫，那麼你可以在第一次運行腳本時不安裝或更換 EPEL 軟體源，然後再單獨執行下面的命令

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --only-epel
    ```

    對於已經 EOL 的 EPEL 7，注意需要使用 [`archive`](https://dl.fedoraproject.org/pub/archive/epel) 倉庫，境外以及海外網絡環境建議通過命令選項 `--use-official-source-epel true` 使用官方源

- ### 恢復使用官方源

    當你不小心刪除了官方軟體源的備份時可以使用此命令來恢復，使用此命令選項後將跳過選擇軟體源步驟

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --use-official-source true
    ```
    > 部分系統不存在官方軟體源例如 `Arch Linux`，屆時會自動更換成相容性較高的阿里雲鏡像站

- ### 特定係統的使用範例

    - #### 關於 CentOS 停服問題

        腳本對於已經 EOL 的 CentOS 7/8、CentOS Stream 8 進行了適配

        <div class="grid cards" markdown>

        -   __中國大陸__

            ---

            正常使用腳本，沒有額外操作，因為大部分中國大陸鏡像站都已同步 [`CentOS Vault`](https://vault.centos.org) 倉庫

        -   __國際地區__

            ---

            建議使用 `騰訊雲` 或 `阿里雲` 鏡像站，或透過 `--use-official-source true` 命令選項使用官方軟體源

        </div>

        另外 EPEL 7 也進入了 EOL，腳本同樣對其進行了適配

    - #### 指定 GNU/Linux Debian 作業系統的 Security 軟體源

        如果你想盡可能提高伺服器的安全性建議使用官方軟體源，因為鏡像同步存在延遲

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
          --source-security security.debian.org \
          --branch-security debian-security
        ```

    - #### 指定 Debian 系 Linux 作業系統的版本代號

        大多數情況下自訂版本代號用於更換系統版本，請看下面的例子

        === "升級 GNU/Linux Debian 至 13 "trixie""

            - 更換版本代號

                ``` bash
                bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
                  --codename trixie \
                  --upgrade-software false
                ```

            - 停用 backports 倉庫

                ``` bash
                sed -i '/backports/s/^/# /' /etc/apt/sources.list
                ```

            - 升級系統

                ``` bash
                apt-get update
                apt-get dist-upgrade
                ```

            - 升級完成並重新引導系統後執行下列步驟

                ``` bash
                # 清空原有軟體源（如有非系統軟體源內容請先自行手動備份）
                sed -i '1,$d' /etc/apt/sources.list
                # 重新執行換源腳本
                bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant
                ```

        === "將 GNU/Linux Debian 的版本切換到測試分支"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
              --codename testing \
              --upgrade-software false
            ```

        ``` { .bash .no-copy title="如果腳本無法實現指定版本代號，你也可以在執行腳本後手動替換" }
        sed -i "s/$(lsb_release -cs)/指定版本代號/g" /etc/apt/sources.list
        ```

    - #### 更換 Ubuntu EOL版本軟體源

        !!! info "EOL 為生命週期結束的縮寫（End Of Life），Ubuntu 迭代速度較快一般非LTS(長期支持)版本的生命週期只有9個月。官方會定期從主倉庫移除不在生命週期內的版本倉庫目錄，屆時可能就需要使用鏡像站的 `Ubuntu Old Releases` 倉庫"

        具體版本支援情況詳見官方 [Wiki](https://documentation.ubuntu.com/project/release-team/list-of-releases/)，關於 `Ubuntu Old Releases` 倉庫的支援情況詳見各鏡像站

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
          --source mirrors.ustc.edu.cn \
          --branch ubuntu-old-releases
        ```

    - #### Arch Linux 使用中文社群倉庫

        本專案腳本目前不支援此額外倉庫，因使用人數較少等原因暫不考慮適配，若想使用請參考下方的一鍵設定命令

        ``` bash
        SOURCE="https://mirrors.aliyun.com/archlinuxcn" # 指定軟體源位址
        grep -q "\[archlinuxcn\]" /etc/pacman.conf || echo -e "[archlinuxcn]\nServer = ${SOURCE}/\$arch" >>/etc/pacman.conf # 一鍵配置命令
        ```

- ### 國際化（I18n）

    腳本提供多語言支持，目前內建 `简体中文`、`繁體中文`、`English` 共三種顯示語言，預設為 `简体中文`

    - #### 指定語言

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --lang xxx
        ```

        | 類型 | 值 |
        | :-: | :-: |
        | 简体中文 | `zh-hans` `zh-cn` `zh` |
        | 繁體中文 | `zh-hant` `zh-tw` `zh-hk` |
        | English | `en` `en-us` |

        也可以直接作為指令選項使用

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en
        ```
        > `--en` `--en-us` `--zh` `--zh-cn` `--zh-hans` `--zh-hant`

    - #### 透過互動進行選擇

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --lang auto
        ```

- ### 無人值守（自動化）

    不透過交互完成換源操作，至少需要使用以下命令選項來實現，建議熟悉後再使用

    ``` { .bash .no-copy title="参考命令" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant \
      --source mirror.example.com \
      --protocol http \
      --use-intranet-source false \
      --install-epel true \
      --backup true \
      --upgrade-software false \
      --clean-cache false \
      --ignore-backup-tips
    ```
    > 如果報錯 `命令選項無效` 那麼請檢查選項合法性以及空格字元編碼，在範例中一行寫一個選項是為了提高命令的可讀性

- ### 純淨模式

    推出此功能是為了方便開發以及运維人員使用，啟用後會精簡腳本內容輸出，建議搭配其它指令選項無互動使用

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant --pure-mode
    ```

    !!! tip "滾動輸出的命令日誌可能有無法預料的顯示問題，不過目前暫未發現異常"

---

## 客製化腳本

如果你是其它專案的開發者希望透過本專案來製作專屬腳本，那麼請參考下面提到的內容，目前已經有中國大陸教育單位鏡像站的維護者這樣做了。

1.  首先不建議修改程式碼的底層邏輯，應盡量與本專案原始碼保持同步，腳本內容執行順序由 `main` 函數控制，程式碼邏輯清晰
2.  你可以簡單去除一些無關內容，例如將軟體源列表（陣列）`mirror_list_(default|edu|abroad|extranet|intranet)` 中的內容刪除，例如：`mirror_list_default=()`
3.  如果你想要自定義腳本列印內容可直接修改 `run_start` `run_end` `print_title` 這三個函數中的內容
4.  如果你想加入自定義 Shell 內容請參見 `main` 函數中腳本執行順序，可以在對應位置直接插入內容也可以封裝函數後調用
5.  如果你想要縮減腳本體積那麼可以刪除一些不必要的內容，除了上面提到的軟體源列表還有一些涉及腳本工作的部分模組內容，具體如下：
    1. 首先在刪除內容時應盡可能保留腳本原始結構，直接把涉及函數中的內容刪除即可，使其保留為空函數
    2. 可以刪除一些不使用（作業系統）的軟體源原始內容 `gen_repo_files_xxx`，這些內容佔據了腳本 `60%` 以上的體積
    3. 如果你不使用某些功能，那麼可以刪除對應功能模組函數中的內容，`命令選項 handle_command_options`、`備份原有軟體源 backup_original_mirrors`、`更新軟體包 upgrade_software`
    4. 移除不需要的語言包，例：`function msg_pack_en() {}`
6. 腳本主要功能配置是由統一的變量控制的，命令選項亦是如此，這些全局變量由全大寫字母構成並遵循下劃線命名法，具體變量詳見如下表格，你只需要將這些變量聲明在腳本頭部（預留註釋區域）即可快速完成定制

??? note "變數列表（點擊展開查看）"

    | 名稱 | 含義 | 值型別 |
    | :-: | :-: | :-: |
    | `SOURCE` | 指定軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_EPEL` | 指定 EPEL 附加軟體包倉庫的軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_SECURITY` | 指定 Debian / Ubuntu 系統 security 倉庫的軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_VAULT` | 指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_PORTAGE` | 指定 Gentoo 系統 portage 倉庫的軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_BASE_SYSTEM` | 指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源位址（網域名稱或IP） | `位址` |
    | `SOURCE_BRANCH` | 指定軟體源倉庫（路徑） | `倉庫名稱` |
    | `SOURCE_EPEL_BRANCH` | 指定 EPEL 附加軟體套件倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
    | `SOURCE_SECURITY_BRANCH` | 指定 Debian 系統 security 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
    | `SOURCE_VAULT_BRANCH` | 指定 CentOS / AlmaLinux 系統 vault 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
    | `SOURCE_PORTAGE_BRANCH` | 指定 Gentoo 系統 portage 倉庫的軟體源倉庫（路徑） | `倉庫名稱` |
    | `SOURCE_BASE_SYSTEM_BRANCH` | 指定 Linux Mint / Raspberry Pi OS 底層系統的軟體源倉庫（路徑） | `倉庫名稱` |
    | `DEBIAN_CODENAME` | 指定 Debian 系 / openKylin 作業系統的版本代號 | `代號名稱` |
    | `USE_INTRANET_SOURCE` | 是否優先使用內網軟體源位址 | `true` 或 `false` |
    | `USE_OFFICIAL_SOURCE` | 是否使用目標作業系統的官方軟體源 | `true` 或 `false` |
    | `USE_OFFICIAL_SOURCE_EPEL` | 是否使用 EPEL 附加軟體包的官方軟體源 | `true` 或 `false` |
    | `WEB_PROTOCOL` | 指定 Web 協定 | `http` 或 `https` |
    | `INSTALL_EPEL` | 是否安裝 EPEL 附加軟體包 | `true` 或 `false` |
    | `ONLY_EPEL` | 僅更換 EPEL 軟體源模式 | `true` 或 `false` |
    | `BACKUP` | 是否備份原有軟體源 | `true` 或 `false` |
    | `IGNORE_BACKUP_TIPS` | 忽略覆蓋備份提示（即不覆蓋備份） | `true` 或 `false` |
    | `UPGRADE_SOFTWARE` | 是否更新軟體包 | `true` 或 `false` |
    | `CLEAN_CACHE` | 是否在更新軟體包後清理下載快取 | `true` 或 `false` |
    | `CLEAN_SCREEN` | 是否在運行前清除螢幕上的所有內容 | `true` 或 `false` |
    | `PRINT_DIFF` | 是否列印原始檔案修改前後差異 | `true` 或 `false` |
    | `PURE_MODE` | 純淨模式，精簡列印內容 | `true` 或 `false` |

    > 部分變數存在預設值，未涉及的變數無需宣告為空值（空字串），另外如果對應功能配置不存在那麼就可能會出現交互
