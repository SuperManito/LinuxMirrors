#!/bin/bash
## Author: SuperManito
## Modified: 2025-12-06
## License: MIT
## GitHub: https://github.com/SuperManito/LinuxMirrors
## Website: https://linuxmirrors.cn

SOURCE="download.docker.com"
SOURCE_REGISTRY="registry.hub.docker.com"
WEB_PROTOCOL="https"
INSTALL_LATESTED_DOCKER="true"
IGNORE_BACKUP_TIPS="true"
CLOSE_FIREWALL="true"

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
SYSTEM_KYLIN_DESKTOP="Kylin Desktop"
SYSTEM_KYLIN_SERVER="Kylin Server"
SYSTEM_OPENKYLIN="openKylin"
SYSTEM_OPENSUSE="openSUSE"
SYSTEM_ARCH="Arch"
SYSTEM_MANJARO="Manjaro"
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
File_KylinRelease=/etc/kylin-release
File_kylinVersion=/etc/kylin-version/kylin-system-version.conf
File_ProxmoxVersion=/etc/pve/.version

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
WARN="\033[1;43m WARN ${PLAIN}"
ERROR="\033[1;31m✘${PLAIN}"
FAIL="\033[1;31m✘${PLAIN}"
TIP="\033[1;44m TIP ${PLAIN}"
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
    ## 判断参数
    while [ $# -gt 0 ]; do
        case "$1" in
        ## 指定 Docker CE 软件源地址
        --source)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        ## 指定 Docker Registry 仓库地址
        --source-registry)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_REGISTRY="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.registryAddress")"
            fi
            ;;
        ## 指定 Docker CE 软件源仓库
        --branch)
            if [ "$2" ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        ## 指定 Docker CE 软件源仓库版本
        --branch-version)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "^[0-9]{1,2}$"
                if [ $? -eq 0 ]; then
                    SOURCE_BRANCH_VERSION="$2"
                    shift
                else
                    command_error "$2" "$(msg "error.cmd.options.validVersion")"
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.ceRepositoryVersion")"
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
                    command_error "$2" "$(msg "error.cmd.options.validVersion")"
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.version")"
            fi
            ;;
        ## 指定 Debian 版本代号
        --codename)
            if [ "$2" ]; then
                DEBIAN_CODENAME="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.codename")"
            fi
            ;;
        ## Web 协议（HTTP/HTTPS）
        --protocol)
            if [ "$2" ]; then
                case "$2" in
                http | https | HTTP | HTTPS)
                    WEB_PROTOCOL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.protocol")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.needProtocol")"
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
                    command_error "$2" "$(msg "error.cmd.options.needIntranetSource")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.needIntranetSource")"
            fi
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
                    command_error "$2" "$(msg "error.cmd.options.needIntranetSource")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.needIntranetSource")"
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
                    command_error "$2" "$(msg "error.cmd.options.needIntranetSource")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.needIntranetSource")"
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
            echo -e "\n$(msg "commands.help" "https://github.com/SuperManito/LinuxMirrors/issues")\n"
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

function run_start() { :; }

function run_end() {
    if [[ "${PURE_MODE}" == "true" ]]; then
        echo ''
        return
    fi
    echo -e "\n\033[3;1mPowered by \033[34mLinuxMirrors\033[0m - \033[3mhttps://linuxmirrors.cn\033[0m\n"
}

function output_error() {
    [ "$1" ] && echo -e "\n$ERROR $1\n"
    exit 1
}

function command_error() {
    local tmp_text="$(msg "error.cmd.options.needConfirm")"
    if [[ "${2}" ]]; then
        tmp_text="$(msg "error.cmd.options.needSpecify" "${2}")"
    fi
    output_error "$(msg "error.cmd.options.invalid" "${BLUE}$1${PLAIN}" "${tmp_text}")"
}

function unsupport_system_error() {
    if [[ "${2}" ]]; then
        output_error "$(msg "error.unsupportSystem2" "${1}")\n\n${BLUE}$2${PLAIN}"
    else
        output_error "$(msg "error.unsupportSystem1" "${1}")"
    fi
}

function input_error() {
    echo -e "\n$WARN $(msg "error.input" "${1}")"
}

function command_exists() {
    command -v "$@" &>/dev/null
}

function permission_judgment() {
    if [ $UID -ne 0 ]; then
        local change_cmd="su root"
        if command_exists sudo; then
            change_cmd="sudo -i"
        fi
        output_error "$(msg "error.needRoot" "${BLUE}${change_cmd}${PLAIN}")"
    fi
}

function get_os_release_value() {
    grep -E "^${1}=" $File_LinuxRelease | cut -d= -f2- | sed "s/[\'\"]//g"
}

