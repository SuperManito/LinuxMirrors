---
hide:
  - navigation
  - footer
---

## One-Click Command

=== ":material-home-city: Chinese mainland"

    !!! quote ""

        === ":linuxmirrors: Official Site (Recommended)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --en
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en
            ```
            > Real-time sync, no delay. Recommended for use in Chinese mainland network environments.

        === ":simple-gitcode: GitCode"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en
            ```
            > 1-hour sync delay.

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --en
            ```

        === ":tencent-cloud: Tencent Cloud EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --en
            ```
            > Not recommended in Chinese mainland network environments.

=== ":material-earth: International Regions"

    !!! quote ""

        === ":linuxmirrors: Official Site (Recommended)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --abroad
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --en --abroad
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en --abroad
            ```
            > Real-time sync, no delay. Recommended for use in Chinese mainland network environments.

        === ":simple-gitcode: GitCode"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en --abroad
            ```
            > 1-hour sync delay.

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --en --abroad
            ```

        === ":tencent-cloud: Tencent Cloud EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --abroad
            ```
            > Not recommended in Chinese mainland network environments.

=== ":material-library: China Education Network"

    !!! quote ""

        === ":linuxmirrors: Official Site (Recommended)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --edu
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --en --edu
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en --edu
            ```
            > Real-time sync, no delay. Recommended for use in Chinese mainland network environments.

        === ":simple-gitcode: GitCode"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --en --edu
            ```
            > 1-hour sync delay.

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/ChangeMirrors.sh) --en --edu
            ```

        === ":tencent-cloud: Tencent Cloud EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/main.sh) --en --edu
            ```
            > Not recommended in Chinese mainland network environments.



!!! tip "Usage Help"

    The tabs represent the built-in mirror site types and script sources. Please check whether your target mirror site supports your operating system before use. You can check in the [Mirror List](../mirrors/index.md).  
    By default, the original mirror configuration will be automatically backed up. For more details, see the documentation below. If you are confused by some options during use, just press Enter all the way after selecting the mirror, which is the best practice.

    _It supports use in abnormal environments such as when the original system software source is damaged, missing, or invalid. There is no need to install any additional dependencies._

!!! quote "About Mirror Selection (Must Read for New Users)"

    If you are not familiar with these mirrors, it is recommended to use `Aliyun (high compatibility, strong availability)` or `USTC (fast speed)`. Don't worry about speed tests, the built-in mirrors generally do not differ much.  
    This project script is an automated operation and maintenance tool. It does not subjectively rank or customize mirrors. User choice should be free, which is also to better continue the spirit of open source software.

<div class="grid cards" markdown>

-   :material-numeric-1:{style="color: #5b84f5" .lg} __`ROOT` privileges required__

    ---

    Please run this script using the `root` account, switching between the `sudo -i` and `su root` commands, as the commands vary depending on the system. Also, avoid directly running one-click commands such as `sudo bash <(xxx)` using `sudo`.

-   :material-numeric-2:{style="color: #5b84f5" .lg} __It is recommended to use a modern `SSH` client__

    ---

    The system's GUI graphical interface terminal application may experience some unpredictable display issues. Some systems will automatically enable the SSH service; otherwise, please refer to [how to enable SSH](#how-to-enable-ssh-remote-login).

