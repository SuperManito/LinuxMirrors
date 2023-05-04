| 名称 | 含义 | 选项值 |
| :-: | :-: | :-: |
| `--source` | 指定软件源地址 | 地址 |
| `--branch` | 指定软件源分支 | 分支名 |
| `--abroad` | 使用海外软件源 | 无 |
| `--web-protocol` | 指定 WEB 协议 | `http` 或 `https` |
| `--intranet` | 使用内网地址 | `true` 或 `false` |
| `--install-epel` | 安装 EPEL 附加软件包 | `true` 或 `false` |
| `--close-firewall` | 关闭防火墙 | `true` 或 `false` |
| `--backup` | 备份原有软件源 | `true` 或 `false` |
| `--ignore-backup-tips` | 忽略覆盖备份提示 | 无 |
| `--updata-software` | 更新软件包 | `true` 或 `false` |
| `--clean-cache` | 清理下载缓存 | `true` 或 `false` |
| `--help` | 查看帮助菜单 | 无 |

## 示例

### 指定软件源地址

若不想通过交互选择默认提供的软件源，你可以使用该命令选项指定软件源地址

``` { .bash .no-copy }
bash ChangeMirrors.sh --source mirrors.ustc.edu.cn
```

### 指定软件源分支

使用场景：目标软件源有对应系统镜像但是不符合本脚本关于软件源分支设置的默认规则  

本脚本为了适配大环境不会针对某一镜像站独特的镜像分支名称而单独定制，最开始是为了更换国内软件源而设计适配的，默认使用的分支名称如下

<table>
<tr>
    <td><a href="https://www.debian.org" target="_blank"><img src="../assets/images/icon/debian.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Debian</td>
    <td align="center">debian</td>
</tr>
<tr>
    <td><a href="https://cn.ubuntu.com" target="_blank"><img src="../assets/images/icon/ubuntu.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Ubuntu</td>
    <td align="center">ubuntu</td>
</tr>
<tr>
    <td><a href="https://www.kali.org" target="_blank"><img src="../assets/images/icon/kali.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Kali Linux</td>
    <td align="center">kali</td>
</tr>
<tr>
    <td><a href="https://access.redhat.com/products/red-hat-enterprise-linux" target="_blank"><img src="../assets/images/icon/redhat.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Red Hat Enterprise Linux</td>
    <td align="center">centos</td>
</tr>
<tr>
    <td><a href="https://www.centos.org/centos-linux" target="_blank"><img src="../assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;CentOS</td>
    <td align="center">centos</td>
</tr>
<tr>
    <td><a href="https://www.centos.org/centos-stream" target="_blank"><img src="../assets/images/icon/centos.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;CentOS Stream</td>
    <td align="center">centos-stream</td>
</tr>
<tr>
    <td><a href="https://rockylinux.org" target="_blank"><img src="../assets/images/icon/rocky.svg" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Rocky Linux</td>
    <td align="center">rocky</td>
</tr>
<tr>
    <td><a href="https://fedoraproject.org/zh-Hans" target="_blank"><img src="../assets/images/icon/fedora.ico" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;Fedora</td>
    <td align="center">fedora</td>
</tr>
<tr>
    <td><a href="https://www.openeuler.org/zh" target="_blank"><img src="../assets/images/icon/openeuler.ico" width="16" height="16" style="vertical-align: -0.15em"/></a>&nbsp;openEuler</td>
    <td align="center">openeuler</td>
</tr>
<tr>
    <td><a href="https://www.opensuse.org" target="_blank"><img src="../assets/images/icon/opensuse.svg" width="16" height="16" style="vertical-align: -0.25em"/></a>&nbsp;openSUSE</td>
    <td align="center">opensuse</td>
</tr>
</table>

请看下面的例子

``` { .bash .no-copy title="使用阿里云的 Rocky Linux 软件源" }
bash ChangeMirrors.sh \
  --source mirrors.aliyun.com \
  --branch rockylinux
```

阿里云镜像站的 Rocky Linux 镜像分支名称为 [`rockylinux`](https://mirrors.aliyun.com/rockylinux)，不符合默认规则，但是可以通过命令选项绕过脚本默认规则来实现

## 无人值守

不通过交互完成换源操作，需要使用大量命令选项来实现，建议熟悉后再使用

``` { .bash .no-copy title="参考命令" }
bash ChangeMirrors.sh \
  --source mirror.example.com \
  --web-protocol http \
  --intranet false \
  --install-epel true \
  --close-firewall true \
  --backup true \
  --updata-software false \
  --clean-cache false \
  --ignore-backup-tips
```
