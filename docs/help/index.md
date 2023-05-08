---
hide:
  - navigation
---

## 关于报错 Command not found

  - 如果提示 `Command 'curl' not found` 则说明当前未安装 `curl` 软件包

    === "Debian 系 Linux"

        ``` sh
        apt-get install -y curl
        ```

        `Debian` &nbsp; `Ubuntu` &nbsp; `Kali`

    === "RedHat 系 Linux / OpenCloudOS / openEuler"

        ``` sh
        yum install -y curl || dnf install -y curl
        ```

        `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `Fedora` &nbsp; `openEuler`

    === "openSUSE"

        ``` sh
        zypper install curl
        ```

    === "Arch Linux"

        ``` sh
        pacman -S curl
        ```

## 还原已备份的软件源

=== "Debian 系 Linux"

    ``` sh
    cp -rvf /etc/apt/sources.list.bak /etc/apt/sources.list
    apt-get update
    ```

    `Debian` &nbsp; `Ubuntu` &nbsp; `Kali`

=== "RedHat 系 Linux / OpenCloudOS / openEuler"

    ``` sh
    cp -rvf /etc/yum.repos.d.bak /etc/yum.repos.d
    yum makecache
    ```

    `Red Hat Enterprise Linux` &nbsp; `CentOS` &nbsp; `Rocky Linux` &nbsp; `Fedora` &nbsp; `openEuler`

=== "openSUSE"

    ``` sh
    cp -rvf /etc/zypp/repos.d.bak /etc/zypp/repos.d
    zypper ref
    ```

=== "Arch Linux"

    ``` sh
    cp -rvf /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist
    pacman -Sy
    ```

## 其它

  - 如果提示 `bash: /proc/self/fd/11: No such file or directory`，请切换至 `Root` 用户执行，切换命令为 `su root`
