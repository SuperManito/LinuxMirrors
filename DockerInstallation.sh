#!/bin/bash
## Author: SuperManito
## Modified: 2025-08-07
## License: MIT
## GitHub: https://github.com/SuperManito/LinuxMirrors
## Website: https://linuxmirrors.cn

## Docker CE 软件源列表
# 格式："名称@地址"
mirror_list_docker_ce=(
    "阿里云@mirrors.aliyun.com/docker-ce"
    "腾讯云@mirrors.tencent.com/docker-ce"
    "华为云@mirrors.huaweicloud.com/docker-ce"
    "网易@mirrors.163.com/docker-ce"
    "火山引擎@mirrors.volces.com/docker"
    "微软 Azure 中国@mirror.azure.cn/docker-ce"
    "清华大学@mirrors.tuna.tsinghua.edu.cn/docker-ce"
    "北京大学@mirrors.pku.edu.cn/docker-ce"
    "浙江大学@mirrors.zju.edu.cn/docker-ce"
    "南京大学@mirrors.nju.edu.cn/docker-ce"
    "上海交通大学@mirror.sjtu.edu.cn/docker-ce"
    "重庆邮电大学@mirrors.cqupt.edu.cn/docker-ce"
    "中国科学技术大学@mirrors.ustc.edu.cn/docker-ce"
    "中国科学院软件研究所@mirror.iscas.ac.cn/docker-ce"
    "官方@download.docker.com"
)

## Docker Registry 仓库列表
# 格式："名称@地址"
mirror_list_registry=(
    "毫秒镜像（推荐）@docker.1ms.run"
    "Docker Proxy@dockerproxy.net"
    "DaoCloud 道客@docker.m.daocloud.io"
    "1Panel 镜像@docker.1panel.live"
    "阿里云（杭州）@registry.cn-hangzhou.aliyuncs.com"
    "阿里云（上海）@registry.cn-shanghai.aliyuncs.com"
    "阿里云（青岛）@registry.cn-qingdao.aliyuncs.com"
    "阿里云（北京）@registry.cn-beijing.aliyuncs.com"
    "阿里云（张家口）@registry.cn-zhangjiakou.aliyuncs.com"
    "阿里云（呼和浩特）@registry.cn-huhehaote.aliyuncs.com"
    "阿里云（乌兰察布）@registry.cn-wulanchabu.aliyuncs.com"
    "阿里云（深圳）@registry.cn-shenzhen.aliyuncs.com"
    "阿里云（河源）@registry.cn-heyuan.aliyuncs.com"
    "阿里云（广州）@registry.cn-guangzhou.aliyuncs.com"
    "阿里云（成都）@registry.cn-chengdu.aliyuncs.com"
    "阿里云（香港）@registry.cn-hongkong.aliyuncs.com"
    "阿里云（日本-东京）@registry.ap-northeast-1.aliyuncs.com"
    "阿里云（新加坡）@registry.ap-southeast-1.aliyuncs.com"
    "阿里云（马来西亚-吉隆坡）@registry.ap-southeast-3.aliyuncs.com"
    "阿里云（印度尼西亚-雅加达）@registry.ap-southeast-5.aliyuncs.com"
    "阿里云（德国-法兰克福）@registry.eu-central-1.aliyuncs.com"
    "阿里云（英国-伦敦）@registry.eu-west-1.aliyuncs.com"
    "阿里云（美国西部-硅谷）@registry.us-west-1.aliyuncs.com"
    "阿里云（美国东部-弗吉尼亚）@registry.us-east-1.aliyuncs.com"
    "阿里云（阿联酋-迪拜）@registry.me-east-1.aliyuncs.com"
    "腾讯云@mirror.ccs.tencentyun.com"
    "谷歌云（北美）@gcr.io"
    "谷歌云（亚洲）@asia.gcr.io"
    "谷歌云（欧洲）@eu.gcr.io"
    "官方 Docker Hub@registry.hub.docker.com"
)

## 配置需要区分公网地址和内网地址的软件源（不分地域）
# 需要同时在两个数组变量中分别定义软件源地址，并且保证排列顺序一致
# 软件源公网地址列表
mirror_list_extranet=(
    "mirrors.aliyun.com/docker-ce"
    "mirrors.tencent.com/docker-ce"
    "mirrors.huaweicloud.com/docker-ce"
    "mirrors.volces.com/docker-ce"
)
# 软件源内网地址列表
mirror_list_intranet=(
    "mirrors.cloud.aliyuncs.com/docker-ce"
    "mirrors.tencentyun.com/docker-ce"
    "mirrors.myhuaweicloud.com/docker-ce"
    "mirrors.ivolces.com/docker-ce"
)

## 赞助商广告
SPONSOR_ADS=(
    "1Panel · Linux 面板｜极简运维 ➜  \033[3mhttps://1panel.cn\033[0m"
    "多途云 · 智能化防护，每一次连接皆在安全之下 ➜  \033[3mhttps://www.duotuyun.com\033[0m"
    "毫秒镜像 · 专为中国开发者提供Docker镜像加速下载服务 ➜  \033[3mhttps://1ms.run\033[0m"
    "速拓云 · 国内高防云28元/月｜香港云100M优化线路9元/月 ➜  \033[3mhttps://www.sutuoyun.com\033[0m"
    "林枫云 · 专注独立IP高频VPS｜R9/i9系列定制 ➜  \033[3mhttps://www.dkdun.cn\033[0m"
    "云悠YUNYOO · 全球高性价比云服务器｜低至15.99元起 ➜  \033[3mhttps://yunyoo.cc\033[0m"
    "语鹿云盾 · 专业CDN加速、防御，亚太百兆三网优化CDN低至9元起 ➜  \033[3mhttps://www.lucdn.cn\033[0m"
    "不死鸟CDN · 香港日本高防CDN，免实名/免备案，轻松阻断DDOS/CC攻击 ➜  \033[3mhttps://www.bsncdn.org\033[0m"
    "不二云 · 国内外建站快响应服务器的不二之选 ➜  \033[3mhttps://cb2.cn\033[0m"
    "HKGserver · 全球家宽｜双ISP｜住宅原生云服务器54元/月起 ➜  \033[3mhttps://www.hkgserver.com\033[0m"
    "润信云 · 国内挂机宝海外云服务器低至9.9元/月 ➜  \033[3mhttps://www.runxinyun.com\033[0m"
)

##############################################################################

## 定义系统判定变量
SYSTEM_DEBIAN="Debian"
SYSTEM_UBUNTU="Ubuntu"
SYSTEM_KALI="Kali"
SYSTEM_DEEPIN="Deepin"
SYSTEM_LINUX_MINT="Linuxmint"
SYSTEM_ZORIN="Zorin"
SYSTEM_RASPBERRY_PI_OS="Raspberry Pi OS"
SYSTEM_REDHAT="RedHat"
SYSTEM_RHEL="Red Hat Enterprise Linux"
SYSTEM_CENTOS="CentOS"
SYSTEM_CENTOS_STREAM="CentOS Stream"
SYSTEM_ROCKY="Rocky"
SYSTEM_ALMALINUX="AlmaLinux"
SYSTEM_FEDORA="Fedora"
SYSTEM_ORACLE="Oracle Linux"
SYSTEM_OPENCLOUDOS="OpenCloudOS"
SYSTEM_OPENCLOUDOS_STREAM="OpenCloudOS Stream"
SYSTEM_TENCENTOS="TencentOS"
SYSTEM_OPENEULER="openEuler"
SYSTEM_ANOLISOS="Anolis"
SYSTEM_OPENKYLIN="openKylin"
SYSTEM_OPENSUSE="openSUSE"
SYSTEM_ARCH="Arch"
SYSTEM_ALPINE="Alpine"
SYSTEM_GENTOO="Gentoo"
SYSTEM_NIXOS="NixOS"

## 定义系统版本文件
File_LinuxRelease=/etc/os-release
File_RedHatRelease=/etc/redhat-release
File_DebianVersion=/etc/debian_version
File_ArmbianRelease=/etc/armbian-release
File_RaspberryPiOSRelease=/etc/rpi-issue
File_openEulerRelease=/etc/openEuler-release
File_HuaweiCloudEulerOSRelease=/etc/hce-release
File_OpenCloudOSRelease=/etc/opencloudos-release
File_TencentOSServerRelease=/etc/tlinux-release
File_AnolisOSRelease=/etc/anolis-release
File_AlibabaCloudLinuxRelease=/etc/alinux-release
File_OracleLinuxRelease=/etc/oracle-release
File_ArchLinuxRelease=/etc/arch-release
File_ManjaroRelease=/etc/manjaro-release
File_AlpineRelease=/etc/alpine-release
File_GentooRelease=/etc/gentoo-release
File_openKylinVersion=/etc/kylin-version/kylin-system-version.conf