function collect_system_info() {
    if [ ! -s "${File_LinuxRelease}" ]; then
        unsupport_system_error "$(msg "error.unknownSystem")"
    fi
    ## 定义系统名称
    SYSTEM_NAME="$(get_os_release_value NAME)"
    SYSTEM_PRETTY_NAME="$(get_os_release_value PRETTY_NAME)"
    ## 定义系统版本号
    SYSTEM_VERSION_ID="$(get_os_release_value VERSION_ID)"
    SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%%.*}"
    SYSTEM_VERSION_ID_MINOR="${SYSTEM_VERSION_ID#*.}"
    ## 定义系统ID
    SYSTEM_ID="$(get_os_release_value ID)"
    ## 判定当前系统派系
    if [ -s "${File_DebianVersion}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_DEBIAN}"
        if [ -s "${File_kylinVersion}" ]; then
            [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "Kylin Desktop" "apt-get install -y docker\nsystemctl enable --now docker.io"
        fi
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
    elif [ -s "${File_kylinVersion}" ] || [ -s "${File_KylinRelease}" ]; then
        if [[ "${SYSTEM_ID}" == *"openkylin"* ]]; then
            SYSTEM_FACTIONS="${SYSTEM_OPENKYLIN}"
        else
            SYSTEM_FACTIONS="${SYSTEM_KYLIN_SERVER}"
        fi
    elif [ -f "${File_ArchLinuxRelease}" ]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "Arch Linux" "pacman -S docker\nsystemctl enable --now docker"
    elif [ -f "${File_GentooRelease}" ]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "Gentoo"
    elif [[ "${SYSTEM_NAME}" == *"openSUSE"* ]]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "openSUSE" "zypper install docker\nsystemctl enable --now docker"
    elif [[ "${SYSTEM_NAME}" == *"NixOS"* ]]; then
        [[ "${ONLY_REGISTRY}" != "true" ]] && unsupport_system_error "NixOS"
    else
        unsupport_system_error "$(msg "error.unknownSystem")"
    fi
    ## 判定系统类型、版本、版本号
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        if command_exists lsb_release; then
            SYSTEM_JUDGMENT="$(lsb_release -is)"
            SYSTEM_VERSION_CODENAME="${DEBIAN_CODENAME:-"$(lsb_release -cs)"}"
        else
            ## https://codeberg.org/gioele/lsb-release-minimal
            SYSTEM_JUDGMENT="${SYSTEM_ID^}"
            if [ "${SYSTEM_NAME}" ]; then
                if [[ "${SYSTEM_ID,,}" == "${SYSTEM_NAME,,}" ]]; then
                    SYSTEM_JUDGMENT="${SYSTEM_NAME}"
                fi
            fi
            SYSTEM_VERSION_CODENAME="${DEBIAN_CODENAME:-"$(get_os_release_value VERSION_CODENAME)"}"
        fi
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
        output_error "$(msg "error.unsupportX86_32")"
        ;;
    *)
        output_error "$(msg "error.unknownArch" "${DEVICE_ARCH_RAW}")"
        ;;
    esac
    ## 定义软件源仓库名称
    if [[ -z "${SOURCE_BRANCH}" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            local debian_codename_latest="trixie"
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_DEBIAN}")
                SOURCE_BRANCH="debian"
                ;;
            "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
                SOURCE_BRANCH="ubuntu"
                ;;
            "${SYSTEM_KALI}")
                SOURCE_BRANCH="debian"
                SOURCE_BRANCH_CODENAME="${debian_codename_latest}"
                ;;
            "${SYSTEM_LINUX_MINT}")
                if [[ "${SYSTEM_NAME}" == *"LMDE"* ]]; then
                    SOURCE_BRANCH="debian"
                    SOURCE_BRANCH_CODENAME="$(get_os_release_value DEBIAN_CODENAME)"
                else
                    SOURCE_BRANCH="ubuntu"
                    SOURCE_BRANCH_CODENAME="$(get_os_release_value UBUNTU_CODENAME)"
                fi
                if [[ -z "${SOURCE_BRANCH_CODENAME}" ]]; then
                    SOURCE_BRANCH="debian"
                    SOURCE_BRANCH_CODENAME="bookworm"
                fi
                ;;
            "${SYSTEM_RASPBERRY_PI_OS}")
                case "${DEVICE_ARCH_RAW}" in
                x86_64 | aarch64)
                    SOURCE_BRANCH="debian"
                    ;;
                *)
                    # 注：自 Docker 29 版本起将不再提供此分支仓库
                    SOURCE_BRANCH="raspbian"
                    ;;
                esac
                ;;
            # "${SYSTEM_KYLIN_DESKTOP}")
            #     SOURCE_BRANCH="ubuntu"
            #     case "${SYSTEM_VERSION_ID_MAJOR}" in
            #     "v10")
            #         SOURCE_BRANCH_CODENAME="focal"
            #         ;;
            #     "v11")
            #         SOURCE_BRANCH_CODENAME="noble"
            #         ;;
            #     *)
            #         SOURCE_BRANCH_CODENAME="noble"
            #         ;;
            #     esac
            #     ;;
            "${SYSTEM_OPENKYLIN}")
                SOURCE_BRANCH="debian"
                SOURCE_BRANCH_CODENAME="${debian_codename_latest}"
                ;;
            *)
                # 其余 Debian 系衍生操作系统
                SOURCE_BRANCH="debian"
                SOURCE_BRANCH_CODENAME="bookworm"
                ;;
            esac
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_FEDORA}")
                SOURCE_BRANCH="fedora"
                ;;
            "${SYSTEM_RHEL}")
                SOURCE_BRANCH="rhel"
                ;;
            *)
                SOURCE_BRANCH="centos"
                ;;
            esac
            if [[ "${DEVICE_ARCH_RAW}" == "s390x" ]]; then
                output_error "$(msg "error.unsupportS390x")"
            fi
            ;;
        esac
    fi
    ## 定义软件源更新文字
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text1")"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text2")"
        ;;
    esac
    ## 判断是否可以使用高级交互式选择器
    CAN_USE_ADVANCED_INTERACTIVE_SELECTION="false"
    if command_exists tput; then
        CAN_USE_ADVANCED_INTERACTIVE_SELECTION="true"
    fi
}

