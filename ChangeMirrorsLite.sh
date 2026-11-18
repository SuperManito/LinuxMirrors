#!/bin/bash
## Author: SuperManito
## Modified: 2026-11-19
## License: MIT
## GitHub: https://github.com/SuperManito/LinuxMirrors
## Website: https://linuxmirrors.cn

WEB_PROTOCOL="http"
INSTALL_EPEL="true"
IGNORE_BACKUP_TIPS="true"
UPGRADE_SOFTWARE="false"

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
SYSTEM_VOID="Void"

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
Dir_AptAdditionalSources=/etc/apt/sources.list.d
Dir_AptAdditionalSourcesBackup=$Dir_AptAdditionalSources.bak
Dir_YumRepos=/etc/yum.repos.d
Dir_YumReposBackup=$Dir_YumRepos.bak
Dir_ZYppRepos=/etc/zypp/repos.d
Dir_ZYppReposBackup=$Dir_ZYppRepos.bak
Dir_GentooReposConf=/etc/portage/repos.conf
Dir_NixConfig=/etc/nix
Dir_XbpsRepos=/etc/xbps.d
Dir_XbpsReposBackup=$Dir_XbpsRepos.bak
File_AptSourceList=/etc/apt/sources.list
File_AptSourceListBackup=$File_AptSourceList.bak
File_DebianSources=$Dir_AptAdditionalSources/debian.sources
File_DebianSourcesBackup=$File_DebianSources.bak
File_UbuntuSources=$Dir_AptAdditionalSources/ubuntu.sources
File_UbuntuSourcesBackup=$File_UbuntuSources.bak
File_ArmbianSourceList=$Dir_AptAdditionalSources/armbian.list
File_ArmbianSourceListBackup=$File_ArmbianSourceList.bak
File_ProxmoxSourceList=$Dir_AptAdditionalSources/pve-no-subscription.list
File_ProxmoxSourceListBackup=$File_ProxmoxSourceList.bak
File_ProxmoxSources=$Dir_AptAdditionalSources/pve-no-subscription.sources
File_ProxmoxSourcesBackup=$File_ProxmoxSources.bak
File_ProxmoxCephSourceList=$Dir_AptAdditionalSources/ceph.list
File_ProxmoxCephSourceListBackup=$File_ProxmoxCephSourceList.bak
File_ProxmoxCephSources=$Dir_AptAdditionalSources/ceph.sources
File_ProxmoxCephSourcesBackup=$File_ProxmoxCephSources.bak
File_LinuxMintSourceList=$Dir_AptAdditionalSources/official-package-repositories.list
File_LinuxMintSourceListBackup=$File_LinuxMintSourceList.bak
File_RaspberryPiSourceList=$Dir_AptAdditionalSources/raspi.list
File_RaspberryPiSourceListBackup=$File_RaspberryPiSourceList.bak
File_PacmanMirrorList=/etc/pacman.d/mirrorlist
File_PacmanMirrorListBackup=$File_PacmanMirrorList.bak
File_PacmanEndeavourOSMirrorList=/etc/pacman.d/endeavouros-mirrorlist
File_PacmanEndeavourOSMirrorListBackup=$File_PacmanEndeavourOSMirrorList.bak
File_AlpineRepositories=/etc/apk/repositories
File_AlpineRepositoriesBackup=$File_AlpineRepositories.bak
File_GentooMakeConf=/etc/portage/make.conf
File_GentooMakeConfBackup=$File_GentooMakeConf.bak
File_GentooReposConf=/etc/portage/repos.conf/gentoo.conf
File_GentooReposConfBackup=$File_GentooReposConf.bak
File_NixConf=/etc/nix/nix.conf
File_NixConfBackup=$File_NixConf.bak

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
    check_command_options
    run_start
    choose_mirrors
    choose_protocol
    choose_install_epel_packages
    backup_original_mirrors
    remove_original_mirrors
    change_mirrors_main
    upgrade_software
    run_end
}

function handle_command_options() {
    while [ $# -gt 0 ]; do
        case "$1" in
        ## 指定软件源地址
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
        --source-epel)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_EPEL="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-security)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_SECURITY="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-vault)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_VAULT="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-portage)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_PORTAGE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        --source-base-system)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "$(msg "error.cmd.options.validAddress")"
                else
                    SOURCE_BASE_SYSTEM="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "$(msg "error.cmd.options.sourceAddress")"
            fi
            ;;
        ## 指定软件源仓库
        --branch)
            if [ "$2" ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-epel)
            if [ "$2" ]; then
                SOURCE_EPEL_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-security)
            if [ "$2" ]; then
                SOURCE_SECURITY_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-vault)
            if [ "$2" ]; then
                SOURCE_VAULT_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-portage)
            if [ "$2" ]; then
                SOURCE_PORTAGE_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        --branch-base-system)
            if [ "$2" ]; then
                SOURCE_BASE_SYSTEM_BRANCH="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.sourceRepository")"
            fi
            ;;
        ## 指定 Debian 系操作系统的版本代号
        --codename)
            if [ "$2" ]; then
                DEBIAN_CODENAME="$2"
                shift
            else
                command_error "$1" "$(msg "error.cmd.options.codename")"
            fi
            ;;
        ## 使用官方源
        --use-official-source)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_OFFICIAL_SOURCE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        ## EPEL 使用 官方源
        --use-official-source-epel)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    USE_OFFICIAL_SOURCE_EPEL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        ## Web 协议（HTTP/HTTPS）
        --protocol | --web-protocol)
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
                ocommand_error "$1" "$(msg "error.cmd.options.needProtocol")"
            fi
            ;;
        ## 安装 EPEL 附加软件包
        --install-epel)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    INSTALL_EPEL="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        --only-epel)
            ONLY_EPEL="true"
            INSTALL_EPEL="true"
            ;;
        ## 备份原有软件源
        --backup)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    BACKUP="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        ## 更新软件包
        --upgrade-software | --updata-software)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    UPGRADE_SOFTWARE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        ## 在更新软件包后清理下载缓存
        --clean-cache)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLEAN_CACHE="${2,,}"
                    shift
                    ;;
                *)
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
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
                    command_error "$2" "$(msg "error.cmd.options.boolean")"
                    ;;
                esac
            else
                command_error "$1" "$(msg "error.cmd.options.boolean")"
            fi
            ;;
        ## 打印源文件修改前后差异
        --print-diff)
            PRINT_DIFF="true"
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
    ONLY_EPEL="${ONLY_EPEL:-"false"}"
    BACKUP="${BACKUP:-"true"}"
    USE_OFFICIAL_SOURCE="${USE_OFFICIAL_SOURCE:-"false"}"
    IGNORE_BACKUP_TIPS="${IGNORE_BACKUP_TIPS:-"false"}"
    PRINT_DIFF="${PRINT_DIFF:-"false"}"
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
    output_error "$(msg "error.unsupportSystem" "${1}")"
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
    elif [ -s "${File_RedHatRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_REDHAT}"
    elif [ -s "${File_openEulerRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENEULER}"
    elif [ -s "${File_OpenCloudOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENCLOUDOS}" # 自 9.0 版本起不再基于红帽
    elif [ -s "${File_AnolisOSRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ANOLISOS}" # 自 8.8 版本起不再基于红帽
    elif [ -s "${File_kylinVersion}" ] && [[ "${SYSTEM_ID}" == *"openkylin"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENKYLIN}"
    elif [ -f "${File_ArchLinuxRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ARCH}"
    elif [ -f "${File_AlpineRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_ALPINE}"
    elif [ -f "${File_GentooRelease}" ]; then
        SYSTEM_FACTIONS="${SYSTEM_GENTOO}"
    elif [[ "${SYSTEM_NAME}" == *"openSUSE"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENSUSE}"
    elif [[ "${SYSTEM_NAME}" == *"NixOS"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_NIXOS}"
    elif [[ "${SYSTEM_ID}" == "void" ]]; then
        SYSTEM_FACTIONS="${SYSTEM_VOID}"
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
        ## Raspberry Pi OS 判定
        if [[ "${SYSTEM_FACTIONS}" == "${SYSTEM_DEBIAN}" ]] && [ -s "${File_RaspberryPiOSRelease}" ]; then
            SYSTEM_JUDGMENT="${SYSTEM_RASPBERRY_PI_OS}"
            SYSTEM_PRETTY_NAME="${SYSTEM_RASPBERRY_PI_OS}"
        fi
        ## 针对特定系统的判定
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]]; then
            ## 尚未正式发布的版本
            if [[ -z "${SYSTEM_VERSION_ID}" && "${SYSTEM_VERSION_CODENAME}" == "forky" ]]; then
                SYSTEM_VERSION_ID="14"
                SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%%.*}"
                SYSTEM_VERSION_ID_MINOR="${SYSTEM_VERSION_ID#*.}"
            fi
            ## 是否使用 DEB822 格式
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" && "${SYSTEM_VERSION_ID_MAJOR}" -ge 13 ]]; then
                USE_DEB822_FORMAT="true"
            fi
        fi
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]]; then
            ## 是否使用 DEB822 格式
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" && "${SYSTEM_VERSION_ID_MAJOR}" -ge 24 ]]; then
                USE_DEB822_FORMAT="true"
            fi
        fi
        ;;
    "${SYSTEM_REDHAT}")
        SYSTEM_JUDGMENT="$(awk '{printf $1}' $File_RedHatRelease)"
        ## 针对特定系统的判定
        # Red Hat Enterprise Linux
        grep -q "${SYSTEM_RHEL}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_RHEL}"
        # CentOS Stream
        grep -q "${SYSTEM_CENTOS_STREAM}" $File_RedHatRelease && SYSTEM_JUDGMENT="${SYSTEM_CENTOS_STREAM}"
        # Oracle Linux
        [ -s "${File_OracleLinuxRelease}" ] && SYSTEM_JUDGMENT="${SYSTEM_ORACLE}"
        ;;
    "${SYSTEM_ARCH}")
        if [ -f "${File_ManjaroRelease}" ]; then
            SYSTEM_JUDGMENT="${SYSTEM_MANJARO}"
        else
            SYSTEM_JUDGMENT="${SYSTEM_FACTIONS}"
        fi
        ;;
    *)
        SYSTEM_JUDGMENT="${SYSTEM_FACTIONS}"
        ;;
    esac
    ## 判断系统及版本是否适配
    local is_supported="true"
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_DEBIAN}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(1[0-4]|[8-9])$ ]]; then
            is_supported="false"
        fi
        if [[ "${SYSTEM_VERSION_CODENAME}" == "sid" ]]; then
            if [[ "${PURE_MODE}" != "true" ]]; then
                echo -e "\n${WARN} $(msg "warn.unstableDebian" "${BLUE}unstable(sid)${PLAIN}")\n"
            fi
        fi
        ;;
    "${SYSTEM_UBUNTU}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(1[4-9]|2[0-6])$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_LINUX_MINT}")
        if [[ "${SYSTEM_NAME}" == *"LMDE"* ]]; then
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [6-7] ]]; then
                is_supported="false"
            fi
        else
            if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(19|2[0-2])$ ]]; then
                is_supported="false"
            fi
        fi
        ;;
    "${SYSTEM_RHEL}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([7-9]|10)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [7-8] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMALINUX}" | "${SYSTEM_ORACLE}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([8-9]|10)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_FEDORA}")
        if [[ "${SYSTEM_VERSION_ID}" != [3-4][0-9] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENEULER}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 2[0-6] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^([8-9]|23)$ ]] || [[ "${SYSTEM_VERSION_ID_MAJOR}" == 8 && "${SYSTEM_VERSION_ID_MINOR}" -lt 6 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_ANOLISOS}")
        if [[ ! "${SYSTEM_VERSION_ID_MAJOR}" =~ ^(8|23)$ ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENSUSE}")
        case "${SYSTEM_ID}" in
        "opensuse-leap")
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 1[5-6] ]]; then
                is_supported="false"
            fi
            ;;
        "opensuse-tumbleweed") ;;
        *)
            is_supported="false"
            ;;
        esac
        ;;
    # 理论全部支持或不作判断
    "${SYSTEM_KALI}" | "${SYSTEM_DEEPIN}" | "${SYSTEM_ZORIN}" | "${SYSTEM_RASPBERRY_PI_OS}" | "${SYSTEM_OPENKYLIN}") ;;
    "${SYSTEM_ARCH}" | "${SYSTEM_MANJARO}" | "${SYSTEM_ALPINE}" | "${SYSTEM_GENTOO}" | "${SYSTEM_NIXOS}" | "${SYSTEM_VOID}") ;;
    *)
        unsupport_system_error "$(msg "error.unknownVersion")"
        ;;
    esac
    if [[ "${is_supported}" == "false" ]]; then
        unsupport_system_error "$(msg "error.unsupportVersion")"
    fi
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
    i686)
        DEVICE_ARCH="x86_32"
        ;;
    *)
        DEVICE_ARCH="${DEVICE_ARCH_RAW}"
        ;;
    esac
    ## 定义软件源仓库名称
    if [[ -z "${SOURCE_BRANCH}" ]]; then
        ## 默认为系统名称小写，替换空格
        SOURCE_BRANCH="${SYSTEM_JUDGMENT,,}"
        SOURCE_BRANCH="${SOURCE_BRANCH// /-}"
        ## 处理特殊的仓库名称
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_DEBIAN}")
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8 | 9 | 10 | 11)
                SOURCE_BRANCH="debian-archive/debian"
                ;;
            *)
                SOURCE_BRANCH="debian"
                ;;
            esac
            ;;
        "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                SOURCE_BRANCH="ubuntu"
            else
                SOURCE_BRANCH="ubuntu-ports"
            fi
            ;;
        "${SYSTEM_RASPBERRY_PI_OS}")
            SOURCE_BRANCH="raspberrypi"
            ;;
        "${SYSTEM_DEEPIN}")
            # deepin 25 起仓库路径追加版本代号（如 deepin/beige），旧版本为 deepin
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" -ge 25 ]]; then
                SOURCE_BRANCH="deepin/${SYSTEM_VERSION_CODENAME,,}"
            else
                SOURCE_BRANCH="deepin"
            fi
            ;;
        "${SYSTEM_RHEL}")
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            7 | 8)
                if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                    SOURCE_BRANCH="centos-vault"
                else
                    SOURCE_BRANCH="centos-altarch"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos-stream" # 使用 CentOS Stream 仓库
                ;;
            esac
            ;;
        "${SYSTEM_CENTOS}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                SOURCE_BRANCH="centos-vault"
            else
                SOURCE_BRANCH="centos-altarch"
            fi
            ;;
        "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
            # 自 CentOS Stream 9 开始使用 centos-stream 仓库，旧版本使用 centos 仓库
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8)
                if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
                    SOURCE_BRANCH="centos-vault"
                else
                    SOURCE_BRANCH="centos-altarch"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos-stream"
                ;;
            esac
            ;;
        "${SYSTEM_FEDORA}")
            if [[ "${SYSTEM_VERSION_ID}" -lt 39 ]]; then
                SOURCE_BRANCH="fedora-archive"
            fi
            ;;
        "${SYSTEM_ARCH}")
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                SOURCE_BRANCH="archlinux"
            else
                SOURCE_BRANCH="archlinuxarm"
            fi
            # EndeavourOS
            if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                SOURCE_BRANCH="archlinux"
            fi
            ;;
        "${SYSTEM_OPENCLOUDOS}")
            # OpenCloudOS Stream
            grep -q "${SYSTEM_OPENCLOUDOS_STREAM}" $File_OpenCloudOSRelease
            if [ $? -eq 0 ]; then
                SOURCE_BRANCH="${SYSTEM_OPENCLOUDOS_STREAM,,}"
                SOURCE_BRANCH="${SOURCE_BRANCH// /-}"
            fi
            ;;
        "${SYSTEM_NIXOS}")
            SOURCE_BRANCH="nix-channels"
            ;;
        "${SYSTEM_VOID}")
            SOURCE_BRANCH="voidlinux"
            ;;
        esac
    fi
    ## 定义软件源更新文字
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_ALPINE}" | "${SYSTEM_OPENKYLIN}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text1")"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text2")"
        ;;
    "${SYSTEM_OPENSUSE}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text3")"
        ;;
    "${SYSTEM_ARCH}" | "${SYSTEM_GENTOO}" | "${SYSTEM_VOID}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text4")"
        ;;
    "${SYSTEM_NIXOS}")
        SYNC_MIRROR_TEXT="$(msg "source.sync.text5")"
        ;;
    esac
    ## 判断是否可以使用高级交互式选择器
    CAN_USE_ADVANCED_INTERACTIVE_SELECTION="false"
    if command_exists tput; then
        CAN_USE_ADVANCED_INTERACTIVE_SELECTION="true"
    fi
}

## 命令选项兼容性判断
function check_command_options() {
    if [[ "${DEBIAN_CODENAME}" ]]; then
        if [[ "${SYSTEM_FACTIONS}" != "${SYSTEM_DEBIAN}" && "${SYSTEM_FACTIONS}" != "${SYSTEM_OPENKYLIN}" ]]; then
            output_error "$(msg "error.cmd.options.unsupportCodename")"
        fi
    fi
    if [[ "${ONLY_EPEL}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_REDHAT}")
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
                output_error "$(msg "error.cmd.options.unsupportEPEL")"
            fi
            ;;
        *)
            output_error "$(msg "error.cmd.options.unsupportEPEL")"
            ;;
        esac
    fi
}

function choose_display_language() { :; }

function choose_mirrors() { :; }

function choose_protocol() { :; }

function choose_install_epel_packages() { :; }