## 定义软件源相关文件或目录
File_AptSourceList=/etc/apt/sources.list
Dir_AptAdditionalSources=/etc/apt/sources.list.d
Dir_YumRepos=/etc/yum.repos.d

## 定义 Docker 相关变量
Dir_Docker=/etc/docker
File_DockerConfig=$Dir_Docker/daemon.json
File_DockerConfigBackup=$Dir_Docker/daemon.json.bak
File_DockerVersionTmp=docker-version.txt
File_DockerCEVersionTmp=docker-ce-version.txt
File_DockerCECliVersionTmp=docker-ce-cli-version.txt
File_DockerSourceList=$Dir_AptAdditionalSources/docker.list
File_DockerRepo=$Dir_YumRepos/docker-ce.repo

## 定义颜色和样式变量
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
AZURE='\033[36m'
PLAIN='\033[0m'
BOLD='\033[1m'
SUCCESS="\033[1;32m✔${PLAIN}"
COMPLETE="\033[1;32m✔${PLAIN}"
WARN="\033[1;43m 警告 ${PLAIN}"
ERROR="\033[1;31m✘${PLAIN}"
FAIL="\033[1;31m✘${PLAIN}"
TIP="\033[1;44m 提示 ${PLAIN}"
WORKING="\033[1;36m◉${PLAIN}"

function main() {
    permission_judgment
    collect_system_info
    run_start
    choose_mirrors
    if [[ "${ONLY_REGISTRY}" == "true" ]]; then
        only_change_docker_registry_mirror
    else
        choose_protocol
        close_firewall_service
        install_dependency_packages
        configure_docker_ce_mirror
        install_docker_engine
        change_docker_registry_mirror
        check_installed_result
    fi
    run_end
}

function handle_command_options() {
    function output_command_help() {
        echo -e "
命令选项(名称/含义/值)：

  --source                 指定 Docker CE 源地址(域名或IP)         地址
  --source-registry        指定镜像仓库地址(域名或IP)              地址
  --branch                 指定 Docker CE 源仓库(路径)             仓库名
  --codename               指定 Debian 系操作系统的版本代号        代号名称
  --designated-version     指定 Docker CE 安装版本                 版本号
  --protocol               指定 Docker CE 源的 WEB 协议            http 或 https
  --use-intranet-source    是否优先使用内网 Docker CE 软件源地址   true 或 false
  --install-latest         是否安装最新版本的 Docker Engine        true 或 false
  --close-firewall         是否关闭防火墙                          true 或 false
  --clean-screen           是否在运行前清除屏幕上的所有内容        true 或 false
  --only-registry          仅更换镜像仓库模式                      无
  --ignore-backup-tips     忽略覆盖备份提示                        无
  --pure-mode              纯净模式，精简打印内容                  无

问题报告 https://github.com/SuperManito/LinuxMirrors/issues
  "
    }

    ## 判断参数
    while [ $# -gt 0 ]; do
        case "$1" in
        ## 指定 Docker CE 软件源地址
        --source)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        ## 指定 Docker Registry 仓库地址
        --source-registry)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_REGISTRY="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "镜像仓库地址"
            fi
            ;;
        ## 指定 Docker CE 软件源仓库
        --branch)
            if [ "$2" ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        ## 指定 Debian 版本代号
        --codename)
            if [ "$2" ]; then
                DEBIAN_CODENAME="$2"
                shift
            else
                command_error "$1" "版本代号"
            fi
            ;;
        ## 指定 Docker Engine 安装版本
        --designated-version)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "^[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}$"
                if [ $? -eq 0 ]; then
                    DESIGNATED_DOCKER_VERSION="$2"
                    shift
                else
                    command_error "$2" "有效的版本号"
                fi
            else
                command_error "$1" "版本号"
            fi
            ;;
        ## WEB 协议（HTTP/HTTPS）
        --protocol)
            if [ "$2" ]; then
                case "$2" in
                http | https | HTTP | HTTPS)
                    WEB_PROTOCOL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" " http 或 https "
                    ;;
                esac
            else
                ocommand_error "$1" " WEB 协议 (http/https) "
            fi
            ;;
        ## 使用内网地址
        --use-intranet-source)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_INTRANET_SOURCE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
            fi
            ;;
        ## 安装最新版本
        --install-latest | --install-latested)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    INSTALL_LATESTED_DOCKER="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
            fi
            ;;
        ## 忽略覆盖备份提示
        --ignore-backup-tips)
            IGNORE_BACKUP_TIPS="true"
            ;;
        ## 关闭防火墙
        --close-firewall)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLOSE_FIREWALL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
            fi
            ;;
        ## 清除屏幕上的所有内容
        --clean-screen)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLEAN_SCREEN="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
            fi
            ;;
        ## 仅更换镜像仓库模式
        --only-registry)
            ONLY_REGISTRY="true"
            ;;
        ## 纯净模式
        --pure-mode)
            PURE_MODE="true"
            ;;
        ## 命令帮助
        --help)
            output_command_help
            exit
            ;;
        *)
            command_error "$1"
            ;;
        esac
        shift
    done
    ## 设置部分功能的默认值
    IGNORE_BACKUP_TIPS="${IGNORE_BACKUP_TIPS:-"false"}"
    if [[ "${DESIGNATED_DOCKER_VERSION}" ]]; then
        INSTALL_LATESTED_DOCKER="false"
    fi
    PURE_MODE="${PURE_MODE:-"false"}"
}

function run_start() {
    if [ -z "${CLEAN_SCREEN}" ]; then
        [[ -z "${SOURCE}" || -z "${SOURCE_REGISTRY}" ]] && clear
    elif [ "${CLEAN_SCREEN}" == "true" ]; then
        clear
    fi
    if [[ "${PURE_MODE}" == "true" ]]; then
        return
    fi
    echo -e "+-----------------------------------+"
    echo -e "| \033[0;1;35;95m⡇\033[0m  \033[0;1;33;93m⠄\033[0m \033[0;1;32;92m⣀⡀\033[0m \033[0;1;36;96m⡀\033[0;1;34;94m⢀\033[0m \033[0;1;35;95m⡀⢀\033[0m \033[0;1;31;91m⡷\033[0;1;33;93m⢾\033[0m \033[0;1;32;92m⠄\033[0m \033[0;1;36;96m⡀⣀\033[0m \033[0;1;34;94m⡀\033[0;1;35;95m⣀\033[0m \033[0;1;31;91m⢀⡀\033[0m \033[0;1;33;93m⡀\033[0;1;32;92m⣀\033[0m \033[0;1;36;96m⢀⣀\033[0m |"
    echo -e "| \033[0;1;31;91m⠧\033[0;1;33;93m⠤\033[0m \033[0;1;32;92m⠇\033[0m \033[0;1;36;96m⠇⠸\033[0m \033[0;1;34;94m⠣\033[0;1;35;95m⠼\033[0m \033[0;1;31;91m⠜⠣\033[0m \033[0;1;33;93m⠇\033[0;1;32;92m⠸\033[0m \033[0;1;36;96m⠇\033[0m \033[0;1;34;94m⠏\033[0m  \033[0;1;35;95m⠏\033[0m  \033[0;1;33;93m⠣⠜\033[0m \033[0;1;32;92m⠏\033[0m  \033[0;1;34;94m⠭⠕\033[0m |"
    echo -e "+-----------------------------------+"
    echo -e "欢迎使用 Docker Engine 安装与换源脚本"
}

function run_end() {
    if [[ "${PURE_MODE}" == "true" ]]; then
        echo ''
        return
    fi
    echo -e "\n✨ 脚本运行完毕，更多使用教程详见官网 👉 \033[3mhttps://linuxmirrors.cn\033[0m"
    if [[ "${#SPONSOR_ADS[@]}" -gt 0 ]]; then
        echo -e "\n\033[2m【赞助商广告】\033[0m"
        for ad in "${SPONSOR_ADS[@]}"; do
            sleep 0.1
            echo -e "  \033[2m${ad}\033[0m"
        done
    fi
    echo -e "\n\033[3;1mPowered by \033[34mLinuxMirrors\033[0m\n"
}

function output_error() {
    [ "$1" ] && echo -e "\n$ERROR $1\n"
    exit 1
}

