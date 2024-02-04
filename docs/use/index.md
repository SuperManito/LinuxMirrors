---
hide:
  - feedback
---

## 一键执行命令

=== ":material-home: 中国大陆（默认）"

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh)
    ```

    !!! question "请在使用前检查目标镜像站是否支持您所使用的操作系统"

    ??? quote "原始执行命令"

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh)
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
            ```

        > 可以使用仓库原始地址来调用脚本，项目利用 GitHub Action 在每次提交后自动拷贝源码到文档目录作为网站资源发布，网站托管于知名云服务商几乎没有被劫持的风险可放心使用

=== ":material-school: 中国大陆教育网"

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --edu # (1)!
    ```

    1.  通过 `--edu` 命令选项来使用中国大陆教育单位软件源

    !!! question "请在使用前检查目标镜像站是否支持您所使用的操作系统"

    ??? quote "原始执行命令"

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --edu
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --edu
            ```

        > 可以使用仓库原始地址来调用脚本，项目利用 GitHub Action 在每次提交后自动拷贝源码到文档目录作为网站资源发布，网站托管于知名云服务商几乎没有被劫持的风险可放心使用

=== ":octicons-globe-16: 海外地区"

    ``` bash
    bash <(curl -sSL https://linuxmirrors.cn/main.sh) --abroad # (1)!
    ```

    1.  通过 `--abroad` 命令选项来使用海外软件源

    !!! question "请在使用前检查目标镜像站是否支持您所使用的操作系统"

    ??? quote "原始执行命令"

        === ":simple-github: GitHub"

            ``` bash
            bash <(curl -sSL https://raw.githubusercontent.com/SuperManito/LinuxMirrors/main/ChangeMirrors.sh) --abroad
            ```

        === ":simple-gitee: Gitee"

            ``` bash
            bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh) --abroad
            ```

        > 可以使用仓库原始地址来调用脚本，项目利用 GitHub Action 在每次提交后自动拷贝源码到文档目录作为网站资源发布，网站托管于知名云服务商几乎没有被劫持的风险可放心使用

## 相关注意事项

<div class="grid cards" markdown>

-   :material-numeric-1:{style="color: #3CA7E5" .lg} __需使用 `ROOT` 用户执行脚本__

    ---

    切换命令为 `sudo -i` 或 `su root`，不同系统环境使用的命令不一样，因为有些系统没有在初始安装时为 ROOT 用户设置固定密码（例如Ubuntu）所以需要使用 `sudo` 指令来提权

-   :material-numeric-2:{style="color: #3CA7E5" .lg} __建议使用 `SSH` 远程工具__

    ---

    如果你使用的系统终端界面不支持 `UTF-8` 编码那么将无法正常显示中文内容，导致无法正确选择交互内容。大部分系统都会自动开启该服务，否则请参考[启用方法](help.md#%E5%85%B3%E4%BA%8E%E5%BC%80%E5%90%AF-ssh-%E8%BF%9C%E7%A8%8B%E7%99%BB%E5%BD%95%E7%9A%84%E6%96%B9%E6%B3%95)

-   :material-numeric-3:{style="color: #3CA7E5" .lg} __如果是在新系统上首次执行脚本__

    ---

    当前执行方式依赖 `curl` 指令来获取脚本内容并执行，所以需要先通过包管理工具来安装该软件包，否则会报错 `Command not found`，安装方法详见[常见问题](help.md#%E5%85%B3%E4%BA%8E%E6%8A%A5%E9%94%99-command-not-found)，若无法安装就复制[源码](https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)到本地新建`.sh`脚本，然后通过 `bash` 手动执行

</div>

## 未启用的源

遵循系统默认设置即没有启用的软件源不会在运行完本脚本后被启用，但是它们也随脚本更换了目标软件源地址，如果你有使用需求请阅读下面的启用方法

=== "Debian 系"

    默认禁用了`deb-src`源码仓库和`proposed`预发布软件源，若需启用请将 `/etc/apt/sources.list` 文件中相关内容的所在行取消注释

    > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali` &nbsp; `Deepin` &nbsp; `Armbian`

=== "RedHat 系 / OpenCloudOS / openEuler"

    部分仓库默认没有启用，若需启用请将 `/etc/yum.repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`

    > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `OpenCloudOS` &nbsp; `openEuler`

=== "openSUSE"

    部分仓库默认没有启用，若需启用请将 `/etc/zypp/repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`


!!! note ":octicons-heart-fill-24:{ .heart style="color: red" } 如果您觉得这个项目不错对您有所帮助的话，方便在仓库右上角给颗 ⭐ 并分享给更多的朋友吗？"