## 备份原有软件源（文件/目录）
function backup_original_mirrors() {
    function backup_file() {
        local target_file=$1
        local backup_file=$2
        local type="$3"
        ## 判断是否存在源文件
        [ -f "${target_file}" ] || touch "${target_file}"
        if [ ! -s "${target_file}" ]; then
            return
        fi
        ## 判断是否存在已备份的源文件
        if [ -s "${backup_file}" ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" != "false" ]]; then
                return
            fi
            local ask_text="$(msg "interaction.backup.skipOverwrite.sourceFile" "${type}")?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    echo ''
                    cp -rvf "${target_file}" "${backup_file}" 2>&1
                    BACKED_UP="true"
                fi
            else
                local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE_BACKUP}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    echo ''
                    cp -rvf "${target_file}" "${backup_file}" 2>&1
                    BACKED_UP="true"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.noOverwrite")"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf "${target_file}" "${backup_file}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE $(msg "info.backuped.sourceFile" "${type}")"
            sleep 1s
        fi
    }
    function backup_dir() {
        local target_dir=$1
        local backup_dir=$2
        local file_type="${3:-repo}"
        [ -d "${target_dir}" ] || mkdir -p "${target_dir}"
        [ -d "${backup_dir}" ] || mkdir -p "${backup_dir}"
        ## 判断是否存在软件源文件
        ls "${target_dir}" | grep "\.${file_type}$" -q
        if [ $? -ne 0 ]; then
            return
        fi
        ## 判断是否存在已备份的软件源文件
        ls "${backup_dir}" | grep "\.${file_type}$" -q
        if [ $? -eq 0 ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" != "false" ]]; then
                return
            fi
            local ask_text="$(msg "interaction.backup.skipOverwrite.sourceFile" "${file_type}")?"
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    echo ''
                    cp -rvf $target_dir/* "${backup_dir}" 2>&1
                    BACKED_UP="true"
                fi
            else
                local CHOICE_BACKUP="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
                read -rp "${CHOICE_BACKUP}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    echo ''
                    cp -rvf $target_dir/* "${backup_dir}" 2>&1
                    BACKED_UP="true"
                    ;;
                *)
                    input_error "$(msg "error.defaultBehavior.noOverwrite")"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf $target_dir/* "${backup_dir}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE $(msg "info.backuped.sourceFile" "${file_type}")"
            sleep 1s
        fi
    }

    BACKED_UP="false" # 是否已备份
    if [[ "${BACKUP}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            # Debian DEB822 格式源文件
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]] && [ -f "${File_DebianSources}" ]; then
                backup_file $File_DebianSources $File_DebianSourcesBackup "debian.sources"
                USE_DEB822_FORMAT="true"
            fi
            # Ubuntu DEB822 格式源文件
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]] && [ -f "${File_UbuntuSources}" ]; then
                backup_file $File_UbuntuSources $File_UbuntuSourcesBackup "ubuntu.sources"
                USE_DEB822_FORMAT="true"
            fi
            # /etc/apt/sources.list
            if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" && -s "${File_AptSourceList}" ]]; then
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    grep -Eqv '^#|^$' $File_AptSourceList
                    if [ $? -eq 0 ]; then
                        backup_file $File_AptSourceList $File_AptSourceListBackup "sources.list"
                    fi
                else
                    backup_file $File_AptSourceList $File_AptSourceListBackup "sources.list"
                fi
            fi
            # Armbian
            if [ -f "${File_ArmbianRelease}" ]; then
                backup_file $File_ArmbianSourceList $File_ArmbianSourceListBackup "armbian.list"
            fi
            # Proxmox VE
            if [ -f "${File_ProxmoxVersion}" ]; then
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    backup_file $File_ProxmoxSources $File_ProxmoxSourcesBackup "pve-no-subscription.sources"
                    [ -f "${File_ProxmoxCephSources}" ] && backup_file $File_ProxmoxCephSources $File_ProxmoxCephSourcesBackup "ceph.sources"
                else
                    backup_file $File_ProxmoxSourceList $File_ProxmoxSourceListBackup "pve-no-subscription.list"
                    [ -f "${File_ProxmoxCephSourceList}" ] && backup_file $File_ProxmoxCephSourceList $File_ProxmoxCephSourceListBackup "ceph.list"
                fi
            fi
            # Linux Mint
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]]; then
                backup_file $File_LinuxMintSourceList $File_LinuxMintSourceListBackup "official-package-repositories.list"
            fi
            # Raspberry Pi OS
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]]; then
                backup_file $File_RaspberryPiSourceList $File_RaspberryPiSourceListBackup "raspi.list"
            fi
            ;;
        "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
            # /etc/yum.repos.d
            backup_dir $Dir_YumRepos $Dir_YumReposBackup
            ;;
        "${SYSTEM_OPENSUSE}")
            # /etc/zypp/repos.d
            backup_dir $Dir_ZYppRepos $Dir_ZYppReposBackup
            ;;
        "${SYSTEM_ARCH}")
            # /etc/pacman.d/mirrorlist
            backup_file $File_PacmanMirrorList $File_PacmanMirrorListBackup "mirrorlist"
            # EndeavourOS
            if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                # /etc/pacman.d/endeavouros-mirrorlist
                backup_file $File_PacmanEndeavourOSMirrorList $File_PacmanEndeavourOSMirrorListBackup "endeavouros-mirrorlist"
            fi
            ;;
        "${SYSTEM_ALPINE}")
            # /etc/apk/repositories
            backup_file $File_AlpineRepositories $File_AlpineRepositoriesBackup "repositories"
            ;;
        "${SYSTEM_GENTOO}")
            # /etc/portage/make.conf
            backup_file $File_GentooMakeConf $File_GentooMakeConfBackup "make.conf"
            # /etc/portage/repos.conf/gentoo.conf
            [ -d "${Dir_GentooReposConf}" ] || mkdir -p "${Dir_GentooReposConf}"
            backup_file $File_GentooReposConf $File_GentooReposConfBackup "gentoo.conf"
            ;;
        "${SYSTEM_NIXOS}")
            [ ! -d "${Dir_NixConfig}" ] && mkdir -p "${Dir_NixConfig}"
            # /etc/nix/nix.conf
            backup_file $File_NixConf $File_NixConfBackup "nix.conf"
            ;;
        "${SYSTEM_VOID}")
            # /etc/xbps.d
            backup_dir $Dir_XbpsRepos $Dir_XbpsReposBackup "conf"
            ;;
        esac
    fi
}

## 移除原有软件源
function remove_original_mirrors() {
    function clear_file() {
        [ -f "$1" ] && sed -i '1,$d' "$1"
    }

    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        # /etc/apt/sources.list.d
        [ -d "${Dir_AptAdditionalSources}" ] || mkdir -p $Dir_AptAdditionalSources
        # Debian DEB822 格式源文件
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]] && [ -f "${File_DebianSources}" ]; then
            clear_file $File_DebianSources
            USE_DEB822_FORMAT="true"
        fi
        # Ubuntu DEB822 格式源文件
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]] && [ -f "${File_UbuntuSources}" ]; then
            clear_file $File_UbuntuSources
            USE_DEB822_FORMAT="true"
        fi
        # /etc/apt/sources.list
        if [[ "${USE_DEB822_FORMAT}" != "true" ]] && [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" ]]; then
            [ -s "${File_AptSourceList}" ] && clear_file $File_AptSourceList
        fi
        ## 解决软件源冲突
        if [[ "${USE_DEB822_FORMAT}" == "true" ]] && [ -s "${File_AptSourceList}" ]; then
            if [[ "${SOURCE_BRANCH}" ]]; then
                sed -e "/^deb\(-src\)\? http.*\/${SOURCE_BRANCH}/d" \
                    -e "/^#[[:space:]]*deb\(-src\)\? http.*\/${SOURCE_BRANCH}/d" \
                    -e "/^#.*\(默认禁用源码镜像以提高更新速度\|安全更新软件源\|预发布软件源\).*/d" \
                    -i \
                    $File_AptSourceList
            fi
        fi
        # Armbian
        [ -f "${File_ArmbianRelease}" ] && clear_file $File_ArmbianSourceList
        # Proxmox VE
        if [ -f "${File_ProxmoxVersion}" ]; then
            if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                clear_file $File_ProxmoxSources
                [ -f "${File_ProxmoxCephSources}" ] && clear_file $File_ProxmoxCephSources
            else
                clear_file $File_ProxmoxSourceList
                [ -f "${File_ProxmoxCephSourceList}" ] && clear_file $File_ProxmoxCephSourceList
            fi
        fi
        # Linux Mint
        [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]] && clear_file $File_LinuxMintSourceList
        # Raspberry Pi OS
        [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]] && clear_file $File_RaspberryPiSourceList
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        if [ ! -d "${Dir_YumRepos}" ]; then
            mkdir -p "${Dir_YumRepos}"
            return
        fi
        local -a repo_patterns=()
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
            repo_patterns=(
                "fedora.repo"
                "fedora-updates.repo"
                "fedora-updates-testing.repo"
                "fedora-modular.repo"
                "fedora-updates-modular.repo"
                "fedora-updates-testing-modular.repo"
            )
        else
            if [[ "${ONLY_EPEL}" != "false" ]]; then
                return
            fi
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_RHEL}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                7 | 8)
                    repo_patterns=("CentOS-*")
                    ;;
                *)
                    repo_patterns=(
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                esac
                ;;
            "${SYSTEM_CENTOS}")
                repo_patterns=("CentOS-*")
                ;;
            "${SYSTEM_CENTOS_STREAM}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9 | 10)
                    repo_patterns=(
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                8)
                    repo_patterns=("CentOS-Stream-*")
                    ;;
                esac
                ;;
            "${SYSTEM_ROCKY}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9)
                    repo_patterns=(
                        "rocky.repo"
                        "rocky-addons.repo"
                        "rocky-devel.repo"
                        "rocky-extras.repo"
                    )
                    ;;
                8)
                    repo_patterns=("Rocky-*")
                    ;;
                esac
                ;;
            "${SYSTEM_ALMALINUX}")
                repo_patterns=("almalinux*")
                ;;
            "${SYSTEM_ORACLE}")
                case "${SYSTEM_VERSION_ID_MAJOR}" in
                9 | 10)
                    repo_patterns=(
                        "*ol${SYSTEM_VERSION_ID_MAJOR}.repo"
                        "centos-stream.repo"
                        "centos-stream-addons.repo"
                    )
                    ;;
                8)
                    repo_patterns=(
                        "*ol${SYSTEM_VERSION_ID_MAJOR}.repo"
                        "CentOS-Stream-*"
                    )
                    ;;
                esac
                ;;
            "${SYSTEM_OPENCLOUDOS}")
                repo_patterns=("OpenCloudOS*")
                ;;
            "${SYSTEM_ANOLISOS}")
                repo_patterns=("AnolisOS*")
                ;;
            "${SYSTEM_OPENEULER}")
                repo_patterns=("openEuler.repo")
                ;;
            esac
        fi
        for pattern in "${repo_patterns[@]}"; do
            if [[ -n "$pattern" ]]; then
                eval "rm -rf $Dir_YumRepos/$pattern"
            fi
        done
        ;;
    "${SYSTEM_OPENSUSE}")
        if [ ! -d "${Dir_ZYppRepos}" ]; then
            mkdir -p "${Dir_ZYppRepos}"
            return
        fi
        rm -rf $Dir_ZYppRepos/repo-*
        rm -rf $Dir_ZYppRepos/openSUSE:repo-*
        rm -rf $Dir_ZYppRepos/download.opensuse.org-*
        ;;
    "${SYSTEM_ARCH}")
        clear_file $File_PacmanMirrorList
        # EndeavourOS
        if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
            clear_file $File_PacmanEndeavourOSMirrorList
        fi
        ;;
    "${SYSTEM_ALPINE}")
        clear_file $File_AlpineRepositories
        ;;
    "${SYSTEM_GENTOO}")
        clear_file $File_GentooReposConf
        ;;
    "${SYSTEM_VOID}")
        if [ ! -d "${Dir_XbpsRepos}" ]; then
            mkdir -p "${Dir_XbpsRepos}"
            return
        fi
        rm -rf $Dir_XbpsRepos/*-repository-*.conf
        ;;
    esac
}

## 换源
function change_mirrors_main() {
    ## 打印软件源内容修改前后差异
    function print_diff() {
        ## 单一文件
        function diff_file() {
            local diff_file=$1
            local origin_file=$2
            if [ -s "${diff_file}" ] && [ -s "${origin_file}" ]; then
                if [[ "$(cat "${diff_file}")" != "$(cat "${origin_file}")" ]]; then
                    echo -e "\n${BLUE}${diff_file}${PLAIN} -> ${BLUE}${origin_file}${PLAIN}"
                    diff "${diff_file}" "${origin_file}" -d --color=always -I -B -E
                fi
            fi
        }
        ## 目录文件
        function diff_dir() {
            local diff_dir=$1
            local origin_dir=$2
            for item in $(ls $diff_dir | xargs); do
                diff_file "${diff_dir}/${item}" "${origin_dir}/${item}"
            done
        }

        if command_exists diff && [[ "${BACKED_UP}" == "true" ]]; then
            case "${SYSTEM_FACTIONS}" in
            "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
                if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                    # DEB822 格式源文件
                    if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]]; then
                        diff_file $File_DebianSourcesBackup $File_DebianSources
                    fi
                    if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_UBUNTU}" ]]; then
                        diff_file $File_UbuntuSourcesBackup $File_UbuntuSources
                    fi
                else
                    if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" ]]; then
                        diff_file $File_AptSourceListBackup $File_AptSourceList
                    fi
                fi
                # Armbian
                if [ -f "${File_ArmbianRelease}" ]; then
                    diff_file $File_ArmbianSourceListBackup $File_ArmbianSourceList
                fi
                # Proxmox VE
                if [ -f "${File_ProxmoxVersion}" ]; then
                    if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
                        diff_file $File_ProxmoxSourcesBackup $File_ProxmoxSources
                        [ -f "${File_ProxmoxCephSources}" ] && diff_file $File_ProxmoxCephSourcesBackup $File_ProxmoxCephSources
                    else
                        diff_file $File_ProxmoxSourceListBackup $File_ProxmoxSourceList
                        [ -f "${File_ProxmoxCephSourceList}" ] && diff_file $File_ProxmoxCephSourceListBackup $File_ProxmoxCephSourceList
                    fi
                fi
                # Linux Mint
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_LINUX_MINT}" ]]; then
                    diff_file $File_LinuxMintSourceListBackup $File_LinuxMintSourceList
                fi
                # Raspberry Pi OS
                if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_RASPBERRY_PI_OS}" ]]; then
                    diff_file $File_RaspberryPiSourceListBackup $File_RaspberryPiSourceList
                fi
                ;;
            "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
                diff_dir $Dir_YumReposBackup $Dir_YumRepos
                ;;
            "${SYSTEM_OPENSUSE}")
                diff_dir $Dir_ZYppReposBackup $Dir_ZYppRepos
                ;;
            "${SYSTEM_ARCH}")
                diff_file $File_PacmanMirrorListBackup $File_PacmanMirrorList
                # EndeavourOS
                if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
                    diff_file $File_PacmanEndeavourOSMirrorListBackup $File_PacmanEndeavourOSMirrorList
                fi
                ;;
            "${SYSTEM_ALPINE}")
                diff_file $File_AlpineRepositoriesBackup $File_AlpineRepositories
                ;;
            "${SYSTEM_GENTOO}")
                diff_file $File_GentooMakeConfBackup $File_GentooMakeConf
                diff_file $File_GentooReposConfBackup $File_GentooReposConf
                ;;
            "${SYSTEM_NIXOS}")
                diff_file $File_NixConfBackup $File_NixConf
                ;;
            "${SYSTEM_VOID}")
                diff_dir $Dir_XbpsReposBackup $Dir_XbpsRepos
                ;;
            esac
        fi
    }
    if [[ -z "${SOURCE}" ]]; then
        USE_OFFICIAL_SOURCE="true"
    fi
    ## 调用换源函数
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        change_mirrors_Debian
        ;;
    "${SYSTEM_REDHAT}")
        change_mirrors_RedHat
        ;;
    "${SYSTEM_OPENEULER}")
        change_mirrors_openEuler
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        change_mirrors_OpenCloudOS
        ;;
    "${SYSTEM_OPENKYLIN}")
        change_mirrors_openKylin
        ;;
    "${SYSTEM_ANOLISOS}")
        change_mirrors_AnolisOS
        ;;
    "${SYSTEM_OPENSUSE}")
        change_mirrors_openSUSE
        ;;
    "${SYSTEM_ARCH}")
        change_mirrors_ArchLinux
        ;;
    "${SYSTEM_ALPINE}")
        change_mirrors_Alpine
        ;;
    "${SYSTEM_GENTOO}")
        change_mirrors_Gentoo
        ;;
    "${SYSTEM_NIXOS}")
        change_mirrors_NixOS
        ;;
    "${SYSTEM_VOID}")
        change_mirrors_Void
        ;;
    esac
    ## 比较差异
    if [[ "${PRINT_DIFF}" == "true" ]]; then
        print_diff
    fi
    ## 更新软件源
    local -a commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        commands+=("apt-get update")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        commands+=("${package_manager} makecache")
        ;;
    "${SYSTEM_OPENSUSE}")
        commands+=("zypper ref")
        ;;
    "${SYSTEM_ARCH}")
        commands+=("pacman -Sy")
        ;;
    "${SYSTEM_ALPINE}")
        commands+=("apk update -f")
        ;;
    "${SYSTEM_GENTOO}")
        commands+=("emerge --sync --quiet")
        ;;
    "${SYSTEM_NIXOS}")
        commands+=("nix-store --verify")
        commands+=("nix-channel --update")
        ;;
    "${SYSTEM_VOID}")
        commands+=("xbps-install -S")
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
        if [ $? -ne 0 ]; then
            echo ''
            exit 1
        fi
    else
        echo -e "\n$WORKING ${SYNC_MIRROR_TEXT}...\n"
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
        if [ $? -eq 0 ]; then
            echo -e "\n$SUCCESS $(msg "source.changeResult.success")"
        else
            echo -e "\n$FAIL $(msg "source.changeResult.fail" "${SYNC_MIRROR_TEXT}")"
            echo -e "\n$TIP $(msg "source.changeResult.tipTitle" "${SYNC_MIRROR_TEXT}")"
            echo -e "\n1. $(msg "source.changeResult.tip1")"
            echo -e "2. $(msg "source.changeResult.tip2" "${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}")"
            echo -e "      $(msg "source.changeResult.tip2.1")"
            echo -e "      $(msg "source.changeResult.tip2.2")"
            echo -e "      $(msg "source.changeResult.tip2.3")"
            echo -e "3. $(msg "source.changeResult.tip3")\n"
            exit 1
        fi
    fi
}

## 升级软件包
function upgrade_software() {
    ## 跳过特殊的系统
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}" | "${SYSTEM_ORACLE}")
        return
        ;;
    esac
    local ask_text=""
    ## 交互确认
    if [[ -z "${UPGRADE_SOFTWARE}" ]]; then
        UPGRADE_SOFTWARE="false"
        ask_text="$(msg "interaction.upgrade.skip")?"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "false" ]]; then
                UPGRADE_SOFTWARE="true"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss]) ;;
            [Nn] | [Nn][Oo])
                UPGRADE_SOFTWARE="true"
                ;;
            *)
                input_error "$(msg "error.defaultBehavior.noUpdate")"
                ;;
            esac
        fi
    fi
    if [[ "${UPGRADE_SOFTWARE}" == "false" ]]; then
        return
    fi
    if [[ -z "${CLEAN_CACHE}" ]]; then
        CLEAN_CACHE="false"
        ask_text="$(msg "interaction.cache.autoClean")?"
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "true" ]]; then
                CLEAN_CACHE="true"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss])
                CLEAN_CACHE="true"
                ;;
            [Nn] | [Nn][Oo]) ;;
            *)
                input_error "$(msg "error.defaultBehavior.noClean")"
                ;;
            esac
        fi
    fi
    local -a commands=()
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        commands+=("apt-get upgrade -y")
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        commands+=("${package_manager} upgrade -y")
        ;;
    "${SYSTEM_OPENSUSE}")
        commands+=("zypper update -y")
        ;;
    "${SYSTEM_ARCH}")
        commands+=("pacman -Syu --noconfirm")
        ;;
    "${SYSTEM_ALPINE}")
        commands+=("apk upgrade --no-cache")
        ;;
    "${SYSTEM_GENTOO}")
        commands+=("emerge --update --deep --with-bdeps=y --ask=n @world")
        ;;
    "${SYSTEM_NIXOS}")
        commands+=("nixos-rebuild switch")
        ;;
    "${SYSTEM_VOID}")
        commands+=("xbps-install -yu")
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
        animate_exec "${exec_cmd}" "$(msg "work.upgradeSoftware")"
    else
        echo ''
        for cmd in "${commands[@]}"; do
            eval "${cmd}"
        done
    fi
    if [[ "${CLEAN_CACHE}" == "false" ]]; then
        return
    fi
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
        apt-get autoremove -y >/dev/null 2>&1
        apt-get clean >/dev/null 2>&1
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        local package_manager="$(get_package_manager)"
        $package_manager autoremove -y >/dev/null 2>&1
        $package_manager clean packages -y >/dev/null 2>&1
        ;;
    "${SYSTEM_OPENSUSE}")
        rm -rf /var/cache/zypp/* >/dev/null 2>&1
        ;;
    "${SYSTEM_ARCH}")
        pacman -Scc --noconfirm >/dev/null 2>&1
        ;;
    "${SYSTEM_ALPINE}")
        rm -rf /var/cache/apk/* >/dev/null 2>&1
        ;;
    "${SYSTEM_GENTOO}")
        eclean-dist --deep >/dev/null 2>&1
        eclean-packages --deep >/dev/null 2>&1
        ;;
    "${SYSTEM_NIXOS}")
        nix-collect-garbage -d >/dev/null 2>&1
        ;;
    "${SYSTEM_VOID}")
        xbps-remove -O >/dev/null 2>&1
        ;;
    esac
}

##############################################################################

## 更换基于 Debian 系 Linux 发行版的软件源
function change_mirrors_Debian() {
    local apt_source_file=$File_AptSourceList
    local apt_source_content=""
    function write_apt_source() {
        if [[ -n "${apt_source_content}" ]]; then
            echo "${apt_source_content}" >>$apt_source_file
        fi
        apt_source_content="" # 重置内容
    }

    ## 注释的提示语句
    local deb_src_disabled_tips="## $(msg "source.comment.disabledSourceCode")"
    local security_source_tips="## $(msg "source.comment.securitySource")"
    local proposed_source_tips="## $(msg "source.comment.proposedSource")"

    ## one-line 格式模板
    function _template_deb() {
        echo "${1} ${WEB_PROTOCOL}://${2}/ ${3} ${4}"
    }
    function gen_deb() {
        echo "$(_template_deb "deb" "${1}" "${2}" "${3}")
$(_template_deb "deb-src" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb_unsrc() {
        echo "$(_template_deb "deb" "${1}" "${2}" "${3}")"
    }
    function gen_deb_disabled() {
        echo "$(gen_deb "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb_unsrc_disabled() {
        echo "$(gen_deb_unsrc "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb_security() {
        echo "${security_source_tips}
$(gen_deb "${1}" "${2}-security" "${3}")"
    }

    ## DEB822 格式模板
    function _template_deb822() {
        echo "Types: ${1}
URIs: ${WEB_PROTOCOL}://${2}/
Suites: ${3}
Components: ${4}
Signed-By: /usr/share/keyrings/${_DEB22_ARCHIVE_KEYRING:-"${SYSTEM_JUDGMENT,,}-archive-keyring.gpg"}"
    }
    function gen_deb822() {
        echo "$(_template_deb822 "deb" "${1}" "${2}" "${3}")

$(_template_deb822 "deb-src" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb822_unsrc() {
        echo "$(_template_deb822 "deb" "${1}" "${2}" "${3}")"
    }
    function gen_deb822_disabled() {
        echo "$(_template_deb822 "deb" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")

$(_template_deb822 "deb-src" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb822_security() {
        echo "${security_source_tips}
$(gen_deb822 "${1}" "${2}-security" "${3}")"
    }

    ## 获取 Debian 软件源相关信息
    function _template_get_debian_info() {
        local data1="${1}"
        local data2="${2}"
        local mode="${3:-main}"
        local codename="${4}"
        local result="${data2}"
        case "${mode}" in
        "security")
            local -a majors=(8 9 10)
            local -a codenames=("jessie" "stretch" "buster")
            ;;
        *)
            local -a majors=(8 9 10 11)
            local -a codenames=("jessie" "stretch" "buster" "bullseye")
            ;;
        esac
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_DEBIAN}" ]]; then
            for version in "${majors[@]}"; do
                if [[ "${SYSTEM_VERSION_ID_MAJOR}" == "${version}" ]]; then
                    result="${data1}"
                    break
                fi
            done
        else
            for name in "${codenames[@]}"; do
                if [[ "${codename}" == "${name}" ]]; then
                    result="${data1}"
                    break
                fi
            done
        fi
        echo "${result}"
    }
    function get_debian_official_source() {
        # 注：使用官方源时仓库分支固定为 debian，应同此方法一起使用
        _template_get_debian_info "archive.debian.org" "deb.debian.org" "main" "${1}"
    }
    function get_debian_source_branch() {
        _template_get_debian_info "debian-archive/debian" "debian" "main" "${1}"
    }
    function get_debian_repo_components() {
        _template_get_debian_info "main contrib non-free" "main contrib non-free non-free-firmware" "main" "${1}"
    }
    function get_debian_official_source_security_host() {
        # 注：使用官方源时仓库分支固定为 debian-security，应同此方法一起使用
        _template_get_debian_info "archive.debian.org" "security.debian.org" "security" "${1}"
    }
    function get_debian_source_security_branch() {
        _template_get_debian_info "debian-archive/debian-security" "debian-security" "security" "${1}"
    }

    ## Debian 软件源模板
    # debian-backports: https://ftp.debian.org/debian/dists
    # debian-security: https://security.debian.org/debian-security/dists
    function _template_gen_debian_source() {
        local mode="${4:-main}"
        local type="${5:-deb}"
        local result=""

        case "${mode}" in
        "security")
            case "${2}" in
            "forky" | "trixie" | "bookworm" | "bullseye" | "oldoldstable" | "oldstable" | "stable" | "testing")
                if [[ "${type}" == "deb822" ]]; then
                    result="$(gen_deb822_security "${1}" "${2}" "${3}")"
                else
                    result="$(gen_deb_security "${1}" "${2}" "${3}")"
                fi
                ;;
            "jessie" | "stretch" | "buster")
                if [[ "${type}" == "deb822" ]]; then
                    result="${security_source_tips}
$(gen_deb822 "${1}" "${2}" "${3}")"
                else
                    result="${security_source_tips}
$(gen_deb "${1}" "${2}" "${3}")"
                fi
                ;;
            *)
                result=""
                ;;
            esac
            ;;

        *)
            case "${2}" in
            "forky" | "trixie" | "bookworm" | "stable" | "oldstable" | "testing")
                if [[ "${type}" == "deb822" ]]; then
                    result="${deb_src_disabled_tips}
$(gen_deb822 "${1}" "${2} ${2}-updates ${2}-backports" "${3}")"
                else
                    result="$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")
$(gen_deb "${1}" "${2}-backports" "${3}")"
                fi
                ;;
            *)
                if [[ "${type}" == "deb822" ]]; then
                    result="${deb_src_disabled_tips}
$(gen_deb822 "${1}" "${2} ${2}-updates" "${3}")"
                else
                    result="$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")"
                fi
                ;;
            esac
            ;;
        esac
        echo "${result}"
    }
    function gen_debian_deb() {
        _template_gen_debian_source "${1}" "${2}" "${3}" "main" "deb"
    }
    function gen_debian_deb_security() {
        _template_gen_debian_source "${1}" "${2}" "${3}" "security" "deb"
    }
    function gen_debian_deb822() {
        _template_gen_debian_source "${1}" "${2}" "${3}" "main" "deb822"
    }
    function gen_debian_deb822_security() {
        _template_gen_debian_source "${1}" "${2}" "${3}" "security" "deb822"
    }

    ## Ubuntu 软件源模板
    function gen_ubuntu_deb() {
        echo "$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")
$(gen_deb "${1}" "${2}-backports" "${3}")
${proposed_source_tips}
$(gen_deb_disabled "${1}" "${2}-proposed" "${3}")"
    }
    function gen_ubuntu_deb822() {
        echo "${deb_src_disabled_tips}
$(gen_deb822 "${1}" "${2} ${2}-updates ${2}-backports" "${3}")

${proposed_source_tips}
$(gen_deb822_disabled "${1}" "${2}-proposed" "${3}")"
    }

    # 注：SOURCE_<XXX> SOURCE_<XXX>_BRANCH 系列变量默认为空值，仅在自定义（使用相关命令选项）时提供，需注意逻辑顺序
    local repo_components=""                          # 软件源仓库区域
    local source_address="${SOURCE}/${SOURCE_BRANCH}" # 软件源地址

    local source_security_host="${SOURCE}"
    local source_security_branch="${SOURCE_BRANCH}"
    local source_security_address=""

    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_DEBIAN}")
        repo_components="$(get_debian_repo_components "${SYSTEM_VERSION_CODENAME}")"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="$(get_debian_official_source "${SYSTEM_VERSION_CODENAME}")"
            SOURCE_BRANCH="debian"
            source_address="${SOURCE}/${SOURCE_BRANCH}"
        fi
        # 安全更新源
        source_security_branch="$(get_debian_source_security_branch "${SYSTEM_VERSION_CODENAME}")"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            source_security_host="$(get_debian_official_source_security_host "${SYSTEM_VERSION_CODENAME}")"
            source_security_branch="debian-security"
        fi
        source_security_address="${SOURCE_SECURITY:-${source_security_host}}/${SOURCE_SECURITY_BRANCH:-${source_security_branch}}"
        ## DEB822 / one-line
        if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
            apt_source_file="${File_DebianSources}"
            if [[ "${SYSTEM_VERSION_CODENAME}" != "sid" ]]; then
                apt_source_content="$(gen_debian_deb822 "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")

$(gen_debian_deb822_security "${source_security_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
            else
                apt_source_content="$(gen_debian_deb822 "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
            fi
        else
            apt_source_file="${File_AptSourceList}"
            if [[ "${SYSTEM_VERSION_CODENAME}" != "sid" ]]; then
                apt_source_content="${deb_src_disabled_tips}
$(gen_debian_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")
$(gen_debian_deb_security "${source_security_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
            else
                apt_source_content="${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
            fi
        fi
        write_apt_source
        ;;

    "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
        repo_components="main restricted universe multiverse"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                SOURCE="archive.ubuntu.com"
                SOURCE_BRANCH="ubuntu"
                source_address="${SOURCE}/${SOURCE_BRANCH}"
            else
                SOURCE="ports.ubuntu.com"
                SOURCE_BRANCH="" # 官方源默认无分支（注：有 ubuntu-ports 重定向）
                source_address="${SOURCE}"
            fi
        fi
        # 安全更新源
        source_security_address="${SOURCE_SECURITY:-${source_security_host}}/${SOURCE_SECURITY_BRANCH:-${source_security_branch}}"
        ## DEB822 / one-line
        if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
            apt_source_file="${File_UbuntuSources}"
            apt_source_content="$(gen_ubuntu_deb822 "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")

$(gen_deb822_security "${source_security_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
        else
            apt_source_file="${File_AptSourceList}"
            apt_source_content="${deb_src_disabled_tips}
$(gen_ubuntu_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")
$(gen_deb_security "${source_security_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
        fi
        write_apt_source
        ;;

    "${SYSTEM_KALI}")
        repo_components="main contrib non-free non-free-firmware"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="http.kali.org"
            SOURCE_BRANCH="" # 官方源无分支
            source_address="${SOURCE}"
        fi
        apt_source_content="${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
        write_apt_source
        ;;

    "${SYSTEM_DEEPIN}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" == "25" ]]; then
            repo_components="main commercial community"
        else
            repo_components="main contrib non-free"
        fi
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="community-packages.deepin.com"
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" -ge 25 ]]; then
                SOURCE_BRANCH="deepin/${SYSTEM_VERSION_CODENAME,,}"
            else
                SOURCE_BRANCH="deepin"
            fi
            source_address="${SOURCE}/${SOURCE_BRANCH}"
        fi
        apt_source_content="${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
        write_apt_source
        ;;

    "${SYSTEM_LINUX_MINT}")
        # 专用源
        repo_components="main upstream import backport"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="packages.linuxmint.com"
            SOURCE_BRANCH="" # 官方源无分支
            source_address="${SOURCE}"
        fi
        apt_source_file="${File_LinuxMintSourceList}"
        apt_source_content="${deb_src_disabled_tips}
$(gen_deb_unsrc "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")
" # 注：此处空行用于隔开两种软件源内容
        write_apt_source

        # 底层系统软件源
        local base_system_branch base_system_codename
        if [[ "${SYSTEM_NAME}" == *"LMDE"* ]]; then
            ## Debian 版（LMDE）
            base_system_codename="$(get_os_release_value DEBIAN_CODENAME)"
            [[ -z "${base_system_codename}" ]] && base_system_codename="bookworm"
            base_system_branch="$(get_debian_source_branch "${base_system_codename}")"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                SOURCE="$(get_debian_official_source "${base_system_codename}")"
                base_system_branch="debian"
            fi
            repo_components="$(get_debian_repo_components "${base_system_codename}")"
            source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
            # 安全更新源
            source_security_branch="$(get_debian_source_security_branch "${base_system_codename}")"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                source_security_host="$(get_debian_official_source_security_host "${base_system_codename}")"
                source_security_branch="debian-security"
            fi
            source_security_address="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${source_security_host}}}/${SOURCE_SECURITY_BRANCH:-${source_security_branch}}"
            # 写入源文件
            apt_source_file="${File_LinuxMintSourceList}"
            apt_source_content="$(gen_debian_deb "${source_address}" "${base_system_codename}" "${repo_components}")
$(gen_debian_deb_security "${source_security_address}" "${base_system_codename}" "${repo_components}")"
            write_apt_source
        else
            ## Ubuntu 版
            base_system_codename="$(get_os_release_value UBUNTU_CODENAME)"
            [[ -z "${base_system_codename}" ]] && base_system_codename="noble"
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                base_system_branch="ubuntu"
                if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                    SOURCE="archive.ubuntu.com"
                fi
            else
                base_system_branch="ubuntu-ports"
                if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                    SOURCE="ports.ubuntu.com"
                fi
            fi
            repo_components="main restricted universe multiverse"
            source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
            # 安全更新源
            source_security_address="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${source_security_host}}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
            # 写入源文件
            apt_source_file="${File_LinuxMintSourceList}"
            apt_source_content="$(gen_ubuntu_deb "${source_address}" "${base_system_codename}" "${repo_components}")
$(gen_deb_security "${source_security_address}" "${base_system_codename}" "${repo_components}")"
            write_apt_source
        fi
        ;;

    "${SYSTEM_RASPBERRY_PI_OS}")
        # 专用源
        repo_components="main"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="archive.raspberrypi.org"
            SOURCE_BRANCH="debian"
            source_address="${SOURCE}/${SOURCE_BRANCH}"
        fi
        apt_source_file="${File_RaspberryPiSourceList}"
        apt_source_content="${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")"
        write_apt_source

        # 底层系统软件源（注：64位系统为 Debian 官方仓库，32位为 Raspbian 仓库）
        local base_system_branch base_system_codename
        case "${DEVICE_ARCH_RAW}" in
        x86_64 | aarch64)
            ## Debian 版
            base_system_codename="${SYSTEM_VERSION_CODENAME}"
            base_system_branch="$(get_debian_source_branch "${base_system_codename}")"
            repo_components="$(get_debian_repo_components "${base_system_codename}")"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                SOURCE="$(get_debian_official_source "${base_system_codename}")"
                base_system_branch="debian"
            fi
            source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
            # 安全更新源
            source_security_branch="$(get_debian_source_security_branch "${base_system_codename}")"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                source_security_host="$(get_debian_official_source_security_host "${base_system_codename}")"
                source_security_branch="debian-security"
            fi
            source_security_address="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${source_security_host}}}/${SOURCE_SECURITY_BRANCH:-${source_security_branch}}"
            # 写入源文件
            apt_source_file="${File_AptSourceList}"
            apt_source_content="${deb_src_disabled_tips}
$(gen_debian_deb "${source_address}" "${base_system_codename}" "${repo_components}")
$(gen_debian_deb_security "${source_security_address}" "${base_system_codename}" "${repo_components}")"
            write_apt_source
            ;;
        *)
            ## Raspbian 版
            base_system_branch="raspbian"
            base_system_codename="${SYSTEM_VERSION_CODENAME}"
            repo_components="main contrib non-free rpi"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                SOURCE="raspbian.raspberrypi.org"
                source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
            else
                source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}/raspbian"
            fi
            # 写入源文件
            apt_source_file="${File_AptSourceList}"
            apt_source_content="${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${base_system_codename}" "${repo_components}")"
            # multiarch 源
            if [[ "${DEVICE_ARCH_RAW}" == "armv7l" && "${USE_OFFICIAL_SOURCE}" != "true" ]]; then
                source_address="${SOURCE_BASE_SYSTEM:-${SOURCE}}/${SOURCE_BASE_SYSTEM_BRANCH:-${base_system_branch}}"
                apt_source_content="${apt_source_content}
## multiarch
# deb [arch=arm64] ${WEB_PROTOCOL}://${source_address}/multiarch/ ${base_system_codename} ${repo_components}"
            fi
            write_apt_source
            ;;
        esac
        ;;
    esac

    ## 处理其它衍生操作系统的专用源
    # Armbian
    if [ -f "${File_ArmbianRelease}" ]; then
        apt_source_file="${File_ArmbianSourceList}"
        apt_source_content="deb [signed-by=/usr/share/keyrings/armbian.gpg] ${WEB_PROTOCOL}://${SOURCE}/armbian ${SYSTEM_VERSION_CODENAME} main ${SYSTEM_VERSION_CODENAME}-utils ${SYSTEM_VERSION_CODENAME}-desktop"
        write_apt_source
    fi
    # Proxmox VE
    if [ -f "${File_ProxmoxVersion}" ]; then
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            source_address="download.proxmox.com"
        else
            source_address="${SOURCE}/proxmox"
        fi
        if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
            _DEB22_ARCHIVE_KEYRING="proxmox-archive-keyring.gpg"
            apt_source_file="${File_ProxmoxSources}"
            apt_source_content="$(gen_deb822_unsrc "${source_address}/debian/pve" "${SYSTEM_VERSION_CODENAME}" "pve-no-subscription")"
            write_apt_source
            # Ceph 仓库
            if [ -f "${File_ProxmoxCephSources}" ]; then
                local ceph_codename="$(ceph -v | grep ceph | awk '{print $(NF-1)}')"
                apt_source_file="${File_ProxmoxCephSources}"
                apt_source_content="$(gen_deb822_unsrc "${source_address}/debian/ceph-${ceph_codename}" "${SYSTEM_VERSION_CODENAME}" "no-subscription")"
                write_apt_source
            fi
            _DEB22_ARCHIVE_KEYRING=""
        else
            apt_source_file="${File_ProxmoxSourceList}"
            apt_source_content="$(gen_deb_unsrc "${source_address}/debian/pve" "${SYSTEM_VERSION_CODENAME}" "pve-no-subscription")"
            write_apt_source
            # Ceph 仓库
            if [ -f "${File_ProxmoxCephSourceList}" ]; then
                local ceph_codename="$(ceph -v | grep ceph | awk '{print $(NF-1)}')"
                apt_source_file="${File_ProxmoxCephSourceList}"
                apt_source_content="$(gen_deb_unsrc "${source_address}/debian/ceph-${ceph_codename}" "${SYSTEM_VERSION_CODENAME}" "no-subscription")"
                write_apt_source
            fi
        fi
        # CT Templates
        if [ -s /usr/share/perl5/PVE/APLInfo.pm ]; then
            sed -e "s|url => [\"']https\?://[^/]*/images[\"']|url => \"${WEB_PROTOCOL}://${source_address}/images\"|g" \
                -i \
                /usr/share/perl5/PVE/APLInfo.pm
        fi
    fi
}