function command_error() {
    local tmp_text="请确认后重新输入"
    if [[ "${2}" ]]; then
        tmp_text="请在该选项后指定${2}"
    fi
    output_error "命令选项 ${BLUE}$1${PLAIN} 无效，${tmp_text}！"
}

function unsupport_system_error() {
    local tmp_text=""
    if [[ "${2}" ]]; then
        tmp_text="，请参考如下命令自行安装：\n\n${BLUE}$2${PLAIN}"
    fi
    output_error "不支持当前操作系统（$1）${tmp_text}"
}

function input_error() {
    echo -e "\n$WARN 输入错误，$1！"
}

function command_exists() {
    command -v "$@" &>/dev/null
}

function permission_judgment() {
    if [ $UID -ne 0 ]; then
        output_error "权限不足，请使用 Root 用户运行本脚本"
    fi
}

function collect_system_info() {
    ## 定义系统名称
    SYSTEM_NAME="$(cat $File_LinuxRelease | grep -E "^NAME=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    grep -q "PRETTY_NAME=" $File_LinuxRelease && SYSTEM_PRETTY_NAME="$(cat $File_LinuxRelease | grep -E "^PRETTY_NAME=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    ## 定义系统版本号
    SYSTEM_VERSION_ID="$(cat $File_LinuxRelease | grep -E "^VERSION_ID=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%.*}"
    SYSTEM_VERSION_ID_MINOR="${SYSTEM_VERSION_ID#*.}"
    ## 定义系统ID
    SYSTEM_ID="$(cat $File_LinuxRelease | grep -E "^ID=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    ## 判定当前系统派系
    if [ -s "${File_DebianVersion}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_DEBIAN}"
    elif [ -s "${File_RedHatRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_REDHAT}"
    elif [ -s "${File_openEulerRelease}" ] || [ -s "${File_HuaweiCloudEulerOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENEULER}"
    elif [ -s "${File_OpenCloudOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENCLOUDOS}" # 自 9.0 版本起不再基于红帽
    elif [ -s "${File_AnolisOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ANOLISOS}" # 自 8.8 版本起不再基于红帽
    elif [ -s "${File_TencentOSServerRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_TENCENTOS}" # 自 4 版本起不再基于红帽
    elif [ -s "${File_openKylinVersion}" ]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "openKylin" "apt-get install -y docker\nsystemctl enable --now docker"
    elif [ -f "${File_ArchLinuxRelease}" ]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "Arch Linux" "pacman -S docker\nsystemctl enable --now docker"
    elif [ -f "${File_GentooRelease}" ]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "Gentoo"
    elif [[ "${SYSTEM_NAME}" == *"openSUSE"* ]]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "openSUSE" "zypper install docker\nsystemctl enable --now docker"
    elif [[ "${SYSTEM_NAME}" == *"NixOS"* ]]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "NixOS"
    else
        unsupport_system_error "未知的系统"
    fi
    ## 判定系统类型、版本、版本号
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        if ! command_exists lsb_release; then
            apt-get update
            apt-get install -y lsb-release
            if [ $? -ne 0 ]; then
                output_error "lsb-release 软件包安装失败\n\n本脚本依赖 lsb_release 指令判断系统具体类型和版本，当前系统可能为精简安装，请自行安装后重新执行脚本！"
            fi
        fi
        SYSTEM_JUDGMENT="$(lsb_release -is)"
        SYSTEM_VERSION_CODENAME="${DEBIAN_CODENAME:-"$(lsb_release -cs)"}"
        # Raspberry Pi OS
        if [ -s "${File_RaspberryPiOSRelease}" ]; then
            SYSTEM_JUDGMENT="${SYSTEM_RASPBERRY_PI_OS}"
            SYSTEM_PRETTY_NAME="${SYSTEM_RASPBERRY_PI_OS}"
        fi
        ;;
    "${SYSTEM_REDHAT}")
        SYSTEM_JUDGMENT="$(awk '{printf $1}' $File_RedHatRelease)"
        ## 特殊系统判断
        # Red Hat Enterprise Linux
        grep -q "${SYSTEM_RHEL}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_RHEL}"
        # CentOS Stream
        grep -q "${SYSTEM_CENTOS_STREAM}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_CENTOS_STREAM}"
        # Oracle Linux
        [ -s "${File_OracleLinuxRelease}" ] && SYSTEM_JUDGMENT="${SYSTEM_ORACLE}"
        ;;
    *)
        SYSTEM_JUDGMENT="${SYSTEM_FACTIONS}"
        ;;
    esac
    ## 判定系统处理器架构
    DEVICE_ARCH_RAW="$(uname -m)"
    case "${DEVICE_ARCH_RAW}" in
    x86_64)
        DEVICE_ARCH="x86_64"
        ;;
    aarch64)
        DEVICE_ARCH="ARM64"
        ;;
    armv8l)
        DEVICE_ARCH="ARMv8_32"
        ;;
    armv7l)
        DEVICE_ARCH="ARMv7"
        ;;
    armv6l)
        DEVICE_ARCH="ARMv6"
        ;;
    armv5tel)
        DEVICE_ARCH="ARMv5"
        ;;
    ppc64le)
        DEVICE_ARCH="ppc64le"
        ;;
    s390x)
        DEVICE_ARCH="s390x"
        ;;
    i386 | i686)
        output_error "Docker Engine 不支持安装在 x86_32 架构的环境上！"
        ;;
    *)
        output_error "未知的系统架构：${DEVICE_ARCH_RAW}"
        ;;
    esac
    ## 定义软件源仓库名称
    if [[ -z "${SOURCE_BRANCH}" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_DEBIAN}")
                SOURCE_BRANCH="debian"
                ;;
            "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
                SOURCE_BRANCH="ubuntu"
                ;;
            "${SYSTEM_RASPBERRY_PI_OS}")
                case "${DEVICE_ARCH_RAW}" in
                x86_64 | aarch64)
                    SOURCE_BRANCH="debian"
                    ;;
                *)
                    SOURCE_BRANCH="raspbian"
                    ;;
                esac
                ;;
            *)
                # 部分 Debian 系衍生操作系统使用 Debian 12 的 docker ce 源
                SOURCE_BRANCH="debian"
                SYSTEM_VERSION_CODENAME="bookworm"
                ;;
            esac
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_FEDORA}")
                SOURCE_BRANCH="fedora"
                ;;
            "${SYSTEM_RHEL}")
                SOURCE_BRANCH="rhel"
                # RHEL 10
                if [[ "${SYSTEM_VERSION_ID_MAJOR}" == 10 ]]; then
                    echo -e "\n$WARN 当前采用 centos 分支（红帽衍生操作系统安装方式）进行安装，可能存在某些无法预料的兼容性问题！"
                    echo -e "\n$TIP Docker 官方尚未支持 RHEL 10 且红帽官方已将 Docker 从注册软件源中移除并默认使用 Podman。"
                    SOURCE_BRANCH="centos"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos"
                ;;
            esac
            if [[ "${DEVICE_ARCH_RAW}" == "s390x" ]]; then
                output_error "请查阅 RHEL 发行版声明以了解 s390x 支持"
            fi
            ;;
        esac
    fi
    ## 定义软件源更新文字
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        SYNC_MIRROR_TEXT="更新软件源"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        SYNC_MIRROR_TEXT="生成软件源缓存"
        ;;
    esac
    ## 判断是否可以使用高级交互式选择器
    CAN_USE_ADVANCED_INTERACTIVE_SELECTION="false"
    if command_exists tput; then
        CAN_USE_ADVANCED_INTERACTIVE_SELECTION="true"
    fi
}