function choose_display_language() { :; }

function choose_mirrors() { :; }

function choose_protocol() { :; }

## 关闭防火墙和SELinux
function close_firewall_service() {
    if ! command_exists systemctl; then
        return
    fi
    if [[ "$(systemctl is-active firewalld)" == "active" ]]; then
        if [[ -z "${CLOSE_FIREWALL}" ]]; then
            local ask_text="$(msg "interaction.firewall.close")?"
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
                    input_error "$(msg "error.defaultBehavior.noClose")"
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
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        sed -i '/docker-ce/d' $File_AptSourceList
        rm -rf $File_DockerSourceList
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        rm -rf $Dir_YumRepos/*docker*.repo
        ;;
    esac
    ## 更新软件源
    commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        package_manager="apt-get"
        commands+=("${package_manager} update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
        echo ''
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
    if [ $? -ne 0 ]; then
        output_error "$(msg "error.sync" "${SYNC_MIRROR_TEXT}" "${BLUE}${package_manager}${PLAIN}")"
    fi

    commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        commands+=("${package_manager} install -y ca-certificates curl")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
        animate_exec "${exec_cmd}" "$(msg "work.installDependents")"
    else
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
}

## 配置 Docker CE 源
function configure_docker_ce_mirror() {
    local -a commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        ## 处理 GPG 密钥
        local file_keyring="/etc/apt/keyrings/docker.asc"
        apt-key del 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88 >/dev/null 2>&1 # 删除旧的密钥
        [ -f "${file_keyring}" ] && rm -rf $file_keyring
        install -m 0755 -d /etc/apt/keyrings
        curl -fsSL "${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH}/gpg" -o $file_keyring >/dev/null
        if [ $? -ne 0 ]; then
            output_error "$(msg "error.downloadGPG")"
        fi
        chmod a+r $file_keyring
        ## 添加源
        [ -d "${Dir_AptAdditionalSources}" ] || mkdir -p $Dir_AptAdditionalSources
        local apt_source_content="deb [arch=$(dpkg --print-architecture) signed-by=${file_keyring}] ${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH} ${DEBIAN_CODENAME:-${SOURCE_BRANCH_CODENAME:-${SYSTEM_VERSION_CODENAME}}} stable"
        echo "${apt_source_content}" | tee $File_DockerSourceList >/dev/null 2>&1
        commands+=("apt-get update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        local repo_file_url="${WEB_PROTOCOL}://${SOURCE}/linux/${SOURCE_BRANCH}/docker-ce.repo"
        local package_manager="$(get_package_manager)"
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        7)
            yum-config-manager -y --add-repo "${repo_file_url}"
            ;;
        *)
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
                dnf-3 config-manager -y --add-repo "${repo_file_url}"
            else
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
        ## 处理版本号
        if [[ "${SOURCE_BRANCH_VERSION}" ]]; then
            # 指定版本
            sed -e "s|\$releasever|${SOURCE_BRANCH_VERSION}|g" \
                -i \
                $File_DockerRepo
            commands+=("${package_manager} makecache")
        elif [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_FEDORA}" ]]; then
            # 兼容处理
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
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_KYLIN_SERVER}" ]]; then
                    case "${SYSTEM_VERSION_ID_MAJOR}" in
                    "V10")
                        target_version="8"
                        ;;
                    "V11")
                        target_version="10"
                        ;;
                    *)
                        target_version="10"
                        ;;
                    esac
                fi
                ;;
            esac
            sed -e "s|\$releasever|${target_version}|g" \
                -i \
                $File_DockerRepo
            commands+=("${package_manager} makecache")
        fi
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
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            apt-cache madison docker-ce | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCEVersionTmp
            apt-cache madison docker-ce-cli | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}" >$File_DockerCECliVersionTmp
            grep -wf $File_DockerCEVersionTmp $File_DockerCECliVersionTmp >$File_DockerVersionTmp
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            package_list='docker* podman podman-docker containerd runc'
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
            package_list='docker* podman podman-docker runc'
            ;;
        esac
        # 卸载软件包并清理残留
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            apt-get remove -y $package_list >/dev/null 2>&1
            apt-get autoremove -y >/dev/null 2>&1
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
        local -a commands=()
        if [[ "${INSTALL_LATESTED_DOCKER}" == "true" ]]; then
            pkgs="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
        else
            export_version_list
            if [ ! -s "${File_DockerVersionTmp}" ]; then
                rm -rf $File_DockerVersionTmp
                output_error "$(msg "error.queryVersionFailed")"
            fi
            if [[ "${DESIGNATED_DOCKER_VERSION}" ]]; then
                cat $File_DockerVersionTmp | grep -Eq "^${DESIGNATED_DOCKER_VERSION}$"
                if [ $? -ne 0 ]; then
                    rm -rf $File_DockerVersionTmp
                    output_error "$(msg "error.designatedVersion")"
                fi
                target_docker_version="${DESIGNATED_DOCKER_VERSION}"
            else
                if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                    local -a version_list=(
                        $(cat $File_DockerVersionTmp | sort -t '.' -k1,1nr -k2,2nr -k3,3nr | tr '\n' ' ' | sed 's/ $//')
                    )
                    local mirror_list_name="version_list"
                    interactive_select_list "${mirror_list_name}" "\n ${BOLD}$(msg "interaction.install.selectVersion")${PLAIN}\n"
                    target_docker_version="${_SELECT_RESULT}"
                    echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}$(msg "interaction.install.selectedVersion")${target_docker_version}${PLAIN}\n"
                else
                    echo -e "\n${GREEN} --------- $(msg "interaction.install.selectedTitle" "28.3.0") ---------- ${PLAIN}\n"
                    cat $File_DockerVersionTmp
                    while true; do
                        local CHOICE="$(echo -e "\n${BOLD}└─ $(msg "interaction.install.inputVersion")${PLAIN}\n")"
                        read -rp "${CHOICE}" target_docker_version
                        echo ''
                        cat $File_DockerVersionTmp | grep -Eqw "${target_docker_version}"
                        if [ $? -eq 0 ]; then
                            echo "${target_docker_version}" | grep -Eqw '[0-9][0-9].[0-9]{1,2}.[0-9]{1,2}'
                            if [ $? -eq 0 ]; then
                                break
                            else
                                echo -e "$ERROR $(msg "error.invalidVersion")"
                            fi
                        else
                            echo -e "$ERROR $(msg "error.reEnter")"
                        fi
                    done
                fi
            fi
            rm -rf $File_DockerVersionTmp
            local major_version="$(echo ${target_docker_version} | cut -d'.' -f1)"
            local minor_version="$(echo ${target_docker_version} | cut -d'.' -f2)"
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
                if [[ $major_version -gt 18 ]] || [[ $major_version -eq 18 && $minor_version -ge 9 ]]; then
                    local tmp_version="$(apt-cache madison docker-ce-cli | grep "${target_docker_version}" | head -1 | awk '{print $3}' | awk -F "${target_docker_version}" '{print$1}')"
                    pkgs="docker-ce=${tmp_version}${target_docker_version}* docker-ce-cli=${tmp_version}${target_docker_version}*"
                else
                    pkgs="docker-ce=${target_docker_version}* docker-ce-cli=${target_docker_version}*"
                fi
                ;;

            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            commands+=("apt-get install -y ${pkgs}")
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
            commands+=("$(get_package_manager) install -y ${pkgs}")
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
            animate_exec "${exec_cmd}" "$(msg "work.installDockerEngine")"
        else
            for cmd in "${commands[@]}"; do
                eval "${cmd}"
            done
        fi
        [ $? -ne 0 ] && output_error "$(msg "error.installDockerEngineFailed")"
    }

    ## 判断是否手动选择安装版本
    if [[ -z "${INSTALL_LATESTED_DOCKER}" ]]; then
        local ask_text="$(msg "interaction.install.latestVersion")?"
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
            read -rp "${CHOICE_A}" INPUT
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
                input_error "$(msg "error.defaultBehavior.installLatest")"
                ;;
            esac
        fi
    fi

    ## 判定是否已安装
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        dpkg -l | grep docker-ce-cli -q
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        rpm -qa | grep docker-ce-cli -q
        ;;
    esac
    if [ $? -eq 0 ]; then
        export_version_list
        local current_docker_version="$(docker -v | grep -Eo "[0-9][0-9]\.[0-9]{1,2}\.[0-9]{1,2}")"
        local latest_docker_version="$(cat $File_DockerVersionTmp | head -n 1)"
        rm -rf $File_DockerVersionTmp
        if [[ "${current_docker_version}" == "${latest_docker_version}" ]] && [[ "${INSTALL_LATESTED_DOCKER}" == "true" ]]; then
            echo -e "\n$TIP $(msg "tip.skipInstallDockerEngine")"
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
                echo -e "\n${WARN} $(msg "warn.needManuallyDeleteConfig" "${File_DockerConfig}" "${BLUE}registry-mirrors${PLAIN}" "${BLUE}systemctl daemon-reload && systemctl restart docker${PLAIN}")\n"
            fi
        fi
        return
    fi
    ## 备份原有配置文件
    if [ -d "${Dir_Docker}" ] && [ -e "${File_DockerConfig}" ]; then
        if [ -e "${File_DockerConfigBackup}" ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                local ask_text="$(msg "interaction.backup.skipOverwrite")?"
                if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                    echo ''
                    interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                    if [[ "${_SELECT_RESULT}" == "false" ]]; then
                        echo ''
                        cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
                    fi
                else
                    local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                    read -rp "${CHOICE_BACKUP}" INPUT
                    [[ -z "${INPUT}" ]] && INPUT=Y
                    case $INPUT in
                    [Yy] | [Yy][Ee][Ss]) ;;
                    [Nn] | [Nn][Oo])
                        echo ''
                        cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
                        ;;
                    *)
                        input_error "$(msg "error.defaultBehavior.noOverwrite")"
                        ;;
                    esac
                fi
            fi
        else
            echo ''
            cp -rvf $File_DockerConfig $File_DockerConfigBackup 2>&1
            echo -e "\n$COMPLETE $(msg "info.backuped.dockerConfig")"
        fi
        sleep 2s
    else
        mkdir -p $Dir_Docker >/dev/null 2>&1
        touch $File_DockerConfig
    fi

    echo -e '{\n  "registry-mirrors": '"$(handleRegistryMirrorsValue ${SOURCE_REGISTRY})"'\n}' >$File_DockerConfig
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
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        dpkg -l | grep docker-ce-cli -q
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        rpm -qa | grep docker-ce-cli -q
        ;;
    esac
    if [ $? -ne 0 ]; then
        ## 仅镜像仓库换源模式
        if [[ "${ONLY_REGISTRY}" == "true" ]]; then
            output_error "$(msg "result.registry.dockerEngineNotExsit" "${BLUE}--only-registry${PLAIN}")"
        fi
    fi

    [ -d "${Dir_Docker}" ] || mkdir -p "${Dir_Docker}"
    if [ -s "${File_DockerConfig}" ]; then
        ## 安装 jq
        if ! command_exists jq; then
            ## 更新软件源
            local package_manager
            local -a commands=()
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
                package_manager="apt-get"
                commands+=("${package_manager} update")
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
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
                echo ''
                for cmd in "${commands[@]}"; do
                    eval "${cmd}"
                done
            fi
            if [ $? -ne 0 ]; then
                output_error "$(msg "error.sync" "${SYNC_MIRROR_TEXT}" "${BLUE}${package_manager}${PLAIN}")"
            fi
            $package_manager install -y jq
            if ! command_exists jq; then
                output_error "$(msg "error.installPackageFailed" "${BLUE}jq${PLAIN}")"
            fi
        fi
        [ -s "${File_DockerConfig}" ] || echo "{}" >$File_DockerConfig
        jq '.["registry-mirrors"] = '"$(handleRegistryMirrorsValue ${SOURCE_REGISTRY})"'' $File_DockerConfig >$File_DockerConfig.tmp && mv $File_DockerConfig.tmp $File_DockerConfig
    else
        echo -e '{\n  "registry-mirrors": '"$(handleRegistryMirrorsValue ${SOURCE_REGISTRY})"'\n}' >$File_DockerConfig
    fi
    ## 重启服务
    systemctl daemon-reload
    if [[ "$(systemctl is-active docker 2>/dev/null)" == "active" ]]; then
        systemctl restart docker
    fi

    echo -e "\n${BLUE}\$${PLAIN} docker info --format '{{json .RegistryConfig.Mirrors}}'"
    echo -e "\033[2m>${PLAIN} $(docker info --format '{{json .RegistryConfig.Mirrors}}')"
    if [[ "${PURE_MODE}" != "true" ]]; then
        echo -e "\n$COMPLETE $(msg "result.registry.success")"
    fi
}

function handleRegistryMirrorsValue() {
    local content="$1"
    local result=""
    content="$(echo "${content}" | sed 's| ||g')"
    local -a items=(${content//,/ })
    for item in "${items[@]}"; do
        [[ -z "${item}" ]] && continue
        if [[ -z "${result}" ]]; then
            result='"https://'"${item}"'"'
        else
            result="${result},\"https://${item}\""
        fi
    done
    if [[ "${result}" ]]; then
        echo "[${result}]"
    else
        echo ""
    fi
}

## 查看版本并验证安装结果
function check_installed_result() {
    if command_exists docker; then
        systemctl enable --now docker >/dev/null 2>&1
        echo -en "\n$COMPLETE "
        docker -v
        if [ $? -eq 0 ]; then
            echo -e "  $(docker compose version 2>&1)"
            # echo -e "\n$COMPLETE 安装完成"
        else
            echo -e "\n$FAIL $(msg "result.install.failed")"
            local source_file package_manager
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
                source_file="${File_DockerSourceList}"
                package_manager="apt-get"
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
                source_file="${File_DockerRepo}"
                package_manager="$(get_package_manager)"
                ;;
            esac
            echo -e "\n$(msg "result.install.checkSourceFile" "cat ${source_file}")"
            echo -e "$(msg "result.install.manuallyExecCmd" "${package_manager} install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin")\n"
            exit 1
        fi
        if [[ "$(systemctl is-active docker 2>/dev/null)" != "active" ]]; then
            sleep 2
            systemctl disable --now docker >/dev/null 2>&1
            sleep 2
            systemctl enable --now docker >/dev/null 2>&1
            sleep 2
            if [[ "$(systemctl is-active docker)" != "active" ]]; then
                echo -e "\n$WARN $(msg "result.install.notRunning")"
                local start_cmd
                if command_exists systemctl; then
                    start_cmd="systemctl start docker"
                else
                    start_cmd="service docker start"
                fi
                echo -e "\n$TIP $(msg "result.install.manuallyRun" "${BLUE}${start_cmd}${PLAIN}")"
            fi
        fi
    else
        echo -e "\n$FAIL $(msg "result.install.failed")"
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
    "${SYSTEM_FEDORA}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}" | "${SYSTEM_TENCENTOS}" | "${SYSTEM_KYLIN_SERVER}")
        command="dnf"
        ;;
    esac
    echo "${command}"
}

function interactive_select_list() {
    _SELECT_RESULT=""
    eval "local -a __values=(\"\${${1}[@]}\")"
    local -a __labels=()
    local message="${2}"
    local selected=0
    local start=0
    local page_size=$(($(tput lines 2>/dev/null) - 3))
    if [[ "${3}" ]]; then
        eval "__labels=(\"\${${3}[@]}\")"
    fi
    function clear_menu() {
        tput rc 2>/dev/null
        for ((i = 0; i < ${#__values[@]} + 1; i++)); do
            echo -e "\r\033[K"
        done
        tput rc 2>/dev/null
    }
    function cleanup() {
        clear_menu
        tput rc 2>/dev/null
        tput cnorm 2>/dev/null
        tput rmcup 2>/dev/null
        echo -e "\n\033[1;44m $(msg "interaction.common.tip") \033[0m \033[31m$(msg "interaction.common.operationCanceled")\033[0m\n"
        exit 130
    }
    function draw_menu() {
        tput clear 2>/dev/null
        tput cup 0 0 2>/dev/null
        echo -e "${message}"
        local end=$((start + page_size - 1))
        local label
        if [ $end -ge ${#__values[@]} ]; then
            end=${#__values[@]}-1
        fi
        for ((i = start; i <= end; i++)); do
            if [[ "${__labels[$i]}" ]]; then
                label="${__labels[$i]}"
            else
                label="${__values[$i]}"
            fi
            if [ "$i" -eq "${selected}" ]; then
                echo -e "\e[34;4m➤ ${label}\e[0m"
            else
                echo -e "  ${label}"
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
            if [ "${selected}" -gt 0 ]; then
                selected=$((selected - 1))
                if [ "${selected}" -lt "$start" ]; then
                    start=$((start - 1))
                fi
            fi
            ;;
        "[B" | "s" | "S")
            if [ "${selected}" -lt $((${#__values[@]} - 1)) ]; then
                selected=$((selected + 1))
                if [ "${selected}" -ge $((start + page_size)) ]; then
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
    _SELECT_RESULT="${__values[${selected}]}"
    if [ "${__labels[${selected}]}" ]; then
        _SELECT_RESULT="${_SELECT_RESULT}@@${__labels[${selected}]}"
    fi
}

function interactive_select_boolean() {
    _SELECT_RESULT=""
    local selected=0
    local message="$1"
    local positive_title="${2:-"$(msg "interaction.common.yes")"}"
    local negative_title="${3:-"$(msg "interaction.common.no")"}"
    local menu_height=3
    local original_line
    function store_position() {
        original_line=$(tput lines 2>/dev/null)
    }
    function clear_menu() {
        for ((i = 0; i < $menu_height; i++)); do
            tput cuu1 2>/dev/null
            tput el 2>/dev/null
        done
    }
    function cleanup() {
        clear_menu
        tput cnorm 2>/dev/null
        echo -e "\n\033[1;44m $(msg "interaction.common.tip") \033[0m \033[31m$(msg "interaction.common.operationCanceled")\033[0m\n"
        exit 130
    }
    function draw_menu() {
        echo -e "╭─ ${message}"
        echo -e "│"
        if [ "${selected}" -eq 0 ]; then
            echo -e "╰─ \033[34m●\033[0m ${positive_title}\033[2m / ○ ${negative_title}\033[0m"
        else
            echo -e "╰─ \033[2m○ ${positive_title} / \033[0m\033[34m●\033[0m ${negative_title}"
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
            if [ "${selected}" -gt 0 ]; then
                selected=$((selected - 1))
                clear_menu
                draw_menu
            fi
            ;;
        "[C" | "d" | "D")
            if [ "${selected}" -lt 1 ]; then
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
    if [ "${selected}" -eq 0 ]; then
        echo -e "╰─ \033[32m●\033[0m \033[1m${positive_title}\033[0m\033[2m / ○ ${negative_title}\033[0m"
        _SELECT_RESULT="true"
    else
        echo -e "╰─ \033[2m○ ${positive_title} / \033[0m\033[32m●\033[0m \033[1m${negative_title}\033[0m"
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
    local scroll_mode="${6:-1}"
    if [[ "${scroll_mode}" == "0" ]]; then
        echo -e "◉ ${title} \n"
        eval "${cmd}"
        return $?
    fi
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
        local non_ascii_count=$(echo "${line}" | sed "s|[0-9a-zA-Z -~]||g; s| ||g" | wc -m)
        local total_length=${#line}
        local display_length=$((total_length + non_ascii_count))
        local quote_count=0
        [[ $(echo "${line}" | grep -c "“") -gt 0 ]] && ((quote_count += "$(echo "${line}" | grep -c "“")"))
        [[ $(echo "${line}" | grep -c "”") -gt 0 ]] && ((quote_count += "$(echo "${line}" | grep -c "”")"))
        [[ $(echo "${line}" | grep -c "‘") -gt 0 ]] && ((quote_count += "$(echo "${line}" | grep -c "‘")"))
        [[ $(echo "${line}" | grep -c "’") -gt 0 ]] && ((quote_count += "$(echo "${line}" | grep -c "’")"))
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
            if ! [[ "$char" =~ [0-9a-zA-Z\.\=\:\_\(\)\'\"\-\/\!\·] ]]; then
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
        echo -e "\n\033[1;44m $(msg "interaction.common.tip") \033[0m \033[31m$(msg "interaction.common.operationCanceled")\033[0m\n"
        exit 130
    }
    function make_temp_file() {
        local -a temp_dirs=("." "/tmp")
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

##############################################################################

MESSAGE_LANG_DEFAULT='en'
MESSAGE_LANG_KEYS=(
    "en"
)
declare -A MESSAGE_LANG_DISPLAY=(
    ['en']='English'
)
declare -A MESSAGE_CONTENTS

function msg() {
    local key="$1"
    shift
    local text="${MESSAGE_CONTENTS[${key}]}"
    if [[ -z "${text}" ]]; then
        echo "${key}"
        return
    fi
    while [[ $# -gt 0 ]]; do
        if [[ "${text}" == *"{}"* ]]; then
            text="${text/\{\}/$1}"
        else
            break
        fi
        shift
    done
    echo "${text}"
}

function init_msg_pack() {
    function load_pack() {
        local func_name="${1}"
        if declare -f "${func_name}" >/dev/null 2>&1; then
            eval "${func_name}"
        fi
    }
    local current_lang="${1:-${MESSAGE_LANG_DEFAULT}}"
    current_lang="$(echo "${current_lang}" | sed 's/^-*//')"
    current_lang="${current_lang,,}"
    if [[ "${MESSAGE_LANG_DISPLAY[${current_lang}]}" ]]; then
        current_lang="${current_lang//-/_}"
        load_pack "msg_pack_${current_lang}"
    fi
}

