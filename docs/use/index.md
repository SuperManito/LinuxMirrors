---
hide:
  - navigation
  - footer
---

> 如果觉得这个项目不错对您有所帮助的话，请点击仓库右上角的 Star 并分享给更多的朋友 :octicons-heart-fill-24:{ .heart style="color: red" }

## 一键执行命令

=== ":material-home-city: 中国大陆"

    !!! quote ""

        === ":linuxmirrors: 官网（推荐）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh)
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh)
            ```

        === ":simple-gitee: Gitee 码云 (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
            ```
            > 实时同步、无延迟，国内网络环境下推荐使用

        === ":gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/gh_mirrors/li/LinuxMirrors/raw/main/ChangeMirrors.sh)
            ```
            > 本项目已加入 GitHub 加速计划，同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh)
            ```

=== ":material-earth: 境外以及海外地区"

    !!! quote ""

        === ":linuxmirrors: 官网（推荐）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --abroad # (1)!
            ```

            1.  通过 `--abroad` 命令选项来使用海外软件源

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --abroad # (1)!
            ```

            1.  通过 `--abroad` 命令选项来使用海外软件源

        === ":simple-gitee: Gitee 码云 (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --abroad # (1)!
            ```

            1.  通过 `--abroad` 命令选项来使用海外软件源

            > 实时同步、无延迟，国内网络环境下推荐使用

        === ":gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/gh_mirrors/li/LinuxMirrors/raw/main/ChangeMirrors.sh) --abroad # (1)!
            ```

            1.  通过 `--abroad` 命令选项来使用海外软件源

            > 本项目已加入 GitHub 加速计划，同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --abroad # (1)!
            ```

            1.  通过 `--abroad` 命令选项来使用海外软件源

=== ":material-library: 中国大陆教育网"

    !!! quote ""

        === ":linuxmirrors: 官网（推荐）"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --edu # (1)!
            ```

            1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --edu # (1)!
            ```

            1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源

        === ":simple-gitee: Gitee 码云 (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --edu # (1)!
            ```

            1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源

            > 实时同步、无延迟，国内网络环境下推荐使用

        === ":gitcode: GitCode (镜像仓库)"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/gh_mirrors/li/LinuxMirrors/raw/main/ChangeMirrors.sh) --edu # (1)!
            ```

            1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源

            > 本项目已加入 GitHub 加速计划，同步存在1小时延迟

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --edu # (1)!
            ```

            1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源



!!! tip "使用帮助"

    选项卡分别代表脚本内置软件源类型和获取脚本途径，请在使用前检查目标镜像站是否支持您所使用的操作系统，可以在[软件源列表](../mirrors/index.md)中查看。  
    默认自动备份原有软件源内容，如需了解更多请翻阅下方文档。若使用过程中的某些选项令你疑惑不解，那么在选择软件源后一路回车即是最佳实践。

!!! quote "关于软件源的选择（新用户必读）"

    如果你不了解这些镜像站那么建议使用 `阿里云 (兼容性高)` 或 `中国科学技术大学 (速度快)`，请不要陷入测速焦虑，内置的默认软件源一般不会有太大的差异。  
    本项目脚本只是一个自动化运维工具，不会对镜像站进行主观的优劣排序，用户的选择应该是自由的，这也是为了开源软件精神能够得到更好的延续。

<div class="grid cards" markdown>

-   :material-numeric-1:{style="color: #3CA7E5" .lg} __需使用 `ROOT` 用户执行脚本__

    ---

    切换命令为 `sudo -i` 或 `su root`。不同系统使用的命令不同，因为部分系统没有在初始安装时为 ROOT 账户设置密码（例如 Ubuntu）或系统默认禁止 ROOT 用户登录。