function choose_mirrors() {
    ## 打印软件源列表
    function print_mirrors_list() {
        local tmp_mirror_name tmp_mirror_url arr_num default_mirror_name_length tmp_mirror_name_length tmp_spaces_nums a i j
        ## 计算字符串长度
        function StringLength() {
            local text=$1
            echo "${#text}"
        }
        echo -e ''

        local list_arr=()
        local list_arr_sum="$(eval echo \${#$1[@]})"
        for ((a = 0; a < $list_arr_sum; a++)); do
            list_arr[$a]="$(eval echo \${$1[a]})"
        done
        if command_exists printf; then
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                tmp_mirror_name=$(echo "${list_arr[i]}" | awk -F '@' '{print$1}') # 软件源名称
                # tmp_mirror_url=$(echo "${list_arr[i]}" | awk -F '@' '{print$2}') # 软件源地址
                arr_num=$((i + 1))
                default_mirror_name_length=${2:-"30"} # 默认软件源名称打印长度
                ## 补齐长度差异（中文的引号在等宽字体中占1格而非2格）
                [[ $(echo "${tmp_mirror_name}" | grep -c "“") -gt 0 ]] && let default_mirror_name_length+=$(echo "${tmp_mirror_name}" | grep -c "“")
                [[ $(echo "${tmp_mirror_name}" | grep -c "”") -gt 0 ]] && let default_mirror_name_length+=$(echo "${tmp_mirror_name}" | grep -c "”")
                [[ $(echo "${tmp_mirror_name}" | grep -c "‘") -gt 0 ]] && let default_mirror_name_length+=$(echo "${tmp_mirror_name}" | grep -c "‘")
                [[ $(echo "${tmp_mirror_name}" | grep -c "’") -gt 0 ]] && let default_mirror_name_length+=$(echo "${tmp_mirror_name}" | grep -c "’")
                # 非一般字符长度
                tmp_mirror_name_length=$(StringLength $(echo "${tmp_mirror_name}" | sed "s| ||g" | sed "s|[0-9a-zA-Z\.\=\:\_\(\)\'\"-\/\!·]||g;"))
                ## 填充空格
                tmp_spaces_nums=$(($(($default_mirror_name_length - ${tmp_mirror_name_length} - $(StringLength "${tmp_mirror_name}"))) / 2))
                for ((j = 1; j <= ${tmp_spaces_nums}; j++)); do
                    tmp_mirror_name="${tmp_mirror_name} "
                done
                printf "❖  %-$(($default_mirror_name_length + ${tmp_mirror_name_length}))s %4s\n" "${tmp_mirror_name}" "$arr_num)"
            done
        else
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                tmp_mirror_name="${list_arr[i]%@*}" # 软件源名称
                tmp_mirror_url="${list_arr[i]#*@}"  # 软件源地址
                arr_num=$((i + 1))
                echo -e " ❖  $arr_num. ${tmp_mirror_url} | ${tmp_mirror_name}"
            done
        fi
    }

    ## 选择使用软件源内网地址
    function choose_use_intranet_address() {
        local ask_text="默认使用软件源的公网地址，是否继续?"
        local intranet_source
        for ((i = 0; i < ${#mirror_list_extranet[@]}; i++)); do
            if [[ "${SOURCE}" == "${mirror_list_extranet[i]}" ]]; then
                intranet_source="${mirror_list_intranet[i]}"
                ONLY_HTTP="true" # 强制使用 HTTP 协议
                break
            else
                continue
            fi
        done
        if [[ -z "${USE_INTRANET_SOURCE}" ]]; then
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    SOURCE="${intranet_source}"
                    [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN 已切换至内网专用地址，仅限在特定环境下使用！"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    SOURCE="${intranet_source}"
                    [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN 已切换至内网专用地址，仅限在特定环境下使用！"
                    ;;
                *)
                    input_error "默认不使用内网地址"
                    ;;
                esac
            fi
        elif [[ "${USE_INTRANET_SOURCE}" == "true" ]]; then
            SOURCE="${intranet_source}"
        fi
    }

    function print_title() {
        local system_name="${SYSTEM_PRETTY_NAME:-"${SYSTEM_NAME} ${SYSTEM_VERSION_ID}"}"
        local arch="${DEVICE_ARCH}"
        local date_time time_zone
        date_time="$(date "+%Y-%m-%d %H:%M")"
        timezone="$(timedatectl status 2>/dev/null | grep "Time zone" | awk -F ':' '{print$2}' | awk -F ' ' '{print$1}')"

        echo -e ''
        echo -e "运行环境 ${BLUE}${system_name} ${arch}${PLAIN}"
        echo -e "系统时间 ${BLUE}${date_time} ${timezone}${PLAIN}"
    }

    [[ "${PURE_MODE}" != "true" ]] && print_title

    local mirror_list_name
    if [[ -z "${SOURCE}" ]] && [[ "${ONLY_REGISTRY}" != "true" ]]; then
        mirror_list_name="mirror_list_docker_ce"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            sleep 1 >/dev/null 2>&1
            eval "interactive_select_mirror \"\${${mirror_list_name}[@]}\" \"\\n \${BOLD}请选择你想使用的 Docker CE 源：\${PLAIN}\\n\""
            SOURCE="${_SELECT_RESULT#*@}"
            echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}Docker CE: ${_SELECT_RESULT%@*}${PLAIN}"
        else
            print_mirrors_list "${mirror_list_name}" 38
            local CHOICE_B=$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的 Docker CE 源 [ 1-$(eval echo \${#$mirror_list_name[@]}) ]：${PLAIN}")
            while true; do
                read -p "${CHOICE_B}" INPUT
                case "${INPUT}" in
                [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
                    local tmp_source="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]})"
                    if [[ -z "${tmp_source}" ]]; then
                        echo -e "\n$WARN 请输入有效的数字序号！"
                    else
                        SOURCE="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]} | awk -F '@' '{print$2}')"
                        break
                    fi
                    ;;
                *)
                    echo -e "\n$WARN 请输入数字序号以选择你想使用的软件源！"
                    ;;
                esac
            done
        fi
    fi

    ## 选择软件源内网地址
    if [[ "${mirror_list_extranet[*]}" =~ (^|[^[:alpha:]])"${SOURCE}"([^[:alpha:]]|$) ]]; then
        choose_use_intranet_address
    fi

    if [[ -z "${SOURCE_REGISTRY}" ]]; then
        mirror_list_name="mirror_list_registry"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            sleep 1 >/dev/null 2>&1
            eval "interactive_select_mirror \"\${${mirror_list_name}[@]}\" \"\\n \${BOLD}请选择你想使用的 Docker Registry 源：\${PLAIN}\\n\""
            SOURCE_REGISTRY="${_SELECT_RESULT#*@}"
            echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}Docker Registry: $(echo "${_SELECT_RESULT%@*}" | sed 's|（推荐）||g')${PLAIN}"
        else
            print_mirrors_list "${mirror_list_name}" 44
            local CHOICE_C=$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的 Docker Registry 源 [ 1-$(eval echo \${#$mirror_list_name[@]}) ]：${PLAIN}")
            while true; do
                read -p "${CHOICE_C}" INPUT
                case "${INPUT}" in
                [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
                    local tmp_source="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]})"
                    if [[ -z "${tmp_source}" ]]; then
                        echo -e "\n$WARN 请输入有效的数字序号！"
                    else
                        SOURCE_REGISTRY="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]} | awk -F '@' '{print$2}')"
                        break
                    fi
                    ;;
                *)
                    echo -e "\n$WARN 请输入数字序号以选择你想使用的软件源！"
                    ;;
                esac
            done
        fi
    fi
}

## 选择同步或更新软件源所使用的 WEB 协议（ HTTP/HTTPS）
function choose_protocol() {
    if [[ -z "${WEB_PROTOCOL}" ]]; then
        if [[ "${ONLY_HTTP}" == "true" ]]; then
            WEB_PROTOCOL="http"
        else
            local ask_text="软件源是否使用 HTTP 协议?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "true" ]]; then
                    WEB_PROTOCOL="http"
                else
                    WEB_PROTOCOL="https"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss])
                    WEB_PROTOCOL="http"
                    ;;
                [Nn] | [Nn][Oo])
                    WEB_PROTOCOL="https"
                    ;;
                *)
                    input_error "默认使用 HTTPS 协议"
                    WEB_PROTOCOL="https"
                    ;;
                esac
            fi
        fi
    fi
    WEB_PROTOCOL="${WEB_PROTOCOL,,}"
}

## 关闭防火墙和SELinux
function close_firewall_service() {
    if ! command_exists systemctl; then
        return
    fi
    if [[ "$(systemctl is-active firewalld)" == "active" ]]; then
        if [[ -z "${CLOSE_FIREWALL}" ]]; then
            local ask_text="是否关闭系统防火墙和 SELinux ?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "true" ]]; then
                    CLOSE_FIREWALL="true"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss])
                    CLOSE_FIREWALL="true"
                    ;;
                [Nn] | [Nn][Oo]) ;;
                *)
                    input_error "默认不关闭"
                    ;;
                esac
            fi
        fi
        if [[ "${CLOSE_FIREWALL}" == "true" ]]; then
            local SelinuxConfig=/etc/selinux/config
            systemctl disable --now firewalld >/dev/null 2>&1
            [ -s "${SelinuxConfig}" ] && sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" $SelinuxConfig && setenforce 0 >/dev/null 2>&1
        fi
    fi
}

