| 名称 | 含义 | 选项值 |
| - | - | :-: |
| `--abroad` | 使用海外软件源 | 无 |
| `--edu` | 使用中国大陆教育网软件源 | 无 |
| `--source` | 指定软件源地址(域名或IP) | 地址 |
| `--source-security` | 指定 Debian 的 security 软件源地址(域名或IP) | 地址 |
| `--source-vault` | 指定 CentOS/AlmaLinux 的 vault 软件源地址(域名或IP) | 地址 |
| `--use-official-source` | 使用操作系统官方软件源 | 无 |
| `--branch` | 指定软件源分支(路径) | 分支名 |
| `--branch-security` | 指定 Debian 的 security 软件源分支(路径) | 分支名 |
| `--branch-vault` | 指定 CentOS/AlmaLinux 的 vault 软件源分支(路径) | 分支名 |
| `--codename` | 指定 Debian 系操作系统的版本代号 | 代号名称 |
| `--protocol` | 指定 WEB 协议 | `http` 或 `https` |
| `--intranet` | 优先使用内网地址 | `true` 或 `false` |
| `--install-epel` | 安装 EPEL 附加软件包 | `true` 或 `false` |
| `--only-epel` | 仅更换 EPEL 软件源模式 | 无 |
| `--close-firewall` | 关闭防火墙 | `true` 或 `false` |
| `--backup` | 备份原有软件源 | `true` 或 `false` |
| `--ignore-backup-tips` | 忽略覆盖备份提示（即不覆盖备份） | 无 |
| `--upgrade-software` | 更新软件包 | `true` 或 `false` |
| `--clean-cache` | 清理下载缓存 | `true` 或 `false` |
| `--print-diff` | 打印源文件修改前后差异 | `true` 或 `false` |
| `--help` | 查看帮助菜单 | 无 |

> 软件源格式 `<指定WEB协议>://<软件源地址>/<软件源分支>`

## 示例

### 指定软件源地址

若不想通过交互选择默认提供的软件源，你可以使用该命令选项指定软件源地址

``` { .bash .no-copy }
bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
    --source mirror.example.com
```

### 指定软件源分支

使用场景：目标镜像站有对应的系统镜像但是不符合本项目脚本关于软件源分支设置的默认规则  

项目脚本为了适配大的环境不会针对某一镜像站独特的镜像分支名称而单独适配，默认使用的分支名称如下

<div class="annotate" markdown>
| 系统名称 | 版本代号 |
| --- | :---: |
| <a href="https://www.debian.org" target="_blank"><img src="/assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.45em"></a> Debian | debian |
| <a href="https://cn.ubuntu.com" target="_blank"><img src="/assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"></a> Ubuntu | ubuntu / ubuntu-ports |
| <a href="https://www.kali.org" target="_blank"><img src="/assets/images/icon/kali-linux.svg" width="16" height="16"></a> Kali Linux | kali |
| <a href="https://www.deepin.org" target="_blank"><img src="/assets/images/icon/deepin.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Deepin | deepin |
| <a href="https://www.armbian.com" target="_blank"><img src="/assets/images/icon/armbian.png" width="16" height="16" style="vertical-align: -0.2em"></a> Armbian | armbian |
| <a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="/assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.1em"></a> Red Hat Enterprise Linux :material-information-outline:{ title="9版本使用 <code>Rocky Linux</code>， 7、8版本使用<code>CentOS</code>" } | centos / centos-altarch / rocky |
| <a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="/assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.2em"></a> Fedora | fedora |
| <a href="https://www.centos.org" target="_blank"><img src="/assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.2em"></a> CentOS | centos / centos-stream / centos-altarch / centos-vault |
| <a href="https://rockylinux.org/zh_CN" target="_blank"><img src="/assets/images/icon/rocky-linux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> Rocky Linux | rocky |
| <a href="https://almalinux.org/zh-hans" target="_blank"><img src="/assets/images/icon/almalinux.svg" width="16" height="16" style="vertical-align: -0.25em"></a> AlmaLinux | almalinux / almalinux-vault |
| <a href="https://www.opencloudos.org" target="_blank"><img src="/assets/images/icon/opencloudos.png" width="16" height="16" style="vertical-align: -0.25em"></a> OpenCloudOS | opencloudos |
| <a href="https://www.openeuler.org/zh" target="_blank"><img src="/assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.2em"></a> openEuler | openeuler |
| <a href="https://www.opensuse.org" target="_blank"><img src="/assets/images/icon/opensuse.svg" width="16" height="16"></a> openSUSE | opensuse |
| <a href="https://archlinux.org" target="_blank"><img src="/assets/images/icon/arch-linux.ico" width="16" height="16" style="vertical-align: -0.15em"></a> Arch Linux | archlinux / archlinuxarm |
| <a href="https://www.alpinelinux.org" target="_blank"><img src="/assets/images/icon/alpine.png" width="16" height="16" style="vertical-align: -0.15em"></a> Alpine Linux | alpine |
</div>

请看下面的例子

``` { .bash .no-copy title="使用阿里云的 Rocky Linux 软件源" }
bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
  --source mirrors.aliyun.com \
  --branch rockylinux
```

阿里云镜像站的 Rocky Linux 镜像分支名称为 [`rockylinux`](https://mirrors.aliyun.com/rockylinux)，不符合默认规则，但是可以通过命令选项绕过脚本默认规则来实现。

什么是默认规则？参考这几个例子： `Debian GNU/Linux => debian`、`Rocky Linux => rocky`、`AlmaLinux => almalinux`

### 单独更换 EPEL 源

有些时候你会发现想使用的镜像站没有 epel 镜像仓库，那么你可以在第一次运行脚本时不安装或不更换 epel 源然后再单独执行下面的命令

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --only-epel
```

### 恢复使用官方源

当你不小心删除了官方源的备份时可以使用此命令来恢复，使用此命令选项后将跳过选择软件源步骤

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) --use-official-source
```

### 自定义 Debian Security 源

如果你想尽可能提高服务器的安全性则建议使用官方源，因为镜像同步存在延迟

``` bash
bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
  --source-security security.debian.org \
  --branch-security debian-security
```

### 指定 Debian 系 Linux 版本代号

大多数情况下自定义版本代号用于升级系统版本，请看下面的例子

``` { .bash .no-copy title="升级 Debian 至最新 12 版本 Bookworm" }
bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
  --codename bookworm
```
更换软件源后还需要执行系统更新命令才能实现更新操作，并且建议在更新完成并重启系统后重新执行本换源脚本，因为仅更换软件源配置中的系统版本代号可能会在后期使用时产生一些兼容性问题

## 无人值守

不通过交互完成换源操作，需要使用大量命令选项来实现，建议熟悉后再使用

``` { .bash .no-copy title="参考命令" }
bash <(curl -sSL https://linuxmirrors.cn/main.sh) \
  --source mirror.example.com \
  --protocol http \
  --intranet false \
  --install-epel true \
  --close-firewall true \
  --backup true \
  --upgrade-software false \
  --clean-cache false \
  --ignore-backup-tips
```