function msg_pack_en() {
    MESSAGE_CONTENTS=(
        ['start.welcome']='Docker installation & mirror switcher'
        ['start.runtimeEnv']='Runtime Env'
        ['start.dateTime']='System Time'
        ['end.moreInfo']='Script execution completed, visit our website for more tutorials'
        ['end.sponsorAds']='[Sponsor Ads]'
        ['error.cmd.options.needConfirm']='Please confirm and re-enter'
        ['error.cmd.options.needSpecify']='Please specify {} after this option'
        ['error.cmd.options.invalid']='Command option {} is invalid, {}!'
        ['error.cmd.options.validAddress']='a valid address'
        ['error.cmd.options.sourceAddress']='mirror address'
        ['error.cmd.options.registryAddress']='registry mirror address'
        ['error.cmd.options.sourceRepository']='mirror repository'
        ['error.cmd.options.validVersion']='a valid version number'
        ['error.cmd.options.ceRepositoryVersion']='Docker CE mirror repository version'
        ['error.cmd.options.version']='version number'
        ['error.cmd.options.codename']='version codename'
        ['error.cmd.options.boolean']=' true or false '
        ['error.cmd.options.protocol']=' http or https '
        ['error.cmd.options.needProtocol']=' Web protocol(http/https)'
        ['error.cmd.options.validLangKey']='A valid language ID '
        ['error.cmd.options.langKey']='language ID '
        ['error.unsupportSystem1']='Unsupported operating system ({})'
        ['error.unsupportSystem2']='Unsupported operating system ({}), please install manually with commands:'
        ['error.unknownSystem']='Unknown system'
        ['error.unsupportX86_32']='Docker Engine does not support installation on x86_32 architecture!'
        ['error.unknownArch']='Unknown system architecture: {}'
        ['error.unsupportS390x']='Please refer to RHEL distribution announcement for s390x support'
        ['error.input']='Input error, {}!'
        ['error.needRoot']='Insufficient privileges, please run this script as root. Switch command: {}'
        ['error.sync']='{} failed. Please fix system software sources (package repositories) so the {} package manager is available!'
        ['error.downloadGPG']='GPG key download failed, please check network or switch Docker CE mirror and retry!'
        ['error.queryVersionFailed']='Failed to query Docker Engine version list!'
        ['error.designatedVersion']='Specified Docker Engine version does not exist or is not supported for installation!'
        ['error.invalidVersion']='Please enter a valid version number!'
        ['error.reEnter']='Input error, please re-enter!'
        ['error.installDockerEngineFailed']='Docker Engine installation failed!'
        ['error.installPackageFailed']='Package {} installation failed, please install manually and rerun script!'
        ['error.defaultBehavior.https']='Using HTTPS protocol by default'
        ['error.defaultBehavior.noClose']='Not closing by default'
        ['error.defaultBehavior.installLatest']='Installing latest version by default'
        ['error.defaultBehavior.noOverwrite']='Not overwriting by default'
        ['error.defaultBehavior.noUseIntranetSource']='Not using intranet address by default'
        ['warn.usedIntranetSource']='Switched to intranet-only address, use only in specific environments!'
        ['warn.needValidNumberIndex']='Please enter a valid number index!'
        ['warn.needInputNumberIndex']='Please enter a number index!'
        ['warn.needManuallyDeleteConfig']='Please manually delete {} configuration in {} and restart service {}'
        ['tip.skipInstallDockerEngine']='Detected Docker Engine is already installed with latest version, skipping installation'
        ['info.backuped.dockerConfig']='Original Docker config file has been backed up'
        ['interaction.source.type.public']='Public'
        ['interaction.source.type.intranet']='Intranet'
        ['interaction.source.type.select']='Please select network address (access method) for Docker CE mirror:'
        ['interaction.source.type.usePublicAddress']='Use public network address for Docker CE mirror by default, continue'
        ['interaction.source.dockerCE.select']='Please select the Docker CE mirror you want to use:'
        ['interaction.source.dockerCE.selectAndInput']='Please select and enter the Docker CE mirror you want to use'
        ['interaction.source.dockerRegistry.select']='Please select the Docker Registry mirror you want to use:'
        ['interaction.source.dockerRegistry.selectAndInput']='Please select and enter the Docker Registry mirror you want to use'
        ['interaction.protocol.select']='Please select network protocol for Docker CE mirror:'
        ['interaction.protocol.useHttp']='Use HTTP protocol for Docker CE mirror'
        ['interaction.firewall.close']='Close system firewall and SELinux'
        ['interaction.install.selectVersion']='Please select the version you want to install:'
        ['interaction.install.selectedVersion']='Specified installation version:'
        ['interaction.install.selectedTitle']='Please select the version to install, e.g.: {}'
        ['interaction.install.inputVersion']='Based on the list above, please select and enter the specific version you want to install:'
        ['interaction.install.latestVersion']='Install latest version of Docker Engine'
        ['interaction.backup.skipOverwrite']='Detected existing backup of Docker config file, skip overwriting backup'
        ['interaction.common.tip']='Tip'
        ['interaction.common.operationCanceled']='Operation canceled'
        ['interaction.common.yes']='Yes'
        ['interaction.common.no']='No'
        ['work.installDependents']='Install environment packages'
        ['work.installDockerEngine']='Install Docker Engine'
        ['source.sync.text1']='Update APT package index'
        ['source.sync.text2']='Generate mirror cache'
        ['result.install.failed']='Installation failed'
        ['result.install.checkSourceFile']='Check source file:'
        ['result.install.manuallyExecCmd']='Please try manually executing installation command: {}'
        ['result.install.notRunning']='Detected Docker service startup error, try running this script again'
        ['result.install.manuallyRun']='Please execute {} command to try starting or investigate error cause'
        ['result.registry.success']='Registry mirror replaced successfully'
        ['result.registry.dockerEngineNotExsit']='Docker Engine is not installed yet, please remove {} command option and rerun script!'
        ['commands.help']='Command options(name/meaning/value):

  --source                  Specify Docker CE mirror address (domain or IP)           address
  --source-registry         Specify Docker Registry mirror address (domain or IP)     address
  --branch                  Specify Docker CE mirror repository (path)                repo name
  --branch-version          Specify Docker CE mirror repository version               version
  --designated-version      Specify Docker Engine installation version                version
  --codename                Specify Debian-based OS codename                          codename
  --protocol                Specify Web protocol for Docker CE mirror                 http or https
  --install-latest          Whether to install the latest Docker Engine               true or false
  --close-firewall          Whether to disable the firewall                           true or false
  --clean-screen            Whether to clear the screen before running                true or false
  --only-registry           Only switch registry mirror mode                          none
  --pure-mode               Pure mode, minimal output                                 none
  --help                    Show help menu                                            none

Issue Report {}'
    )
}

init_msg_pack
handle_command_options "$@"
main