## 安装环境包
function install_dependency_packages() {
    local commands package_manager
    ## 删除原有源
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        sed -i '/docker-ce/d' $File_AptSourceList
        rm -rf $File_DockerSourceList
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        rm -rf $Dir_YumRepos/*docker*.repo
        ;;
    esac
    ## 更新软件源
    commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        package_manager="apt-get"
        commands+=("${package_manager} update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        package_manager="$(get_package_manager)"
        commands+=("${package_manager} makecache")
        ;;
    esac
    if [[ "${PURE_MODE}" == "true" ]]; then
        local exec_cmd=""
        for cmd in "${commands[@]}"; do
            if [[ -z "${exec_cmd}" ]]; then
                exec_cmd="${cmd}"
            else
                exec_cmd="${exec_cmd} ; ${cmd}"
            fi
        done
        echo ''
        animate_exec "${exec_cmd}" "${SYNC_MIRROR_TEXT}"
    else
        echo -e "\n$WORKING ${SYNC_MIRROR_TEXT}...\n"
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
        echo -e "\n$COMPLETE ${SYNC_MIRROR_TEXT}结束\n"
    fi
    if [ $? -ne 0 ]; then
        output_error "${SYNC_MIRROR_TEXT}出错，请先解决系统原有软件源错误以确保 ${BLUE}${package_manager}${PLAIN} 软件包管理工具可用！"
    fi

    commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        commands+=("${package_manager} install -y ca-certificates curl")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        # 注：红帽 8 版本才发布了 dnf 包管理工具
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        7)
            commands+=("${package_manager} install -y yum-utils device-mapper-persistent-data lvm2")
            ;;
        *)
            if [[ "${package_manager}" == "dnf" ]]; then
                commands+=("${package_manager} install -y dnf-plugins-core")
            else
                commands+=("${package_manager} install -y yum-utils device-mapper-persistent-data lvm2")
            fi
            ;;
        esac
        ;;
    esac
    if [[ "${PURE_MODE}" == "true" ]]; then
        local exec_cmd=""
        for cmd in "${commands[@]}"; do
            if [[ -z "${exec_cmd}" ]]; then
                exec_cmd="${cmd}"
            else
                exec_cmd="${exec_cmd} ; ${cmd}"
            fi
        done
        echo ''
        animate_exec "${exec_cmd}" "安装环境软件包"
    else
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
}

## 配置 Docker CE 源
function configure_docker_ce_mirror() {
    local commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        ## 处理 GPG 密钥
        local file_keyring="/etc/apt/keyrings/docker.asc"
        apt-key del 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 >/dev/null 2>&1 # 删除旧的密钥
        [ -f "${file_keyring}" ] && rm -rf $file_keyring
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL "${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH}/gpg" -o $file_keyring >/dev/null
        if [ $? -ne 0 ]; then
            output_error "GPG 密钥下载失败，请检查网络或更换 Docker CE 软件源后重试！"
        fi
        chmod a+r $file_keyring
        ## 添加源
        echo "deb [arch=$(dpkg --print-architecture) signed-by=${file_keyring}] ${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH} ${SYSTEM_VERSION_CODENAME} stable" | tee $File_DockerSourceList >/dev/null 2>&1
        commands+=("apt-get update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        local repo_file_url="${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH}/docker-ce.repo"
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        7)
            yum-config-manager -y --add-repo "${repo_file_url}"
            ;;
        *)
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
                dnf-3 config-manager -y --add-repo "${repo_file_url}"
            else
                local package_manager="$(get_package_manager)"
                if [[ "${package_manager}" == "dnf" ]]; then
                    dnf config-manager -y --add-repo "${repo_file_url}"
                else
                    yum-config-manager -y --add-repo "${repo_file_url}"
                fi
            fi
            ;;
        esac
        sed -e "s|https://download.docker.com|${WEB_PROTOCOL}://${SOURCE}|g" \
            -e "s|http[s]\?://.*/linux/${SOURCE_BRANCH}/|${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH}/|g" \
            -i \
            $File_DockerRepo
        ## 兼容处理版本号
        if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_FEDORA}" ]]; then
            local target_version
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            7 | 8 | 9 | 10)
                target_version="${SYSTEM_VERSION_ID_MAJOR}"
                ;;
            *)
                target_version="8" # 注：部分系统使用9版本分支会有兼容性问题
                ## 适配国产操作系统
                # OpenCloudOS、Anolis OS 的 23 版本
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_OPENCLOUDOS}" || "${SYSTEM_JUDGMENT}" == "${SYSTEM_ANOLISOS}" ]]; then
                    if [[ "${SYSTEM_VERSION_ID_MAJOR}" == 23 ]]; then
                        target_version="9"
                    fi
                fi
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_OPENEULER}" ]]; then
                    if [ -s "${File_HuaweiCloudEulerOSRelease}" ]; then
                        # Huawei Cloud EulerOS
                        case "${SYSTEM_VERSION_ID_MAJOR}" in
                        1)
                            target_version="8" # openEuler 20
                            ;;
                        2)
                            target_version="9" # openEuler 22
                            ;;
                        esac
                    else
                        # openEuler
                        if [[ "${SYSTEM_VERSION_ID_MAJOR}" -ge 22 ]]; then
                            target_version="9"
                        fi
                    fi
                fi
                # TencentOS Server
                if [ -s "${File_TencentOSServerRelease}" ]; then
                    case "${SYSTEM_VERSION_ID_MAJOR}" in
                    4)
                        target_version="9"
                        ;;
                    3)
                        target_version="8"
                        ;;
                    2)
                        target_version="7"
                        ;;
                    esac
                fi
                # Alibaba Cloud Linux
                if [ -s "${File_AnolisOSRelease}" ] && [ -s "${File_AlibabaCloudLinuxRelease}" ]; then
                    case "${SYSTEM_VERSION_ID_MAJOR}" in
                    3)
                        target_version="8"
                        ;;
                    2)
                        target_version="7"
                        ;;
                    esac
                fi
                ;;
            esac
            sed -i "s|\$releasever|${target_version}|g" $File_DockerRepo
            local package_manager="$(get_package_manager)"
            commands+=("${package_manager} makecache")
        fi
        ;;
    esac
    echo ''
    if [[ "${PURE_MODE}" == "true" ]]; then
        local exec_cmd=""
        for cmd in "${commands[@]}"; do
            if [[ -z "${exec_cmd}" ]]; then
                exec_cmd="${cmd}"
            else
                exec_cmd="${exec_cmd} ; ${cmd}"
            fi
        done
        animate_exec "${exec_cmd}" "${SYNC_MIRROR_TEXT}"
    else
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
}

