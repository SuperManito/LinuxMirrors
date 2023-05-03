---
hide:
  - navigation
---

## 关于报错 Command not found

  - 如果提示 `Command 'curl' not found` 则说明当前未安装 `curl` 软件包

    ``` sh
    yum install -y curl || apt-get install -y curl
    ```

## 还原已备份的软件源

  - Debian 系

    ``` sh
    cp -rvf /etc/apt/sources.list.bak /etc/apt/sources.list
    ```

  - RedHat 系 / openEuler

    ``` sh
    cp -rvf /etc/yum.repos.d.bak /etc/yum.repos.d
    ```

  - openSUSE

    ``` sh
    cp -rvf /etc/zypp/repos.d.bak /etc/zypp/repos.d
    ```

## 其它

  - 如果提示 `bash: /proc/self/fd/11: No such file or directory`，请切换至 `Root` 用户执行