## 更换基于 RedHat 系 Linux 发行版的软件源
function change_mirrors_RedHat() {
    ## 仅 EPEL 模式
    if [[ "${ONLY_EPEL}" == "true" ]]; then
        change_mirrors_or_install_EPEL # EPEL 附加软件包
        return
    fi
    ## 生成 repo 源文件
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        7 | 8)
            gen_repo_files CentOS "${SYSTEM_VERSION_ID_MAJOR}"
            ;;
        *)
            gen_repo_files CentOSStream "${SYSTEM_VERSION_ID_MAJOR}"
            ;;
        esac
        ;;
    "${SYSTEM_CENTOS}")
        gen_repo_files CentOS "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
        gen_repo_files CentOSStream "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_ROCKY}")
        gen_repo_files RockyLinux "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_ALMALINUX}")
        gen_repo_files AlmaLinux "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_FEDORA}")
        gen_repo_files Fedora "${SYSTEM_VERSION_ID}"
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        gen_repo_files OpenCloudOS "${SYSTEM_VERSION_ID}"
        ;;
    "${SYSTEM_ANOLISOS}")
        gen_repo_files AnolisOS "${SYSTEM_VERSION_ID}"
        ;;
    esac
    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_CENTOS}" ]]; then
            SOURCE="vault.centos.org"
            SOURCE_BRANCH="centos"
        else
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
                if [[ "${SYSTEM_VERSION_ID_MAJOR}" == 8 ]]; then
                    SOURCE="vault.centos.org"
                    SOURCE_BRANCH="centos"
                else
                    change_mirrors_or_install_EPEL # EPEL 附加软件包
                    return
                fi
                ;;
            *)
                change_mirrors_or_install_EPEL # EPEL 附加软件包
                return
                ;;
            esac
        fi
    fi

    ## 修改源
    cd $Dir_YumRepos
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        7 | 8)
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -i \
                CentOS-*
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8)
                sed -e "s|mirror.centos.org/\$contentdir|mirror.centos.org/${SOURCE_BRANCH}|g" \
                    -e "s|\$releasever|8.5.2111|g" \
                    -i \
                    CentOS-*
                sed -e "s|vault.centos.org/\$contentdir|vault.centos.org/${SOURCE_VAULT_BRANCH:-"centos-vault"}|g" \
                    -i \
                    CentOS-Linux-Sources.repo
                ;;
            7)
                sed -e "s|mirror.centos.org/centos|mirror.centos.org/${SOURCE_BRANCH}|g" \
                    -e "s|\$releasever|7.9.2009|g" \
                    -i \
                    CentOS-*
                sed -e "s|vault.centos.org/centos|vault.centos.org/${SOURCE_VAULT_BRANCH:-"centos-vault"}|g" \
                    -i \
                    CentOS-Sources.repo
                ;;
            esac
            sed -e "s|mirror.centos.org|${SOURCE}|g" \
                -e "s|vault.centos.org|${SOURCE_VAULT:-${SOURCE}}|g" \
                -i \
                CentOS-*
            ;;
        *)
            sed -e "s|^#baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^metalink=|#metalink=|g" \
                -e "s|mirror.stream.centos.org|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                centos.repo \
                centos-addons.repo
            # 禁用 GPG 签名检查
            sed -e "s|gpgcheck=1|gpgcheck=0|g" \
                -i \
                centos.repo \
                centos-addons.repo
            ;;
        esac
        ;;
    "${SYSTEM_CENTOS}")
        sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
            -e "s|^mirrorlist=|#mirrorlist=|g" \
            -i \
            CentOS-*
        if [[ "${DEVICE_ARCH_RAW}" == "x86_64" ]]; then
            SOURCE_BRANCH="centos-vault"
        else
            SOURCE_BRANCH="centos-altarch"
        fi
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        8)
            # 最终版本为 8.5.2011（2022-02）
            sed -e "s|mirror.centos.org/\$contentdir|mirror.centos.org/${SOURCE_BRANCH}|g" \
                -e "s|\$releasever|8.5.2111|g" \
                -i \
                CentOS-*
            sed -e "s|vault.centos.org/\$contentdir|vault.centos.org/${SOURCE_VAULT_BRANCH:-"centos-vault"}|g" \
                -i \
                CentOS-Linux-Sources.repo
            ;;
        7)
            # 最终版本为 7.9.2009（2024-07）
            sed -e "s|mirror.centos.org/centos|mirror.centos.org/${SOURCE_BRANCH}|g" \
                -e "s|\$releasever|7.9.2009|g" \
                -i \
                CentOS-*
            sed -e "s|vault.centos.org/centos|vault.centos.org/${SOURCE_VAULT_BRANCH:-"centos-vault"}|g" \
                -i \
                CentOS-Sources.repo
            ;;
        esac
        sed -e "s|mirror.centos.org|${SOURCE}|g" \
            -e "s|vault.centos.org|${SOURCE_VAULT:-${SOURCE}}|g" \
            -i \
            CentOS-*
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        9 | 10)
            sed -e "s|^#baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^metalink=|#metalink=|g" \
                -e "s|mirror.stream.centos.org|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                centos.repo \
                centos-addons.repo
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_ORACLE}" ]]; then
                # 禁用 GPG 签名检查
                sed -e "s|gpgcheck=1|gpgcheck=0|g" \
                    -i \
                    centos.repo \
                    centos-addons.repo
            fi
            ;;
        8)
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|mirror.centos.org/\$contentdir|${SOURCE}/${SOURCE_BRANCH}|g" \
                -e "s|vault.centos.org/\$contentdir|${SOURCE_VAULT:-${SOURCE}}/${SOURCE_VAULT_BRANCH:-"centos-vault"}|g" \
                -i \
                CentOS-Stream-*
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_ORACLE}" ]]; then
                # 禁用 GPG 签名检查
                sed -e "s|gpgcheck=1|gpgcheck=0|g" \
                    -i \
                    CentOS-Stream-*
            fi
            ;;
        esac
        ;;
    "${SYSTEM_ROCKY}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        9 | 10)
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|dl.rockylinux.org/\$contentdir|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                rocky.repo \
                rocky-addons.repo \
                rocky-devel.repo \
                rocky-extras.repo
            ;;
        8)
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|dl.rockylinux.org/\$contentdir|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                Rocky-*
            ;;
        esac
        ;;
    "${SYSTEM_ALMALINUX}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        10)
            sed -e "s|^# baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|vault.almalinux.org|${SOURCE_VAULT:-${SOURCE}}/${SOURCE_VAULT_BRANCH:-"almalinux-vault"}|g" \
                -e "s|repo.almalinux.org/almalinux|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                almalinux-appstream.repo \
                almalinux-baseos.repo \
                almalinux-crb.repo \
                almalinux-extras.repo \
                almalinux-highavailability.repo \
                almalinux-nfv.repo \
                almalinux-rt.repo \
                almalinux-saphana.repo \
                almalinux-sap.repo
            ;;
        9)
            sed -e "s|^# baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|repo.almalinux.org/vault|${SOURCE_VAULT:-${SOURCE}}/${SOURCE_VAULT_BRANCH:-"almalinux-vault"}|g" \
                -e "s|repo.almalinux.org/almalinux|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                almalinux-appstream.repo \
                almalinux-baseos.repo \
                almalinux-crb.repo \
                almalinux-extras.repo \
                almalinux-highavailability.repo \
                almalinux-nfv.repo \
                almalinux-plus.repo \
                almalinux-resilientstorage.repo \
                almalinux-rt.repo \
                almalinux-sap.repo \
                almalinux-saphana.repo
            ;;
        8)
            sed -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|^# baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|repo.almalinux.org/vault|${SOURCE_VAULT:-${SOURCE}}/${SOURCE_VAULT_BRANCH:-"almalinux-vault"}|g" \
                -e "s|repo.almalinux.org/almalinux|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                almalinux-ha.repo \
                almalinux-nfv.repo \
                almalinux-plus.repo \
                almalinux-powertools.repo \
                almalinux-resilientstorage.repo \
                almalinux-rt.repo \
                almalinux-sap.repo \
                almalinux-saphana.repo \
                almalinux.repo
            ;;
        esac
        ;;
    "${SYSTEM_FEDORA}")
        # 自 Fedora 39 起不再使用 modular 仓库
        local fedora_repo_files="fedora.repo fedora-updates.repo fedora-updates-testing.repo"
        if [[ "${SYSTEM_VERSION_ID}" -lt 39 ]]; then
            fedora_repo_files="${fedora_repo_files} fedora-modular.repo fedora-updates-modular.repo fedora-updates-testing-modular.repo"
        fi
        sed -e "s|^metalink=|#metalink=|g" \
            -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
            -e "s|download.example/pub/fedora/linux|${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            $fedora_repo_files
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        8)
            sed -e "s|^baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|mirrors.opencloudos.tech/opencloudos|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                OpenCloudOS-Debuginfo.repo \
                OpenCloudOS.repo \
                OpenCloudOS-Sources.repo
            ;;
        esac
        ;;
    "${SYSTEM_ANOLISOS}")
        # Anolis OS 仓库配置特殊，baseurl 同时使用 http 和 https 协议，gpgkey 同时使用软件源仓库远程路径和本地路径
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        8)
            sed -e "s|http\(s\)\?://mirrors.openanolis.cn/anolis|${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                AnolisOS-*
            ;;
        esac
        ;;
    esac

    ## 重置使用官方源时定义的变量
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_CENTOS}" ]]; then
            SOURCE=""
            SOURCE_BRANCH=""
        else
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
                if [[ "${SYSTEM_VERSION_ID_MAJOR}" == 8 ]]; then
                    SOURCE=""
                    SOURCE_BRANCH=""
                fi
                ;;
            esac
        fi
    fi

    change_mirrors_or_install_EPEL # EPEL 附加软件包
}