## 安装 Docker Engine
function install_docker_engine() {
    ## 导出可安装的版本列表
    function export_version_list() {
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            apt-cache madison docker-ce | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCEVersionTmp
            apt-cache madison docker-ce-cli | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCECliVersionTmp
            grep -wf $File_DockerCEVersionTmp $File_DockerCECliVersionTmp >$File_DockerVersionTmp
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
            local package_manager="$(get_package_manager)"
            $package_manager list docker-ce --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCEVersionTmp
            $package_manager list docker-ce-cli --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCECliVersionTmp
            grep -wf $File_DockerCEVersionTmp $File_DockerCECliVersionTmp >$File_DockerVersionTmp
            ;;
        esac
        rm -rf $File_DockerCEVersionTmp $File_DockerCECliVersionTmp
    }

    ## 卸载 Docker Engine 原有版本软件包
    function uninstall_original_version() {
        if command_exists docker; then
            # 先停止并禁用 Docker 服务
            systemctl disable --now docker >/dev/null 2>&1
            sleep 2s
        fi
        # 确定需要卸载的软件包
        local package_list
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            package_list='docker* podman podman-docker containerd runc'
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
            package_list='docker* podman podman-docker runc'
            ;;
        esac
        # 卸载软件包并清理残留
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            apt-get remove -y $package_list >/dev/null 2>&1
            apt-get autoremove -y >/dev/null 2>&1
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
            local package_manager="$(get_package_manager)"
            $package_manager remove -y $package_list >/dev/null 2>&1
            $package_manager autoremove -y >/dev/null 2>&1
            ;;
        esac
    }

    ## 安装
    function install_main() {
        local target_docker_version
        local pkgs=""
        local commands=()
        if [[ "${INSTALL_LATESTED_DOCKER}" == "true" ]]; then
            pkgs="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
        else
            export_version_list
            if [ ! -s "${File_DockerVersionTmp}" ]; then
                rm -rf $File_DockerVersionTmp
                output_error "查询 Docker Engine 版本列表失败！"
            fi
            if [[ "${DESIGNATED_DOCKER_VERSION}" ]]; then
                cat $File_DockerVersionTmp | grep -Eq "^${DESIGNATED_DOCKER_VERSION}$"
                if [ $? -ne 0 ]; then
                    rm -rf $File_DockerVersionTmp
                    output_error "指定的 Docker Engine 版本不存在或不支持安装！"
                fi
                target_docker_version="${DESIGNATED_DOCKER_VERSION}"
            else
                if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                    local version_list=(
                        $(cat $File_DockerVersionTmp | sort -t '.' -k1,1nr -k2,2nr -k3,3nr | tr '\n' ' ' | sed 's/ $//')
                    )
                    local mirror_list_name="version_list"
                    eval "interactive_select_mirror \"\${${mirror_list_name}[@]}\" \"\\n \${BOLD}请选择你想安装的版本：\${PLAIN}\\n\""
                    target_docker_version="${_SELECT_RESULT}"
                    echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}指定安装版本：${target_docker_version}${PLAIN}\n"
                else
                    echo -e "\n${GREEN} --------- 请选择你要安装的版本，如：28.3.0 ---------- ${PLAIN}\n"
                    cat $File_DockerVersionTmp
                    while true; do
                        local CHOICE=$(echo -e "\n${BOLD}└─ 请根据上面的列表，选择并输入你想要安装的具体版本号：${PLAIN}\n")
                        read -p "${CHOICE}" target_docker_version
                        echo ''
                        cat $File_DockerVersionTmp | grep -Eqw "${target_docker_version}"
                        if [ $? -eq 0 ]; then
                            echo "${target_docker_version}" | grep -Eqw '[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}'
                            if [ $? -eq 0 ]; then
                                break
                            else
                                echo -e "$ERROR 请输入正确的版本号！"
                            fi
                        else
                            echo -e "$ERROR 输入错误请重新输入！"
                        fi
                    done
                fi
            fi
            rm -rf $File_DockerVersionTmp
            local major_version="$(echo ${target_docker_version} | cut -d'.' -f1)"
            local minor_version="$(echo ${target_docker_version} | cut -d'.' -f2)"
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}")
                if [[ $major_version -gt 18 ]] || [[ $major_version -eq 18 && $minor_version -ge 9 ]]; then
                    local tmp_version="$(apt-cache madison docker-ce-cli | grep "${target_docker_version}" | head -1 | awk '{print $3}' | awk -F "${target_docker_version}" '{print$1}')"
                    pkgs="docker-ce=${tmp_version}${target_docker_version}* docker-ce-cli=${tmp_version}${target_docker_version}*"
                else
                    pkgs="docker-ce=${target_docker_version}* docker-ce-cli=${target_docker_version}*"
                fi
                ;;

            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
                pkgs="docker-ce-${target_docker_version}"
                if [[ $major_version -gt 18 ]] || [[ $major_version -eq 18 && $minor_version -ge 9 ]]; then
                    pkgs="${pkgs} docker-ce-cli-${target_docker_version}"
                fi
                ;;
            esac
            pkgs="${pkgs} containerd.io"
            if [[ $major_version -gt 20 ]] || [[ $major_version -eq 20 && $minor_version -ge 10 ]]; then
                pkgs="${pkgs} docker-compose-plugin"
            fi
            if [[ $major_version -ge 23 ]]; then
                pkgs="${pkgs} docker-buildx-plugin"
            fi
        fi
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            commands+=("apt-get install -y ${pkgs}")
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
            commands+=("$(get_package_manager) install -y ${pkgs}")
            ;;
        esac
        if [[ "${PURE_MODE}" == "true" ]]; then
            local exec_cmd=""
            for cmd in "${commands[@]}"; do
                if [[ -z "${exec_cmd}" ]]; then
                    exec_cmd="${cmd}"
                else
                    exec_cmd="${exec_cmd} ; ${cmd}"
                fi
            done
            animate_exec "${exec_cmd}" "安装 Docker Engine"
        else
            for cmd in "${commands[@]}"; do
                eval "${cmd}"
            done
        fi
        [ $? -ne 0 ] && output_error "安装 Docker Engine 失败！"
    }

    ## 判断是否手动选择安装版本
    if [[ -z "${INSTALL_LATESTED_DOCKER}" ]]; then
        local ask_text="是否安装最新版本的 Docker Engine ?"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "true" ]]; then
                INSTALL_LATESTED_DOCKER="true"
            else
                INSTALL_LATESTED_DOCKER="false"
            fi
        else
            local CHOICE_A="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -p "${CHOICE_A}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case $INPUT in
            [Yy] | [Yy][Ee][Ss])
                INSTALL_LATESTED_DOCKER="true"
                ;;
            [Nn] | [Nn][Oo])
                INSTALL_LATESTED_DOCKER="false"
                ;;
            *)
                INSTALL_LATESTED_DOCKER="true"
                input_error "默认安装最新版本"
                ;;
            esac
        fi
        echo ''
    fi

    ## 判定是否已安装
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        dpkg -l | grep docker-ce-cli -q
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        rpm -qa | grep docker-ce-cli -q
        ;;
    esac
    if [ $? -eq 0 ]; then
        export_version_list
        local current_docker_version="$(docker -v | grep -Eo "[0-9][0-9]\.[0-9]{1,2}\.[0-9]{1,2}")"
        local latest_docker_version="$(cat $File_DockerVersionTmp | head -n 1)"
        rm -rf $File_DockerVersionTmp
        if [[ "${current_docker_version}" == "${latest_docker_version}" ]] && [[ "${INSTALL_LATESTED_DOCKER}" == "true" ]]; then
            echo -e "\n$TIP 检测到系统已安装 Docker Engine 且是最新版本，跳过安装"
        else
            uninstall_original_version
            install_main
        fi
    else
        uninstall_original_version
        install_main
    fi
}

## 修改 Docker Registry 镜像仓库源
function change_docker_registry_mirror() {
    ## 使用官方 Docker Hub
    if [[ "${REGISTRY_SOURCEL}" == "registry.hub.docker.com" ]]; then
        if [ -s "${File_DockerConfig}" ]; then
            ## 安装 jq
            local package_manager="$(get_package_manager)"
            $package_manager install -y jq
            if command_exists jq; then
                jq 'del(.["registry-mirrors"])' $File_DockerConfig >$File_DockerConfig.tmp && mv $File_DockerConfig.tmp $File_DockerConfig
                # 重启服务
                systemctl daemon-reload
                if [[ "$(systemctl is-active docker 2>/dev/null)" == "active" ]]; then
                    systemctl restart docker
                fi
            else
                echo -e "\n${WARN} 请自行删除 $File_DockerConfig 中的 ${BLUE}registry-mirrors${PLAIN} 配置并重启服务 ${BLUE}systemctl daemon-reload && systemctl restart docker${PLAIN}\n"
            fi
        fi
        return
    fi
    ## 备份原有配置文件
    if [ -d "${Dir_Docker}" ] && [ -e "${File_DockerConfig}" ]; then
        if [ -e "${File_DockerConfigBackup}" ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                local ask_text="检测到已备份的 Docker 配置文件，是否跳过覆盖备份?"
                if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                    echo ''
                    interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                    if [[ "${_SELECT_RESULT}" == "false" ]]; then
                        echo ''
                        cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
                    fi
                else
                    local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                    read -p "${CHOICE_BACKUP}" INPUT
                    [[ -z "${INPUT}" ]] && INPUT=Y
                    case $INPUT in
                    [Yy] | [Yy][Ee][Ss]) ;;
                    [Nn] | [Nn][Oo])
                        echo ''
                        cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
                        ;;
                    *)
                        input_error "默认不覆盖"
                        ;;
                    esac
                fi
            fi
        else
            echo ''
            cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
            echo -e "\n$COMPLETE 已备份原有 Docker 配置文件"
        fi
        sleep 2s
    else
        mkdir -p $Dir_Docker >/dev/null 2>&1
        touch $File_DockerConfig
    fi

    echo -e '{\n  "registry-mirrors": ["https://'"${SOURCE_REGISTRY}"'"]\n}' >$File_DockerConfig
    ## 重启服务
    systemctl daemon-reload
    if [[ "$(systemctl is-active docker 2>/dev/null)" == "active" ]]; then
        systemctl restart docker
    fi
}

