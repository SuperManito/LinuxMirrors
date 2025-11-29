---
hide:
  - navigation
  - footer
---

# :simple-docker:{style="color: #1d63ed"} Docker Installation & Registry Mirror Switcher

## One-Click Command

=== "Install"

    !!! quote ""

        === ":linuxmirrors: Official Site (Recommended)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh) --en
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --en
            ```
            > Real-time sync, no delay. Recommended for use in Chinese mainland network environments.

        === ":simple-gitcode: GitCode"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --en
            ```
            > 1-hour sync delay.

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --en
            ```

        === ":tencent-cloud: Tencent Cloud EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh) --en
            ```
            > Not recommended in Chinese mainland network environments.

        Integrates installation of [`Docker Engine`](https://docs.docker.com/engine) and [`Docker Compose`](https://docs.docker.com/compose), supports selecting or switching software repositories (Docker repositories) and registry mirrors, installing specific versions, reinstalling, and supports ARM architecture.

        The script refers to the [official documentation](https://docs.docker.com/engine/install) and uses the system package manager for installation. There are no compatibility or security issues. The available versions are determined by the Docker CE repository.

=== "Only Switch Registry Mirror"

    !!! quote ""

        === ":linuxmirrors: Official Site (Recommended)"

            ``` bash
            bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --only-registry
            ```

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/DockerInstallation.sh) --en --only-registry
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --en --only-registry
            ```
            > Real-time sync, no delay. Recommended for use in Chinese mainland network environments.

        === ":simple-gitcode: GitCode"

            ``` bash
            bash <(curl -sSL https://raw.gitcode.com/SuperManito/LinuxMirrors/raw/main/DockerInstallation.sh) --en --only-registry
            ```
            > 1-hour sync delay.

        === ":simple-jsdelivr: jsDelivr (CDN)"

            ``` bash
            bash <(curl -sSL https://cdn.jsdelivr.net/gh/SuperManito/LinuxMirrors@main/DockerInstallation.sh) --en --only-registry
            ```

        === ":tencent-cloud: Tencent Cloud EO (CDN)"

            ``` bash
            bash <(curl -sSL https://edgeone.linuxmirrors.cn/docker.sh) --en --only-registry
            ```
            > Not recommended in Chinese mainland network environments.

<div class="grid cards" markdown>

-   :material-shimmer:{ .lg .middle } __Completely replace the official installation script__

    ---

    It is logically consistent with [get.docker.com](https://get.docker.com) and incorporates the repositories and features of this project.

-   :material-graph:{ .lg .middle } __Supports domestic derivative operating systems__

    ---

    Compatible with a number of derivative operating systems not supported by the official installation script. :material-information-outline:{ title="In addition to the operating systems shown on the official website homepage, it also supports special systems such as those shown below. </br><ul><li>Kylin Server</li><li>Huawei Cloud EulerOS</li><li>TencentOS Server</li><li>Alibaba Cloud Linux</li></ul>" }

-   :material-weight-lifter:{ .lg .middle } __Powerful and unparalleled__

    ---

    One of the most practical open source operation and maintenance scripts on the entire network, with excellent performance

-   :material-compass-rose:{ .lg .middle } __Exquisite interactive design__

    ---

    An interactive command line interface that is easy to understand and use, way ahead of the competition

</div>

<div style="display: flex; align-items: center; gap: 8px;">
    <p>✨ After years of technical accumulation and production environment testing, it has been widely praised by the community and deeply loved by developers. It is used by major companies.</p>
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

!!! tip "Docker Compose does not require a separate installation"

    Starting from V2, Docker Compose is part of the Docker CLI. The script integrates the installation of this [plugin](https://docs.docker.com/compose/install/linux) by default. Please use the `docker compose` command instead of `docker-compose`.

!!! node "About Software Sources"

    <div class="grid cards" markdown>

    -   __Docker CE Software Repository__

        ---

        Docker CE stands for Docker Community Edition, which is another name for Docker Engine. This repository is used to download and install Docker-related packages.

    -   __Docker Registry Mirror__

        ---

        Used to control the default source repository for pulling images, also known as a registry accelerator. The default is the official container registry [Docker Hub](https://hub.docker.com).

    </div>

    Due to some force majeure, [Docker Hub](https://hub.docker.com) is currently inaccessible in the Chinese mainland network environment, so the image cannot be pulled normally. It is recommended to use the image warehouse source available in Chinese mainland mentioned below.

    Note: The specified Web protocol in the script is only for controlling the `Docker CE` software source. `Docker Registry` always uses the `HTTPS` protocol.


!!! quote "Built-in Registry Mirrors"

    <div style="text-align: center" markdown>
    <div style="font-size: 0.8rem"><strong>Available in Chinese mainland</strong></div>

    | Site Name | Address | Description |
    | :--: | :--: | :-- |
    | 1ms Mirror | [docker.1ms.run](https://1ms.run "docker.1ms.run") | Enterprise mirror, CDN smart distribution, extremely fast, supports paid customization, recommended |
    | Docker Proxy | [dockerproxy.net](https://dockerproxy.net "dockerproxy.net") | Created by ghproxy, highly available but slow, supports paid enterprise acceleration |
    | DaoCloud | [docker.m.daocloud.io](https://docker.m.daocloud.io "docker.m.daocloud.io") | Well-known enterprise mirror, highly available and fast, now whitelist only |
    | 1Panel Mirror | [docker.1panel.live](https://1panel.cn "docker.1panel.live") | Enterprise product self-use mirror |

    <blockquote style="border-left: none !important">This open source project is not suitable for collecting personal self-built registry accelerators. If needed, you can use command options to specify your own.</blockquote>

    <div style="font-size: 0.8rem; margin-top: 1rem"><strong>Others</strong></div>

    | Site Name | Address | Site Name | Address |
    | :- | :-: | :- | :-: |
    | Alibaba Cloud (Hangzhou) | [registry.cn-hangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hangzhou.aliyuncs.com") | Alibaba Cloud (Japan - Tokyo) | [registry.ap-northeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-northeast-1.aliyuncs.com") |
    | Alibaba Cloud (Shanghai) | [registry.cn-shanghai.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shanghai.aliyuncs.com") | Alibaba Cloud (Singapore) | [registry.ap-southeast-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-1.aliyuncs.com") |
    | Alibaba Cloud (Qingdao) | [registry.cn-qingdao.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-qingdao.aliyuncs.com") | Alibaba Cloud (Malaysia - Kuala Lumpur) | [registry.ap-southeast-3.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-3.aliyuncs.com") |
    | Alibaba Cloud (Beijing) | [registry.cn-beijing.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-beijing.aliyuncs.com") | Alibaba Cloud (Indonesia - Jakarta) | [registry.ap-southeast-5.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.ap-southeast-5.aliyuncs.com") |
    | Alibaba Cloud (Zhangjiakou) | [registry.cn-zhangjiakou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-zhangjiakou.aliyuncs.com") | Alibaba Cloud (Germany - Frankfurt) | [registry.eu-central-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-central-1.aliyuncs.com") |
    | Alibaba Cloud (Hohhot) | [registry.cn-huhehaote.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-huhehaote.aliyuncs.com") | Alibaba Cloud (UK - London) | [registry.eu-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.eu-west-1.aliyuncs.com") |
    | Alibaba Cloud (Ulanqab) | [registry.cn-wulanchabu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-wulanchabu.aliyuncs.com") | Alibaba Cloud (US West - Silicon Valley) | [registry.us-west-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-west-1.aliyuncs.com") |
    | Alibaba Cloud (Shenzhen) | [registry.cn-shenzhen.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-shenzhen.aliyuncs.com") | Alibaba Cloud (US East - Virginia) | [registry.us-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.us-east-1.aliyuncs.com") |
    | Alibaba Cloud (Heyuan) | [registry.cn-heyuan.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-heyuan.aliyuncs.com") | Alibaba Cloud (UAE - Dubai) | [registry.me-east-1.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.me-east-1.aliyuncs.com") |
    | Alibaba Cloud (Guangzhou) | [registry.cn-guangzhou.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-guangzhou.aliyuncs.com") | Google Cloud (North America) | [gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://gcr.io") |
    | Alibaba Cloud (Chengdu) | [registry.cn-chengdu.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-chengdu.aliyuncs.com") | Google Cloud (Asia) | [asia.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://asia.gcr.io") |
    | Alibaba Cloud (Hong Kong) | [registry.cn-hongkong.aliyuncs.com](https://help.aliyun.com/zh/acr/user-guide/accelerate-the-pulls-of-docker-official-images "https://registry.cn-hongkong.aliyuncs.com") | Google Cloud (Europe) | [eu.gcr.io](https://cloud.google.com/artifact-registry/docs/transition/gcr-repositories?hl=zh-cn "https://eu.gcr.io") |
    | Tencent Cloud | [mirror.ccs.tencentyun.com](https://cloud.tencent.com/document/product/1207/45596 "https://mirror.ccs.tencentyun.com") | Docker Hub | [registry.hub.docker.com](https://hub.docker.com/ "registry.hub.docker.com") |

    <blockquote style="border-left: none !important">Note: Registry mirrors from domestic cloud computing companies are only for their own business. Instances in Chinese mainland may still not be able to access Docker Hub.</blockquote>

    </div>

## Command Options (Advanced Usage)

<!-- termynal -->
```
$ bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --help 

Command options(name/meaning/value):

  --source                  Specify Docker CE mirror address (domain or IP)            address
  --source-registry         Specify Docker Registry mirror address (domain or IP)      address
  --branch                  Specify Docker CE mirror repository (path)                 repo name
  --branch-version          Specify Docker CE mirror repository version                version
  --designated-version      Specify Docker Engine installation version                 version
  --codename                Specify Debian-based OS codename                           codename
  --protocol                Specify Web protocol for Docker CE mirror                  http or https
  --use-intranet-source     Prefer intranet Docker CE mirror address                   true or false
  --install-latest          Whether to install the latest Docker Engine                true or false
  --close-firewall          Whether to disable the firewall                            true or false
  --clean-screen            Whether to clear the screen before running                 true or false
  --lang                    Specify the language of the script output                  language
  --only-registry           Only switch registry mirror mode                           none
  --ignore-backup-tips      Ignore backup overwrite prompt (do not backup)             none
  --pure-mode               Pure mode, minimal output                                  none
  --help                    Show help menu                                             none
```

| Name | Meaning | Value |
| :-: | :-: | :-: |
| `--source` | Specify `Docker CE` mirror address (domain or IP) | `address` |
| `--source-registry` | Specify `Docker Registry` mirror address (domain or IP) | `address (separate multiple entries with commas)` |
| `--branch` | Specify `Docker CE` mirror repository (path) | `repo name (see docs below)` |
| `--branch-version` | Specify `Docker CE` mirror repository version | `version (see docs below)` |
| `--designated-version` | Specify `Docker Engine` installation version | `version (see docs below)` |
| `--codename` | Specify `Debian-based` OS codename | `codename` |
| `--protocol` | Specify Web protocol for `Docker CE` mirror | `http` or `https` |
| `--use-intranet-source` | Prefer intranet `Docker CE` mirror address | `true` or `false` |
| `--install-latest` | Whether to install the latest `Docker Engine` | `true` or `false` |
| `--close-firewall` | Whether to disable the firewall | `true` or `false` |
| `--clean-screen` | Whether to clear the screen before running | `true` or `false` |
| `--lang` | Specify the language of the script output | `language id (see docs below)` |
| `--only-registry` | Only switch registry mirror mode | none |
| `--ignore-backup-tips` | Ignore backup overwrite prompt (do not backup) | none |
| `--pure-mode` | Pure mode, minimal output | none |
| `--help` | Show help menu | none |

> Full source format: `< Web  protocol>://<source address (domain or IP)>/<repository path>`

- ### Specify Registry Mirror Address

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --source-registry registry.example.com
    ```

    Can specify multiple addresses at the same time, and they must be separated by commas.

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en \
      --source-registry "registry-1.example.com,registry-2.example.com"
    ```

- ### Only Switch Registry Mirror

    === "Use Script for One-Click Replacement"

        Only switches the registry accelerator. If Docker is not installed, an error will be reported and exit.

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --only-registry
        ```

        Lazy one-click command (using multiple addresses)

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en \
          --only-registry \
          --source-registry "docker.1ms.run,docker.1panel.live,docker.m.daocloud.io"
        ```
        > The option value can specify multiple addresses, which must be separated by commas.

    === "Manual Replacement"

        - Install the `jq` package

            === "Debian-based / openKylin"

                ``` bash
                apt-get install -y jq
                ```

                > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS` &nbsp; `openKylin`

                For new systems, run `apt-get update` first.

            === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

                ``` bash
                dnf install -y jq || yum install -y jq
                ```

                > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        - Specify registry mirror address

            > Manually replace `<example.registry.com>` with the registry address. See the address column in the "Built-in Registry Mirrors" table above.

            ``` bash
            SOURCE_REGISTRY='"https://<example.registry.com>"'
            ```
            You can also specify multiple registry mirrors, e.g., `SOURCE_REGISTRY='"https://example.registry.com","https://test.registry.com"'`, separated by commas.

        - Replace registry mirror address

            ``` bash
            [ -s "/etc/docker/daemon.json" ] || echo "{}" >/etc/docker/daemon.json
            jq '.["registry-mirrors"] = ['"${SOURCE_REGISTRY}"']' /etc/docker/daemon.json >/etc/docker/daemon.json.tmp && mv /etc/docker/daemon.json.tmp
            ```

        - Restart Docker service

            ``` bash
            systemctl daemon-reload
            [[ $(systemctl is-active docker) == "active" ]] && systemctl restart docker || systemctl enable --now docker
            ```

- ### Specify Docker CE Source Address

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --source mirror.example.com/docker-ce
    ```
    > Note: The address path must include the Docker CE mirror repository path, i.e., `docker-ce`.

- ### Specify Docker CE Source Repository

    The script will automatically detect this in most cases. Specify only if you have special requirements.

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --branch centos
    ```
    > Repository names are fixed: [`centos`](https://download.docker.com/linux/centos/) [`debian`](https://download.docker.com/linux/debian/) [`fedora`](https://download.docker.com/linux/fedora/) [`raspbian`](https://download.docker.com/linux/raspbian/) [`rhel`](https://download.docker.com/linux/rhel/) [`sles`](https://download.docker.com/linux/sles/) [`static`](https://download.docker.com/linux/static/) [`ubuntu`](https://download.docker.com/linux/ubuntu/)  
    > See [official installation docs](https://docs.docker.com/engine/install) and [Docker CE official repo](https://download.docker.com/linux) for details.

    ``` { .bash .no-copy title="Can also specify the repository version number." }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en \
      --branch centos \
      --branch-version 9
    ```
    > This option can be used to control the compatibility of the installed software package (only applicable to Red Hat operating systems). For details, see the path name (positive integer) representing the version number in the corresponding warehouse directory.

- ### Specify Docker Engine Installation Version

    When specifying a version, the "install latest" option is ignored. Format: `major.minor.patch`, e.g., `28.4.1`.

    ``` { .bash .no-copy }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --designated-version 28.0.0
    ```
    > If the specified version does not exist or is not supported on your system, the script will report an error and exit.

    ??? quote "How to view available versions"

        === "Debian-based"

            ``` bash
            apt-cache madison docker-ce | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" | sort -t '.' -k1,1nr -k2,2nr -k3,3nr
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS`

        === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            dnf list docker-ce --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" | sort -t '.' -k1,1nr -k2,2nr -k3,3nr
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        Versions not listed are not supported by this script. If you cannot get the version list, your system environment has not been properly configured for the Docker CE repository (this will not happen when running the script).

- ### I18n (Internationalization)

    The script provides multi-language support. Currently, there are three built-in display languages: `简体中文`、`繁體中文`、`English`. The default is `简体中文`.

    - #### Specify Language

        ``` { .bash .no-copy }
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang xxx
        ```

        | Type | Value |
        | :-: | :-: |
        | 简体中文 | `zh-hans` `zh-cn` `zh` |
        | 繁體中文 | `zh-hant` `zh-tw` `zh-hk` |
        | English | `en` `en-us` |

        It can also be used directly as a command option

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --zh-hant
        ```
        > `--en` `--en-us` `--zh` `--zh-cn` `--zh-hans` `--zh-hant`

    - #### Select through interaction

        ``` bash
        bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --lang auto
        ```

- ### Unattended (Automation)

    To perform installation without interaction, use at least the following options. Recommended for experienced users.

    ``` { .bash .no-copy title="Example Command" }
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en \
      --source mirror.example.com/docker-ce \
      --source-registry registry.hub.docker.com \
      --protocol http \
      --use-intranet-source false \
      --install-latest true \
      --close-firewall true \
      --ignore-backup-tips
    ```
    > If you get an "invalid option" error, check the option validity and whitespace encoding. Each option is written on a separate line for readability.

- ### Pure Mode

    This feature is introduced to facilitate the use of developers and operation and maintenance personnel. After it is enabled, the script content output will be simplified. It is recommended to use it with other command options without interaction.

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/docker.sh) --en --pure-mode
    ```

    !!! tip "Scrolling command logs may have unpredictable display issues, but no problems have been found so far."

## FAQ

- #### About Service Startup Errors

    !!! quote ""

        In non-fresh environments, you may encounter `Docker` service startup failures after running the script. It is recommended to reinstall to resolve this. Uninstalling will not delete local images or container data.

        Uninstall commands:

        === "Debian-based"

            ``` bash
            apt-get remove -y docker* containerd.io runc && apt-get autoremove
            ```

            > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Linux Mint` &nbsp; `Deepin` &nbsp; `Zorin OS` &nbsp; `Armbian` &nbsp; `Proxmox VE` &nbsp; `Raspberry Pi OS`

        === "RedHat-based / openEuler / OpenCloudOS / Anolis OS"

            ``` bash
            yum remove -y docker* containerd.io podman* runc
            ```

            > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `openEuler` &nbsp; `OpenCloudOS` &nbsp; `Anolis OS`

        After uninstalling, simply rerun the script to install.

- #### About unsupported operating systems

    If it prompts that it is not supported, please use the system's own package management tool to install it. Because these packages are built and maintained by the Linux distribution's package maintainers and may have differences in configuration or are built from modified source code.

    You can also use &nbsp; [![Docker Desktop](../assets/images/icon/custom/docker-desktop.svg){ width="140" style="vertical-align: -0.2rem" }](https://www.docker.com/products/docker-desktop)

## Lite Version

The project also provides a simplified version, which is a copy of the main script, designed for enterprise products and large open-source community projects. It has the following features:

- Single display language `English`, no I18n internationalization
- Uses the official source by default, removing the interactive selection of built-in software sources
- Removes irrelevant printouts
- Retains core logic and command option design

``` bash
bash <(curl -sSL https://linuxmirrors.cn/docker-lite.sh)
```
> Please familiarize yourself with this project before using it. It is not recommended for novice users.

## Best Practices

??? note "Code examples for enterprise product deployment and automated operations such as CI/CD (expand to view)"

    If you don't want any user interaction, use the `fully automated` example.

    - #### Fully automated (recommended)

        --8<-- "docs/other/example1.md"

    - #### Simple method

        --8<-- "docs/other/example2.md"
        > Note: If you don't specify `Docker CE` and `Docker Registry` mirrors, the script will be interactively selected by the user. The screen will be automatically cleared (`$ clear`) at this point, which will cause your script's log to be cleared.