## 更换 openEuler 软件源
function change_mirrors_openEuler() {
    ## 生成 repo 源文件
    gen_repo_files openEuler
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_YumRepos
    sed -e "s|^baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
        -e "s|repo.openeuler.org|${SOURCE}/${SOURCE_BRANCH}|g" \
        -i \
        openEuler.repo
}

## 更换 OpenCloudOS 软件源
function change_mirrors_OpenCloudOS() {
    ## 生成 repo 源文件
    gen_repo_files OpenCloudOS "${SYSTEM_VERSION_ID}"
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_YumRepos
    if [[ "${SYSTEM_VERSION_ID}" == 23 ]]; then
        sed -e "s|^baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
            -e "s|mirrors.opencloudos.tech/opencloudos-stream|${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            OpenCloudOS-Stream.repo
    else
        sed -e "s|^baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
            -e "s|mirrors.opencloudos.tech/opencloudos|${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            OpenCloudOS.repo
    fi
}

## 更换 openKylin 软件源
function change_mirrors_openKylin() {
    local deb_src_disabled_tips="## $(msg "source.comment.disabledSourceCode")"

    function gen_deb() {
        echo "deb ${WEB_PROTOCOL}://${1}/ ${2} ${3}
# deb-src ${WEB_PROTOCOL}://${1}/ ${2} ${3}
deb ${WEB_PROTOCOL}://${1}/ ${2}-security ${3}
# deb-src ${WEB_PROTOCOL}://${1}/ ${2}-security ${3}
deb ${WEB_PROTOCOL}://${1}/ ${2}-updates ${3}
# deb-src ${WEB_PROTOCOL}://${1}/ ${2}-updates ${3}"
    }

    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        SOURCE="archive.build.openkylin.top"
    fi
    local repo_components="main cross pty" # 仓库区域
    local source_address="${SOURCE}/${SOURCE_BRANCH}"
    echo "${deb_src_disabled_tips}
$(gen_deb "${source_address}" "${SYSTEM_VERSION_CODENAME}" "${repo_components}")" >>$File_AptSourceList
}

## 更换 Anolis OS 软件源
function change_mirrors_AnolisOS() {
    ## 生成 repo 源文件
    gen_repo_files AnolisOS "${SYSTEM_VERSION_ID}"
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_YumRepos
    # Anolis OS 仓库配置特殊，baseurl 同时使用 http 和 https 协议，gpgkey 同时使用软件源仓库远程路径和本地路径
    case "${SYSTEM_VERSION_ID_MAJOR}" in
    23)
        sed -e "s|http\(s\)\?://mirrors.openanolis.cn/anolis|${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            AnolisOS-Debuginfo.repo \
            AnolisOS.repo \
            AnolisOS-Source.repo
        ;;
    8)
        sed -e "s|http\(s\)\?://mirrors.openanolis.cn/anolis|${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            AnolisOS-*
        ;;
    esac
}

## 更换 openSUSE 软件源
function change_mirrors_openSUSE() {
    ## 禁用 RIS
    zypper remove -y openSUSE-repos-* >/dev/null 2>&1
    ## 生成 repo 源文件
    case "${SYSTEM_ID}" in
    "opensuse-leap")
        gen_repo_files openSUSE "leap" "${SYSTEM_VERSION_ID}"
        ;;
    "opensuse-tumbleweed")
        gen_repo_files openSUSE "tumbleweed"
        ;;
    esac
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_ZYppRepos
    local -a opensuse_repo_files=()
    case "${SYSTEM_ID}" in
    opensuse-leap)
        case "${SYSTEM_VERSION_ID_MAJOR}" in
        16)
            opensuse_repo_files=(
                "openSUSE:repo-non-oss-debug.repo"
                "openSUSE:repo-non-oss.repo"
                "openSUSE:repo-oss-debug.repo"
                "openSUSE:repo-oss.repo"
                "openSUSE:repo-oss-source.repo"
            )
            ;;
        15)
            case "${SYSTEM_VERSION_ID_MINOR}" in
            [0-2])
                opensuse_repo_files=(
                    "repo-debug-non-oss.repo"
                    "repo-debug.repo"
                    "repo-debug-update-non-oss.repo"
                    "repo-debug-update.repo"
                    "repo-non-oss.repo"
                    "repo-oss.repo"
                    "repo-source-non-oss.repo"
                    "repo-source.repo"
                    "repo-update-non-oss.repo"
                    "repo-update.repo"
                )
                ;;
            *)
                opensuse_repo_files=(
                    "repo-backports-debug-update.repo"
                    "repo-backports-update.repo"
                    "repo-debug-non-oss.repo"
                    "repo-debug.repo"
                    "repo-debug-update-non-oss.repo"
                    "repo-debug-update.repo"
                    "repo-non-oss.repo"
                    "repo-openh264.repo"
                    "repo-oss.repo"
                    "repo-sle-debug-update.repo"
                    "repo-sle-update.repo"
                    "repo-source.repo"
                    "repo-update-non-oss.repo"
                    "repo-update.repo"
                )
                ;;
            esac
            ;;
        esac
        ;;
    opensuse-tumbleweed)
        opensuse_repo_files=(
            "repo-debug.repo"
            "repo-non-oss.repo"
            "repo-openh264.repo"
            "repo-oss.repo"
            "repo-source.repo"
            "repo-update.repo"
        )
        ;;
    esac
    sed -e "s#\(baseurl\|gpgkey\)=http://\(cdn\|download\)\.opensuse\.org/\(distribution\|update\|tumbleweed\|factory\|slowroll\|history\)/#\1=${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\3/#g" \
        -i \
        "${opensuse_repo_files[@]}"
}