## 仅修改 Docker Registry 镜像仓库源模式
function only_change_docker_registry_mirror() {
    ## 判定是否已安装
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        dpkg -l | grep docker-ce-cli -q
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        rpm -qa | grep docker-ce-cli -q
        ;;
    esac
    if [ $? -ne 0 ]; then
        ## 仅镜像仓库换源模式
        if [[ "${ONLY_REGISTRY}" == "true" ]]; then
            output_error "当前尚未安装 Docker Engine，请取消设置 ${BLUE}--only-registry${PLAIN} 命令选项后重新执行脚本！"
        fi
    fi

    [ -d "${Dir_Docker}" ] || mkdir -p "${Dir_Docker}"
    if [ -s "${File_DockerConfig}" ]; then
        ## 安装 jq
        if ! command_exists jq; then
            ## 更新软件源
            local package_manager
            local commands=()
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}")
                package_manager="apt-get"
                commands+=("${package_manager} update")
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
                package_manager="$(get_package_manager)"
                commands+=("${package_manager} makecache")
                ;;
            esac
            if [[ "${PURE_MODE}" == "true" ]]; then
                local exec_cmd=""
                for cmd in "${commands[@]}"; do
                    if [[ -z "${exec_cmd}" ]]; then
                        exec_cmd="${cmd}"
                    else
                        exec_cmd="${exec_cmd} ; ${cmd}"
                    fi
                done
                echo ''
                animate_exec "${exec_cmd}" "${SYNC_MIRROR_TEXT}"
            else
                echo -e "\n$WORKING ${SYNC_MIRROR_TEXT}...\n"
                for cmd in "${commands[@]}"; do
                    eval "${cmd}"
                done
                echo -e "\n$COMPLETE ${SYNC_MIRROR_TEXT}结束\n"
            fi
            if [ $? -ne 0 ]; then
                output_error "${SYNC_MIRROR_TEXT}出错，请先解决系统原有软件源错误以确保 ${BLUE}${package_manager}${PLAIN} 软件包管理工具可用！"
            fi
            $package_manager install -y jq
            if ! command_exists jq; then
                output_error "软件包 ${BLUE}jq${PLAIN} 安装失败，请自行安装后重新运行脚本！"
            fi
        fi
        [ -s "${File_DockerConfig}" ] || echo "{}" >$File_DockerConfig
        jq '.["registry-mirrors"] = ["https://'"${SOURCE_REGISTRY}"'"]' $File_DockerConfig >$File_DockerConfig.tmp && mv $File_DockerConfig.tmp $File_DockerConfig
    else
        echo -e '{\n  "registry-mirrors": ["https://'"${SOURCE_REGISTRY}"'"]\n}' >$File_DockerConfig
    fi

    echo -e "\n${BLUE}\$${PLAIN} docker info --format '{{json .RegistryConfig.Mirrors}}'"
    echo -e "\n${GREEN}➜${PLAIN}  $(docker info --format '{{json .RegistryConfig.Mirrors}}')"
    ## 重启服务
    systemctl daemon-reload
    if [[ "$(systemctl is-active docker 2>/dev/null)" == "active" ]]; then
        systemctl restart docker
    fi
    if [[ "${PURE_MODE}" != "true" ]]; then
        echo -e "\n$COMPLETE 已更换镜像仓库"
    fi
}

## 查看版本并验证安装结果
function check_installed_result() {
    if command_exists docker; then
        systemctl enable --now docker >/dev/null 2>&1
        echo -en "\n当前安装版本："
        docker -v
        if [ $? -eq 0 ]; then
            echo -e "              $(docker compose version 2>&1)"
            # echo -e "\n$COMPLETE 安装完成"
        else
            echo -e "\n$FAIL 安装失败"
            local source_file package_manager
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}")
                source_file="${File_DockerSourceList}"
                package_manager="apt-get"
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
                source_file="${File_DockerRepo}"
                package_manager="$(get_package_manager)"
                ;;
            esac
            echo -e "\n检查源文件：cat ${source_file}"
            echo -e "请尝试手动执行安装命令：${package_manager} install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin\n"
            exit 1
        fi
        if [[ "$(systemctl is-active docker 2>/dev/null)" != "active" ]]; then
            sleep 2
            systemctl disable --now docker >/dev/null 2>&1
            sleep 2
            systemctl enable --now docker >/dev/null 2>&1
            sleep 2
            if [[ "$(systemctl is-active docker)" != "active" ]]; then
                echo -e "\n$WARN 检测到 Docker 服务启动${RED}异常${PLAIN}，可尝试再次执行本脚本重试"
                local start_cmd
                if command_exists systemctl; then
                    start_cmd="systemctl start docker"
                else
                    start_cmd="service docker start"
                fi
                echo -e "\n$TIP 请执行 ${BLUE}${start_cmd}${PLAIN} 命令尝试启动或自行查询错误原因"
            fi
        fi
    else
        echo -e "\n$FAIL 安装失败"
    fi
}

## 选择系统包管理器
function get_package_manager() {
    local command="yum"
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}" | "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMALINUX}" | "${SYSTEM_ORACLE}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        9 | 10)
            command="dnf"
            ;;
        esac
        ;;
    "${SYSTEM_FEDORA}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}")
        command="dnf"
        ;;
    esac
    echo "${command}"
}

