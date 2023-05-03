=== "Debian"

    默认禁用了源码仓库和预发布软件源，若需启用请将 `/etc/apt/sources.list` 文件中相关内容的所在行取消注释

    `Debian`  
    `Ubuntu`  
    `Kali`

=== "RedHat/openEuler"

    部分仓库默认没有启用，若需启用请将 `/etc/yum.repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`

    `Red Hat Enterprise Linux`  
    `CentOS`  
    `Rocky Linux`  
    `Fedora`  
    `openEuler`

=== "openSUSE"

    部分仓库默认没有启用，若需启用请将 `/etc/zypp/repos.d` 目录下相关 repo 文件中的 `enabled` 值修改为 `1`