## 更换 Arch Linux 系 Linux 发行版的软件源
function change_mirrors_ArchLinux() {
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_ARCH}")
        ## 修改源
        case "${SOURCE_BRANCH}" in
        "archlinuxarm")
            [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && SOURCE="mirror.archlinuxarm.org" ## 使用官方源
            echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$arch/\$repo" >>$File_PacmanMirrorList
            ;;
        *)
            [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && SOURCE="mirror.pkgbuild.com" ## 使用官方源
            echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$repo/os/\$arch" >>$File_PacmanMirrorList
            ;;
        esac
        # EndeavourOS
        if [[ "${SYSTEM_NAME}" == *"EndeavourOS"* ]] && [[ -f "${File_PacmanEndeavourOSMirrorList}" ]]; then
            [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && SOURCE="mirror.alpix.eu" ## 使用官方源
            echo "Server = ${WEB_PROTOCOL}://${SOURCE}/endeavouros/repo/\$repo/\$arch" >>$File_PacmanEndeavourOSMirrorList
        fi
        ;;
    "${SYSTEM_MANJARO}")
        ## 使用官方源
        [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && SOURCE="mirrors2.manjaro.org"
        ## 修改源
        echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/stable/\$repo/\$arch" >>$File_PacmanMirrorList
        ;;
    esac
    # if [[ "${USE_ARCHLINUXCN_SOURCE}" == "true" ]]; then
    #     # /etc/pacman.conf
    #     [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && SOURCE="repo.archlinuxcn.org" ## 使用官方源
    #     echo -e "[archlinuxcn]\nServer = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$arch" >>/etc/pacman.conf
    # fi
}

## 更换 Alpine Linux 软件源
function change_mirrors_Alpine() {
    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        SOURCE="dl-cdn.alpinelinux.org"
    fi
    local version_name
    echo "${SYSTEM_PRETTY_NAME}" | grep " edge" -q
    if [ $? -eq 0 ]; then
        version_name="edge"
    else
        version_name="v${SYSTEM_VERSION_ID%.*}"
    fi
    ## 修改源
    echo "${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/${version_name}/main
${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/${version_name}/community" >>$File_AlpineRepositories
}

## 更换 Gentoo 软件源
function change_mirrors_Gentoo() {
    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        grep -Eq "^GENTOO_MIRRORS=" $File_GentooMakeConf
        if [ $? -eq 0 ]; then
            sed -e "/^GENTOO_MIRRORS=/d" \
                -i \
                $File_GentooMakeConf
        fi
        [ -f "${File_GentooReposConf}" ] && rm -rf $File_GentooReposConf
        return
    fi
    ## 修改源
    grep -Eq "^GENTOO_MIRRORS=" $File_GentooMakeConf
    if [ $? -eq 0 ]; then
        sed -e "s|^GENTOO_MIRRORS=.*|GENTOO_MIRRORS=\"${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}\"|g" \
            -i \
            $File_GentooMakeConf
    else
        echo -e "\nGENTOO_MIRRORS=\"${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}\"" >>$File_GentooMakeConf
    fi
    echo "[DEFAULT]
main-repo = gentoo

[gentoo]
location = /usr/portage
sync-type = rsync
sync-uri = rsync://${SOURCE_PORTAGE:-${SOURCE}}/${SOURCE_PORTAGE_BRANCH:-"gentoo-portage"}
auto-sync = yes" >$File_GentooReposConf
}

## 更换 NixOS 软件源
function change_mirrors_NixOS() {
    local binary_cache_source channel_source
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        binary_cache_source="https://cache.nixos.org/"
        channel_source="https://nixos.org/channels"
    else
        binary_cache_source="${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/store https://cache.nixos.org/"
        channel_source="${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}"
    fi
    # binary cache
    sed -e "s|^substituters.*|substituters = ${binary_cache_source}|g" \
        -i \
        $File_NixConf
    # channel
    nix-channel --add "${channel_source}/nixos-${SYSTEM_VERSION_ID}" nixos
    nix-channel --update >/dev/null 2>&1
}

## 更换 Void Linux 软件源
function change_mirrors_Void() {
    [ -d "${Dir_XbpsRepos}" ] || mkdir -p $Dir_XbpsRepos
    cp -rvf /usr/share/xbps.d/*-repository-*.conf $Dir_XbpsRepos
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_XbpsRepos
    sed -e "s|https://repo-default.voidlinux.org|${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}|g" \
        -i \
        *-repository-*.conf
}

## EPEL (Extra Packages for Enterprise Linux) 附加软件包 - 安装或更换软件源
function change_mirrors_or_install_EPEL() {
    if [[ "${INSTALL_EPEL}" != "true" ]]; then
        return
    fi
    if [[ -z "${SOURCE}" && -z "${SOURCE_EPEL}" ]]; then
        USE_OFFICIAL_SOURCE_EPEL="true"
    fi
    ## 确定安装版本（不支持安装的系统直接跳出此方法）
    local epel_version
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_REDHAT}")
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
            return
        else
            epel_version="${SYSTEM_VERSION_ID_MAJOR}"
        fi
        ;;
    *)
        return
        ;;
    esac
    ## EPEL 7
    if [[ "${epel_version}" == "7" ]]; then
        [ -z "${SOURCE_EPEL_BRANCH}" ] && SOURCE_EPEL_BRANCH="epel-archive"
        [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN $(msg "warn.EPEL7")"
        [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$TIP $(msg "tip.EPEL7")\n\n${GREEN}➜${PLAIN}  ${WEB_PROTOCOL}://${SOURCE_EPEL:-${SOURCE}}/${SOURCE_EPEL_BRANCH:-"epel"}"
    fi
    ## 安装 EPEL 软件包
    if [ $VERIFICATION_EPEL -ne 0 ]; then
        echo -e "\n${WORKING} $(msg "work.installEPELPackage")\n"
        local package_manager="$(get_package_manager)"
        local package_path="epel/epel-release-latest-${epel_version}"
        case "${epel_version}" in
        7)
            local epel_package_sub_version
            case "${DEVICE_ARCH_RAW}" in
            aarch64)
                epel_package_sub_version="12"
                ;;
            ppc64)
                epel_package_sub_version="11"
                ;;
            *)
                epel_package_sub_version="14"
                ;;
            esac
            package_path="epel-archive/7/${DEVICE_ARCH_RAW}/Packages/e/epel-release-7-${epel_package_sub_version}"
            ;;
        9)
            ## CentOS Stream 9 特殊，有两个不同的发行包 epel-release epel-next-release
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}" | "${SYSTEM_RHEL}")
                package_path="epel/epel{,-next}-release-latest-9"
                ;;
            esac
            ;;
        esac
        eval $package_manager install -y https://mirrors.cloud.tencent.com/${package_path}.noarch.rpm
        rm -rf $Dir_YumRepos/epel*
    fi
    ## 删除原有 repo 源文件
    if [ -d "${Dir_YumRepos}" ]; then
        ls $Dir_YumRepos | grep epel -q
        [ $? -eq 0 ] && rm -rf $Dir_YumRepos/epel*
    fi
    if [ -d "${Dir_YumReposBackup}" ]; then
        ls $Dir_YumReposBackup | grep epel -q
        [ $? -eq 0 ] && rm -rf $Dir_YumReposBackup/epel*
    fi
    ## 生成 repo 源文件
    gen_repo_files EPEL "${SYSTEM_VERSION_ID_MAJOR}"
    if [[ "${epel_version}" == 9 ]]; then
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}" | "${SYSTEM_RHEL}")
            gen_repo_files EPEL_NEXT "${SYSTEM_VERSION_ID_MAJOR}"
            ;;
        esac
    fi
    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" || "${USE_OFFICIAL_SOURCE_EPEL}" == "true" ]]; then
        case "${epel_version}" in
        7)
            SOURCE_EPEL="dl.fedoraproject.org/pub/archive"
            ;;
        *)
            SOURCE_EPEL="dl.fedoraproject.org/pub"
            ;;
        esac
    fi
    ## 修改源
    sed -e "s|^#baseurl=http\(s\)\?|baseurl=${WEB_PROTOCOL}|g" \
        -e "s|^metalink=|#metalink=|g" \
        -e "s|download.example/pub/epel|${SOURCE_EPEL:-${SOURCE}}/${SOURCE_EPEL_BRANCH:-"epel"}|g" \
        -i \
        $Dir_YumRepos/epel*
    ## 启用所需的仓库（EPEL 需要结合 PowerTools / CRB 使用）
    case "${epel_version}" in
    9 | 10)
        dnf config-manager --set-enabled crb >/dev/null 2>&1
        ;;
    8)
        dnf config-manager --set-enabled powertools >/dev/null 2>&1
        ;;
    esac
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
    "${SYSTEM_FEDORA}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
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

function gen_repo_files() {
    _w() { cat >"$Dir_YumRepos/$1"; }
    _wz() { cat >"$Dir_ZYppRepos/$1"; }
    local _rv='$releasever'
    local _rvb='${releasever}'
    local _ba='$basearch'
    local _ctd='$contentdir'
    local _st='$stream'
    local _rl='$rltype'
    local _if='$infra'
    local _bu='baseurl='
    local _cm='countme='
    local _cm1="${_cm}1"
    local _e='enabled='
    local _e0="${_e}0"
    local _e1="${_e}1"
    local _gc='gpgcheck='
    local _gc1="${_gc}1"
    local _gk='gpgkey='
    local _me='metadata_expire='
    local _ml='mirrorlist='
    local _mt='metalink='
    local _n='name='
    local _rg='repo_gpgcheck='
    local _rg0="${_rg}0"
    local _su='skip_if_unavailable='
    local _suF="${_su}False"
    local _suT="${_su}True"
    local _ty='type='
    local _pki='file:///etc/pki/rpm-gpg/RPM-GPG-KEY-'
    local _md='file:///media/'
    "gen_repo_files_$1" "${@:2}"
}

## 生成 CentOS repo 源文件
function gen_repo_files_CentOS() {
    local __u1="${_bu}http://debuginfo.centos.org/"
    local __u2="${_ml}http://mirrorlist.centos.org/"
    case "$1" in
    8)
        local __s='HighAvailability'
        local __u3="${_bu}http://mirror.centos.org/$_ctd/$_rv/"
        local __u4="${_bu}http://vault.centos.org/$_ctd/$_rv/"
        local __n1="${_n}CentOS Linux $_rv - "
        local __k1="${_gk}${_pki}centosofficial"
        local __f='&infra=$infra'
        local _fp='CentOS-Linux-'
        _w "${_fp}AppStream.repo" <<EOF
[appstream]
${__n1}AppStream
${__u2}?release=$_rv&arch=$_ba&repo=AppStream${__f}
#${__u3}AppStream/$_ba/os/
$_gc1
$_e1
$__k1
EOF
        _w "${_fp}BaseOS.repo" <<EOF
[baseos]
${__n1}BaseOS
${__u2}?release=$_rv&arch=$_ba&repo=BaseOS${__f}
#${__u3}BaseOS/$_ba/os/
$_gc1
$_e1
$__k1
EOF
        _w "${_fp}ContinuousRelease.repo" <<EOF
[cr]
${__n1}ContinuousRelease
${__u2}?release=$_rv&arch=$_ba&repo=cr${__f}
#${__u3}cr/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Debuginfo.repo" <<EOF
[debuginfo]
${__n1}Debuginfo
${__u1}$_rv/$_ba/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Devel.repo" <<EOF
[devel]
${__n1}Devel WARNING! FOR BUILDROOT USE ONLY!
${__u2}?release=$_rv&arch=$_ba&repo=Devel${__f}
#${__u3}Devel/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Extras.repo" <<EOF
[extras]
${__n1}Extras
${__u2}?release=$_rv&arch=$_ba&repo=extras${__f}
#${__u3}extras/$_ba/os/
$_gc1
$_e1
$__k1
EOF
        _w "${_fp}FastTrack.repo" <<EOF
[fasttrack]
${__n1}FastTrack
${__u2}?release=$_rv&arch=$_ba&repo=fasttrack${__f}
#${__u3}fasttrack/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}HighAvailability.repo" <<EOF
[ha]
${__n1}${__s}
${__u2}?release=$_rv&arch=$_ba&repo=${__s}${__f}
#${__u3}${__s}/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Media.repo" <<EOF
[media-baseos]
${__n1}Media - BaseOS
${_bu}${_md}CentOS/BaseOS
        ${_md}cdrom/BaseOS
        ${_md}cdrecorder/BaseOS
$_gc1
$_e0
$__k1

[media-appstream]
${__n1}Media - AppStream
${_bu}${_md}CentOS/AppStream
        ${_md}cdrom/AppStream
        ${_md}cdrecorder/AppStream
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Plus.repo" <<EOF
[plus]
${__n1}Plus
${__u2}?release=$_rv&arch=$_ba&repo=centosplus${__f}
#${__u3}centosplus/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}PowerTools.repo" <<EOF
[powertools]
${__n1}PowerTools
${__u2}?release=$_rv&arch=$_ba&repo=PowerTools${__f}
#${__u3}PowerTools/$_ba/os/
$_gc1
$_e0
$__k1
EOF
        _w "${_fp}Sources.repo" <<EOF
[baseos-source]
${__n1}BaseOS - Source
${__u4}BaseOS/Source/
$_gc1
$_e0
$__k1

[appstream-source]
${__n1}AppStream - Source
${__u4}AppStream/Source/
$_gc1
$_e0
$__k1

[extras-source]
${__n1}Extras - Source
${__u4}extras/Source/
$_gc1
$_e0
$__k1

[plus-source]
${__n1}Plus - Source
${__u4}centosplus/Source/
$_gc1
$_e0
$__k1
EOF
        ;;
    7)
        local __u5="${_bu}http://mirror.centos.org/centos/$_rv/"
        local __u6="${_bu}http://vault.centos.org/centos/$_rv/"
        local __n2="${_n}CentOS-$_rv - "
        local __k2="${_gk}${_pki}CentOS-7"
        local __f='&infra=$infra'
        local _fp='CentOS-'
        _w "${_fp}Base.repo" <<EOF
[base]
${__n2}Base
${__u2}?release=$_rv&arch=$_ba&repo=os${__f}
#${__u5}os/$_ba/
$_gc1
$__k2

[updates]
${__n2}Updates
${__u2}?release=$_rv&arch=$_ba&repo=updates${__f}
#${__u5}updates/$_ba/
$_gc1
$__k2

[extras]
${__n2}Extras
${__u2}?release=$_rv&arch=$_ba&repo=extras${__f}
#${__u5}extras/$_ba/
$_gc1
$__k2

[centosplus]
${__n2}Plus
${__u2}?release=$_rv&arch=$_ba&repo=centosplus${__f}
#${__u5}centosplus/$_ba/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}CR.repo" <<EOF
[cr]
${__n2}cr
${__u5}cr/$_ba/
$_gc1
$__k2
$_e0
EOF
        _w "${_fp}Debuginfo.repo" <<EOF
[base-debuginfo]
${_n}CentOS-7 - Debuginfo
${__u1}7/$_ba/
$_gc1
${_gk}${_pki}CentOS-Debug-7
$_e0
EOF
        _w "${_fp}fasttrack.repo" <<EOF
[fasttrack]
${_n}CentOS-7 - fasttrack
${__u2}?release=$_rv&arch=$_ba&repo=fasttrack${__f}
#${__u5}fasttrack/$_ba/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}Media.repo" <<EOF
[c7-media]
${__n2}Media
${_bu}${_md}CentOS/
        ${_md}cdrom/
        ${_md}cdrecorder/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}Sources.repo" <<EOF
[base-source]
${__n2}Base Sources
${__u6}os/Source/
$_gc1
$_e0
$__k2

[updates-source]
${__n2}Updates Sources
${__u6}updates/Source/
$_gc1
$_e0
$__k2

[extras-source]
${__n2}Extras Sources
${__u6}extras/Source/
$_gc1
$_e0
$__k2

[centosplus-source]
${__n2}Plus Sources
${__u6}centosplus/Source/
$_gc1
$_e0
$__k2
EOF
        ;;
    esac
}

## 生成 CentOS Stream repo 源文件
function gen_repo_files_CentOSStream() {
    local _m6="${_me}6h"
    local __s1='HighAvailability'
    local __s2='ResilientStorage'
    local __u1="${_bu}https://mirror.stream.centos.org/$_rv-stream/"
    local __u2="${_mt}https://mirrors.centos.org/metalink?"
    local __n="${_n}CentOS Stream $_rv - "
    local __k1="${_gk}${_pki}CentOS-SIG-Extras-SHA512"
    local __k2="${_gk}${_pki}centosofficial"
    case "$1" in
    10)
        local __k3="${_gk}${_pki}centosofficial-SHA256"
        local __f='&protocol=https,http'
        _w centos.repo <<EOF
[baseos]
${__n}BaseOS
#${__u1}BaseOS/$_ba/os/
${__u2}repo=centos-baseos-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[baseos-debuginfo]
${__n}BaseOS - Debug
${__u2}repo=centos-baseos-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[baseos-source]
${__n}BaseOS - Source
${__u2}repo=centos-baseos-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[appstream]
${__n}AppStream
#${__u1}AppStream/$_ba/os/
${__u2}repo=centos-appstream-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[appstream-debuginfo]
${__n}AppStream - Debug
${__u2}repo=centos-appstream-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[appstream-source]
${__n}AppStream - Source
${__u2}repo=centos-appstream-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[crb]
${__n}CRB
#${__u1}CRB/$_ba/os/
${__u2}repo=centos-crb-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[crb-debuginfo]
${__n}CRB - Debug
${__u2}repo=centos-crb-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[crb-source]
${__n}CRB - Source
${__u2}repo=centos-crb-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0
EOF
        _w centos-addons.repo <<EOF
[highavailability]
${__n}${__s1}
#${__u1}${__s1}/$_ba/os/
${__u2}repo=centos-highavailability-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[highavailability-debuginfo]
${__n}${__s1} - Debug
${__u2}repo=centos-highavailability-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[highavailability-source]
${__n}${__s1} - Source
${__u2}repo=centos-highavailability-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[nfv]
${__n}NFV
#${__u1}NFV/$_ba/os/
${__u2}repo=centos-nfv-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[nfv-debuginfo]
${__n}NFV - Debug
${__u2}repo=centos-nfv-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[nfv-source]
${__n}NFV - Source
${__u2}repo=centos-nfv-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[rt]
${__n}RT
#${__u1}RT/$_ba/os/
${__u2}repo=centos-rt-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[rt-debuginfo]
${__n}RT - Debug
${__u2}repo=centos-rt-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[rt-source]
${__n}RT - Source
${__u2}repo=centos-rt-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[resilientstorage]
${__n}${__s2}
#${__u1}${__s2}/$_ba/os/
${__u2}repo=centos-resilientstorage-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[resilientstorage-debuginfo]
${__n}${__s2} - Debug
${__u2}repo=centos-resilientstorage-debug-$_st&arch=$_ba${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[resilientstorage-source]
${__n}${__s2} - Source
${__u2}repo=centos-resilientstorage-source-$_st&arch=source${__f}
$__k3
$_gc1
$_rg0
$_m6
$_e0

[extras-common]
${__n}Extras packages
#${_bu}https://mirror.stream.centos.org/SIGs/$_rv-stream/extras/$_ba/extras-common/
${__u2}repo=centos-extras-sig-extras-common-$_st&arch=$_ba${__f}
$__k1
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[extras-common-source]
${__n}Extras packages - Source
${__u2}repo=centos-extras-sig-extras-common-source-$_st&arch=source${__f}
$__k1
$_gc1
$_rg0
$_m6
$_e0
EOF
        ;;
    9)
        local __f='&protocol=https,http'
        _w centos.repo <<EOF
[baseos]
${__n}BaseOS
#${__u1}BaseOS/$_ba/os/
${__u2}repo=centos-baseos-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[baseos-debug]
${__n}BaseOS - Debug
${__u2}repo=centos-baseos-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[baseos-source]
${__n}BaseOS - Source
${__u2}repo=centos-baseos-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[appstream]
${__n}AppStream
#${__u1}AppStream/$_ba/os/
${__u2}repo=centos-appstream-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[appstream-debug]
${__n}AppStream - Debug
${__u2}repo=centos-appstream-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[appstream-source]
${__n}AppStream - Source
${__u2}repo=centos-appstream-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[crb]
${__n}CRB
#${__u1}CRB/$_ba/os/
${__u2}repo=centos-crb-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[crb-debug]
${__n}CRB - Debug
${__u2}repo=centos-crb-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[crb-source]
${__n}CRB - Source
${__u2}repo=centos-crb-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0
EOF
        _w centos-addons.repo <<EOF
[highavailability]
${__n}${__s1}
#${__u1}${__s1}/$_ba/os/
${__u2}repo=centos-highavailability-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[highavailability-debug]
${__n}${__s1} - Debug
${__u2}repo=centos-highavailability-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[highavailability-source]
${__n}${__s1} - Source
${__u2}repo=centos-highavailability-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[nfv]
${__n}NFV
#${__u1}NFV/$_ba/os/
${__u2}repo=centos-nfv-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[nfv-debug]
${__n}NFV - Debug
${__u2}repo=centos-nfv-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[nfv-source]
${__n}NFV - Source
${__u2}repo=centos-nfv-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[rt]
${__n}RT
#${__u1}RT/$_ba/os/
${__u2}repo=centos-rt-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[rt-debug]
${__n}RT - Debug
${__u2}repo=centos-rt-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[rt-source]
${__n}RT - Source
${__u2}repo=centos-rt-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[resilientstorage]
${__n}${__s2}
#${__u1}${__s2}/$_ba/os/
${__u2}repo=centos-resilientstorage-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_cm1
$_e0

[resilientstorage-debug]
${__n}${__s2} - Debug
${__u2}repo=centos-resilientstorage-debug-$_st&arch=$_ba${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[resilientstorage-source]
${__n}${__s2} - Source
${__u2}repo=centos-resilientstorage-source-$_st&arch=source${__f}
$__k2
$_gc1
$_rg0
$_m6
$_e0

[extras-common]
${__n}Extras packages
#${_bu}https://mirror.stream.centos.org/SIGs/$_rv-stream/extras/$_ba/extras-common/
${__u2}repo=centos-extras-sig-extras-common-$_st&arch=$_ba${__f}
$__k1
$_gc1
$_rg0
$_m6
$_cm1
$_e1

[extras-common-source]
${__n}Extras packages - Source
${__u2}repo=centos-extras-sig-extras-common-source-$_st&arch=source${__f}
$__k1
$_gc1
$_rg0
$_m6
$_e0
EOF
        ;;
    8)
        local __u3="${_bu}http://debuginfo.centos.org/"
        local __u4="${_ml}http://mirrorlist.centos.org/"
        local __u5="${_bu}http://vault.centos.org/$_ctd/$_st/"
        local _fp='CentOS-Stream-'
        _w "${_fp}AppStream.repo" <<EOF
[appstream]
${__n}AppStream
${__u4}?release=$_st&arch=$_ba&repo=AppStream&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/AppStream/$_ba/os/
$_gc1
$_e1
$__k2
EOF
        _w "${_fp}BaseOS.repo" <<EOF
[baseos]
${__n}BaseOS
${__u4}?release=$_st&arch=$_ba&repo=BaseOS&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/BaseOS/$_ba/os/
$_gc1
$_e1
$__k2
EOF
        _w "${_fp}Debuginfo.repo" <<EOF
[debuginfo]
${__n}Debuginfo
${__u3}$_st/$_ba/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}Extras-common.repo" <<EOF
[extras-common]
${__n}Extras common packages
${__u4}?release=$_st&arch=$_ba&repo=extras-extras-common
#${_bu}http://mirror.centos.org/$_ctd/$_st/extras/$_ba/extras-common/
$_gc1
$_e1
${_gk}${_pki}CentOS-SIG-Extras
EOF
        _w "${_fp}Extras.repo" <<EOF
[extras]
${__n}Extras
${__u4}?release=$_st&arch=$_ba&repo=extras&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/extras/$_ba/os/
$_gc1
$_e1
$__k2
EOF
        _w "${_fp}HighAvailability.repo" <<EOF
[ha]
${__n}${__s1}
${__u4}?release=$_st&arch=$_ba&repo=${__s1}&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/${__s1}/$_ba/os/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}Media.repo" <<EOF
[media-baseos]
${__n}Media - BaseOS
${_bu}${_md}CentOS/BaseOS
        ${_md}cdrom/BaseOS
        ${_md}cdrecorder/BaseOS
$_gc1
$_e0
$__k2

[media-appstream]
${__n}Media - AppStream
${_bu}${_md}CentOS/AppStream
        ${_md}cdrom/AppStream
        ${_md}cdrecorder/AppStream
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}NFV.repo" <<EOF
[nfv]
${__n}NFV
${__u4}?release=$_st&arch=$_ba&repo=NFV&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/NFV/$_ba/os/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}PowerTools.repo" <<EOF
[powertools]
${__n}PowerTools
${__u4}?release=$_st&arch=$_ba&repo=PowerTools&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/PowerTools/$_ba/os/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}RealTime.repo" <<EOF
[rt]
${__n}RealTime
${__u4}?release=$_st&arch=$_ba&repo=RT&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/RT/$_ba/os/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}ResilientStorage.repo" <<EOF
[resilientstorage]
${__n}${__s2}
${__u4}?release=$_st&arch=$_ba&repo=${__s2}&infra=$_if
#${_bu}http://mirror.centos.org/$_ctd/$_st/${__s2}/$_ba/os/
$_gc1
$_e0
$__k2
EOF
        _w "${_fp}Sources.repo" <<EOF
[baseos-source]
${__n}BaseOS - Source
${__u5}BaseOS/Source/
$_gc1
$_e0
$__k2

[appstream-source]
${__n}AppStream - Source
${__u5}AppStream/Source/
$_gc1
$_e0
$__k2

[powertools-source]
${__n}PowerTools - Source
${__u5}PowerTools/Source/
$_gc1
$_e0
$__k2

[extras-source]
${__n}Extras - Source
${__u5}extras/Source/
$_gc1
$_e0
$__k2

[ha-source]
${__n}${__s1} - Source
${__u5}${__s1}/Source/
$_gc1
$_e0
$__k2

[rt-source]
${__n}RT - Source
${__u5}RT/Source/
$_gc1
$_e0
$__k2

[resilientstorage-source]
${__n}${__s2} - Source
${__u5}${__s2}/Source/
$_gc1
$_e0
$__k2

[nfv-source]
${__n}NFV - Source
${__u5}NFV/Source/
$_gc1
$_e0
$__k2
EOF
        ;;
    esac
}

## 生成 Rocky Linux repo 源文件
function gen_repo_files_RockyLinux() {
    local _m6="${_me}6h"
    local __s5='WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED'
    local __s3='HighAvailability'
    local __s4='ResilientStorage'
    local __s2='source/tree/'
    local __s1='debug/tree/'
    local __u1="${_bu}http://dl.rockylinux.org/$_ctd/$_rv/"
    local __u2="${_ml}https://mirrors.rockylinux.org/mirrorlist?arch="
    local __n="${_n}Rocky Linux $_rv - "
    case "$1" in
    10)
        local __k1="${_gk}${_pki}Rocky-10"
        _w rocky.repo <<EOF
[baseos]
${__n}BaseOS
${__u2}$_ba&repo=BaseOS-$_rv$_rl
#${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k1

[baseos-debuginfo]
${__n}BaseOS - Debug
${__u2}$_ba&repo=BaseOS-$_rv-debug$_rl
#${__u1}BaseOS/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[baseos-source]
${__n}BaseOS - Source
${__u2}source&repo=BaseOS-$_rv-source$_rl
#${__u1}BaseOS/${__s2}
$_gc1
$_e0
$_m6
$__k1

[appstream]
${__n}AppStream
${__u2}$_ba&repo=AppStream-$_rv$_rl
#${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k1

[appstream-debuginfo]
${__n}AppStream - Debug
${__u2}$_ba&repo=AppStream-$_rv-debug$_rl
#${__u1}AppStream/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[appstream-source]
${__n}AppStream - Source
${__u2}source&repo=AppStream-$_rv-source$_rl
#${__u1}AppStream/${__s2}
$_gc1
$_e0
$_m6
$__k1

[crb]
${__n}CRB
${__u2}$_ba&repo=CRB-$_rv$_rl
#${__u1}CRB/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[crb-debuginfo]
${__n}CRB - Debug
${__u2}$_ba&repo=CRB-$_rv-debug$_rl
#${__u1}CRB/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[crb-source]
${__n}CRB - Source
${__u2}source&repo=CRB-$_rv-source$_rl
#${__u1}CRB/${__s2}
$_gc1
$_e0
$_m6
$__k1
EOF
        _w rocky-addons.repo <<EOF
[highavailability]
${__n}High Availability
${__u2}$_ba&repo=${__s3}-$_rv$_rl
#${__u1}${__s3}/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[highavailability-debuginfo]
${__n}High Availability - Debug
${__u2}$_ba&repo=${__s3}-$_rv-debug$_rl
#${__u1}${__s3}/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[highavailability-source]
${__n}High Availability - Source
${__u2}source&repo=${__s3}-$_rv-source$_rl
#${__u1}${__s3}/${__s2}
$_gc1
$_e0
$_m6
$__k1

[nfv]
${__n}NFV
${__u2}$_ba&repo=NFV-$_rv$_rl
#${__u1}NFV/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[nfv-debuginfo]
${__n}NFV Debug
${__u2}$_ba&repo=RT-$_rv-debug$_rl
#${__u1}NFV/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[nfv-source]
${__n}NFV Source
${__u2}$_ba&repo=RT-$_rv-source$_rl
#${__u1}NFV/${__s2}
$_gc1
$_e0
$_m6
$__k1

[rt]
${__n}Realtime
${__u2}$_ba&repo=RT-$_rv$_rl
#${__u1}RT/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[rt-debuginfo]
${__n}Realtime Debug
${__u2}$_ba&repo=RT-$_rv-debug$_rl
#${__u1}RT/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[rt-source]
${__n}Realtime Source
${__u2}$_ba&repo=RT-$_rv-source$_rl
#${__u1}RT/${__s2}
$_gc1
$_e0
$_m6
$__k1

[sap]
${__n}SAP
${__u2}$_ba&repo=SAP-$_rv$_rl
#${__u1}SAP/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[sap-debuginfo]
${__n}SAP Debug
${__u2}$_ba&repo=SAP-$_rv-debug$_rl
#${__u1}SAP/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[sap-source]
${__n}SAP Source
${__u2}$_ba&repo=SAP-$_rv-source$_rl
#${__u1}SAP/${__s2}
$_gc1
$_e0
$_m6
$__k1

[saphana]
${__n}SAPHANA
${__u2}$_ba&repo=SAPHANA-$_rv$_rl
#${__u1}SAPHANA/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[saphana-debuginfo]
${__n}SAPHANA Debug
${__u2}$_ba&repo=SAPHANA-$_rv-debug$_rl
#${__u1}SAPHANA/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[saphana-source]
${__n}SAPHANA Source
${__u2}$_ba&repo=SAPHANA-$_rv-source$_rl
#${__u1}SAPHANA/${__s2}
$_gc1
$_e0
$_m6
$__k1
EOF
        _w rocky-devel.repo <<EOF
[devel]
${__n}Devel ${__s5}
${__u2}$_ba&repo=devel-$_rv$_rl
#${__u1}devel/$_ba/os/
$_gc1
$_e0
$_cm1
$__k1

[devel-debuginfo]
${__n}Devel Debug ${__s5}
${__u2}$_ba&repo=devel-$_rv-debug$_rl
#${__u1}devel/$_ba/${__s1}
$_gc1
$_e0
$_cm1
$__k1

[devel-source]
${__n}Devel Source ${__s5}
${__u2}$_ba&repo=devel-$_rv-source$_rl
#${__u1}devel/${__s2}
$_gc1
$_e0
$_cm1
$__k1
EOF
        _w rocky-extras.repo <<EOF
[extras]
${__n}Extras
${__u2}$_ba&repo=extras-$_rv$_rl
#${__u1}extras/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k1

[extras-debuginfo]
${__n}Extras Debug
${__u2}$_ba&repo=extras-$_rv-debug$_rl
#${__u1}extras/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[extras-source]
${__n}Extras Source
${__u2}$_ba&repo=extras-$_rv-source$_rl
#${__u1}extras/${__s2}
$_gc1
$_e0
$_m6
$__k1

[plus]
${__n}Plus
${__u2}$_ba&repo=plus-$_rv$_rl
#${__u1}plus/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k1

[plus-debuginfo]
${__n}Plus - Debug
${__u2}$_ba&repo=plus-$_rv-debug$_rl
#${__u1}plus/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k1

[plus-source]
${__n}Plus - Source
${__u2}source&repo=plus-$_rv-source$_rl
#${__u1}plus/${__s2}
$_gc1
$_e0
$_m6
$__k1
EOF
        ;;
    9)
        local __k2="${_gk}${_pki}Rocky-9"
        _w rocky.repo <<EOF
[baseos]
${__n}BaseOS
${__u2}$_ba&repo=BaseOS-$_rv$_rl
#${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k2

[baseos-debug]
${__n}BaseOS - Debug
${__u2}$_ba&repo=BaseOS-$_rv-debug$_rl
#${__u1}BaseOS/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[baseos-source]
${__n}BaseOS - Source
${__u2}source&repo=BaseOS-$_rv-source$_rl
#${__u1}BaseOS/${__s2}
$_gc1
$_e0
$_m6
$__k2

[appstream]
${__n}AppStream
${__u2}$_ba&repo=AppStream-$_rv$_rl
#${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k2

[appstream-debug]
${__n}AppStream - Debug
${__u2}$_ba&repo=AppStream-$_rv-debug$_rl
#${__u1}AppStream/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[appstream-source]
${__n}AppStream - Source
${__u2}source&repo=AppStream-$_rv-source$_rl
#${__u1}AppStream/${__s2}
$_gc1
$_e0
$_m6
$__k2

[crb]
${__n}CRB
${__u2}$_ba&repo=CRB-$_rv$_rl
#${__u1}CRB/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[crb-debug]
${__n}CRB - Debug
${__u2}$_ba&repo=CRB-$_rv-debug$_rl
#${__u1}CRB/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[crb-source]
${__n}CRB - Source
${__u2}source&repo=CRB-$_rv-source$_rl
#${__u1}CRB/${__s2}
$_gc1
$_e0
$_m6
$__k2
EOF
        _w rocky-addons.repo <<EOF
[highavailability]
${__n}High Availability
${__u2}$_ba&repo=${__s3}-$_rv$_rl
#${__u1}${__s3}/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[highavailability-debug]
${__n}High Availability - Debug
${__u2}$_ba&repo=${__s3}-$_rv-debug$_rl
#${__u1}${__s3}/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[highavailability-source]
${__n}High Availability - Source
${__u2}source&repo=${__s3}-$_rv-source$_rl
#${__u1}${__s3}/${__s2}
$_gc1
$_e0
$_m6
$__k2

[resilientstorage]
${__n}Resilient Storage
${__u2}$_ba&repo=${__s4}-$_rv$_rl
#${__u1}${__s4}/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[resilientstorage-debug]
${__n}Resilient Storage - Debug
${__u2}$_ba&repo=${__s4}-$_rv-debug$_rl
#${__u1}${__s4}/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[resilientstorage-source]
${__n}Resilient Storage - Source
${__u2}source&repo=${__s4}-$_rv-source$_rl
#${__u1}${__s4}/${__s2}
$_gc1
$_e0
$_m6
$__k2

[nfv]
${__n}NFV
${__u2}$_ba&repo=NFV-$_rv$_rl
#${__u1}NFV/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[nfv-debug]
${__n}NFV Debug
${__u2}$_ba&repo=RT-$_rv-debug$_rl
#${__u1}NFV/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[nfv-source]
${__n}NFV Source
${__u2}$_ba&repo=RT-$_rv-source$_rl
#${__u1}NFV/${__s2}
$_gc1
$_e0
$_m6
$__k2

[rt]
${__n}Realtime
${__u2}$_ba&repo=RT-$_rv$_rl
#${__u1}RT/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[rt-debug]
${__n}Realtime Debug
${__u2}$_ba&repo=RT-$_rv-debug$_rl
#${__u1}RT/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[rt-source]
${__n}Realtime Source
${__u2}$_ba&repo=RT-$_rv-source$_rl
#${__u1}RT/${__s2}
$_gc1
$_e0
$_m6
$__k2

[sap]
${__n}SAP
${__u2}$_ba&repo=SAP-$_rv$_rl
#${__u1}SAP/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[sap-debug]
${__n}SAP Debug
${__u2}$_ba&repo=SAP-$_rv-debug$_rl
#${__u1}SAP/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[sap-source]
${__n}SAP Source
${__u2}$_ba&repo=SAP-$_rv-source$_rl
#${__u1}SAP/${__s2}
$_gc1
$_e0
$_m6
$__k2

[saphana]
${__n}SAPHANA
${__u2}$_ba&repo=SAPHANA-$_rv$_rl
#${__u1}SAPHANA/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[saphana-debug]
${__n}SAPHANA Debug
${__u2}$_ba&repo=SAPHANA-$_rv-debug$_rl
#${__u1}SAPHANA/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[saphana-source]
${__n}SAPHANA Source
${__u2}$_ba&repo=SAPHANA-$_rv-source$_rl
#${__u1}SAPHANA/${__s2}
$_gc1
$_e0
$_m6
$__k2
EOF
        _w rocky-devel.repo <<EOF
[devel]
${__n}Devel ${__s5}
${__u2}$_ba&repo=devel-$_rv$_rl
#${__u1}devel/$_ba/os/
$_gc1
$_e0
$_cm1
$__k2
EOF
        _w rocky-extras.repo <<EOF
[extras]
${__n}Extras
${__u2}$_ba&repo=extras-$_rv$_rl
#${__u1}extras/$_ba/os/
$_gc1
$_e1
$_cm1
$_m6
$__k2

[extras-debug]
${__n}Extras Debug
${__u2}$_ba&repo=extras-$_rv-debug$_rl
#${__u1}extras/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[extras-source]
${__n}Extras Source
${__u2}$_ba&repo=extras-$_rv-source$_rl
#${__u1}extras/${__s2}
$_gc1
$_e0
$_m6
$__k2

[plus]
${__n}Plus
${__u2}$_ba&repo=plus-$_rv$_rl
#${__u1}plus/$_ba/os/
$_gc1
$_e0
$_cm1
$_m6
$__k2

[plus-debug]
${__n}Plus - Debug
${__u2}$_ba&repo=plus-$_rv-debug$_rl
#${__u1}plus/$_ba/${__s1}
$_gc1
$_e0
$_m6
$__k2

[plus-source]
${__n}Plus - Source
${__u2}source&repo=plus-$_rv-source$_rl
#${__u1}plus/${__s2}
$_gc1
$_e0
$_m6
$__k2
EOF
        ;;
    8)
        local __k3="${_gk}${_pki}rockyofficial"
        local _fp='Rocky-'
        _w "${_fp}AppStream.repo" <<EOF
[appstream]
${__n}AppStream
${__u2}$_ba&repo=AppStream-$_rv
#${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$_cm1
$__k3
EOF
        _w "${_fp}BaseOS.repo" <<EOF
[baseos]
${__n}BaseOS
${__u2}$_ba&repo=BaseOS-$_rv
#${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$_cm1
$__k3
EOF
        _w "${_fp}Debuginfo.repo" <<EOF
[baseos-debug]
${__n}BaseOS - Source
${__u2}$_ba&repo=BaseOS-$_rv-debug
#${__u1}BaseOS/$_ba/${__s1}
$_gc1
$_e0
$__k3

[appstream-debug]
${__n}AppStream - Source
${__u2}$_ba&repo=AppStream-$_rv-debug
#${__u1}AppStream/$_ba/${__s1}
$_gc1
$_e0
$__k3

[ha-debug]
${__n}High Availability - Source
${__u2}$_ba&repo=${__s3}-$_rv-debug
#${__u1}${__s3}/$_ba/${__s1}
$_gc1
$_e0
$__k3

[powertools-debug]
${__n}PowerTools - Source
${__u2}$_ba&repo=PowerTools-$_rv-debug
#${__u1}PowerTools/$_ba/${__s1}
$_gc1
$_e0
$__k3

[resilient-storage-debug]
${__n}Resilient Storage - Source
${__u2}$_ba&repo=${__s4}-$_rv-debug
#${__u1}${__s4}/$_ba/${__s1}
$_gc1
$_e0
$__k3
EOF
        _w "${_fp}Devel.repo" <<EOF
[devel]
${__n}Devel WARNING! FOR BUILDROOT AND KOJI USE
${__u2}$_ba&repo=Devel-$_rv
#${__u1}Devel/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}Extras.repo" <<EOF
[extras]
${__n}Extras
${__u2}$_ba&repo=extras-$_rv
#${__u1}extras/$_ba/os/
$_gc1
$_e1
$_cm1
$__k3
EOF
        _w "${_fp}HighAvailability.repo" <<EOF
[ha]
${__n}${__s3}
${__u2}$_ba&repo=${__s3}-$_rv
#${__u1}${__s3}/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}Media.repo" <<EOF
[media-baseos]
${__n}Media - BaseOS
${_bu}${_md}Rocky/BaseOS
        ${_md}cdrom/BaseOS
        ${_md}cdrecorder/BaseOS
$_gc1
$_e0
$__k3

[media-appstream]
${__n}Media - AppStream
${_bu}${_md}Rocky/AppStream
        ${_md}cdrom/AppStream
        ${_md}cdrecorder/AppStream
$_gc1
$_e0
$__k3
EOF
        _w "${_fp}NFV.repo" <<EOF
[nfv]
${__n}NFV
${__u2}$_ba&repo=NFV-$_rv
#${__u1}nfv/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}Plus.repo" <<EOF
[plus]
${__n}Plus
${__u2}$_ba&repo=rockyplus-$_rv
#${__u1}plus/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}PowerTools.repo" <<EOF
[powertools]
${__n}PowerTools
${__u2}$_ba&repo=PowerTools-$_rv
#${__u1}PowerTools/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}ResilientStorage.repo" <<EOF
[resilient-storage]
${__n}${__s4}
${__u2}$_ba&repo=${__s4}-$_rv
#${__u1}${__s4}/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}RT.repo" <<EOF
[rt]
${__n}Realtime
${__u2}$_ba&repo=RT-$_rv
#${__u1}RT/$_ba/os/
$_gc1
$_e0
$_cm1
$__k3
EOF
        _w "${_fp}Sources.repo" <<EOF
[baseos-source]
${__n}BaseOS - Source
${__u2}source&repo=BaseOS-$_rv-source
#${__u1}BaseOS/${__s2}
$_gc1
$_e0
$__k3

[appstream-source]
${__n}AppStream - Source
${__u2}source&repo=AppStream-$_rv-source
#${__u1}AppStream/${__s2}
$_gc1
$_e0
$__k3

#[extras-source]
#${__n}Extras - Source
#${__u2}source&repo=extras-$_rv-source
#${__u1}extras/${__s2}
#$_gc1
#$_e0
#$__k3

#[plus-source]
#${__n}Plus - Source
#${__u2}source&repo=plus-$_rv-source
#${__u1}Plus/${__s2}
#$_gc1
#$_e0
#$__k3

[ha-source]
${__n}High Availability - Source
${__u2}source&repo=${__s3}-$_rv-source
#${__u1}${__s3}/${__s2}
$_gc1
$_e0
$__k3

[powertools-source]
${__n}PowerTools - Source
${__u2}source&repo=PowerTools-$_rv-source
#${__u1}PowerTools/${__s2}
$_gc1
$_e0
$__k3

[resilient-storage-source]
${__n}Resilient Storage - Source
${__u2}source&repo=${__s4}-$_rv-source
#${__u1}${__s4}/${__s2}
$_gc1
$_e0
$__k3
EOF
        ;;
    esac
}

## 生成 AlmaLinux repo 源文件
function gen_repo_files_AlmaLinux() {
    local _em='enabled_metadata='
    local _em0="${_em}0"
    local _em1="${_em}1"
    local _m86="${_me}86400"
    local __s1='https://repo.almalinux.org/'
    local __s2='HighAvailability'
    local __s3='ResilientStorage'
    local __u1="${_ml}https://mirrors.almalinux.org/mirrorlist/$_rv/"
    local __u2="${_bu}${__s1}almalinux/$_rv/"
    local __u3="${_bu}${__s1}vault/$_rv/"
    local __n="${_n}AlmaLinux $_rv - "
    local _fp='almalinux-'
    case "$1" in
    10)
        local __u4="${_bu}https://vault.almalinux.org/$_rv/"
        local __k1="${_gk}${_pki}AlmaLinux-10"
        _w "${_fp}appstream.repo" <<EOF
[appstream]
${__n}AppStream
${__u1}appstream
# ${__u2}AppStream/$_ba/os/
$_e1
$_gc1
$_cm1
$__k1
$_m86
$_em1

[appstream-debuginfo]
${__n}AppStream - Debug
${__u1}appstream-debug
# ${__u4}AppStream/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[appstream-source]
${__n}AppStream - Source
${__u1}appstream-source
# ${__u4}AppStream/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}baseos.repo" <<EOF
[baseos]
${__n}BaseOS
${__u1}baseos
# ${__u2}BaseOS/$_ba/os/
$_e1
$_gc1
$_cm1
$__k1
$_m86
$_em1

[baseos-debuginfo]
${__n}BaseOS - Debug
${__u1}baseos-debug
# ${__u4}BaseOS/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[baseos-source]
${__n}BaseOS - Source
${__u1}baseos-source
# ${__u4}BaseOS/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}crb.repo" <<EOF
[crb]
${__n}CRB
${__u1}crb
# ${__u2}CRB/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[crb-debuginfo]
${__n}CRB - Debug
${__u1}crb-debug
# ${__u4}CRB/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[crb-source]
${__n}CRB - Source
${__u1}crb-source
# ${__u4}CRB/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}extras.repo" <<EOF
[extras]
${__n}Extras
${__u1}extras
# ${__u2}extras/$_ba/os/
$_e1
$_gc1
$_cm1
$__k1
$_m86
$_em0

[extras-debuginfo]
${__n}Extras - Debug
${__u1}extras-debug
# ${__u4}extras/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[extras-source]
${__n}Extras - Source
${__u1}extras-source
# ${__u4}extras/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}highavailability.repo" <<EOF
[highavailability]
${__n}${__s2}
${__u1}highavailability
# ${__u2}${__s2}/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[highavailability-debuginfo]
${__n}${__s2} - Debug
${__u1}highavailability-debug
# ${__u4}${__s2}/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[highavailability-source]
${__n}${__s2} - Source
${__u1}highavailability-source
# ${__u4}${__s2}/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}nfv.repo" <<EOF
[nfv]
${__n}NFV
${__u1}nfv
# ${__u2}NFV/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[nfv-debuginfo]
${__n}NFV - Debug
${__u1}nfv-debug
# ${__u4}NFV/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[nfv-source]
${__n}NFV - Source
${__u1}nfv-source
# ${__u4}NFV/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}rt.repo" <<EOF
[rt]
${__n}RT
${__u1}rt
# ${__u2}RT/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[rt-debuginfo]
${__n}RT - Debug
${__u1}rt-debug
# ${__u4}RT/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[rt-source]
${__n}RT - Source
${__u1}rt-source
# ${__u4}RT/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}saphana.repo" <<EOF
[saphana]
${__n}SAPHANA
${__u1}saphana
# ${__u2}SAPHANA/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[saphana-debuginfo]
${__n}SAPHANA - Debug
${__u1}saphana-debug
# ${__u4}SAPHANA/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[saphana-source]
${__n}SAPHANA - Source
${__u1}saphana-source
# ${__u4}SAPHANA/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        _w "${_fp}sap.repo" <<EOF
[sap]
${__n}SAP
${__u1}sap
# ${__u2}SAP/$_ba/os/
$_e0
$_gc1
$_cm1
$__k1
$_m86
$_em0

[sap-debuginfo]
${__n}SAP - Debug
${__u1}sap-debug
# ${__u4}SAP/debug/$_ba/
$_e0
$_gc1
$__k1
$_m86
$_em0

[sap-source]
${__n}SAP - Source
${__u1}sap-source
# ${__u4}SAP/Source/
$_e0
$_gc1
$__k1
$_m86
$_em0
EOF
        ;;
    9)
        local __k2="${_gk}${_pki}AlmaLinux-9"
        _w "${_fp}appstream.repo" <<EOF
[appstream]
${__n}AppStream
${__u1}appstream
# ${__u2}AppStream/$_ba/os/
$_e1
$_gc1
$_cm1
$__k2
$_m86
$_em1

[appstream-debug]
${__n}AppStream - Debug
${__u1}appstream-debug
# ${__u3}AppStream/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[appstream-source]
${__n}AppStream - Source
${__u1}appstream-source
# ${__u3}AppStream/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}baseos.repo" <<EOF
[baseos]
${__n}BaseOS
${__u1}baseos
# ${__u2}BaseOS/$_ba/os/
$_e1
$_gc1
$_cm1
$__k2
$_m86
$_em1

[baseos-debug]
${__n}BaseOS - Debug
${__u1}baseos-debug
# ${__u3}BaseOS/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[baseos-source]
${__n}BaseOS - Source
${__u1}baseos-source
# ${__u3}BaseOS/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}crb.repo" <<EOF
[crb]
${__n}CRB
${__u1}crb
# ${__u2}CRB/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[crb-debug]
${__n}CRB - Debug
${__u1}crb-debug
# ${__u3}CRB/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[crb-source]
${__n}CRB - Source
${__u1}crb-source
# ${__u3}CRB/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}extras.repo" <<EOF
[extras]
${__n}Extras
${__u1}extras
# ${__u2}extras/$_ba/os/
$_e1
$_gc1
$_cm1
$__k2
$_m86
$_em0

[extras-debug]
${__n}Extras - Debug
${__u1}extras-debug
# ${__u3}extras/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[extras-source]
${__n}Extras - Source
${__u1}extras-source
# ${__u3}extras/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}highavailability.repo" <<EOF
[highavailability]
${__n}${__s2}
${__u1}highavailability
# ${__u2}${__s2}/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[highavailability-debug]
${__n}${__s2} - Debug
${__u1}highavailability-debug
# ${__u3}${__s2}/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[highavailability-source]
${__n}${__s2} - Source
${__u1}highavailability-source
# ${__u3}${__s2}/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}nfv.repo" <<EOF
[nfv]
${__n}NFV
${__u1}nfv
# ${__u2}NFV/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[nfv-debug]
${__n}NFV - Debug
${__u1}nfv-debug
# ${__u3}NFV/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[nfv-source]
${__n}NFV - Source
${__u1}nfv-source
# ${__u3}NFV/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}plus.repo" <<EOF
[plus]
${__n}Plus
${__u1}plus
# ${__u2}plus/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[plus-debug]
${__n}Plus - Debug
${__u1}plus-debug
# ${__u3}plus/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[plus-source]
${__n}Plus - Source
${__u1}plus-source
# ${__u3}plus/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}resilientstorage.repo" <<EOF
[resilientstorage]
${__n}${__s3}
${__u1}resilientstorage
# ${__u2}${__s3}/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[resilientstorage-debug]
${__n}${__s3} - Debug
${__u1}resilientstorage-debug
# ${__u3}${__s3}/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[resilientstorage-source]
${__n}${__s3} - Source
${__u1}resilientstorage-source
# ${__u3}${__s3}/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}rt.repo" <<EOF
[rt]
${__n}RT
${__u1}rt
# ${__u2}RT/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[rt-debug]
${__n}RT - Debug
${__u1}rt-debug
# ${__u3}RT/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[rt-source]
${__n}RT - Source
${__u1}rt-source
# ${__u3}RT/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}sap.repo" <<EOF
[sap]
${__n}SAP
${__u1}sap
# ${__u2}SAP/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[sap-debug]
${__n}SAP - Debug
${__u1}sap-debug
# ${__u3}SAP/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[sap-source]
${__n}SAP - Source
${__u1}sap-source
# ${__u3}SAP/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        _w "${_fp}saphana.repo" <<EOF
[saphana]
${__n}SAPHANA
${__u1}saphana
# ${__u2}SAPHANA/$_ba/os/
$_e0
$_gc1
$_cm1
$__k2
$_m86
$_em0

[saphana-debug]
${__n}SAPHANA - Debug
${__u1}saphana-debug
# ${__u3}SAPHANA/debug/$_ba/
$_e0
$_gc1
$__k2
$_m86
$_em0

[saphana-source]
${__n}SAPHANA - Source
${__u1}saphana-source
# ${__u3}SAPHANA/Source/
$_e0
$_gc1
$__k2
$_m86
$_em0
EOF
        ;;
    8)
        local __k3="${_gk}${_pki}AlmaLinux"
        _w "${_fp}ha.repo" <<EOF
[ha]
${__n}${__s2}
${__u1}ha
# ${__u2}${__s2}/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[ha-source]
${__n}${__s2} Source
${__u1}ha-source
# ${__u3}${__s2}/Source/
$_e0
$_gc1
$__k3

[ha-debuginfo]
${__n}${__s2} debuginfo
${__u1}ha-debuginfo
# ${__u3}${__s2}/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}nfv.repo" <<EOF
[nfv]
${__n}Real Time for NFV
${__u1}nfv
# ${__u2}NFV/$_ba/os/
$_e0
$_gc1
$__k3

[nfv-source]
${__n}Real Time for NFV Sources
${__u1}nfv-source
# ${__u3}NFV/Source/
$_e0
$_gc1
$__k3

[nfv-debuginfo]
${__n}Real Time for NFV Debuginfo
${__u1}nfv-debuginfo
# ${__u3}NFV/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}plus.repo" <<EOF
[plus]
${__n}Plus
${__u1}plus
# ${__u2}plus/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[plus-source]
${__n}Plus Source
${__u1}plus-source
# ${__u3}plus/Source/
$_e0
$_gc1
$__k3

[plus-debuginfo]
${__n}Plus debuginfo
${__u1}plus-debuginfo
# ${__u3}plus/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}powertools.repo" <<EOF
[powertools]
${__n}PowerTools
${__u1}powertools
# ${__u2}PowerTools/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[powertools-source]
${__n}PowerTools Source
${__u1}powertools-source
# ${__u3}PowerTools/Source/
$_e0
$_gc1
$__k3

[powertools-debuginfo]
${__n}PowerTools debuginfo
${__u1}powertools-debuginfo
# ${__u3}PowerTools/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}resilientstorage.repo" <<EOF
[resilientstorage]
${__n}${__s3}
${__u1}resilientstorage
# ${__u2}${__s3}/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[resilientstorage-source]
${__n}${__s3} Source
${__u1}resilientstorage-source
# ${__u3}${__s3}/Source/
$_e0
$_gc1
$__k3

[resilientstorage-debuginfo]
${__n}${__s3} debuginfo
${__u1}resilientstorage-debuginfo
# ${__u3}${__s3}/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}rt.repo" <<EOF
[rt]
${__n}Real Time
${__u1}rt
# ${__u2}RT/$_ba/os/
$_e0
$_gc1
$__k3

[rt-source]
${__n}Real Time Sources
${__u1}rt-source
# ${__u3}RT/Source/
$_e0
$_gc1
$__k3

[rt-debuginfo]
${__n}Real Time Debuginfo
${__u1}rt-debuginfo
# ${__u3}RT/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}sap.repo" <<EOF
[sap]
${__n}SAP
${__u1}sap
# ${__u2}SAP/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[sap-source]
${__n}SAP Sources
${__u1}sap-source
# ${__u3}SAP/Source/
$_e0
$_gc1
$__k3

[sap-debuginfo]
${__n}SAP Debuginfo
${__u1}sap-debuginfo
# ${__u3}SAP/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w "${_fp}saphana.repo" <<EOF
[saphana]
${__n}SAP HANA
${__u1}saphana
# ${__u2}SAPHANA/$_ba/os/
$_e0
$_gc1
$_cm1
$__k3

[saphana-source]
${__n}SAP HANA Sources
${__u1}saphana-source
# ${__u3}SAPHANA/Source/
$_e0
$_gc1
$__k3

[saphana-debuginfo]
${__n}SAP HANA Debuginfo
${__u1}saphana-debuginfo
# ${__u3}SAPHANA/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        _w almalinux.repo <<EOF
[baseos]
${__n}BaseOS
${__u1}baseos
# ${__u2}BaseOS/$_ba/os/
$_e1
$_gc1
$_cm1
$__k3

[appstream]
${__n}AppStream
${__u1}appstream
# ${__u2}AppStream/$_ba/os/
$_e1
$_gc1
$_cm1
$__k3

[extras]
${__n}Extras
${__u1}extras
# ${__u2}extras/$_ba/os/
$_e1
$_gc1
$_cm1
$__k3

[baseos-source]
${__n}BaseOS Source
${__u1}baseos-source
# ${__u3}BaseOS/Source/
$_e0
$_gc1
$__k3

[appstream-source]
${__n}AppStream Source
${__u1}appstream-source
# ${__u3}AppStream/Source/
$_e0
$_gc1
$__k3

[extras-source]
${__n}Extras Source
${__u1}extras-source
# ${__u3}extras/Source/
$_e0
$_gc1
$__k3

[baseos-debuginfo]
${__n}BaseOS debuginfo
${__u1}baseos-debuginfo
# ${__u3}BaseOS/debug/$_ba/
$_e0
$_gc1
$__k3

[appstream-debuginfo]
${__n}AppStream debuginfo
${__u1}appstream-debuginfo
# ${__u3}AppStream/debug/$_ba/
$_e0
$_gc1
$__k3

[extras-debuginfo]
${__n}Extras debuginfo
${__u1}extras-debuginfo
# ${__u3}extras/debug/$_ba/
$_e0
$_gc1
$__k3
EOF
        ;;
    esac
}

## 生成 Fedora repo 源文件
function gen_repo_files_Fedora() {
    local _m6="${_me}6h"
    local _m7="${_me}7d"
    local _tyr="${_ty}rpm"
    local __s3='source/tree/'
    local __s2='/Everything/'
    local __s1='debug/tree/'
    local __u1="${_bu}http://download.example/pub/fedora/linux/"
    local __u2="${_mt}https://mirrors.fedoraproject.org/metalink?"
    local __n1="${_n}Fedora $_rv - "
    local __n2="${_n}Fedora Modular $_rv - "
    local __k="${_gk}${_pki}fedora-$_rv-$_ba"
    local __f='&arch=$basearch'
    _w fedora.repo <<EOF
[fedora]
${__n1}$_ba
#${__u1}releases/$_rv${__s2}$_ba/os/
${__u2}repo=fedora-$_rv${__f}
$_e1
$_cm1
$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF

[fedora-debuginfo]
${__n1}$_ba - Debug
#${__u1}releases/$_rv${__s2}$_ba/${__s1}
${__u2}repo=fedora-debug-$_rv${__f}
$_e0
$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF

[fedora-source]
${__n1}Source
#${__u1}releases/$_rv${__s2}${__s3}
${__u2}repo=fedora-source-$_rv${__f}
$_e0
$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF
EOF
    _w fedora-updates.repo <<EOF
[updates]
${__n1}$_ba - Updates
#${__u1}updates/$_rv${__s2}$_ba/
${__u2}repo=updates-released-f$_rv${__f}
$_e1
$_cm1
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-debuginfo]
${__n1}$_ba - Updates - Debug
#${__u1}updates/$_rv${__s2}$_ba/debug/
${__u2}repo=updates-released-debug-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-source]
${__n1}Updates Source
#${__u1}updates/$_rv${__s2}SRPMS/
${__u2}repo=updates-released-source-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF
EOF
    _w fedora-updates-testing.repo <<EOF
[updates-testing]
${__n1}$_ba - Test Updates
#${__u1}updates/testing/$_rv${__s2}$_ba/
${__u2}repo=updates-testing-f$_rv${__f}
$_e0
$_cm1
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-testing-debuginfo]
${__n1}$_ba - Test Updates Debug
#${__u1}updates/testing/$_rv${__s2}$_ba/debug/
${__u2}repo=updates-testing-debug-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-testing-source]
${__n1}Test Updates Source
#${__u1}updates/testing/$_rv${__s2}SRPMS/
${__u2}repo=updates-testing-source-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF
EOF
    ## 自 Fedora 39 起不再使用 modular 仓库
    if [[ $1 -lt 39 ]]; then
        _w fedora-modular.repo <<EOF
[fedora-modular]
${__n2}$_ba
#${__u1}releases/$_rv/Modular/$_ba/os/
${__u2}repo=fedora-modular-$_rv${__f}
$_e1
$_cm1
#$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF

[fedora-modular-debuginfo]
${__n2}$_ba - Debug
#${__u1}releases/$_rv/Modular/$_ba/${__s1}
${__u2}repo=fedora-modular-debug-$_rv${__f}
$_e0
$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF

[fedora-modular-source]
${__n2}Source
#${__u1}releases/$_rv/Modular/${__s3}
${__u2}repo=fedora-modular-source-$_rv${__f}
$_e0
$_m7
$_rg0
$_tyr
$_gc1
$__k
$_suF
EOF
        _w fedora-updates-modular.repo <<EOF
[updates-modular]
${__n2}$_ba - Updates
#${__u1}updates/$_rv/Modular/$_ba/
${__u2}repo=updates-released-modular-f$_rv${__f}
$_e1
$_cm1
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-modular-debuginfo]
${__n2}$_ba - Updates - Debug
#${__u1}updates/$_rv/Modular/$_ba/debug/
${__u2}repo=updates-released-modular-debug-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-modular-source]
${__n2}Updates Source
#${__u1}updates/$_rv/Modular/SRPMS/
${__u2}repo=updates-released-modular-source-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF
EOF
        _w fedora-updates-testing-modular.repo <<EOF
[updates-testing-modular]
${__n2}$_ba - Test Updates
#${__u1}updates/testing/$_rv/Modular/$_ba/
${__u2}repo=updates-testing-modular-f$_rv${__f}
$_e0
$_cm1
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-testing-modular-debuginfo]
${__n2}$_ba - Test Updates Debug
#${__u1}updates/$_rv/Modular/$_ba/debug/
${__u2}repo=updates-testing-modular-debug-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF

[updates-testing-modular-source]
${__n2}Test Updates Source
#${__u1}updates/$_rv/Modular/SRPMS/
${__u2}repo=updates-testing-modular-source-f$_rv${__f}
$_e0
$_rg0
$_tyr
$_gc1
$_m6
$__k
$_suF
EOF
    fi
}

## 生成 openEuler repo 源文件
function gen_repo_files_openEuler() {
    local __s='openEuler-version/'
    local __u='https://repo.openeuler.org/'
    local __k1="${_gk}${__u}${__s}OS/$_ba/RPM-GPG-KEY-openEuler"
    local __k2="${_gk}${__u}${__s}source/RPM-GPG-KEY-openEuler"
    _w openEuler.repo <<EOF
[OS]
${_n}OS
${_bu}${__u}${__s}OS/$_ba/
$_e1
$_gc1
$__k1

[everything]
${_n}everything
${_bu}${__u}${__s}everything/$_ba/
$_e1
$_gc1
$__k1

[EPOL]
${_n}EPOL
${_bu}${__u}${__s}EPOL/main/$_ba/
$_e1
$_gc1
$__k1

[debuginfo]
${_n}debuginfo
${_bu}${__u}${__s}debuginfo/$_ba/
$_e1
$_gc1
${_gk}${__u}${__s}debuginfo/$_ba/RPM-GPG-KEY-openEuler

[source]
${_n}source
${_bu}${__u}${__s}source/
$_e1
$_gc1
$__k2

[update]
${_n}update
${_bu}${__u}${__s}update/$_ba/
$_e1
$_gc1
$__k1

[update-source]
${_n}update-source
${_bu}${__u}${__s}update/source/
$_e0
$_gc1
$__k2
EOF
    ## 替换版本号
    local version_name="$(get_os_release_value VERSION | sed 's/["()]//g; s/[_ ]\+/-/g; s/^-\+\|-\+$//g')"
    sed -e "s|openEuler-version|openEuler-${version_name}|g" \
        -i \
        $Dir_YumRepos/openEuler.repo
}

## 生成 OpenCloudOS repo 源文件
function gen_repo_files_OpenCloudOS() {
    local __s2='source/tree/'
    local __s1='debug/tree/'
    local __u1="${_bu}https://mirrors.opencloudos.tech/opencloudos/$_rv/"
    case "${1%%.*}" in
    23)
        local __u2="${_bu}https://mirrors.opencloudos.tech/opencloudos-stream/releases/$_rv/"
        local __k1="${_gk}${_pki}OpenCloudOS-Stream"
        _w OpenCloudOS-Stream.repo <<EOF
[BaseOS]
${_n}BaseOS $_rv - $_ba
${__u2}BaseOS/$_ba/Packages/
$_gc1
$_e1
$__k1

[AppStream]
${_n}AppStream $_rv - $_ba
${__u2}AppStream/$_ba/Packages/
$_gc1
$_e1
$__k1

[BaseOS-debug]
${_n}BaseOS-debug $_rv - $_ba
${__u2}BaseOS/$_ba/debug/
$_gc1
$_e0
$__k1

[AppStream-debug]
${_n}AppStream-debug $_rv - $_ba
${__u2}AppStream/$_ba/debug/
$_gc1
$_e0
$__k1

[BaseOS-source]
${_n}BaseOS-source $_rv
${__u2}BaseOS/source/
$_gc1
$_e0
$__k1

[AppStream-source]
${_n}AppStream-source $_rv
${__u2}AppStream/source/
$_gc1
$_e0
$__k1
EOF
        ;;
    9)
        local __k2="${_gk}${_pki}OpenCloudOS-9"
        _w OpenCloudOS.repo <<EOF
[BaseOS]
${_n}BaseOS $_rv - $_ba
${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$__k2

[AppStream]
${_n}AppStream $_rv - $_ba
${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$__k2

[extras]
${_n}extras $_rv - $_ba
${__u1}extras/$_ba/os/
$_gc1
$_e1
$__k2

[BaseOS-debuginfo]
${_n}BaseOS-debuginfo $_rv - $_ba
${__u1}BaseOS/$_ba/${__s1}
$_gc1
$_e0
$__k2

[AppStream-debuginfo]
${_n}AppStream-debuginfo $_rv - $_ba
${__u1}AppStream/$_ba/${__s1}
$_gc1
$_e0
$__k2

[extras-debuginfo]
${_n}extras-debuginfo $_rv - $_ba
${__u1}extras/$_ba/${__s1}
$_gc1
$_e0
$__k2

[BaseOS-source]
${_n}BaseOS-source $_rv
${__u1}BaseOS/${__s2}
$_gc1
$_e0
$__k2

[AppStream-source]
${_n}AppStream-source $_rv
${__u1}AppStream/${__s2}
$_gc1
$_e0
$__k2

[extras-source]
${_n}extras-source $_rv
${__u1}extras/${__s2}
$_gc1
$_e0
$__k2
EOF
        ;;
    8)
        local __s3='HighAvailability'
        local __s4='ResilientStorage'
        local __n="${_n}OpenCloudOS $_rv - "
        local __k3="${_gk}${_pki}OpenCloudOS"
        _w OpenCloudOS-Debuginfo.repo <<EOF
[BaseOS-debuginfo]
${__n}BaseOS-debuginfo
${__u1}BaseOS/$_ba/${__s1}
$_gc1
$_e0
$__k3

[AppStream-debuginfo]
${__n}AppStream-debuginfo
${__u1}AppStream/$_ba/${__s1}
$_gc1
$_e0
$__k3

[Extras-debuginfo]
${__n}Extras-debuginfo
${__u1}Extras/$_ba/${__s1}
$_gc1
$_e0
$__k3

[HighAvailability-debuginfo]
${__n}${__s3}-debuginfo
${__u1}${__s3}/$_ba/${__s1}
$_gc1
$_e0
$__k3

[PowerTools-debuginfo]
${__n}PowerTools-debuginfo
${__u1}PowerTools/$_ba/${__s1}
$_gc1
$_e0
$__k3

[ResilientStorage-debuginfo]
${__n}${__s4}-debuginfo
${__u1}${__s4}/$_ba/${__s1}
$_gc1
$_e0
$__k3

[Plus-debuginfo]
${__n}Plus-debuginfo
${__u1}Plus/$_ba/${__s1}
$_gc1
$_e0
$__k3
EOF
        if [[ "${1}" == "8.6" ]]; then
            _w OpenCloudOS.repo <<EOF
[BaseOS]
${__n}BaseOS
${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$__k3

[AppStream]
${__n}AppStream
${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$__k3

[Extras]
${__n}Extras
${__u1}Extras/$_ba/os/
$_gc1
$_e1
$__k3

[HighAvailability]
${__n}${__s3}
${__u1}${__s3}/$_ba/os/
$_gc1
$_e0
$__k3

[PowerTools]
${__n}PowerTools
${__u1}PowerTools/$_ba/os/
$_gc1
$_e0
$__k3

[ResilientStorage]
${__n}${__s4}
${__u1}${__s4}/$_ba/os/
$_gc1
$_e0
$__k3

[Plus]
${__n}Plus
${__u1}Plus/$_ba/os/
$_gc1
$_e1
$__k3
EOF
        else
            _w OpenCloudOS.repo <<EOF
[BaseOS]
${__n}BaseOS
${__u1}BaseOS/$_ba/os/
$_gc1
$_e1
$__k3

[AppStream]
${__n}AppStream
${__u1}AppStream/$_ba/os/
$_gc1
$_e1
$__k3

[Extras]
${__n}Extras
${__u1}Extras/$_ba/os/
$_gc1
$_e1
$__k3

[HighAvailability]
${__n}${__s3}
${__u1}${__s3}/$_ba/os/
$_gc1
$_e0
$__k3

[NFV]
${__n}NFV
${__u1}NFV/$_ba/os/
$_gc1
$_e0
$__k3

[PowerTools]
${__n}PowerTools
${__u1}PowerTools/$_ba/os/
$_gc1
$_e0
$__k3

[ResilientStorage]
${__n}${__s4}
${__u1}${__s4}/$_ba/os/
$_gc1
$_e0
$__k3

[Plus]
${__n}Plus
${__u1}Plus/$_ba/os/
$_gc1
$_e1
$__k3
EOF
        fi
        _w OpenCloudOS-Sources.repo <<EOF
[BaseOS-source]
${__n}Base-source
${__u1}BaseOS/${__s2}
$_gc1
$_e0
$__k3

[AppStream-source]
${__n}AppStream-source
${__u1}AppStream/${__s2}
$_gc1
$_e0
$__k3

[Extras-source]
${__n}Extras-source
${__u1}Extras/${__s2}
$_gc1
$_e0
$__k3

[HighAvailability-source]
${__n}${__s3}-source
${__u1}${__s3}/${__s2}
$_gc1
$_e0
$__k3

[PowerTools-source]
${__n}PowerTools-source
${__u1}PowerTools/${__s2}
$_gc1
$_e0
$__k3

[ResilientStorage-source]
${__n}${__s4}-source
${__u1}${__s4}/${__s2}
$_gc1
$_e0
$__k3

[Plus-source]
${__n}Plus-source
${__u1}Plus/${__s2}
$_gc1
$_e0
$__k3
EOF
        ;;
    esac
}

## 生成 Anolis OS repo 源文件
function gen_repo_files_AnolisOS() {
    local __s1='mirrors.openanolis.cn/anolis/'
    local __u1="${_bu}http://${__s1}"
    local __u2="https://${__s1}"
    local __n="${_n}AnolisOS-$_rv - "
    local __k1="${_gk}${_pki}ANOLIS"
    local __k2="${_gk}${__u2}RPM-GPG-KEY-ANOLIS"
    case "${1%%.*}" in
    23)
        _w AnolisOS.repo <<EOF
[os]
${__n}os
${__u1}$_rv/os/$_ba/os
$_e1
$__k1
$_gc1

[updates]
${__n}updates
${__u1}$_rv/updates/$_ba/os
$_e1
$__k1
$_gc1

[kernel-6]
${__n}kernel-6
${__u1}$_rv/kernel-6/$_ba/os
$_e1
$__k1
$_gc1
EOF
        _w AnolisOS-Source.repo <<EOF
[os-source]
${__n}os Source
${_bu}${__u2}$_rv/os/source/
$_e0
$__k2
$_gc1

[updates-source]
${__n}updates Source
${_bu}${__u2}$_rv/updates/source/
$_e0
$__k2
$_gc1

[kernel-source]
${__n}kernel-6 Source
${_bu}${__u2}$_rv/kernel-6/source/
$_e0
$__k2
$_gc1
EOF
        _w AnolisOS-Debuginfo.repo <<EOF
[os-debuginfo]
${__n}os Debuginfo
${_bu}${__u2}$_rv/os/$_ba/debug
$_e0
$__k2
$_gc1

[updates-debuginfo]
${__n}updates Debuginfo
${_bu}${__u2}$_rv/updates/$_ba/debug
$_e0
$__k2
$_gc1

[kernel-6-debuginfo]
${__n}kernel-6 Debuginfo
${_bu}${__u2}$_rv/kernel-6/$_ba/debug
$_e0
$__k2
$_gc1
EOF
        ;;
    8)
        local __s2='HighAvailability'
        local _fp='AnolisOS-'
        _w "${_fp}AppStream.repo" <<EOF
[AppStream]
${__n}AppStream
${__u1}$_rv/AppStream/$_ba/os
$_e1
$__k1
$_gc1
EOF
        _w "${_fp}BaseOS.repo" <<EOF
[BaseOS]
${__n}BaseOS
${__u1}$_rv/BaseOS/$_ba/os
$_e1
$__k1
$_gc1
EOF
        _w "${_fp}DDE.repo" <<EOF
[DDE]
${__n}DDE
${__u1}$_rv/DDE/$_ba/os
$_e0
$__k1
$_gc1
EOF
        _w "${_fp}Debuginfo.repo" <<EOF
[AppStream-debuginfo]
${__n}AppStream Debuginfo
${_bu}${__u2}$_rv/AppStream/$_ba/debug
$_e0
$__k2
$_gc1

[BaseOS-debuginfo]
${__n}BaseOS Debuginfo
${_bu}${__u2}$_rv/BaseOS/$_ba/debug
$_e0
$__k2
$_gc1

[Plus-debuginfo]
${__n}Plus Debuginfo
${_bu}${__u2}$_rv/Plus/$_ba/debug
$_e0
$__k2
$_gc1

[PowerTools-debuginfo]
${__n}PowerTools Debuginfo
${_bu}${__u2}$_rv/PowerTools/$_ba/debug
$_e0
$__k2
$_gc1

[DDE-debuginfo]
${__n}DDE Debuginfo
${_bu}${__u2}$_rv/DDE/$_ba/debug
$_e0
$__k2
$_gc1
EOF
        _w "${_fp}Extras.repo" <<EOF
[Extras]
${__n}Extras
${__u1}$_rv/Extras/$_ba/os
$_e1
$__k1
$_gc1
EOF
        _w "${_fp}HighAvailability.repo" <<EOF
[HighAvailability]
${__n}${__s2}
${__u1}$_rv/${__s2}/$_ba/os
$_e0
$__k1
$_gc1
EOF
        _w "${_fp}Plus.repo" <<EOF
[Plus]
${__n}Plus
${__u1}$_rv/Plus/$_ba/os
$_e0
$__k1
$_gc1
EOF
        _w "${_fp}PowerTools.repo" <<EOF
[PowerTools]
${__n}PowerTools
${__u1}$_rv/PowerTools/$_ba/os
$_e1
$__k1
$_gc1
EOF
        _w "${_fp}Source.repo" <<EOF
[AppStream-source]
${__n}AppStream Source
${_bu}${__u2}$_rv/AppStream/source/
$_e0
$__k2
$_gc1

[BaseOS-source]
${__n}BaseOS Source
${_bu}${__u2}$_rv/BaseOS/source/
$_e0
$__k2
$_gc1

[Plus-source]
${__n}Plus Source
${_bu}${__u2}$_rv/Plus/source/
$_e0
$__k2
$_gc1

[PowerTools-source]
${__n}PowerTools Source
${_bu}${__u2}$_rv/PowerTools/source/
$_e0
$__k2
$_gc1

[DDE-source]
${__n}DDE Source
${_bu}${__u2}$_rv/DDE/source/
$_e0
$__k2
$_gc1
EOF
        ## 8.8 新增
        if [[ "${1#*.}" -ge 8 ]]; then
            _w "${_fp}kernel-5.10.repo" <<EOF
[kernel-5.10]
${__n}Kernel 5.10
${__u1}$_rv/kernel-5.10/$_ba/os
$_e1
$__k1
$_gc1

[kernel-5.10-source]
${__n}Kernel 5.10 source
${__u1}$_rv/kernel-5.10/source
$_e0
$__k1
$_gc1

[kernel-5.10-debug]
${__n}Kernel 5.10 debug
${__u1}$_rv/kernel-5.10/$_ba/debug
$_e0
$__k1
$_gc1
EOF
        fi
        ## 8.10 新增
        if [[ "${1#*.}" -eq 10 ]]; then
            _w "${_fp}Devel.repo" <<EOF
[Devel]
${__n}Devel
${__u1}$_rv/Devel/$_ba/os
$_e0
$__k1
$_gc1
EOF
            _w "${_fp}NDE.repo" <<EOF
[NDE]
${__n}NDE
${__u1}$_rv/NDE/$_ba/os
$_e0
$__k1
$_gc1

[NDE-debuginfo]
${__n}NDE Debuginfo
${_bu}${__u2}$_rv/NDE/$_ba/debug
$_e0
$__k2
$_gc1

[NDE-source]
${__n}NDE Source
${_bu}${__u2}$_rv/NDE/source/
$_e0
$__k2
$_gc1
EOF
        fi
        ;;
    esac
}

## 生成 openSUSE repo 源文件
function gen_repo_files_openSUSE() {
    local _ar='autorefresh='
    local _ar1="${_ar}1"
    local _kp='keeppackages='
    local _kp0="${_kp}0"
    local _tyN="${_ty}NONE"
    local _tym="${_ty}rpm-md"
    local __u1="${_bu}http://codecs.opensuse.org/"
    local __u2="${_bu}http://download.opensuse.org/"
    case "$1" in
    "leap")
        case "${2%%.*}" in
        16)
            local __s='repodata/repomd.xml.key'
            local __u3='http://cdn.opensuse.org/'
            local _fp='openSUSE:repo-'
            _wz "${_fp}non-oss-debug.repo" <<EOF
[openSUSE:repo-non-oss-debug]
${_n}repo-non-oss-debug (${_rvb})
$_e0
$_ar1
${_bu}${__u3}debug/distribution/leap/${_rvb}/repo/non-oss/$_ba
${_gk}${__u3}debug/distribution/leap/${_rvb}/repo/non-oss/$_ba/${__s}
EOF
            _wz "${_fp}non-oss.repo" <<EOF
[openSUSE:repo-non-oss]
${_n}repo-non-oss (${_rvb})
$_e0
$_ar1
${_bu}${__u3}distribution/leap/${_rvb}/repo/non-oss/$_ba
${_gk}${__u3}distribution/leap/${_rvb}/repo/non-oss/$_ba/${__s}
EOF
            _wz "${_fp}openh264.repo" <<EOF
[openSUSE:repo-openh264]
${_n}repo-openh264 (${_rvb})
$_e1
$_ar1
${__u1}openh264/openSUSE_Leap_16
${_gk}https://codecs.opensuse.org/openh264/openSUSE_Leap_16/${__s}
EOF
            _wz "${_fp}oss-debug.repo" <<EOF
[openSUSE:repo-oss-debug]
${_n}repo-oss-debug (${_rvb})
$_e0
$_ar1
${_bu}${__u3}debug/distribution/leap/${_rvb}/repo/oss/$_ba
${_gk}${__u3}debug/distribution/leap/${_rvb}/repo/oss/$_ba/${__s}
EOF
            _wz "${_fp}oss.repo" <<EOF
[openSUSE:repo-oss]
${_n}repo-oss (${_rvb})
$_e1
$_ar1
${_bu}${__u3}distribution/leap/${_rvb}/repo/oss/$_ba
${_gk}${__u3}distribution/leap/${_rvb}/repo/oss/$_ba/${__s}
EOF
            _wz "${_fp}oss-source.repo" <<EOF
[openSUSE:repo-oss-source]
${_n}repo-oss-source (${_rvb})
$_e0
$_ar1
${_bu}${__u3}source/distribution/leap/${_rvb}/repo/oss
${_gk}${__u3}source/distribution/leap/${_rvb}/repo/oss/${__s}
EOF
            ;;
        15)
            local _fp='repo-'
            case "${2#*.}" in
            [0-2])
                _wz "${_fp}debug-non-oss.repo" <<EOF
[repo-debug-non-oss]
${_n}Debug Repository (Non-OSS)
$_e0
$_ar1
${__u2}debug/distribution/leap/$_rv/repo/non-oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}debug.repo" <<EOF
[repo-debug]
${_n}Debug Repository
$_e0
$_ar1
${__u2}debug/distribution/leap/$_rv/repo/oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}debug-update-non-oss.repo" <<EOF
[repo-debug-update-non-oss]
${_n}Update Repository (Debug, Non-OSS)
$_e0
$_ar1
${__u2}debug/update/leap/$_rv/non-oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}debug-update.repo" <<EOF
[repo-debug-update]
${_n}Update Repository (Debug)
$_e0
$_ar1
${__u2}debug/update/leap/$_rv/oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}non-oss.repo" <<EOF
[repo-non-oss]
${_n}Non-OSS Repository
$_e1
$_ar1
${__u2}distribution/leap/$_rv/repo/non-oss/
$_tym
$_kp0
EOF
                _wz "${_fp}oss.repo" <<EOF
[repo-oss]
${_n}Main Repository
$_e1
$_ar1
${__u2}distribution/leap/$_rv/repo/oss/
$_tym
$_kp0
EOF
                _wz "${_fp}source-non-oss.repo" <<EOF
[repo-source-non-oss]
${_n}Source Repository (Non-OSS)
$_e0
$_ar1
${__u2}source/distribution/leap/$_rv/repo/non-oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}source.repo" <<EOF
[repo-source]
${_n}Source Repository
$_e0
$_ar1
${__u2}source/distribution/leap/$_rv/repo/oss/
$_tyN
$_kp0
EOF
                _wz "${_fp}update-non-oss.repo" <<EOF
[repo-update-non-oss]
${_n}Update Repository (Non-Oss)
$_e1
$_ar1
${__u2}update/leap/$_rv/non-oss/
$_tym
$_kp0
EOF
                _wz "${_fp}update.repo" <<EOF
[repo-update]
${_n}Main Update Repository
$_e1
$_ar1
${__u2}update/leap/$_rv/oss/
$_tym
$_kp0
EOF
                ;;
            *)
                local _fp='repo-'
                _wz "${_fp}backports-debug-update.repo" <<EOF
[repo-backports-debug-update]
${_n}Update repository with updates for openSUSE Leap debuginfo packages from openSUSE Backports
$_e0
$_ar1
${__u2}update/leap/$_rv/backports_debug/
$_tyN
$_kp0
EOF
                _wz "${_fp}backports-update.repo" <<EOF
[repo-backports-update]
${_n}Update repository of openSUSE Backports
$_e1
$_ar1
${__u2}update/leap/$_rv/backports/
path=/
$_tym
$_kp0
EOF
                _wz "${_fp}debug-non-oss.repo" <<EOF
[repo-debug-non-oss]
${_n}Debug Repository (Non-OSS)
$_e0
$_ar1
${__u2}debug/distribution/leap/$_rv/repo/non-oss/
$_kp0
EOF
                _wz "${_fp}debug.repo" <<EOF
[repo-debug]
${_n}Debug Repository
$_e0
$_ar1
${__u2}debug/distribution/leap/$_rv/repo/oss/
$_kp0
EOF
                _wz "${_fp}debug-update-non-oss.repo" <<EOF
[repo-debug-update-non-oss]
${_n}Update Repository (Debug, Non-OSS)
$_e0
$_ar1
${__u2}debug/update/leap/$_rv/non-oss/
$_kp0
EOF
                _wz "${_fp}debug-update.repo" <<EOF
[repo-debug-update]
${_n}Update Repository (Debug)
$_e0
$_ar1
${__u2}debug/update/leap/$_rv/oss/
$_kp0
EOF
                _wz "${_fp}non-oss.repo" <<EOF
[repo-non-oss]
${_n}Non-OSS Repository
$_e1
$_ar1
${__u2}distribution/leap/$_rv/repo/non-oss/
$_tym
$_kp0
EOF
                _wz "${_fp}openh264.repo" <<EOF
[repo-openh264]
${_n}Open H.264 Codec (openSUSE Leap)
$_e1
$_ar1
${__u1}openh264/openSUSE_Leap/
$_tym
$_kp0
EOF
                _wz "${_fp}oss.repo" <<EOF
[repo-oss]
${_n}Main Repository
$_e1
$_ar1
${__u2}distribution/leap/$_rv/repo/oss/
$_tym
$_kp0
EOF
                _wz "${_fp}sle-debug-update.repo" <<EOF
[repo-sle-debug-update]
${_n}Update repository with debuginfo for updates from SUSE Linux Enterprise 15
$_e0
$_ar1
${__u2}debug/update/leap/$_rv/sle/
path=/
$_tym
$_kp0
EOF
                _wz "${_fp}sle-update.repo" <<EOF
[repo-sle-update]
${_n}Update repository with updates from SUSE Linux Enterprise 15
$_e1
$_ar1
${__u2}update/leap/$_rv/sle/
path=/
$_tym
$_kp0
EOF
                _wz "${_fp}source.repo" <<EOF
[repo-source]
${_n}Source Repository
$_e0
$_ar1
${__u2}source/distribution/leap/$_rv/repo/oss/
$_kp0
EOF
                _wz "${_fp}update-non-oss.repo" <<EOF
[repo-update-non-oss]
${_n}Update Repository (Non-Oss)
$_e1
$_ar1
${__u2}update/leap/$_rv/non-oss/
$_tym
$_kp0
EOF
                _wz "${_fp}update.repo" <<EOF
[repo-update]
${_n}Main Update Repository
$_e1
$_ar1
${__u2}update/leap/$_rv/oss/
$_tym
$_kp0
EOF
                ;;
            esac
            ;;
        esac
        ;;
    "tumbleweed")
        local _fp='repo-'
        _wz "${_fp}debug.repo" <<EOF
[repo-debug]
${_n}openSUSE-Tumbleweed-Debug
$_e0
$_ar1
${__u2}debug/tumbleweed/repo/oss/
path=/
$_kp0
EOF
        _wz "${_fp}non-oss.repo" <<EOF
[repo-non-oss]
${_n}openSUSE-Tumbleweed-Non-Oss
$_e1
$_ar1
${__u2}tumbleweed/repo/non-oss/
path=/
$_tym
$_kp0
EOF
        _wz "${_fp}openh264.repo" <<EOF
[repo-openh264]
${_n}Open H.264 Codec (openSUSE Tumbleweed)
$_e1
$_ar1
${__u1}openh264/openSUSE_Tumbleweed
path=/
$_tym
$_kp0
EOF
        _wz "${_fp}oss.repo" <<EOF
[repo-oss]
${_n}openSUSE-Tumbleweed-Oss
$_e1
$_ar1
${__u2}tumbleweed/repo/oss/
path=/
$_tym
$_kp0
EOF
        _wz "${_fp}source.repo" <<EOF
[repo-source]
${_n}openSUSE-Tumbleweed-Source
$_e0
$_ar1
${__u2}source/tumbleweed/repo/oss/
path=/
$_kp0
EOF
        _wz "${_fp}update.repo" <<EOF
[repo-update]
${_n}openSUSE-Tumbleweed-Update
$_e1
$_ar1
${__u2}update/tumbleweed/
path=/
$_tym
$_kp0
EOF
        ;;
    esac
}

## 生成 EPEL 附加软件包 repo 源文件
function gen_repo_files_EPEL() {
    local __s3='Extra Packages for Enterprise Linux '
    local __s2='source/tree/'
    local __s1='/Everything/'
    local __u1="${_bu}https://download.example/pub/epel/"
    local __u2="${_mt}https://mirrors.fedoraproject.org/metalink?"
    local __n="${_n}${__s3}$_rv - "
    case "${1}" in
    10)
        local _m24="${_me}24h"
        local __k1="${_gk}${_pki}"'EPEL-$releasever_major'
        _w epel.repo <<EOF
[epel]
${__n}$_ba
#${__u1}$_rv\${releasever_minor:+z}${__s1}$_ba/
${__u2}repo=epel\${releasever_minor:+-z}-$_rv&arch=$_ba
$__k1
$_gc1
$_rg0
$_m24
$_cm1
$_e1

[epel-debuginfo]
${__n}$_ba - Debug
#${__u1}$_rv\${releasever_minor:+z}${__s1}$_ba/debug/
${__u2}repo=epel\${releasever_minor:+-z}-debug-$_rv&arch=$_ba
$__k1
$_gc1
$_rg0
$_m24
$_e0

[epel-source]
${__n}$_ba - Source
#${__u1}$_rv\${releasever_minor:+z}${__s1}${__s2}
${__u2}repo=epel\${releasever_minor:+-z}-source-$_rv&arch=source
$__k1
$_gc1
$_rg0
$_m24
$_e0
EOF
        _w epel-testing.repo <<EOF
[epel-testing]
${__n}Testing - $_ba
#${__u1}testing/$_rv\${releasever_minor:+z}${__s1}$_ba/
${__u2}repo=epel\${releasever_minor:+-z}-testing-$_rv&arch=$_ba
$__k1
$_gc1
$_rg0
$_m24
$_cm1
$_e0

[epel-testing-debuginfo]
${__n}Testing - $_ba - Debug
#${__u1}testing/$_rv\${releasever_minor:+z}${__s1}$_ba/debug/
${__u2}repo=epel\${releasever_minor:+-z}-testing-debug-$_rv&arch=$_ba
$__k1
$_gc1
$_rg0
$_m24
$_e0

[epel-testing-source]
${__n}Testing - $_ba - Source
#${__u1}testing/$_rv\${releasever_minor:+z}${__s1}${__s2}
${__u2}repo=epel\${releasever_minor:+-z}-testing-source-$_rv&arch=source
$__k1
$_gc1
$_rg0
$_m24
$_e0
EOF
        ;;
    9)
        local _m14="${_me}14d"
        local _tyr="${_ty}rpm"
        local __k2="${_gk}${_pki}EPEL-$_rv"
        _w epel.repo <<EOF
[epel]
${__n}$_ba
#${__u1}$_rv${__s1}$_ba/
${__u2}repo=epel-$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e1
$_gc1
$_cm1
$__k2

[epel-debuginfo]
${__n}$_ba - Debug
#${__u1}$_rv${__s1}$_ba/debug/
${__u2}repo=epel-debug-$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e0
$__k2
$_gc1

[epel-source]
${__n}$_ba - Source
#${__u1}$_rv${__s1}${__s2}
${__u2}repo=epel-source-$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e0
$__k2
$_gc1
EOF
        _w epel-testing.repo <<EOF
[epel-testing]
${__n}Testing - $_ba
#${__u1}testing/$_rv${__s1}$_ba/
${__u2}repo=testing-epel$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e0
$_gc1
$_cm1
$__k2

[epel-testing-debuginfo]
${__n}Testing - $_ba - Debug
#${__u1}testing/$_rv${__s1}$_ba/debug/
${__u2}repo=testing-debug-epel$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e0
$__k2
$_gc1

[epel-testing-source]
${__n}Testing - $_ba - Source
#${__u1}testing/$_rv${__s1}${__s2}
${__u2}repo=testing-source-epel$_rv&arch=$_ba&infra=$_if&content=$_ctd
$_e0
$__k2
$_gc1
EOF
        ## 此仓库特殊，默认不启用
        _w epel-cisco-openh264.repo <<EOF
[epel-cisco-openh264]
${_n}${__s3}$_rv openh264 (From Cisco) - $_ba
${__u2}repo=epel-cisco-openh264-$_rv&arch=$_ba
$_tyr
$_e0
$_m14
$_rg0
$_gc1
$__k2
$_suT

[epel-cisco-openh264-debuginfo]
${_n}${__s3}$_rv openh264 (From Cisco) - $_ba - Debug
${__u2}repo=epel-cisco-openh264-debug-$_rv&arch=$_ba
$_tyr
$_e0
$_m14
$_rg0
$_gc1
$__k2
$_suT

[epel-cisco-openh264-source]
${_n}${__s3}$_rv openh264 (From Cisco) - $_ba - Source
${__u2}repo=epel-cisco-openh264-source-$_rv&arch=$_ba
$_tyr
$_e0
$_m14
$_rg0
$_gc1
$__k2
$_suT
EOF
        ;;
    8)
        local __k3="${_gk}${_pki}EPEL-8"
        local __f='&arch=$basearch&infra=$infra&content=$contentdir'
        _w epel.repo <<EOF
[epel]
${_n}${__s3}8 - $_ba
#${__u1}8${__s1}$_ba
${__u2}repo=epel-8${__f}
$_e1
$_gc1
$_cm1
$__k3

[epel-debuginfo]
${_n}${__s3}8 - $_ba - Debug
#${__u1}8${__s1}$_ba/debug
${__u2}repo=epel-debug-8${__f}
$_e0
$__k3
$_gc1

[epel-source]
${_n}${__s3}8 - $_ba - Source
#${__u1}8${__s1}${__s2}
${__u2}repo=epel-source-8${__f}
$_e0
$__k3
$_gc1
EOF
        _w epel-testing.repo <<EOF
[epel-testing]
${_n}${__s3}8 - Testing - $_ba
#${__u1}testing/8${__s1}$_ba
${__u2}repo=testing-epel8${__f}
$_e0
$_gc1
$_cm1
$__k3

[epel-testing-debuginfo]
${_n}${__s3}8 - Testing - $_ba - Debug
#${__u1}testing/8${__s1}$_ba/debug
${__u2}repo=testing-debug-epel8${__f}
$_e0
$__k3
$_gc1

[epel-testing-source]
${_n}${__s3}8 - Testing - $_ba - Source
#${__u1}testing/8${__s1}${__s2}
${__u2}repo=testing-source-epel8${__f}
$_e0
$__k3
$_gc1
EOF
        _w epel-modular.repo <<EOF
[epel-modular]
${_n}${__s3}Modular 8 - $_ba - RETIRED
#${__u1}8/Modular/$_ba
${__u2}repo=epel-modular-8${__f}
$_e0
$_gc1
$_cm1
$__k3

[epel-modular-debuginfo]
${_n}${__s3}Modular 8 - $_ba - Debug - RETIRED
#${__u1}8/Modular/$_ba/debug
${__u2}repo=epel-modular-debug-8${__f}
$_e0
$__k3
$_gc1

[epel-modular-source]
${_n}${__s3}Modular 8 - $_ba - Source - RETIRED
#${__u1}8/Modular/${__s2}
${__u2}repo=epel-modular-source-8${__f}
$_e0
$__k3
$_gc1
EOF
        _w epel-testing-modular.repo <<EOF
[epel-testing-modular]
${_n}${__s3}Modular 8 - Testing - $_ba - RETIRED
#${__u1}testing/8/Modular/$_ba
${__u2}repo=testing-modular-epel8${__f}
$_e0
$_gc1
$_cm1
$__k3

[epel-testing-modular-debuginfo]
${_n}${__s3}Modular 8 - Testing - $_ba - Debug - RETIRED
#${__u1}testing/8/Modular/$_ba/debug
${__u2}repo=testing-modular-debug-epel8${__f}
$_e0
$__k3
$_gc1

[epel-testing-modular-source]
${_n}${__s3}Modular 8 - Testing - $_ba - Source - RETIRED
#${__u1}testing/8/Modular/${__s2}
${__u2}repo=testing-modular-source-epel8${__f}
$_e0
$__k3
$_gc1
EOF
        ;;
    7)
        local _fm='failovermethod='
        local _fop="${_fm}priority"
        local __u3="${_bu}http://download.example/pub/epel/"
        local __k4="${_gk}${_pki}EPEL-7"
        local __f='&arch=$basearch&infra=$infra&content=$contentdir'
        _w epel.repo <<EOF
[epel]
${_n}${__s3}7 - $_ba
#${__u3}7/$_ba
${__u2}repo=epel-7${__f}
$_fop
$_e1
$_gc1
$__k4

[epel-debuginfo]
${_n}${__s3}7 - $_ba - Debug
#${__u3}7/$_ba/debug
${__u2}repo=epel-debug-7${__f}
$_fop
$_e0
$__k4
$_gc1

[epel-source]
${_n}${__s3}7 - $_ba - Source
#${__u3}7/${__s2}
${__u2}repo=epel-source-7${__f}
$_fop
$_e0
$__k4
$_gc1
EOF
        _w epel-testing.repo <<EOF
[epel-testing]
${_n}${__s3}7 - Testing - $_ba
#${__u3}testing/7/$_ba
${__u2}repo=testing-epel7${__f}
$_fop
$_e0
$_gc1
$__k4

[epel-testing-debuginfo]
${_n}${__s3}7 - Testing - $_ba - Debug
#${__u3}testing/7/$_ba/debug
${__u2}repo=testing-debug-epel7${__f}
$_fop
$_e0
$__k4
$_gc1

[epel-testing-source]
${_n}${__s3}7 - Testing - $_ba - Source
#${__u3}testing/7/${__s2}
${__u2}repo=testing-source-epel7${__f}
$_fop
$_e0
$__k4
$_gc1
EOF
        ;;
    esac
}

## 生成 EPEL 附加软件包 NEXT repo 源文件
function gen_repo_files_EPEL_NEXT() {
    case "${1}" in
    9)
        local __s3='Extra Packages for Enterprise Linux '
        local __s2='source/tree/'
        local __s1='/Everything/'
        local __u1="${_bu}https://download.example/pub/epel/"
        local __u2="${_mt}https://mirrors.fedoraproject.org/metalink?"
        local __k="${_gk}${_pki}EPEL-9"
        local __f='&arch=$basearch&infra=$infra&content=$contentdir'
        _w epel-next.repo <<EOF
[epel-next]
${_n}${__s3}9 - Next - $_ba
#${__u1}next/9${__s1}$_ba/
${__u2}repo=epel-next-9${__f}
$_e1
$_gc1
$_cm1
$__k

[epel-next-debuginfo]
${_n}${__s3}9 - Next - $_ba - Debug
#${__u1}next/9${__s1}$_ba/debug/
${__u2}repo=epel-next-debug-9${__f}
$_e0
$__k
$_gc1

[epel-next-source]
${_n}${__s3}9 - Next - $_ba - Source
#${__u1}next/9${__s1}${__s2}
${__u2}repo=epel-next-source-9${__f}
$_e0
$__k
$_gc1
EOF
        _w epel-next-testing.repo <<EOF
[epel-next-testing]
${_n}${__s3}9 - Next - Testing - $_ba
#${__u1}testing/next/9${__s1}$_ba/
${__u2}repo=epel-testing-next-9${__f}
$_e0
$_gc1
$_cm1
$__k

[epel-next-testing-debuginfo]
${_n}${__s3}9 - Next - Testing - $_ba - Debug
#${__u1}testing/next/9${__s1}$_ba/debug/
${__u2}repo=epel-testing-next-debug-9${__f}
$_e0
$__k
$_gc1

[epel-next-testing-source]
${_n}${__s3}9 - Next - Testing - $_ba - Source
#${__u1}testing/next/9${__s1}${__s2}
${__u2}repo=epel-testing-next-source-9${__f}
$_e0
$__k
$_gc1
EOF
        ;;
    esac
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
        ['start.welcome']='  GNU/Linux mirror switching script'
        ['start.runtimeEnv']='Runtime Env'
        ['start.dateTime']='System Time'
        ['end.moreInfo']='Script execution completed, visit our website for more tutorials'
        ['end.sponsorAds']='[Sponsor Ads]'
        ['error.cmd.options.needConfirm']='Please confirm and re-enter'
        ['error.cmd.options.needSpecify']='Please specify {} after this option'
        ['error.cmd.options.invalid']='Command option {} is invalid, {}!'
        ['error.cmd.options.validAddress']='a valid address'
        ['error.cmd.options.sourceAddress']='mirror address'
        ['error.cmd.options.sourceRepository']='mirror repository'
        ['error.cmd.options.codename']='version codename'
        ['error.cmd.options.boolean']=' true or false '
        ['error.cmd.options.protocol']=' http or https '
        ['error.cmd.options.needProtocol']=' Web protocol(http/https)'
        ['error.cmd.options.validLangKey']='A valid language ID '
        ['error.cmd.options.langKey']='language ID '
        ['error.cmd.options.unsupportTwoSourceMode']='Two mirror modes cannot be used at the same time. Please retry!'
        ['error.cmd.options.unsupportCodename']='The current system does not support specifying a codename. Please retry!'
        ['error.cmd.options.unsupportEPEL']='The current system cannot install the EPEL add-on package. Please retry!'
        ['error.unsupportSystem']='The operating system ({}) is not supported. Check the supported list on the website!'
        ['error.unsupportVersion']='The current system version is not supported'
        ['error.unknownSystem']='Unknown system'
        ['error.unknownVersion']='System version unknown'
        ['error.input']='Input error, {}!'
        ['error.needRoot']='Insufficient privileges, please run this script as root. Switch command: {}'
        ['error.defaultBehavior.https']='HTTPS is used by default'
        ['error.defaultBehavior.noReplace']='No replacement by default'
        ['error.defaultBehavior.noOverwrite']='No overwrite by default'
        ['error.defaultBehavior.noUpdate']='No update by default'
        ['error.defaultBehavior.noClean']='No cleanup by default'
        ['error.defaultBehavior.noUseIntranetSource']='Intranet mirrors are disabled by default'
        ['warn.usedIntranetSource']='Switched to an intranet-only mirror. Use only in the intended environment!'
        ['warn.unstableDebian']='Detected system version {} which may cause unpredictable issues.'
        ['warn.EPEL7']='Extra Packages for Enterprise Linux 7 reached end-of-life and was moved to the archive!'
        ['warn.needValidNumberIndex']='Please enter a valid number index!'
        ['warn.needInputNumberIndex']='Please enter a number index!'
        ['info.backuped.sourceFile']='Backed up existing {} source file'
        ['tip.EPEL7']="Some mirrors don't sync that archive. If errors occur, verify the target mirror provides it."
        ['interaction.source.type.public']='Public'
        ['interaction.source.type.intranet']='Intranet'
        ['interaction.source.type.select']='Please select network address (access method) for mirror:'
        ['interaction.source.type.usePublicAddress']='Use public network address for mirror by default, continue'
        ['interaction.source.select']='Please select the mirror you want to use:'
        ['interaction.source.selectAndInput']='Please select and enter the mirror you want to use'
        ['interaction.protocol.select']='Please select network protocol for mirror:'
        ['interaction.protocol.useHttp']='Use HTTP protocol for mirror'
        ['interaction.epel.skipReplace']='EPEL already installed. Replace/overwrite mirror'
        ['interaction.epel.install']='Install EPEL add-on package'
        ['interaction.backup.skipOverwrite.sourceFile']='A backup of {} already exists. Skip overwriting'
        ['interaction.upgrade.skip']='Skip upgrading packages'
        ['interaction.cache.autoClean']='Clean download cache after upgrading packages'
        ['interaction.common.tip']='Tip'
        ['interaction.common.operationCanceled']='Operation canceled'
        ['interaction.common.yes']='Yes'
        ['interaction.common.no']='No'
        ['work.upgradeSoftware']='Upgrading packages'
        ['work.installEPELPackage']='Installing epel-release package...'
        ['source.sync.text1']='Update APT package index'
        ['source.sync.text2']='Generate mirror cache'
        ['source.sync.text3']='Refreshing mirrors'
        ['source.sync.text4']='Synchronizing mirrors'
        ['source.sync.text5']='Updating binary cache and channels'
        ['source.comment.disabledSourceCode']='Source code mirrors are disabled by default for speed. Uncomment to enable'
        ['source.comment.securitySource']='Security updates'
        ['source.comment.proposedSource']='Proposed repository (not recommended)'
        ['source.changeResult.success']='Mirror switching complete'
        ['source.changeResult.fail']='Mirror switching complete, but {} failed'
        ['source.changeResult.tipTitle']='Run the script again with the same mirror. If {} still fails, consider:'
        ['source.changeResult.tip1']='Connectivity issues: unstable network, blocked access, or mirror-side firewall rules'
        ['source.changeResult.tip2']='Mirror issues: test the mirror manually at {}'
        ['source.changeResult.tip2.1']='If a file is missing, the mirror might still be syncing'
        ['source.changeResult.tip2.2']='If a path is missing, the mirror may not provide this system repository'
        ['source.changeResult.tip2.3']='Try another mirror. Syncing mirrors may temporarily serve broken content'
        ['source.changeResult.tip3']='Original mirrors failing: fix unrelated mirror errors and rerun the script'
        ['commands.help']='Command options(name/meaning/value):

  --source                     Specify mirror address (domain or IP)                                        address
  --source-epel                Specify EPEL repository address (domain or IP)                               address
  --source-security            Specify Debian/Ubuntu security repo address (domain or IP)                   address
  --source-vault               Specify CentOS/AlmaLinux vault repo address (domain or IP)                   address
  --source-portage             Specify Gentoo portage repo address (domain or IP)                           address
  --source-base-system         Specify Linux Mint/Raspberry Pi OS base system repo address (domain or IP)   address
  --branch                     Specify mirror repository (repo name)                                        repo name
  --branch-epel                Specify EPEL repository (path)                                               repo name
  --branch-security            Specify Debian security repo (path)                                          repo name
  --branch-vault               Specify CentOS/AlmaLinux vault repo (path)                                   repo name
  --branch-portage             Specify Gentoo portage repo (path)                                           repo name
  --branch-base-system         Specify Linux Mint/Raspberry Pi OS base system repo (path)                   repo name
  --codename                   Specify Debian/openKylin codename                                            codename
  --protocol                   Specify web protocol                                                         http or https
  --use-official-source        Use official mirror of target OS                                             true or false
  --use-official-source-epel   Use official EPEL repo                                                       true or false
  --install-epel               Install EPEL repository                                                      true or false
  --backup                     Backup original mirrors                                                      true or false
  --upgrade-software           Upgrade packages                                                             true or false
  --clean-cache                Clean cache after upgrade                                                    true or false
  --clean-screen               Clear screen before running                                                  true or false
  --only-epel                  Only switch EPEL repo                                                        none
  --print-diff                 Print diff before and after modification                                     none
  --pure-mode                  Pure mode, minimal output                                                    none
  --help                       Show help menu                                                               none

Issue Report {}'
    )
}

##############################################################################

init_msg_pack
handle_command_options "$@"
main