function interactive_select_mirror() {
    _SELECT_RESULT=""
    local options=("$@")
    local message="${options[${#options[@]} - 1]}"
    unset options[${#options[@]}-1]
    local selected=0
    local start=0
    local page_size=$(($(tput lines 2>/dev/null) - 3))
    function clear_menu() {
        tput rc 2>/dev/null
        for ((i = 0; i < ${#options[@]} + 1; i++)); do
            echo -e "\r\033[K"
        done
        tput rc 2>/dev/null
    }
    function cleanup() {
        clear_menu
        tput rc 2>/dev/null
        tput cnorm 2>/dev/null
        tput rmcup 2>/dev/null
        echo -e "\n\033[1;44m 提示 \033[0m \033[31m操作已取消\033[0m\n"
        exit 130
    }
    function draw_menu() {
        tput clear 2>/dev/null
        tput cup 0 0 2>/dev/null
        echo -e "${message}"
        local end=$((start + page_size - 1))
        if [ $end -ge ${#options[@]} ]; then
            end=${#options[@]}-1
        fi
        for ((i = start; i <= end; i++)); do
            if [ "$i" -eq "$selected" ]; then
                echo -e "\e[34;4m➤ ${options[$i]%@*}\e[0m"
            else
                echo -e "  ${options[$i]%@*}"
            fi
        done
    }
    function read_key() {
        IFS= read -rsn1 key
        if [[ $key == $'\x1b' ]]; then
            IFS= read -rsn2 key
            key="$key"
        fi
        echo "$key"
    }
    tput smcup 2>/dev/null
    tput sc 2>/dev/null
    tput civis 2>/dev/null
    trap "cleanup" INT TERM
    draw_menu
    while true; do
        key=$(read_key)
        case "$key" in
        "[A" | "w" | "W")
            if [ "$selected" -gt 0 ]; then
                selected=$((selected - 1))
                if [ "$selected" -lt "$start" ]; then
                    start=$((start - 1))
                fi
            fi
            ;;
        "[B" | "s" | "S")
            if [ "$selected" -lt $((${#options[@]} - 1)) ]; then
                selected=$((selected + 1))
                if [ "$selected" -ge $((start + page_size)) ]; then
                    start=$((start + 1))
                fi
            fi
            ;;
        "")
            tput rmcup
            break
            ;;
        *) ;;
        esac
        draw_menu
    done
    tput cnorm 2>/dev/null
    tput rmcup 2>/dev/null
    _SELECT_RESULT="${options[$selected]}"
}

function interactive_select_boolean() {
    _SELECT_RESULT=""
    local selected=0
    local message="$1"
    local menu_height=3
    local original_line
    function store_position() {
        original_line=$(tput lines 2>/dev/null)
    }
    function clear_menu() {
        for ((i = 0; i < ${menu_height}; i++)); do
            tput cuu1 2>/dev/null
            tput el 2>/dev/null
        done
    }
    function cleanup() {
        clear_menu
        tput cnorm 2>/dev/null
        echo -e "\n\033[1;44m 提示 \033[0m \033[31m操作已取消\033[0m\n"
        exit 130
    }
    function draw_menu() {
        echo -e "╭─ ${message}"
        echo -e "│"
        if [ "$selected" -eq 0 ]; then
            echo -e "╰─ \033[34m●\033[0m 是\033[2m / ○ 否\033[0m"
        else
            echo -e "╰─ \033[2m○ 是 / \033[0m\033[34m●\033[0m 否"
        fi
    }
    function read_key() {
        IFS= read -rsn1 key
        if [[ $key == $'\x1b' ]]; then
            IFS= read -rsn2 key
            key="$key"
        fi
        echo "$key"
    }
    tput civis 2>/dev/null
    store_position
    trap "cleanup" INT TERM
    draw_menu
    while true; do
        key=$(read_key)
        case "$key" in
        "[D" | "a" | "A")
            if [ "$selected" -gt 0 ]; then
                selected=$((selected - 1))
                clear_menu
                draw_menu
            fi
            ;;
        "[C" | "d" | "D")
            if [ "$selected" -lt 1 ]; then
                selected=$((selected + 1))
                clear_menu
                draw_menu
            fi
            ;;
        "")
            clear_menu
            break
            ;;
        *) ;;
        esac
    done
    echo -e "╭─ ${message}"
    echo -e "│"
    if [ "$selected" -eq 0 ]; then
        echo -e "╰─ \033[32m●\033[0m \033[1m是\033[0m\033[2m / ○ 否\033[0m"
        _SELECT_RESULT="true"
    else
        echo -e "╰─ \033[2m○ 是 / \033[0m\033[32m●\033[0m \033[1m否\033[0m"
        _SELECT_RESULT="false"
    fi
    tput cnorm 2>/dev/null
}

function animate_exec() {
    local cmd="$1"
    local title="$2"
    local max_lines=${3:-5}
    local spinner_style="${4:-dots}"
    local refresh_rate="${5:-0.1}"
    local -A spinners=([dots]="⠋ ⠙ ⠹ ⠸ ⠼ ⠴ ⠦ ⠧ ⠇ ⠏" [circle]="◐ ◓ ◑ ◒" [classic]="-\\ |/")
    local -A recommended_rates=([dots]="0.08" [circle]="0.12" [classic]="0.12")
    [[ -z "${spinners[$spinner_style]}" ]] && spinner_style="dots"
    [[ "${refresh_rate}" == "0.1" ]] && refresh_rate="${recommended_rates[$spinner_style]}"
    local term_width=$(tput cols 2>/dev/null || echo 80)
    local display_width=$((term_width - 2))
    function simple_truncate() {
        local line="$1"
        local truncate_marker="..."
        local max_length=$((display_width - 3))
        if [[ "${line}" =~ ^[[:ascii:]]*$ && ${#line} -le $display_width ]]; then
            echo "${line}"
            return
        fi
        local non_ascii_count=$(echo "${line// /}" | sed "s|[0-9a-zA-Z\.\=\:\_\(\)\'\"-\/\!·]||g;" | wc -m)
        local total_length=${#line}
        local display_length=$((total_length + non_ascii_count))
        local quote_count=0
        [[ $(echo "${line}" | grep -c "“") -gt 0 ]] && quote_count=$((quote_count + $(echo "${line}" | grep -c "“")))
        [[ $(echo "${line}" | grep -c "”") -gt 0 ]] && quote_count=$((quote_count + $(echo "${line}" | grep -c "”")))
        [[ $(echo "${line}" | grep -c "‘") -gt 0 ]] && quote_count=$((quote_count + $(echo "${line}" | grep -c "‘")))
        [[ $(echo "${line}" | grep -c "’") -gt 0 ]] && quote_count=$((quote_count + $(echo "${line}" | grep -c "’")))
        display_length=$((display_length - quote_count))
        if [[ $display_length -le $display_width ]]; then
            echo "$line"
            return
        fi
        local result=""
        local current_width=0
        local i=0
        while [ $i -lt ${#line} ]; do
            local char="${line:$i:1}"
            local char_width=1
            if ! [[ "$char" =~ [0-9a-zA-Z\.\=\:\_\(\)\'\"-\/\!·] ]]; then
                if [[ "$char" != "“" && "$char" != "”" && "$char" != "‘" && "$char" != "’" ]]; then
                    char_width=2
                fi
            fi
            if [[ $((current_width + char_width)) -gt $max_length ]]; then
                echo "${result}${truncate_marker}"
                return
            fi
            result+="${char}"
            current_width=$((current_width + char_width))
            ((i++))
        done
        echo "${line}"
    }
    function cleanup() {
        [ -f "${temp_file}" ] && rm -f "${temp_file}"
        tput cnorm 2>/dev/null
        echo -e "\n\033[1;44m 提示 \033[0m \033[31m操作已取消\033[0m\n"
        exit 130
    }
    function make_temp_file() {
        local temp_dirs=("." "/tmp")
        local tmp_file=""
        for dir in "${temp_dirs[@]}"; do
            [[ ! -d "${dir}" || ! -w "${dir}" ]] && continue
            tmp_file="${dir}/animate_exec_$$_$(date +%s)"
            touch "${tmp_file}" 2>/dev/null || continue
            if [[ -f "${tmp_file}" && -w "${tmp_file}" ]]; then
                echo "${tmp_file}"
                return
            fi
        done
        echo "${tmp_file}"
    }
    function update_display() {
        local current_size=$(wc -c <"${temp_file}" 2>/dev/null || echo 0)
        if [[ $current_size -le $last_size ]]; then
            return 1
        fi
        local -a lines=()
        mapfile -t -n "${max_lines}" lines < <(tail -n "$max_lines" "${temp_file}")
        local -a processed_lines=()
        for ((i = 0; i < ${#lines[@]}; i++)); do
            processed_lines[i]=$(simple_truncate "${lines[i]}")
        done
        tput cud1 2>/dev/null
        echo -ne "\r\033[K"
        tput cud1 2>/dev/null
        for ((i = 0; i < $max_lines; i++)); do
            echo -ne "\r\033[K"
            [[ $i -lt ${#processed_lines[@]} ]] && echo -ne "\033[2m${processed_lines[$i]}\033[0m"
            [[ $i -lt $((max_lines - 1)) ]] && tput cud1 2>/dev/null
        done
        for ((i = 0; i < $max_lines + 1; i++)); do
            tput cuu1 2>/dev/null
        done
        last_size=$current_size
        return 0
    }
    local spinner_frames=(${spinners[$spinner_style]})
    local temp_file="$(make_temp_file)"
    trap "cleanup" INT TERM
    tput civis 2>/dev/null
    echo ''
    echo ''
    for ((i = 0; i < $max_lines; i++)); do
        echo ''
    done
    eval "${cmd}" >"${temp_file}" 2>&1 &
    local cmd_pid=$!
    local last_size=0
    local spin_idx=0
    tput cuu $((max_lines + 2)) 2>/dev/null
    sleep 0.05
    echo -ne "\r\033[K◉ ${title} [\033[1m\033[34m${spinner_frames[$spin_idx]}\033[0m]"
    spin_idx=$(((spin_idx + 1) % ${#spinner_frames[@]}))
    update_display
    local update_count=0
    local adaptive_rate=$refresh_rate
    while kill -0 $cmd_pid 2>/dev/null; do
        echo -ne "\r\033[K◉ ${title} [\033[1m\033[34m${spinner_frames[$spin_idx]}\033[0m]"
        spin_idx=$(((spin_idx + 1) % ${#spinner_frames[@]}))
        if update_display; then
            update_count=$((update_count + 1))
            if [[ $update_count -gt 5 ]]; then
                adaptive_rate=$(awk "BEGIN {print $adaptive_rate * 1.5; exit}")
                [[ $(awk "BEGIN {print ($adaptive_rate > 0.5); exit}") -eq 1 ]] && adaptive_rate=0.5
                update_count=0
            fi
        else
            update_count=0
            adaptive_rate=$refresh_rate
        fi
        sleep $adaptive_rate
    done
    wait $cmd_pid
    local exit_status=$?
    update_display
    if [ $exit_status -eq 0 ]; then
        echo -ne "\r\033[K◉ ${title} [\033[1m\033[32m✓\033[0m]\n"
    else
        echo -ne "\r\033[K◉ ${title} [\033[1m\033[31m✗\033[0m]\n"
    fi
    echo -ne "\r\033[K\n"
    local actual_lines=$(wc -l <"${temp_file}" 2>/dev/null || echo 0)
    [[ $actual_lines -gt $max_lines ]] && actual_lines=$max_lines
    if [[ $actual_lines -gt 0 ]]; then
        local -a final_lines=()
        mapfile -t -n "$actual_lines" final_lines < <(tail -n "$actual_lines" "${temp_file}")

        for ((i = 0; i < actual_lines; i++)); do
            local line=$(simple_truncate "${final_lines[$i]}")
            echo -ne "\r\033[K\033[2m${line}\033[0m\n"
        done
    fi
    tput cnorm 2>/dev/null
    rm -f "${temp_file}"
    return $exit_status
}

handle_command_options "$@"
main