-   :material-numeric-3:{style="color: #5b84f5" .lg} __If running the script for the first time on a new system__

    ---

    The script relies on `curl` to fetch content, but some systems do not preinstall this package, resulting in `Command not found` errors. See [_About Command not found_](#about-command-not-found-error) below for installation. The script itself is unrelated to `curl` or `wget` and does not download any content.

-   :material-numeric-4:{style="color: #5b84f5" .lg} __Interactive configuration is required during script execution__

    ---

    Use arrow keys ++arrow-up++++arrow-down++++arrow-left++++arrow-right++ or ++w++++a++++s++++d++ to control options and press ++enter++ to confirm. If interaction is abnormal, try resizing the terminal window and avoid full screen.

</div>

### FAQ

- #### About Command not found error

    !!! quote ""

        This error is caused by the system not having the `curl` package installed. Install it as follows:

        === "Debian-based / openKylin"

            ``` bash
            apt-get install -y curl
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

            For new systems, run `apt-get update` first.

        === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

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

        ??? question "Can't install? (Click to see more solutions)"

            If your system's original mirror is invalid and you can't install `curl`, here are some emergency ways to fetch the script online:

            === "Download with Python"

                Works for most systems (except `Alpine Linux`). If `python3` is missing, try `python`.
                ``` bash
                python3 -c "import urllib.request; urllib.request.urlretrieve('https://linuxmirrors.cn/main.sh', 'main.sh')"
                ```

            === "Download with wget"

                Usually, systems without `curl` also lack `wget`, so this may not work.
                ``` bash
                wget https://linuxmirrors.cn/main.sh
                ```

            === "Download with browser"

                If you have GUI access, open the link in a browser to download the script. Many systems preinstall Firefox.

            Then run the script:

            === ":material-home-city: Chinese mainland"

                ``` bash
                bash main.sh --en
                ```

            === ":material-earth: International Regions"

                ``` bash
                bash main.sh --en --abroad
                ```

            === ":material-library: China Education Network"

                ``` bash
                bash main.sh --en --edu
                ```

            If none of these work, copy the [source code](https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) to a new `.sh` file and run it with `bash`.

- #### Backup of original mirrors

    !!! quote ""

        The script automatically backs up the original mirror configuration. The backup path is the original file or directory with `.bak` appended, e.g., `/etc/apt/sources.list => /etc/apt/sources.list.bak`. If a backup exists, you will be prompted whether to overwrite it.

- #### Restore backed up mirrors

    ??? quote "Click to expand and view"

        === "Debian-based / openKylin"

            === "Traditional format"

                ``` bash
                cp -rf /etc/apt/sources.list.bak /etc/apt/sources.list
                apt-get update
                ```

            === "DEB822 format"

                ``` bash
                system_name="$(lsb_release -is | tr '[:upper:]' '[:lower:]')"
                cp -rf "/etc/apt/sources.list.d/${system_name}.sources.bak" "/etc/apt/sources.list.d/${system_name}.sources"
                apt-get update
                ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

        === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

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

- #### How to enable SSH remote login

    ??? quote "Click to expand and view"

        The commands and configuration steps are for reference only; please be flexible and adapt them accordingly.

        - Check if `SSH` service is installed

            ``` bash
            ls /etc | grep ssh
            ```

            If this folder does not exist, SSH is not installed. Install the `openssh-server` package with your package manager. The installation command is as follows:

            === "Debian-based / openKylin"

                ``` bash
                apt-get install -y openssh-server
                ```

                > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

                For new systems, run `apt-get update` first.

            === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

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

            > Package names may vary across different systems. If you encounter a "package not found" error, try using wildcards `openssh*` to install it.

        - Configure `SSH` service

            ``` { .bash title="Allow root account login" }
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PermitRootLogin " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config || echo -e "\nPermitRootLogin yes" >> /etc/ssh/sshd_config
            ```

            ``` { .bash title="Enable password authentication" }
            cat /etc/ssh/sshd_config | grep -Eq "^[# ]?PasswordAuthentication " ; [ $? -eq 0 ] && sed -i 's/^[# ]\?PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config || echo -e "\nPasswordAuthentication yes" >> /etc/ssh/sshd_config
            ```

        - Start/restart `SSH` service

            ``` bash
            for ssh_svc in sshd ssh openssh; do systemctl restart "${ssh_svc}" 2>/dev/null && break ; systemctl enable --now "${ssh_svc}" 2>/dev/null && break ; done
            ```

        !!! tip "Friendly reminder: If you are using a public server, it is recommended to disable SSH password authentication and set up key-based login."

- #### No arrow key interactive UI

    !!! quote ""

        If you see a text input instead of the new arrow key UI, install the `ncurses` or `nano` package. The new interaction relies on the `tput` command.

- #### About disabled repositories

    !!! quote ""

        Many systems have multiple repositories. The script follows the system default. Disabled repositories will not be enabled after running the script, but their URLs will be updated. To enable them:

        === "Debian-based / openKylin"

            By default, `deb-src` and `proposed` are disabled. Uncomment the relevant lines in `/etc/apt/sources.list` to enable.

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

        === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

            Some repos are disabled by default. Set `enabled=1` in the relevant repo files under `/etc/yum.repos.d`.

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        === "openSUSE"

            Some repos are disabled by default. Set `enabled=1` in the relevant repo files under `/etc/zypp/repos.d`.

- #### Other

    ??? quote "About the script's online location"

        The project uses [GitHub Action](https://github.com/SuperManito/LinuxMirrors/blob/main/.github/workflows/build-docs.yml#L29) to automatically copy the source code to the docs directory after each commit for website publishing. The site is hosted on [:netlify: Netlify](https://www.netlify.com), with almost no risk of hijacking.

        You can also use the raw address from the code repository. This is just to explain why there are several different addresses; the default official site address is easier to remember and access.

    ??? quote "About mirror download speed"

        First, see the recommendations in the [Mirror List](../mirrors/index.md) usage help. These are based on experience, but some users still worry about speed.

        The network latency (`Ping`) of a mirror is not directly related to download speed. Distance does not equal experience. Some mirrors have high bandwidth but poor speed due to load strategies.

        There are many open source speed test scripts written in C or Python. This project is written in Bash Shell and does not depend on third-party libraries. Bash is the most common scripting language for Linux operations and is preinstalled on most distributions, so users can run it directly without installing anything. This convenience cannot be replaced by other languages. However, Bash scripts may not easily achieve accurate speed testing; using other languages for this is reinventing the wheel.

        ??? quote "About software source selection"

        Many people may wonder, "Since scripts are so convenient and highly automated, why can't we automatically select the optimal software source?" It's not that it can't be done, but that it can't be done.

        "Software source selection" here refers to the script automatically selecting a software source with the best experience based on the client's network environment and location. This question needs to be addressed from multiple perspectives:

        - Speed

            As explained above, in summary, the pursuit of speed isn't a universal requirement. For most people, it's simply not noticeable; it's enough to get it working. Moreover, many Linux distributions now offer good speeds without switching sources.

        - Regarding mirror sites themselves

            To give a simple example, Alibaba Cloud mirror sites were once considered the top choice due to their high speed and availability. However, as the number of users increased, their speeds became increasingly slower, sometimes even below 10 Mbps.  
            Over time, mirror sites with large user bases may not be able to handle the high traffic, resulting in a poor user experience. Mirror sites with fewer users may eventually close, which is detrimental to the development of the entire ecosystem.

        - From Developer's Perspective

            This project aims to develop a universal repository switching script from the perspective of an operations and maintenance tool, rather than a tool that specifically addresses software repository requirements. The script's default behavior should be suitable for the majority of users. As an operations and maintenance tool, it should have a clear functional positioning. As a script, its pros and cons should be carefully considered from multiple perspectives, including scalability,and practicality. The choice of software repository should be fully vested in the user.

---

## Command Options (Advanced Usage)

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --help 

Command options(name/meaning/value):

  --abroad                     Use overseas mirrors	                                                         none
  --edu                        Use China education network mirrors                                            none
  --source                     Specify mirror address (domain or IP)                                          address
  --source-epel                Specify EPEL repository address (domain or IP)                                 address
  --source-security            Specify Debian/Ubuntu security repo address (domain or IP)                     address
  --source-vault               Specify CentOS/AlmaLinux vault repo address (domain or IP)                     address
  --source-portage             Specify Gentoo portage repo address (domain or IP)                             address
  --source-base-system         Specify Linux Mint/Raspberry Pi OS base system repo address (domain or IP)     address
  --branch                     Specify mirror repository (repo name)                                          repo name
  --branch-epel                Specify EPEL repository (path)                                                 repo name
  --branch-security            Specify Debian security repo (path)                                            repo name
  --branch-vault               Specify CentOS/AlmaLinux vault repo (path)                                     repo name
  --branch-portage             Specify Gentoo portage repo (path)                                             repo name
  --branch-base-system	       Specify Linux Mint/Raspberry Pi OS base system repo (path)                     repo name
  --codename                   Specify Debian/openKylin codename                                              codename
  --protocol                   Specify web protocol                                                           http or https
  --use-intranet-source        Prefer intranet mirror address                                                 true or false
  --use-official-source        Use official mirror of target OS                                               true or false
  --use-official-source-epel   Use official EPEL repo                                                         true or false
  --install-epel               Install EPEL repository                                                        true or false
  --backup                     Backup original mirrors                                                        true or false
  --upgrade-software           Upgrade packages                                                               true or false
  --clean-cache                Clean cache after upgrade                                                      true or false
  --clean-screen               Clear screen before running                                                    true or false
  --lang                       Specify the language of the script output                                      language
  --only-epel                  Only switch EPEL repo                                                          none
  --ignore-backup-tips         Ignore backup overwrite prompt                                                 none
  --print-diff                 Print diff before and after modification                                       none
  --pure-mode                  Pure mode, minimal output                                                      none
  --help                       Show help menu                                                                 none
```

| Name | Meaning | Value |
| - | - | :-: |
| `--abroad` | Use overseas mirrors | none |
| `--edu` | Use China education network mirrors | none |
| `--source` | Specify mirror address (domain or IP) | `address` |
| `--source-epel` | Specify EPEL repository address (domain or IP) | `address` |
| `--source-security` | Specify Debian/Ubuntu security repo address (domain or IP) | `address` |
| `--source-vault` | Specify CentOS/AlmaLinux vault repo address (domain or IP) | `address` |
| `--source-portage` | Specify Gentoo portage repo address (domain or IP) | `address` |
| `--source-base-system` | Specify Linux Mint/Raspberry Pi OS base system repo address (domain or IP) | `address` |
| `--branch` | Specify mirror repository (path) | `repo name` |
| `--branch-epel` | Specify EPEL repository (path) | `repo name` |
| `--branch-security` | Specify Debian security repo (path) | `repo name` |
| `--branch-vault` | Specify CentOS/AlmaLinux vault repo (path) | `repo name` |
| `--branch-portage` | Specify Gentoo portage repo (path) | `repo name` |
| `--branch-base-system` | Specify Linux Mint/Raspberry Pi OS base system repo (path) | `repo name` |
| `--codename` | Specify Debian/openKylin codename | `codename` |
| `--protocol` | Specify web protocol | `http` or `https` |
| `--use-intranet-source` | Prefer intranet mirror address | `true` or `false` |
| `--use-official-source` | Use official mirror of target OS | `true` or `false` |
| `--use-official-source-epel` | Use official EPEL repo | `true` or `false` |
| `--install-epel` | Install EPEL repository | `true` or `false` |
| `--backup` | Backup original mirrors | `true` or `false` |
| `--upgrade-software` | Upgrade packages | `true` or `false` |
| `--clean-cache` | Clean cache after upgrade | `true` or `false` |
| `--clean-screen` | Clear screen before running | `true` or `false` |
| `--lang` | Specify the language of the script output | `language id (see docs below)` |
| `--only-epel` | Only switch EPEL repo | none |
| `--ignore-backup-tips` | Ignore backup overwrite prompt | none |
| `--print-diff` | Print diff before and after modification | none |
| `--pure-mode` | Pure mode, minimal output | none |
| `--help` | Show help menu | none |

> Full mirror format: `<Web protocol>://<mirror address (domain or IP)>/<repo path>`

Below are some advanced usage examples

- ### Specify mirror address

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --source mirror.example.com
    ```

- ### Specify mirror repository directory

    The repository here refers to the directory after the mirror site address, i.e., the repository directory on the mirror site. Although all are called repositories, it is easy to confuse.

    Main scenario: The target mirror site has a corresponding system repository but does not match the default rule in this script.

    ??? note "Default repo names for each OS (click to expand)"

        The script does not adapt to unique repo names of a single mirror site for compatibility.

        | OS Name | Names Involved |
        | --- | :---: |
        | <a href="https://www.debian.org" title="https://www.debian.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/debian.svg" alt="Debian" width="16" height="16" style="vertical-align: -0.35em"></a> **Debian** | `debian` `debian-archive` |
        | <a href="https://ubuntu.com" title="https://ubuntu.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/ubuntu.svg" alt="Ubuntu" width="16" height="16" style="vertical-align: -0.15em"></a> **Ubuntu** | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.kali.org" title="https://www.kali.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/kali-linux.png" alt="Kali Linux" width="16" height="16"></a> **Kali Linux** | `kali` |
        | <a href="https://linuxmint.com" title="https://linuxmint.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/linux-mint.svg" alt="Linux Mint" width="16" height="16" style="vertical-align: -0.2em"></a> **Linux Mint** | `linuxmint` `ubuntu` `ubuntu-ports` `debian` |
        | <a href="https://www.deepin.org" title="https://www.deepin.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/deepin.png" alt="Deepin" width="16" height="16" style="vertical-align: -0.2em"></a> **Deepin（深度）** | `deepin` |
        | <a href="https://zorin.com/os" title="https://zorin.com/os" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/zorin-os.png" alt="Zorin OS" width="16" height="16" style="vertical-align: -0.15em"></a> **Zorin OS** | `ubuntu` `ubuntu-ports` |
        | <a href="https://www.armbian.com" title="https://www.armbian.com" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/armbian.png" alt="Armbian" width="16" height="16" style="vertical-align: -0.2em"></a> **Armbian** | `armbian` |
        | <a href="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" title="https://www.proxmox.com/en/products/proxmox-virtual-environment/overview" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/proxmox.svg" alt="Proxmox VE" width="16" height="16" style="vertical-align: -0.2em"></a> **Proxmox VE** | `proxmox` |
        | <a href="https://www.raspberrypi.com/software" title="https://www.raspberrypi.com/software" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/raspberry-pi.png" alt="Raspberry Pi OS" width="16" height="16" style="vertical-align: -0.2em"></a> **Raspberry Pi OS** | `raspberrypi` `raspbian` `debian` `debian-archive` |
        | <a href="https://access.redhat.com/products/red-hat-enterprise-linux" title="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/redhat.svg" alt="Red Hat Enterprise Linux" width="16" height="16" style="vertical-align: -0.1em"></a> **Red Hat Enterprise Linux** :material-information-outline:{ title="Version 9 uses <code>CentOS Stream</code>, 7/8 use <code>CentOS</code>" } | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://fedoraproject.org" title="https://fedoraproject.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/fedora.ico" alt="Fedora" width="16" height="16" style="vertical-align: -0.15em"></a> **Fedora** | `fedora` `fedora-archive` |
        | <a href="https://www.centos.org" title="https://www.centos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/centos.svg" alt="CentOS" width="16" height="16" style="vertical-align: -0.135em"></a> **CentOS** | `centos` `centos-stream` `centos-altarch` `centos-vault` |
        | <a href="https://rockylinux.org" title="https://rockylinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/rocky-linux.svg" alt="Rocky Linux" width="16" height="16" style="vertical-align: -0.2em"></a> **Rocky Linux** | `rocky` |
        | <a href="https://almalinux.org" title="https://almalinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/almalinux.svg" alt="AlmaLinux" width="16" height="16" style="vertical-align: -0.15em"></a> **AlmaLinux** | `almalinux` `almalinux-vault` |
        | <a href="https://www.oracle.com/linux" title="https://www.oracle.com/linux" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/oracle-linux.png" alt="Oracle Linux" width="16" height="16" style="vertical-align: -0.25em"></a> **Oracle Linux** | `centos-stream` |
        | <a href="https://www.openeuler.org" title="https://www.openeuler.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openeuler.ico" alt="openEuler" width="16" height="16" style="vertical-align: -0.2em"></a> **openEuler** | `openeuler` |
        | <a href="https://www.opencloudos.org" title="https://www.opencloudos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opencloudos.png" alt="OpenCloudOS" width="16" height="16" style="vertical-align: -0.25em"></a> **OpenCloudOS** | `opencloudos` |
        | <a href="https://www.openkylin.top" title="https://www.openkylin.top" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/openkylin.ico" alt="openKylin" width="16" height="16" style="vertical-align: -0.25em"></a> **openKylin** | `openkylin` |
        | <a href="https://openanolis.cn" title="https://openanolis.cn" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/anolis.png" alt="Anolis OS" width="16" height="16" style="vertical-align: -0.1em"></a> **Anolis OS** | `anolis` |
        | <a href="https://www.opensuse.org" title="https://www.opensuse.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/opensuse.svg" alt="openSUSE" width="16" height="16"></a> **openSUSE** | `opensuse` |
        | <a href="https://archlinux.org" title="https://archlinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/arch-linux.ico" alt="Arch Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Arch Linux** | `archlinux` `archlinuxarm` |
        | <a href="https://manjaro.org" title="https://manjaro.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/manjaro.svg" alt="Manjaro" width="16" height="16" style="vertical-align: -0.2em"></a> **Manjaro** | `manjaro` |
        | <a href="https://www.alpinelinux.org" title="https://www.alpinelinux.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/alpine.png" alt="Alpine Linux" width="16" height="16" style="vertical-align: -0.15em"></a> **Alpine Linux** | `alpine` |
        | <a href="https://www.gentoo.org" title="https://www.gentoo.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/gentoo.svg" alt="Gentoo" width="16" height="16" style="vertical-align: -0.2em"></a> **Gentoo** | `gentoo` `gentoo-portage` |
        | <a href="https://nixos.org" title="https://nixos.org" target="_blank" rel="noopener noreferrer"><img src="/assets/images/icon/nixos.svg" alt="NixOS" width="16" height="16" style="vertical-align: -0.15em"></a> **NixOS** | `nix-channels` |

    Example:

    ``` { .bash title="Use Aliyun mirror for Rocky Linux" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
      --source mirrors.aliyun.com \
      --branch rockylinux
    ```

    The repository directory name for Rocky Linux on Aliyun is [`rockylinux`](https://mirrors.aliyun.com/rockylinux), not the default `rocky`, but you can override the default rule with the command option.

    > Some systems configure multiple repos at once. See command options for details.

    > Since the repo path is appended to the mirror address, you can use multi-level paths, e.g., `--branch "linux/debian"` -> `https://mirrors.example.com/linux/debian`

- ### Switch EPEL repo only

    !!! info "EPEL (Extra Packages for Enterprise Linux) is an additional repo maintained by Fedora, mainly for Red Hat-based distributions except Fedora itself. Configuring EPEL is a common need and is recommended by default."

    Sometimes your desired mirror does not have EPEL. You can skip EPEL during the first run and then run:

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --only-epel
    ```

    For EPEL 7 (EOL), use the [`archive`](https://dl.fedoraproject.org/pub/archive/epel) repo. For overseas networks, use `--use-official-source-epel true` to use the official repo.

- ### Restore official mirrors

    If you accidentally deleted the backup of the official mirror, use this command to restore. This skips mirror selection.

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --use-official-source true
    ```
    > Some systems (e.g., `Arch Linux`) have no official mirror, so Aliyun will be used as a fallback.

- ### Usage examples for specific systems

    - #### About CentOS EOL

        The script adapts to EOL CentOS 7/8 and CentOS Stream 8.

        <div class="grid cards" markdown>

        -   __Chinese mainland__

            ---

            Use the script as usual, no additional steps are required. As most mirror sites in Chinese mainland have already synchronized the [`CentOS Vault`](https://vault.centos.org) repository.

        -   __International__

            ---

            Use `Tencent Cloud` or `Aliyun` mirrors, or use `--use-official-source true` for the official repo.

        </div>

        EPEL 7 is also EOL and is supported by the script.

    - #### Specify GNU/Linux Debian Security repo

        For maximum security, use the official repo due to mirror sync delays.

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
          --source-security security.debian.org \
          --branch-security debian-security
        ```

    - #### Specify Debian-based codename

        Usually for switching system versions. Example:

        === "Upgrade GNU/Linux Debian to 13 "trixie""

            - Change version code

                ``` bash
                bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
                  --codename trixie \
                  --upgrade-software false
                ```

            - Disable the backports repository

                ``` bash
                sed -i '/backports/s/^/# /' /etc/apt/sources.list
                ```

            - Upgrade the system

                ``` bash
                apt-get update
                apt-get dist-upgrade
                ```

            - After the upgrade is complete and the system is rebooted, perform the following steps

                ``` bash
                # Clear the original software sources (If there is any non-system software source content, please back it up manually first)
                sed -i '1,$d' /etc/apt/sources.list
                # Rerun the mirror switching script
                bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en
                ```

        === "Switch GNU/Linux Debian to testing branch"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
              --codename testing \
              --upgrade-software false
            ```

        ``` { .bash .no-copy title="If the script can't set the codename, you can manually replace it after running" }
        sed -i "s/$(lsb_release -cs)/your-codename/g" /etc/apt/sources.list
        ```

    - #### Switch Ubuntu EOL version mirrors

        !!! info "EOL means End Of Life. Non-LTS Ubuntu versions are supported for only 9 months. Old versions are removed from the main repo and may require using the `Ubuntu Old Releases` repo."

        See the official [Wiki](https://documentation.ubuntu.com/project/release-team/list-of-releases/) for version support and check each mirror for `Ubuntu Old Releases` support.

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
          --source mirrors.ustc.edu.cn \
          --branch ubuntu-old-releases
        ```

    - #### Arch Linux use Chinese community repo

        This script does not support this extra repo. For reference, use:

        ``` bash
        SOURCE="https://mirrors.aliyun.com/archlinuxcn"
        grep -q "\[archlinuxcn\]" /etc/pacman.conf || echo -e "[archlinuxcn]\nServer = ${SOURCE}/\$arch" >>/etc/pacman.conf
        ```

- ### I18n (Internationalization)

    The script provides multi-language support. Currently, there are three built-in display languages: `简体中文`、`繁體中文`、`English`. The default is `简体中文`.

    - #### Specify Language

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --lang xxx
        ```

        | Type | Value |
        | :-: | :-: |
        | 简体中文 | `zh-hans` `zh-cn` `zh` |
        | 繁體中文 | `zh-hant` `zh-tw` `zh-hk` |
        | English | `en` `en-us` |

        It can also be used directly as a command option

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --zh-hant
        ```
        > `--en` `--en-us` `--zh` `--zh-cn` `--zh-hans` `--zh-hant`

    - #### Select through interaction

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/main.sh) --lang auto
        ```

- ### Unattended (Automation)

    To run without interaction, use at least the following options. Recommended for experienced users.

    ``` { .bash .no-copy title="Example Command" }
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en \
      --source mirror.example.com \
      --protocol http \
      --use-intranet-source false \
      --install-epel true \
      --backup true \
      --upgrade-software false \
      --clean-cache false \
      --ignore-backup-tips
    ```
    > If you get an "invalid option" error, check the option validity and whitespace encoding. Each option is written on a separate line for readability.

- ### Pure mode

    This feature is introduced to facilitate the use of developers and operation and maintenance personnel. After it is enabled, the script content output will be simplified. It is recommended to use it with other command options without interaction.

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --en --pure-mode
    ```

    !!! tip "Scrolling command logs may have unpredictable display issues, but no problems have been found so far."

---

## Customizing the Script

If you are a developer of another project and want to create a custom script based on this project, refer to the following. Some maintainers of China education network mirrors have already done so.

1.  It is not recommended to modify the core logic. Keep in sync with the upstream source code. The script execution order is controlled by the `main` function and is clear.
2.  You can simply remove irrelevant content, e.g., clear the mirror list arrays `mirror_list_(default|edu|abroad|extranet|intranet)`, e.g., `mirror_list_default=()`
3.  To customize script output, modify the `run_start`, `run_end`, and `print_title` functions.
4.  To add custom shell content, see the execution order in `main`. Insert content directly or encapsulate in a function.
5.  To reduce script size, delete unnecessary content. Besides the mirror lists, you can remove some modules:
    1. Keep the original structure; empty out the function bodies if not needed.
    2. Remove unused OS repo content `gen_repo_files_xxx`, which takes up over 60% of the script.
    3. Remove unused feature modules, e.g., `handle_command_options`, `backup_original_mirrors`, `upgrade_software`.
    4. Remove unnecessary language packs, for example: `function msg_pack_en() {}`
6.  Main configuration is controlled by unified variables, as are command options. These global variables are all uppercase and use underscores. See the table below. Declare them at the top of the script (reserved comment area) for quick customization.

??? note "Variable list (click to expand)"

    | Variable | Meaning | Value Type |
    | :-: | :-: | :-: |
    | `SOURCE` | Specify mirror address (domain or IP) | `address` |
    | `SOURCE_EPEL` | Specify EPEL repo address (domain or IP) | `address` |
    | `SOURCE_SECURITY` | Specify Debian/Ubuntu security repo address (domain or IP) | `address` |
    | `SOURCE_VAULT` | Specify CentOS/AlmaLinux vault repo address (domain or IP) | `address` |
    | `SOURCE_PORTAGE` | Specify Gentoo portage repo address (domain or IP) | `address` |
    | `SOURCE_BASE_SYSTEM` | Specify Linux Mint/Raspberry Pi OS base system repo address (domain or IP) | `address` |
    | `SOURCE_BRANCH` | Specify mirror repo (path) | `repo name` |
    | `SOURCE_EPEL_BRANCH` | Specify EPEL repo (path) | `repo name` |
    | `SOURCE_SECURITY_BRANCH` | Specify Debian security repo (path) | `repo name` |
    | `SOURCE_VAULT_BRANCH` | Specify CentOS/AlmaLinux vault repo (path) | `repo name` |
    | `SOURCE_PORTAGE_BRANCH` | Specify Gentoo portage repo (path) | `repo name` |
    | `SOURCE_BASE_SYSTEM_BRANCH` | Specify Linux Mint/Raspberry Pi OS base system repo (path) | `repo name` |
    | `DEBIAN_CODENAME` | Specify Debian/openKylin codename | `codename` |
    | `USE_INTRANET_SOURCE` | Prefer intranet mirror address | `true` or `false` |
    | `USE_OFFICIAL_SOURCE` | Use official mirror of target OS | `true` or `false` |
    | `USE_OFFICIAL_SOURCE_EPEL` | Use official EPEL repo | `true` or `false` |
    | `WEB_PROTOCOL` | Specify Web protocol | `http` or `https` |
    | `INSTALL_EPEL` | Install EPEL repository | `true` or `false` |
    | `ONLY_EPEL` | Only switch EPEL repo | `true` or `false` |
    | `BACKUP` | Backup original mirrors | `true` or `false` |
    | `IGNORE_BACKUP_TIPS` | Ignore backup overwrite prompt | `true` or `false` |
    | `UPGRADE_SOFTWARE` | Upgrade packages | `true` or `false` |
    | `CLEAN_CACHE` | Clean cache after upgrade | `true` or `false` |
    | `CLEAN_SCREEN` | Clear screen before running | `true` or `false` |
    | `PRINT_DIFF` | Print diff before and after modification | `true` or `false` |
    | `PURE_MODE` | Pure mode, minimal output | `true` or `false` |

    > Some variables have defaults. Unused variables do not need to be declared as empty strings. If a configuration is missing, interaction may occur.