-   :material-numeric-2:{style="color: #3CA7E5" .lg} __建议使用现代化的 `SSH` 客户端应用__

    ---

    如果你系统命令行界面的中文显示乱码那么将导致无法查看交互内容，此外部分系统 GUI 图形界面的终端应用可能存在一些无法预料的显示问题。部分系统会自动开启 SSH 服务，否则请参考[开启方法](#关于开启-ssh-远程登录的方法)。

-   :material-numeric-3:{style="color: #3CA7E5" .lg} __如果是在新装系统上首次执行脚本__

    ---

    当前依赖 `curl` 指令获取脚本内容，但部分操作系统没有预装此软件包，届时则会报错 `Command not found`，安装方法详见下方 [_关于报错 Command not found_](#关于报错-command-not-found)。脚本本身与 `curl` `wget` 指令无关，更不会下载任何内容。

-   :material-numeric-4:{style="color: #3CA7E5" .lg} __脚本运行期间需要交互选择配置__

    ---

    请通过方向键 ++arrow-up++++arrow-down++++arrow-left++++arrow-right++ 或 ++w++++a++++s++++d++ 控制选项并按 ++enter++ 回车键确认。如果发现交互异常那么请改变终端软件的窗口大小后重试，另外窗口不要铺满全屏。

</div>

### 常见问题

- #### 关于报错 Command not found

    !!! quote ""

        此报错是由于系统没有安装 `curl` 软件包导致，安装命令如下

        === "Debian 系 / openKylin"

            ``` bash
            apt-get install -y curl
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

            新装系统需要先执行一遍更新 `apt-get update`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            dnf install -y curl || yum install -y curl
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            ``` bash
            zypper install curl
            ```

        === "Arch Linux"

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

        ??? question "安装不上？（点击展开查看其它解决方法）"

            假如系统原有软件源是无效的导致安装不上 `curl` 软件包，那么对于 Linux 初学者来说可能会比较麻烦，这里提供几个在线获取脚本的应急方法

            === "使用 Python 下载脚本"

                适用于大部分操作系统（`Alpine Linux` 除外），`python3` 要是不存在那就再试试 `python` 指令
                ``` bash
                python3 -c "import urllib.request; urllib.request.urlretrieve('https://linuxmirrors.cn/main.sh', 'main.sh')"
                ```

            === "使用 wget 下载脚本"

                一般没有预装 `curl` 软件包的系统也不会预装 `wget` 软件包，所以大概率这个方法应该是不行的
                ``` bash
                wget https://linuxmirrors.cn/main.sh
                ```

            === "使用浏览器下载"

                如果可以访问系统 GUI 图像界面和桌面的话那可以直接在浏览器中打开链接下载脚本，很多系统都会预装 Firefox 火狐浏览器

            之后再执行脚本即可

            === ":material-home-city: 中国大陆"

                ``` bash
                bash main.sh
                ```

            === ":material-earth: 境外以及海外地区"

                ``` bash
                bash main.sh --abroad
                ```

            === ":material-library: 中国大陆教育网"

                ``` bash
                bash main.sh --edu
                ```

            如果以上方法试了都不行，那就复制[源码](https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)至本地新建任意名称的 `.sh` 脚本，粘贴源码内容后通过 `bash` 指令手动执行。

- #### 备份原有软件源

    !!! quote ""

        脚本会自动备份原有软件源内容，备份路径为原有文件或目录的绝对路径加上 `.bak` 后缀，例如 `/etc/apt/sources.list => /etc/apt/sources.list.bak`，当检查到已存在备份内容时会询问是否覆盖备份。

- #### 还原已备份的软件源

    !!! quote ""

        === "Debian 系 / openKylin"

            === "传统格式"

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

        === "Arch Linux"

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

- #### 关于开启 SSH 远程登录的方法

    !!! quote ""

        - 验证是否已安装 `SSH` 服务

            ``` bash
            ls /etc | grep ssh
            ```
            > 如果没有这个文件夹说明系统未安装 `SSH` 服务，你需要通过包管理工具安装 `openssh` 软件包  
            > 需要注意的是不同系统上的软件包名称有所差异，可直接使用 `openssh*` 通配符进行安装

        - 设置允许 Root 用户登录

            ``` bash
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PermitRootLogin " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config || echo -e "\nPermitRootLogin yes" >> /etc/ssh/sshd_config
            ```

        - 设置密码认证

            ``` bash
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PasswordAuthentication " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config || echo -e "\nPasswordAuthentication yes" >> /etc/ssh/sshd_config
            ```

        - 启动/重启 `SSH` 服务

            ``` bash
            ps -ef | grep -q ssh ; [ $? -eq 0 ] && systemctl restart sshd || systemctl enable --now sshd
            ```
            > 不同系统上的服务名称有所差异，如果不是 `sshd` 那就试试 `ssh`

        > 命令以及配置步骤仅供参考，只适配了部分常见发行版。

- #### 关于未显示方向键交互控制界面

    !!! quote ""

        如果发现交互界面是输入而不是新式的方向键控制，那么请自行安装 `ncurses` 或 `nano` 软件包，新式的按键交互依赖 `tput` 指令实现。

- #### 关于调用脚本的互联网位置

    !!! quote ""

        项目利用 [GitHub Action](https://github.com/SuperManito/LinuxMirrors/blob/main/.github/workflows/build-docs.yml#L29) 在每次提交后自动拷贝源码到文档目录作为网站资源发布，网站托管于 :netlify: [Netlify](https://www.netlify.com)，几乎没有被劫持的风险请放心使用。

        当然你也可以使用代码托管仓库的原始地址来调用，这里只是想告诉你为什么会有几个不同的地址，默认的官网地址更易于记忆和访问。

- #### 关于软件源下载速度相关问题

    !!! quote ""

        首先，在[软件源列表](../mirrors/index.md)的使用帮助处有写使用推荐，这是根据以往经验总结出来的，但总有用户在纠结软件源速度的问题。

        软件源（镜像站）的网络延迟即 `Ping` 与下载速度没有太大的关联，双方地理位置间隔的远近不代表实际体验，有些镜像站下行总带宽很高但实际测速却并不理想，因为这与镜像站的负载策略有关。

        网上也有很多基于 C、Python 编写的镜像站测速开源脚本，而本项目脚本基于 Bash Shell 编写且不依赖任何第三方库，Bash 是 Linux 运维中最常用的脚本语言并且绝大部分发行版都会预装，这意味着用户不需要安装任何环境就能直接运行，这种便利性是其它高级语言无法替代的，不过目前来看 Bash 脚本可能不太容易实现精准测速的功能，使用其它高级语言编写测速功能无疑是造轮子的行为。

- #### 关于未启用的软件源仓库

    !!! quote ""

        很多系统的软件源会启用多个仓库，脚本遵循系统默认设置，默认不启用的软件源（仓库）不会在运行完本脚本后被启用，但是它们也随脚本更换了目标软件源地址，具体启用方法如下：

        === "Debian 系 / openKylin"

            默认禁用了`deb-src`源码仓库和`proposed`预发布软件源，若需启用请将 `/etc/apt/sources.list` 文件中相关内容的所在行取消注释

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

        === "RedHat 系 / openEuler / OpenCloudOS / Anolis OS"

            部分仓库默认没有启用，若需启用请将 `/etc/yum.repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            部分仓库默认没有启用，若需启用请将 `/etc/zypp/repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`


---

## 命令选项（高级用法）

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/main.sh) --help 

命令选项(名称/含义/值)：

  --abroad                      使用境外以及海外软件源                                              无
  --edu                         使用中国大陆教育网软件源                                            无
  --source                      指定软件源地址(域名或IP)                                           地址
  --source-epel                 指定 EPEL 附加软件包仓库的软件源地址(域名或IP)                       地址
  --source-security             指定 Debian / Ubuntu 系统 security 仓库的软件源地址(域名或IP)       地址
  --source-vault                指定 CentOS / AlmaLinux 系统 vault 仓库的软件源地址(域名或IP)       地址
  --source-portage              指定 Gentoo 系统 portage 仓库的软件源地址(域名或IP)                 地址
  --source-base-system          指定 Linux Mint / Raspberry Pi OS 底层系统的软件源地址(域名或IP)    地址
  --branch                      指定软件源仓库(路径)                                               仓库名
  --branch-epel                 指定 EPEL 附加软件包仓库的软件源仓库(路径)                           仓库名
  --branch-security             指定 Debian 系统 security 仓库的软件源仓库(路径)                    仓库名
  --branch-vault                指定 CentOS / AlmaLinux 系统 vault 仓库的软件源仓库(路径)           仓库名
  --branch-portage              指定 Gentoo 系统 portage 仓库的软件源仓库(路径)                     仓库名
  --branch-base-system          指定 Linux Mint / Raspberry Pi OS 底层系统的软件源仓库(路径)        仓库名
  --codename                    指定 Debian 系 / openKylin 操作系统的版本代号                       代号名称
  --protocol                    指定 WEB 协议                                                      http 或 https
  --use-intranet-source         是否优先使用内网软件源地址                                          true 或 false
  --use-official-source         是否使用目标操作系统的官方软件源                                     true 或 false
  --use-official-source-epel    是否使用 EPEL 附加软件包的官方软件源                                 true 或 false
  --install-epel                是否安装 EPEL 附加软件包                                            true 或 false
  --backup                      是否备份原有软件源                                                  true 或 false
  --upgrade-software            是否更新软件包                                                      true 或 false
  --clean-cache                 是否在更新软件包后清理下载缓存                                       true 或 false
  --clean-screen                是否在运行前清除屏幕上的所有内容                                     true 或 false
  --only-epel                   仅更换 EPEL 软件源模式                                              无
  --ignore-backup-tips          忽略覆盖备份提示                                                    无
  --print-diff                  打印源文件修改前后差异                                              无
  --pure-mode                   纯净模式，精简打印内容                                              无
```

| 名称 | 含义 | 选项值 |
| - | - | :-: |
| `--abroad` | 使用境外以及海外软件源 | 无 |
| `--edu` | 使用中国大陆教育网软件源 | 无 |
| `--source` | 指定软件源地址（域名或IP） | `地址` |
| `--source-epel` | 指定 EPEL 附加软件包仓库的软件源地址（域名或IP） | `地址` |
| `--source-security` | 指定 Debian / Ubuntu 系统 security 仓库的软件源地址（域名或IP） | `地址` |
| `--source-vault` | 指定 CentOS / AlmaLinux 系统 vault 仓库的软件源地址（域名或IP） | `地址` |
| `--source-portage` | 指定 Gentoo 系统 portage 仓库的软件源地址（域名或IP） | `地址` |
| `--source-base-system` | 指定 Linux Mint / Raspberry Pi OS 底层系统的软件源地址（域名或IP） | `地址` |
| `--branch` | 指定软件源仓库（路径） | `仓库名` |
| `--branch-epel` | 指定 EPEL 附加软件包仓库的软件源仓库（路径） | `仓库名` |
| `--branch-security` | 指定 Debian 系统 security 仓库的软件源仓库（路径） | `仓库名` |
| `--branch-vault` | 指定 CentOS / AlmaLinux 系统 vault 仓库的软件源仓库（路径） | `仓库名` |
| `--branch-portage` | 指定 Gentoo 系统 portage 仓库的软件源仓库（路径） | `仓库名` |
| `--branch-base-system` | 指定 Linux Mint / Raspberry Pi OS 底层系统的软件源仓库（路径） | `仓库名` |
| `--codename` | 指定 Debian 系 / openKylin 操作系统的版本代号 | `代号名称` |
| `--protocol` | 指定 WEB 协议 | `http` 或 `https` |
| `--use-intranet-source` | 是否优先使用内网软件源地址 | `true` 或 `false` |
| `--use-official-source` | 是否使用目标操作系统的官方软件源 | `true` 或 `false` |
| `--use-official-source-epel` | 是否使用 EPEL 附加软件包的官方软件源 | `true` 或 `false` |
| `--install-epel` | 是否安装 EPEL 附加软件包 | `true` 或 `false` |
| `--backup` | 是否备份原有软件源 | `true` 或 `false` |
| `--upgrade-software` | 是否更新软件包 | `true` 或 `false` |
| `--clean-cache` | 是否在更新软件包后清理下载缓存 | `true` 或 `false` |
| `--clean-screen` | 是否在运行前清除屏幕上的所有内容 | `true` 或 `false` |
| `--print-diff` | 是否打印源文件修改前后差异 | `true` 或 `false` |
| `--only-epel` | 仅更换 EPEL 软件源模式 | 无 |
| `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |
| `--pure-mode` | 纯净模式，精简打印内容 | 无 |
| `--help` | 查看帮助菜单 | 无 |

> 软件源完整格式 `<WEB协议>://<软件源地址(域名或IP)>/<软件源仓库(路径)>`

下面是一些高级用法的举例

- ### 指定软件源地址

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --source mirror.example.com
    ```

- ### 指定软件源仓库

    这里的软件源仓库与系统内容软件源仓库不同，指的是软件源地址后面的路径即镜像站分支仓库，虽然名义上都是仓库但是非常容易混淆

    主要使用场景：目标镜像站有对应的系统镜像仓库但是不符合本项目脚本关于软件源仓库设置的默认规则

    ??? note "项目对于各操作系统所使用的默认仓库名称（点击展开查看）"

        项目脚本为了适配大的环境不会针对某一镜像站独特的仓库名称而单独适配

        | 系统名称 | 涉及的名称 |
        | --- | :---: |
        | <a href="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.35em"></a> Debian | `debian` `debian-archive` |
        | <a href="https://cn.ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Ubuntu | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> Kali Linux | `kali` |
        | <a href="https://linuxmint.com" target="_blank"><img src="/assets/images/icon/linux-mint.ico" width="16" height="16" style="vertical-align: -0.2em"></a> Linux Mint | `linuxmint` `ubuntu` `ubuntu-ports` `debian` |
        | <a href="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.png" width="16" height="16" style="vertical-align: -0.2em"></a> Deepin（深度） | `deepin` |
        | <a href="https://zorin.com/os" target="_blank"><img src="/assets/images/icon/zorin-os.png" width="16" height="16" style="vertical-align: -0.15em"></a> Zorin OS | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.armbian.com" target="_blank"><img src="/assets/images/icon/armbian.png" width="16" height="16" style="vertical-align: -0.2em"></a> Armbian | `armbian` |
        | <a href="https://www.proxmox.com" target="_blank"><img src="/assets/images/icon/proxmox.svg" width="16" height="16" style="vertical-align: -0.2em"></a> Proxmox VE | `proxmox` |
        | <a href="https://www.raspberrypi.com" target="_blank"><img src="/assets/images/icon/raspberry-pi.png" width="16" height="16" style="vertical-align: -0.2em"></a> Raspberry Pi OS | `raspberrypi` `raspbian` `debian` `debian-archive` |
        | <a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Red Hat Enterprise Linux :material-information-outline:{ title="9版本使用 <code>CentOS Stream</code>， 7、8版本使用<code>CentOS</code>" } | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Fedora | `fedora` `fedora-archive` |
        | <a href="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.1em"></a> CentOS | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://rockylinux.org" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Rocky Linux | `rocky` |
        | <a href="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.15em"></a> AlmaLinux | `almalinux` `almalinux-vault` |
        | <a href="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.2em"></a> openEuler（开源欧拉） | `openeuler` |
        | <a href="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> OpenCloudOS（鸥栖） | `opencloudos` |
        | <a href="https://www.openkylin.top" target="_blank"><img src="/assets/images/icon/openkylin.ico" width="16" height="16" style="vertical-align: -0.25em"></a> openKylin（开放麒麟） | `openkylin` |
        | <a href="https://openanolis.cn" target="_blank"><img src="/assets/images/icon/anolis.png" width="16" height="16" style="vertical-align: -0.1em"></a> Anolis OS（龙蜥） | `anolis` |
        | <a href="https://www.opensuse.org" target="_blank"><img src="/assets/images/icon/opensuse.svg" width="16" height="16"></a> openSUSE | `opensuse` |
        | <a href="https://archlinux.org" target="_blank"><img src="/assets/images/icon/arch-linux.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Arch Linux | `archlinux` `archlinuxarm` |
        | <a href="https://www.alpinelinux.org" target="_blank"><img src="/assets/images/icon/alpine.png" width="16" height="16" style="vertical-align: -0.15em"></a> Alpine Linux | `alpine` |
        | <a href="https://www.gentoo.org" target="_blank"><img src="/assets/images/icon/gentoo.svg" width="16" height="16" style="vertical-align: -0.2em"></a> Gentoo | `gentoo` `gentoo-portage` |
        | <a href="https://nixos.org" target="_blank"><img src="/assets/images/icon/nixos.svg" width="16" height="16" style="vertical-align: -0.15em"></a> NixOS | `nix-channels` |

    请看下面的例子

    ``` { .bash title="使用阿里云镜像站的 Rocky Linux 软件源" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
      --source mirrors.aliyun.com \
      --branch rockylinux
    ```

    阿里云镜像站的 Rocky Linux 仓库名称为 [`rockylinux`](https://mirrors.aliyun.com/rockylinux)，不符合默认规则，但是可以通过命令选项绕过脚本默认规则来实现。

    > 部分系统会同时配置多个仓库的软件源，具体详见命令选项

    > 由于软件源仓库作用在软件源地址上因此也可以使用多级路径，例如 `--branch "linux/debian"` -> `https://mirrors.example.com/linux/debian`

- ### 单独更换 EPEL 源

    !!! info "EPEL (Extra Packages for Enterprise Linux) 是由 Fedora 组织维护的一个附加软件包仓库，它主要适用于除 Fedora 操作系统以外的红帽系 Linux 发行版，配置 EPEL 仓库已成为广大用户的普遍需求，建议默认安装它"

    有些时候你会发现想使用的镜像站没有 EPEL 仓库，那么你可以在第一次运行脚本时不安装或更换 EPEL 源然后再单独执行下面的命令

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --only-epel
    ```

    对于已经 EOF 的 EPEL 7 注意需要使用 [`archive`](https://dl.fedoraproject.org/pub/archive/epel) 仓库，境外以及海外网络环境建议通过命令选项 `--use-official-source-epel true` 使用官方源

- ### 恢复使用官方源

    当你不小心删除了官方源的备份时可以使用此命令来恢复，使用此命令选项后将跳过选择软件源步骤

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --use-official-source true
    ```
    > 部分系统不存在官方源例如 `Arch Linux`，届时会自动更换成兼容性较高的阿里云镜像站

- ### 特定系统的使用示例

    - #### 关于 CentOS 停服问题

        脚本对于已经 EOF 的 CentOS 7/8、CentOS Stream 8 进行了适配

        <div class="grid cards" markdown>

        -   __国内网络环境__

            ---

            直接正常使用即可，因为国内大部分镜像站都同步了 [`CentOS Vault`](https://vault.centos.org/) 仓库

        -   __境外以及海外网络环境__

            ---

            建议使用 `腾讯云` 或 `阿里云` 镜像站，或者通过 `--use-official-source true` 命令选项使用官方源

        </div>

        另外 EPEL 7 也进入了 EOF，脚本同样对其进行了适配

    - #### 指定 GNU/Linux Debian 操作系统的 Security 源

        如果你想尽可能提高服务器的安全性则建议使用官方源，因为镜像同步存在延迟

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
          --source-security security.debian.org \
          --branch-security debian-security
        ```

    - #### 指定 Debian 系 Linux 操作系统的版本代号

        大多数情况下自定义版本代号用于更换系统版本，请看下面的例子

        === "升级 GNU/Linux Debian 至 12 版本 Bookworm"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --codename bookworm
            ```

        === "将 GNU/Linux Debian 的版本切换到测试分支"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --codename testing
            ```

        更换软件源后还需要执行系统更新命令 `apt-get dist-upgrade`，并且建议在更新完成并重启系统后重新执行本换源脚本，因为仅更换软件源配置中的系统版本代号可能会在后期使用时产生一些兼容性问题

        ``` { .bash title="若脚本无法实现指定版本代号，你也可以在执行脚本后手动替换" }
        sed -i "s/$(lsb_release -cs)/指定版本代号/g" /etc/apt/sources.list
        ```

    - #### 更换 Ubuntu EOF版本软件源

        !!! info "EOF 为生命周期结束的缩写（End Of Life），Ubuntu 迭代速度较快一般非LTS(长期支持)版本的生命周期只有9个月。官方会定期从主仓库移除不在生命周期内的版本仓库目录，届时可能就需要使用镜像站的 `Ubuntu Old Releases` 仓库"

        具体版本支持情况详见官方 [Wiki](https://wiki.ubuntu.com/Releases)，关于 `Ubuntu Old Releases` 仓库的支持情况详见各镜像站

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
          --source mirrors.ustc.edu.cn \
          --branch ubuntu-old-releases
        ```

- ### 无人值守（自动化）

    不通过交互完成换源操作，至少需要使用如下命令选项来实现，建议熟悉后再使用

    ``` { .bash .no-copy title="参考命令" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
      --source mirror.example.com \
      --protocol http \
      --use-intranet-source false \
      --install-epel true \
      --backup true \
      --upgrade-software false \
      --clean-cache false \
      --ignore-backup-tips
    ```
    > 如果报错 `命令选项无效` 那么请检查选项合法性以及空格字符编码，示例中选项一行写一个是为了提高阅读性

- ### 纯净模式

    为了便于开发者使用所推出的功能，启用后会精简脚本内容输出，建议搭配其它命令选项无交互使用

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --pure-mode
    ```

    !!! tip "滚动输出的命令日志可能存在无法预料的显示问题，不过目前暂未发现异常"

---

## 定制脚本

如果你是其它项目的开发者希望通过本项目来制作专属脚本那么请参考下面提到的内容，目前已经有国内教育单位镜像站的维护者这样做了。

1.  首先不建议修改代码的底层逻辑，应尽量与本项目源码保持同步，脚本内容执行顺序由 `main` 函数控制，代码逻辑清晰
2.  你可以简单去除一些无关内容，例如将软件源列表（数组）`mirror_list_(default|edu|abroad|extranet|intranet)` 中的内容删除，例：`mirror_list_default=()`
3.  如果你想定制脚本打印内容可直接修改 `run_start` `run_end` `print_title` 这三个函数中的内容
4.  如果你想添加自定义 Shell 内容详见 `main` 函数中脚本执行顺序，可以在对应位置直接插入内容也可以封装函数后调用
5.  如果你想要缩减脚本体积那么可以删除一些不必要的内容，除了上面提到的软件源列表还有一些涉及脚本工作的部分模块内容，具体如下：
    1. 首先在删除内容时应尽可能保留脚本原始结构，直接把涉及函数中的内容删除即可，使其保留为空函数
    2. 可以删除一些不使用（操作系统）的软件源原始内容 `gen_repo_files_xxx`，这些内容占据了脚本 `60%` 以上的体积
    3. 如果你不使用某些功能那么可以删除对应功能模块函数中的内容，`命令选项 handle_command_options`、`备份原有软件源 backup_original_mirrors`、`更新软件包 upgrade_software`
6.  脚本主要功能配置是由统一的变量控制的，命令选项亦是如此，这些全局变量由全大写字母构成并遵循下划线命名法，具体变量详见如下表格，你只需要将这些变量声明在脚本头部（预留注释区域）即可快速完成定制

| 变量名 | 含义 | 值类型 |
| :-: | :-: | :-: |
| `SOURCE` | 指定软件源地址（域名或IP） | `地址` |
| `SOURCE_EPEL` | 指定 EPEL 附加软件包仓库的软件源地址（域名或IP） | `地址` |
| `SOURCE_SECURITY` | 指定 Debian / Ubuntu 系统 security 仓库的软件源地址（域名或IP） | `地址` |
| `SOURCE_VAULT` | 指定 CentOS / AlmaLinux 系统 vault 仓库的软件源地址（域名或IP） | `地址` |
| `SOURCE_PORTAGE` | 指定 Gentoo 系统 portage 仓库的软件源地址（域名或IP） | `地址` |
| `SOURCE_BASE_SYSTEM` | 指定 Linux Mint / Raspberry Pi OS 底层系统的软件源地址（域名或IP） | `地址` |
| `SOURCE_BRANCH` | 指定软件源仓库（路径） | `仓库名` |
| `SOURCE_EPEL_BRANCH` | 指定 EPEL 附加软件包仓库的软件源仓库（路径） | `仓库名` |
| `SOURCE_SECURITY_BRANCH` | 指定 Debian 系统 security 仓库的软件源仓库（路径） | `仓库名` |
| `SOURCE_VAULT_BRANCH` | 指定 CentOS / AlmaLinux 系统 vault 仓库的软件源仓库（路径） | `仓库名` |
| `SOURCE_PORTAGE_BRANCH` | 指定 Gentoo 系统 portage 仓库的软件源仓库（路径） | `仓库名` |
| `SOURCE_BASE_SYSTEM_BRANCH` | 指定 Linux Mint / Raspberry Pi OS 底层系统的软件源仓库（路径） | `仓库名` |
| `DEBIAN_CODENAME` | 指定 Debian 系 / openKylin 操作系统的版本代号 | `代号名称` |
| `USE_INTRANET_SOURCE` | 是否优先使用内网软件源地址 | `true` 或 `false` |
| `USE_OFFICIAL_SOURCE` | 是否使用目标操作系统的官方软件源 | `true` 或 `false` |
| `USE_OFFICIAL_SOURCE_EPEL` | 是否使用 EPEL 附加软件包的官方软件源 | `true` 或 `false` |
| `WEB_PROTOCOL` | 指定 WEB 协议 | `http` 或 `https` |
| `INSTALL_EPEL` | 是否安装 EPEL 附加软件包 | `true` 或 `false` |
| `ONLY_EPEL` | 仅更换 EPEL 软件源模式 | `true` 或 `false` |
| `BACKUP` | 是否备份原有软件源 | `true` 或 `false` |
| `IGNORE_BACKUP_TIPS` | 忽略覆盖备份提示（即不覆盖备份） | `true` 或 `false` |
| `UPGRADE_SOFTWARE` | 是否更新软件包 | `true` 或 `false` |
| `CLEAN_CACHE` | 是否在更新软件包后清理下载缓存 | `true` 或 `false` |
| `CLEAN_SCREEN` | 是否在运行前清除屏幕上的所有内容 | `true` 或 `false` |
| `PRINT_DIFF` | 是否打印源文件修改前后差异 | `true` 或 `false` |
| `PURE_MODE` | 纯净模式，精简打印内容 | `true` 或 `false` |

> 部分变量存在默认值，未涉及的变量无需声明为空值（空字符串），另外如果对应功能配置不存在那么就可能会出现交互
