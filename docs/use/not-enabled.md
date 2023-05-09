遵循系统默认设置即没有启用的软件源不会在运行完本脚本后被启用，但是它们跟随脚本更换了目标软件源地址，如果你有使用需求请阅读下面的启用方法

=== "Debian 系 Linux"

    默认禁用了`deb-src`源码仓库和`proposed`预发布软件源，若需启用请将 `/etc/apt/sources.list` 文件中相关内容的所在行取消注释

    > `Debian` &nbsp; `Ubuntu` &nbsp; `Kali`

=== "RedHat 系 Linux / OpenCloudOS / openEuler"

    部分仓库默认没有启用，若需启用请将 `/etc/yum.repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`

    > `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `AlmaLinux` &nbsp; `Fedora` &nbsp; `OpenCloudOS` &nbsp; `openEuler`

=== "openSUSE"

    部分仓库默认没有启用，若需启用请将 `/etc/zypp/repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`
