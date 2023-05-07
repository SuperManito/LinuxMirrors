#!/bin/bash
## Author: SuperManito
## Modified: 2023-05-07
## 中国教育网专用

## 指定软件源地址和分支（字符串）
SOURCE=""
SOURCE_BRANCH=""
## 指定 debian-security 软件源地址和分支（字符串）
SOURCE_SECURITY=""
SOURCE_BRANCH_SECURITY=""
## 指定 centos-vault 软件源地址和分支（字符串）
SOURCE_VAULT=""
SOURCE_BRANCH_VAULT=""
## WEB 协议（http/https）
WEB_PROTOCOL=""
## 安装 EPEL 附加软件包（true/false）
ONLY_EPEL=""
INSTALL_EPEL=""
## 备份原有软件源（true/false）
BACKUP=""
## 忽略覆盖备份提示（true/false）
IGNORE_BACKUP_TIPS=""

## 软件源列表
mirror_list_default=(
    "清华大学@mirrors.tuna.tsinghua.edu.cn"
    "北京交通大学@mirror.bjtu.edu.cn"
    "北京外国语大学@mirrors.bfsu.edu.cn"
    "齐鲁工业大学@mirrors.qlu.edu.cn"
    "中国科学技术大学@mirrors.ustc.edu.cn"
    "南京大学@mirrors.nju.edu.cn"
    "上海交通大学@mirror.sjtu.edu.cn"
    "吉林大学@mirrors.jlu.edu.cn"
    "重庆大学@mirrors.cqu.edu.cn"
    "哈尔滨工业大学@mirrors.hit.edu.cn"
    "ISCAS@mirror.iscas.ac.cn"
    "山东大学@mirrors.sdu.edu.cn"
    "南方科技大学@mirrors.sustech.edu.cn"
    "大连东软信息学院@mirrors.neusoft.edu.cn"
    "兰州大学@mirror.lzu.edu.cn"
    "南京邮电大学@mirrors.njupt.edu.cn"
    "西北农林科技大学@mirrors.nwafu.edu.cn"
    "南阳理工学院@mirror.nyist.edu.cn"
    "北京大学@mirrors.pku.edu.cn"
    "上海科技大学@mirrors.shanghaitech.edu.cn"
    "电子科技大学@mirrors.uestc.cn"
    "武昌首义学院@mirrors.wsyu.edu.cn"
    "浙江大学@mirrors.zju.edu.cn"
)

##############################################################################

## 定义系统判定变量
SYSTEM_DEBIAN="Debian"
SYSTEM_UBUNTU="Ubuntu"
SYSTEM_KALI="Kali"
SYSTEM_REDHAT="RedHat"
SYSTEM_RHEL="Red Hat Enterprise Linux"
SYSTEM_CENTOS="CentOS"
SYSTEM_CENTOS_STREAM="CentOS Stream"
SYSTEM_ROCKY="Rocky"
SYSTEM_ALMA="AlmaLinux"
SYSTEM_FEDORA="Fedora"
SYSTEM_OPENEULER="openEuler"
SYSTEM_OPENSUSE="openSUSE"
SYSTEM_ARCH="Arch"

## 定义目录和文件
File_LinuxRelease=/etc/os-release
File_RedHatRelease=/etc/redhat-release
File_openEulerRelease=/etc/openEuler-release
File_ArchRelease=/etc/arch-release
File_DebianVersion=/etc/debian_version
File_DebianSourceList=/etc/apt/sources.list
File_DebianSourceListBackup=/etc/apt/sources.list.bak
Dir_DebianExtendSource=/etc/apt/sources.list.d
Dir_DebianExtendSourceBackup=/etc/apt/sources.list.d.bak
File_ArchMirrorList=/etc/pacman.d/mirrorlist
File_ArchMirrorListBackup=/etc/pacman.d/mirrorlist.bak
Dir_RedHatRepos=/etc/yum.repos.d
Dir_RedHatReposBackup=/etc/yum.repos.d.bak
Dir_openEulerRepos=/etc/yum.repos.d
Dir_openEulerReposBackup=/etc/yum.repos.d.bak
Dir_openSUSERepos=/etc/zypp/repos.d
Dir_openSUSEReposBackup=/etc/zypp/repos.d.bak

## 定义颜色变量
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PLAIN='\033[0m'
BOLD='\033[1m'
SUCCESS='[\033[32mOK\033[0m]'
COMPLETE='[\033[32mDONE\033[0m]'
WARN='[\033[33mWARN\033[0m]'
ERROR='[\033[31mERROR\033[0m]'
WORKING='[\033[34m*\033[0m]'

function StartTitle() {
    [ -z "${SOURCE}" ] && clear
    echo -e ' 校园网联合镜像站一键换源脚本 - Powered by linuxmirrors.cn'
}

## 报错退出
function Output_Error() {
    [ "$1" ] && echo -e "\n$ERROR $1\n"
    exit 1
}

## 权限判定
function PermissionJudgment() {
    if [ $UID -ne 0 ]; then
        Output_Error "权限不足，请使用 Root 用户运行本脚本"
    fi
}

## 命令选项兼容性判断
function CheckCommandOptions() {
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_DEBIAN}" ]]; then
            if [[ "${SOURCE_SECURITY}" == "true" || "${SOURCE_BRANCH_SECURITY}" == "true" ]]; then
                Output_Error "当前系统不支持使用 debian-security 仓库故无法使用相关参数，请确认后重试！"
            fi
        fi
        if [[ "${INSTALL_EPEL}" == "true" || "${ONLY_EPEL}" == "true" ]]; then
            Output_Error "当前系统不支持安装 EPEL 附件软件包故无法使用相关参数，请确认后重试！"
        fi
        ;;
    "${SYSTEM_REDHAT}")
        if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_CENTOS}" && "${SYSTEM_JUDGMENT}" != "${SYSTEM_RHEL}" ]]; then
            if [[ "${SOURCE_VAULT}" == "true" || "${SOURCE_BRANCH_VAULT}" == "true" ]]; then
                Output_Error "当前系统不支持使用 centos-vault 仓库故无法使用相关参数，请确认后重试！"
            fi
        fi
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_FEDORA}")
            if [[ "${INSTALL_EPEL}" == "true" || "${ONLY_EPEL}" == "true" ]]; then
                Output_Error "当前系统不支持安装 EPEL 附件软件包故无法使用相关参数，请确认后重试！"
            fi
            ;;
        esac
        ;;
    "${SYSTEM_OPENEULER}")
        if [[ "${INSTALL_EPEL}" == "true" || "${ONLY_EPEL}" == "true" ]]; then
            Output_Error "当前系统不支持安装 EPEL 附件软件包故无法使用相关参数，请确认后重试！"
        fi
        ;;
    "${SYSTEM_OPENSUSE}")
        if [[ "${INSTALL_EPEL}" == "true" || "${ONLY_EPEL}" == "true" ]]; then
            Output_Error "当前系统不支持安装 EPEL 附件软件包故无法使用相关参数，请确认后重试！"
        fi
        ;;
    "${SYSTEM_ARCH}")
        if [[ "${INSTALL_EPEL}" == "true" || "${ONLY_EPEL}" == "true" ]]; then
            Output_Error "当前系统不支持安装 EPEL 附件软件包故无法使用相关参数，请确认后重试！"
        fi
        ;;
    esac

}

## 系统判定变量
function EnvJudgment() {
    ## 定义系统名称
    SYSTEM_NAME="$(cat $File_LinuxRelease | grep -E "^NAME=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    cat $File_LinuxRelease | grep "PRETTY_NAME=" -q
    [ $? -eq 0 ] && SYSTEM_PRETTY_NAME="$(cat $File_LinuxRelease | grep -E "^PRETTY_NAME=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    ## 定义系统版本号
    SYSTEM_VERSION_NUMBER="$(cat $File_LinuxRelease | grep -E "^VERSION_ID=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    ## 定义系统ID
    SYSTEM_ID="$(cat $File_LinuxRelease | grep -E "^ID=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")"
    ## 判定当前系统派系（Debian/RedHat/openEuler/openSUSE）
    if [ -s $File_RedHatRelease ]; then
        SYSTEM_FACTIONS="${SYSTEM_REDHAT}"
    elif [ -s $File_DebianVersion ]; then
        SYSTEM_FACTIONS="${SYSTEM_DEBIAN}"
    elif [ -s $File_openEulerRelease ]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENEULER}"
    elif [ -f $File_ArchRelease ]; then
        SYSTEM_FACTIONS="${SYSTEM_ARCH}"
    elif [[ "${SYSTEM_NAME}" == *"openSUSE"* ]]; then
        SYSTEM_FACTIONS="${SYSTEM_OPENSUSE}"
    else
        Output_Error "无法判断当前运行环境，请先确认本脚本是否已经适配当前操作系统"
    fi
    ## 判定系统名称、版本、版本号
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        if [ ! -x /usr/bin/lsb_release ]; then
            apt-get install -y lsb-release
            if [ $? -ne 0 ]; then
                Output_Error "lsb-release 软件包安装失败\n本脚本需要通过 lsb_release 指令判断系统类型，当前可能为精简安装的系统，因为正常情况下系统会自带该软件包，请自行安装后重新执行脚本！"
            fi
        fi
        SYSTEM_JUDGMENT="$(lsb_release -is)"
        SYSTEM_VERSION_CODENAME="$(lsb_release -cs)"
        ;;
    "${SYSTEM_REDHAT}")
        SYSTEM_JUDGMENT="$(cat $File_RedHatRelease | awk -F ' ' '{printf$1}')"
        ## Red Hat Enterprise Linux
        cat $File_RedHatRelease | grep -q "${SYSTEM_RHEL}"
        [ $? -eq 0 ] && SYSTEM_JUDGMENT="${SYSTEM_RHEL}"
        ## CentOS Stream
        cat $File_RedHatRelease | grep -q "${SYSTEM_CENTOS_STREAM}"
        [ $? -eq 0 ] && SYSTEM_JUDGMENT="${SYSTEM_CENTOS_STREAM}"
        ;;
    "${SYSTEM_OPENEULER}")
        SYSTEM_JUDGMENT="$(cat $File_openEulerRelease | awk -F ' ' '{printf$1}')"
        ;;
    "${SYSTEM_OPENSUSE}")
        SYSTEM_JUDGMENT="${SYSTEM_OPENSUSE}"
        ;;
    "${SYSTEM_ARCH}")
        SYSTEM_JUDGMENT="${SYSTEM_ARCH}"
        ;;
    esac
    ## 判定系统处理器架构
    case "$(uname -m)" in
    x86_64)
        DEVICE_ARCH="x86_64"
        ;;
    aarch64)
        DEVICE_ARCH="ARM64"
        ;;
    armv7l)
        DEVICE_ARCH="ARMv7"
        ;;
    armv6l)
        DEVICE_ARCH="ARMv6"
        ;;
    i686)
        DEVICE_ARCH="x86_32"
        ;;
    *)
        DEVICE_ARCH="$(uname -m)"
        ;;
    esac
    ## 定义软件源分支名称
    if [[ -z "${SOURCE_BRANCH}" ]]; then
        ## 默认
        SOURCE_BRANCH="$(echo "${SYSTEM_JUDGMENT,,}" | sed "s/ /-/g")"
        ## 处理特殊
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_RHEL}")
            case ${SYSTEM_VERSION_NUMBER:0:1} in
            9)
                SOURCE_BRANCH="rocky"
                ;;
            *)
                SOURCE_BRANCH="centos"
                ;;
            esac
            ;;
        "${SYSTEM_CENTOS}")
            if [[ "${DEVICE_ARCH}" == "x86_64" ]]; then
                SOURCE_BRANCH="centos"
            else
                SOURCE_BRANCH="centos-altarch"
            fi
            ;;
        "${SYSTEM_CENTOS_STREAM}")
            case ${SYSTEM_VERSION_NUMBER:0:1} in
            8)
                if [[ "${DEVICE_ARCH}" == "x86_64" ]]; then
                    SOURCE_BRANCH="centos"
                else
                    SOURCE_BRANCH="centos-altarch"
                fi
                ;;
            *)
                SOURCE_BRANCH="centos-stream"
                ;;
            esac
            ;;
        "${SYSTEM_UBUNTU}")
            if [[ "${DEVICE_ARCH}" == "x86_64" ]] || [[ "${DEVICE_ARCH}" == *i?86* ]]; then
                SOURCE_BRANCH="ubuntu"
            else
                SOURCE_BRANCH="ubuntu-ports"
            fi
            ;;
        "${SYSTEM_ARCH}")
            if [[ "${DEVICE_ARCH}" == "x86_64" ]] || [[ "${DEVICE_ARCH}" == *i?86* ]]; then
                SOURCE_BRANCH="archlinux"
            else
                SOURCE_BRANCH="archlinuxarm"
            fi
            ;;
        esac
    fi
    ## 定义软件源同步/更新文字
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        SYNC_TXT="更新"
        ;;
    *)
        SYNC_TXT="同步"
        ;;
    esac
}

## 选择软件源
function ChooseMirrors() {
    ## 打印软件源列表
    function PrintMirrorsList() {
        local tmp_mirror_name tmp_mirror_url arr_num default_mirror_name_length tmp_mirror_name_length tmp_spaces_nums a i j
        ## 计算字符串长度
        function StringLength() {
            local text=$1
            echo "${#text}"
        }
        echo -e ''

        local list_arr=()
        local list_arr_sum=$(eval echo \${#$1[@]})
        for ((a = 0; a < $list_arr_sum; a++)); do
            list_arr[$a]="$(eval echo \${$1[a]})"
        done
        if [ -x /usr/bin/printf ]; then
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

                printf " ❖  %-$(($default_mirror_name_length + ${tmp_mirror_name_length}))s %4s\n" "${tmp_mirror_name}" "$arr_num)"
            done
        else
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                tmp_mirror_name=$(echo "${list_arr[i]}" | awk -F '@' '{print$1}') # 软件源名称
                tmp_mirror_url=$(echo "${list_arr[i]}" | awk -F '@' '{print$2}')  # 软件源地址
                arr_num=$((i + 1))

                echo -e " ❖  $arr_num. ${tmp_mirror_url} | ${tmp_mirror_name}"
            done
        fi
    }

    function Title() {
        local system_name="${SYSTEM_PRETTY_NAME:-"${SYSTEM_NAME} ${SYSTEM_VERSION_NUMBER}"}"
        local arch=""${DEVICE_ARCH}""
        local date="$(date "+%Y-%m-%d %H:%M:%S")"
        local timezone="$(timedatectl status 2>/dev/null | grep "Time zone" | awk -F ':' '{print$2}' | awk -F ' ' '{print$1}')"

        echo -e ''
        echo -e " 运行环境 ${BLUE}${system_name} ${arch}${PLAIN}"
        echo -e " 系统时间 ${BLUE}${date} ${timezone}${PLAIN}"
    }

    Title
    if [[ -z "${SOURCE}" ]]; then
        local mirror_list_name="mirror_list_default"
        PrintMirrorsList "${mirror_list_name}" 31

        local CHOICE=$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的软件源 [ 1-$(eval echo \${#$mirror_list_name[@]}) ]：${PLAIN}")
        while true; do
            read -p "${CHOICE}" INPUT
            case "${INPUT}" in
            [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
                local tmp_source="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]})"
                if [[ -z "${tmp_source}" ]]; then
                    echo -e "\n$WARN 请输入有效的数字序号！"
                else
                    SOURCE="$(eval echo \${${mirror_list_name}[$(($INPUT - 1))]} | awk -F '@' '{print$2}')"
                    # echo "${SOURCE}"
                    # exit
                    break
                fi
                ;;
            *)
                echo -e "\n$WARN 请输入数字序号以选择你想使用的软件源！"
                ;;
            esac
        done
    fi
}

## 选择同步软件源所使用的 WEB 协议（ HTTP：80 端口，HTTPS：443 端口）
function ChooseWebProtocol() {
    if [[ -z "${WEB_PROTOCOL}" ]]; then
        if [[ "${ONLY_HTTP}" == "True" ]]; then
            WEB_PROTOCOL="http"
        else
            local CHOICE=$(echo -e "\n${BOLD}└─ 软件源是否使用 HTTP 协议? [Y/n] ${PLAIN}")
            read -p "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss])
                WEB_PROTOCOL="http"
                ;;
            [Nn] | [Nn][Oo])
                WEB_PROTOCOL="https"
                ;;
            *)
                echo -e "\n$WARN 输入错误，默认使用 HTTPS 协议！"
                WEB_PROTOCOL="https"
                ;;
            esac
        fi
    fi
    WEB_PROTOCOL="${WEB_PROTOCOL,,}"
}

# 适用于 RHEL/CentOS(Stream)/RockyLinux 的 EPEL 附加软件包（安装/换源）
function ChooseInstallEPEL() {
    function Check() {
        ## 判断是否已安装 EPEL 软件包
        rpm -qa | grep epel-release -q
        VERIFICATION_EPEL=$?
        ## 判断 /etc/yum.repos.d 目录下是否存在 epel 附加软件包 repo 源文件
        [ -d $Dir_RedHatRepos ] && ls $Dir_RedHatRepos | grep epel -q
        VERIFICATION_EPELFILES=$?
        ## 判断 /etc/yum.repos.d.bak 目录下是否存在 epel 附加软件包 repo 源文件
        [ -d $Dir_RedHatReposBackup ] && ls $Dir_RedHatReposBackup | grep epel -q
        VERIFICATION_EPELBACKUPFILES=$?
    }

    if [[ "${SYSTEM_FACTIONS}" == "${SYSTEM_REDHAT}" ]]; then
        if [[ -z "${INSTALL_EPEL}" ]]; then
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_RHEL}" | "${SYSTEM_CENTOS}" | "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMA}")
                Check
                if [ ${VERIFICATION_EPEL} -eq 0 ]; then
                    local CHOICE=$(echo -e "\n${BOLD}└─ 检测到系统已安装 EPEL 附加软件包，是否替换/覆盖软件源? [Y/n] ${PLAIN}")
                else
                    local CHOICE=$(echo -e "\n${BOLD}└─ 是否安装 EPEL 附加软件包? [Y/n] ${PLAIN}")
                fi
                read -p "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss])
                    INSTALL_EPEL="True"
                    ;;
                [Nn] | [Nn][Oo])
                    INSTALL_EPEL="False"
                    ;;
                *)
                    echo -e "\n$WARN 输入错误，默认不更换！"
                    INSTALL_EPEL="False"
                    ;;
                esac
                ;;
            esac
        elif [[ "${INSTALL_EPEL}" == "true" ]]; then
            Check
        fi
    fi
}

## 备份原有软件源
function BackupOriginMirrors() {
    if [[ "${BACKUP}" == "true" ]]; then
        local VERIFICATION_FILES=1
        local VERIFICATION_BACKUPFILES=1

        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            ## 判断 /etc/apt/sources.list.d 目录下是否存在文件
            [ -d $Dir_DebianExtendSource ] && ls $Dir_DebianExtendSource | grep *.list -q
            VERIFICATION_FILES=$?
            ## 判断 /etc/apt/sources.list.d.bak 目录下是否存在文件
            [ -d $Dir_DebianExtendSourceBackup ] && ls $Dir_DebianExtendSourceBackup | grep *.list -q
            VERIFICATION_BACKUPFILES=$?
            ;;
        "${SYSTEM_REDHAT}")
            ## 判断 /etc/yum.repos.d 目录下是否存在文件
            [ -d $Dir_RedHatRepos ] && ls $Dir_RedHatRepos | grep '\.repo$' -q
            VERIFICATION_FILES=$?
            ## 判断 /etc/yum.repos.d.bak 目录下是否存在文件
            [ -d $Dir_RedHatReposBackup ] && ls $Dir_RedHatReposBackup | grep '\.repo$' -q
            VERIFICATION_BACKUPFILES=$?
            ;;
        "${SYSTEM_OPENEULER}")
            ## 判断 /etc/yum.repos.d 目录下是否存在文件
            [ -d $Dir_openEulerRepos ] && ls $Dir_openEulerRepos | grep '\.repo$' -q
            VERIFICATION_FILES=$?
            ## 判断 /etc/yum.repos.d.bak 目录下是否存在文件
            [ -d $Dir_openEulerReposBackup ] && ls $Dir_openEulerReposBackup | grep '\.repo$' -q
            VERIFICATION_BACKUPFILES=$?
            ;;
        "${SYSTEM_OPENSUSE}")
            ## 判断 /etc/zypp/repos.d 目录下是否存在文件
            [ -d $Dir_openSUSERepos ] && ls $Dir_openSUSERepos | grep '\.repo$' -q
            VERIFICATION_FILES=$?
            ## 判断 /etc/zypp/repos.d.bak 目录下是否存在文件
            [ -d $Dir_openSUSEReposBackup ] && ls $Dir_openSUSEReposBackup | grep '\.repo$' -q
            VERIFICATION_BACKUPFILES=$?
            ;;
        esac

        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}")
            ## /etc/apt/sources.list
            if [ -s $File_DebianSourceList ]; then
                if [ -s $File_DebianSourceListBackup ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP1=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的 list 源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP1}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $File_DebianSourceList $File_DebianSourceListBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    echo ''
                    cp -rvf $File_DebianSourceList $File_DebianSourceListBackup 2>&1
                    echo -e "\n$COMPLETE 已备份原有 list 源文件"
                    sleep 1s
                fi
            else
                [ ! -f $File_DebianSourceList ] && touch $File_DebianSourceList
                echo -e ''
            fi

            ## /etc/apt/sources.list.d
            if [ -d $Dir_DebianExtendSource ] && [ ${VERIFICATION_FILES} -eq 0 ]; then
                if [ -d $Dir_DebianExtendSourceBackup ] && [ ${VERIFICATION_BACKUPFILES} -eq 0 ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP2=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的 list 扩展源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP2}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $Dir_DebianExtendSource/* $Dir_DebianExtendSourceBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    [ ! -d $Dir_DebianExtendSourceBackup ] && mkdir -p $Dir_DebianExtendSourceBackup
                    echo ''
                    cp -rvf $Dir_DebianExtendSource/* $Dir_DebianExtendSourceBackup 2>&1
                    echo -e "$COMPLETE 已备份原有 list 扩展源文件"
                    sleep 1s
                fi
            fi
            ;;
        "${SYSTEM_REDHAT}")
            ## /etc/yum.repos.d
            if [ ${VERIFICATION_FILES} -eq 0 ]; then
                if [ -d $Dir_RedHatReposBackup ] && [ ${VERIFICATION_BACKUPFILES} -eq 0 ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP3=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的 repo 源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP3}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $Dir_RedHatRepos/* $Dir_RedHatReposBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    [ ! -d $Dir_RedHatReposBackup ] && mkdir -p $Dir_RedHatReposBackup
                    echo ''
                    cp -vrf $Dir_RedHatRepos/* $Dir_RedHatReposBackup 2>&1
                    echo -e "\n$COMPLETE 已备份原有 repo 源文件"
                    sleep 1s
                fi
            else
                [ -d $Dir_RedHatRepos ] || mkdir -p $Dir_RedHatRepos
            fi
            ;;
        "${SYSTEM_OPENEULER}")
            ## /etc/yum.repos.d
            if [ ${VERIFICATION_FILES} -eq 0 ]; then
                if [ -d $Dir_openEulerReposBackup ] && [ ${VERIFICATION_BACKUPFILES} -eq 0 ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP4=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的 repo 源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP4}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $Dir_openEulerRepos/* $Dir_openEulerReposBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    [ ! -d $Dir_openEulerReposBackup ] && mkdir -p $Dir_openEulerReposBackup
                    echo ''
                    cp -vrf $Dir_openEulerRepos/* $Dir_openEulerReposBackup 2>&1
                    echo -e "\n$COMPLETE 已备份原有 repo 源文件"
                    sleep 1s
                fi
            else
                [ -d $Dir_openEulerRepos ] || mkdir -p $Dir_openEulerRepos
            fi
            ;;
        "${SYSTEM_OPENSUSE}")
            ## /etc/zypp/repos.d
            if [ ${VERIFICATION_FILES} -eq 0 ]; then
                if [ -d $Dir_openSUSEReposBackup ] && [ ${VERIFICATION_BACKUPFILES} -eq 0 ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP4=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的 repo 源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP4}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $Dir_openSUSERepos/* $Dir_openSUSEReposBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    [ ! -d $Dir_openSUSEReposBackup ] && mkdir -p $Dir_openSUSEReposBackup
                    echo ''
                    cp -vrf $Dir_openSUSERepos/* $Dir_openSUSEReposBackup 2>&1
                    echo -e "\n$COMPLETE 已备份原有 repo 源文件"
                    sleep 1s
                fi
            else
                [ -d $Dir_openSUSERepos ] || mkdir -p $Dir_openSUSERepos
            fi
            ;;
        "${SYSTEM_ARCH}")
            ## /etc/pacman.d/mirrorlist
            if [ -s $File_ArchMirrorList ]; then
                if [ -s $File_ArchMirrorListBackup ]; then
                    if [[ "${IGNORE_BACKUP_TIPS}" == "false" ]]; then
                        local CHOICE_BACKUP5=$(echo -e "\n${BOLD}└─ 检测到系统中存在已备份的软件源文件，是否跳过覆盖备份? [Y/n] ${PLAIN}")
                        read -p "${CHOICE_BACKUP5}" INPUT
                        [[ -z "${INPUT}" ]] && INPUT=Y
                        case "${INPUT}" in
                        [Yy] | [Yy][Ee][Ss]) ;;
                        [Nn] | [Nn][Oo])
                            echo ''
                            cp -rvf $File_ArchMirrorList $File_ArchMirrorListBackup 2>&1
                            ;;
                        *)
                            echo -e "\n$WARN 输入错误，默认不覆盖！"
                            ;;
                        esac
                    fi
                else
                    echo ''
                    cp -rvf $File_ArchMirrorList $File_ArchMirrorListBackup 2>&1
                    echo -e "\n$COMPLETE 已备份原有软件源文件"
                    sleep 1s
                fi
            else
                [ ! -f $File_ArchMirrorList ] && touch $File_ArchMirrorList
                echo -e ''
            fi
            ;;
        esac
    fi
}

## 移除原有软件源
function RemoveOriginMirrors() {
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        [ -f $File_DebianSourceList ] && sed -i '1,$d' $File_DebianSourceList
        ;;
    "${SYSTEM_REDHAT}")
        if [ -d $Dir_RedHatRepos ]; then
            # Fedora Linux 特殊，只删除以 fedora 开头的文件
            case "${SYSTEM_JUDGMENT}" in
            "${SYSTEM_FEDORA}")
                rm -rf $Dir_RedHatRepos/fedora*
                ;;
            *)
                if [[ "${ONLY_EPEL}" == "false" ]]; then
                    if [ -f $Dir_RedHatRepos/epel.repo ]; then
                        ls $Dir_RedHatRepos/ | egrep -v epel | xargs rm -rf
                    else
                        rm -rf $Dir_RedHatRepos/*
                    fi
                fi
                ;;
            esac
        fi
        ;;
    "${SYSTEM_OPENEULER}")
        [ -d $Dir_openEulerRepos ] && rm -rf $Dir_openEulerRepos/*
        ;;
    "${SYSTEM_OPENSUSE}")
        [ -d $Dir_openSUSERepos ] && rm -rf $Dir_openSUSERepos/repo-*
        ;;
    "${SYSTEM_ARCH}")
        [ -f $File_ArchMirrorList ] && sed -i '1,$d' $File_ArchMirrorList
        ;;
    esac
}

## 换源
function ChangeMirrors() {
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        DebianMirrors
        ;;
    "${SYSTEM_REDHAT}")
        RedHatMirrors
        ;;
    "${SYSTEM_OPENEULER}")
        openEulerMirrors
        ;;
    "${SYSTEM_OPENSUSE}")
        openSUSEMirrors
        ;;
    "${SYSTEM_ARCH}")
        ArchMirrors
        ;;
    esac
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}")
        echo -e "\n$COMPLETE 软件源更换完毕，请在之后使用 apt-get update 命令${SYNC_TXT}软件源\n"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}")
        echo -e "\n$COMPLETE 软件源更换完毕，请在之后使用 yum makecache 命令${SYNC_TXT}软件源\n"
        ;;
    "${SYSTEM_OPENSUSE}")
        echo -e "\n$COMPLETE 软件源更换完毕，请在之后使用 zypper ref 命令${SYNC_TXT}软件源\n"
        ;;
    "${SYSTEM_ARCH}")
        echo -e "\n$COMPLETE 软件源更换完毕，请在之后使用 pacman -Sy 命令${SYNC_TXT}软件源\n"
        ;;
    esac
}

##############################################################################

## 更换基于 Debian 系 Linux 发行版的软件源
function DebianMirrors() {
    local source_suffix
    local TIPS="## 默认禁用源码镜像以提高速度，如需启用请自行取消注释"
    local basic_url="${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}"
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_DEBIAN}")
        case "${SYSTEM_VERSION_NUMBER}" in
        12)
            source_suffix="main contrib non-free non-free-firmware"
            ;;
        *)
            source_suffix="main contrib non-free"
            ;;
        esac
        echo "${TIPS}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-updates ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-updates ${source_suffix}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-backports ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-backports ${source_suffix}" >>$File_DebianSourceList
        ## 处理 debian-security 仓库
        local security_url="${SOURCE_SECURITY:-"${SOURCE}"}"
        if [[ -z "${SOURCE_SECURITY}" ]]; then
            local security_url="${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH_SECURITY:-"${SOURCE_BRANCH}-security"}"
        else
            local security_url="${WEB_PROTOCOL}://${SOURCE_SECURITY}/${SOURCE_BRANCH_SECURITY:-"${SOURCE_BRANCH}-security"}"
        fi
        echo "deb ${security_url} ${SYSTEM_VERSION_CODENAME}-security ${source_suffix}
# deb-src ${security_url} ${SYSTEM_VERSION_CODENAME}-security ${source_suffix}" >>$File_DebianSourceList
        ;;
    "${SYSTEM_UBUNTU}")
        source_suffix="main restricted universe multiverse"
        echo "${TIPS}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-updates ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-updates ${source_suffix}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-backports ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-backports ${source_suffix}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-security ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-security ${source_suffix}

## 预发布软件源（不建议启用）
# deb ${basic_url} ${SYSTEM_VERSION_CODENAME}-proposed ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME}-proposed ${source_suffix}" >>$File_DebianSourceList
        ;;
    "${SYSTEM_KALI}")
        source_suffix="main non-free contrib"
        echo "${TIPS}
deb ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}
# deb-src ${basic_url} ${SYSTEM_VERSION_CODENAME} ${source_suffix}" >>$File_DebianSourceList
        ;;
    esac
}

## 更换基于 RedHat 系 Linux 发行版软件源
function RedHatMirrors() {
    ## 安装/更换 EPEL (Extra Packages for Enterprise Linux) 附加软件包软件源
    function EPELMirrors() {
        ## 安装 EPEL 软件包
        if [ ${VERIFICATION_EPEL} -ne 0 ]; then
            echo -e "${WORKING} 开始安装 epel-release 软件包..."
            yum install -y https://mirrors.cloud.tencent.com/epel/epel-release-latest-${SYSTEM_VERSION_NUMBER:0:1}.noarch.rpm
        fi
        ## 删除原有 repo 源文件
        [ ${VERIFICATION_EPELFILES} -eq 0 ] && rm -rf $Dir_RedHatRepos/epel*
        [ ${VERIFICATION_EPELBACKUPFILES} -eq 0 ] && rm -rf $Dir_RedHatReposBackup/epel*
        ## 生成 repo 源文件
        GenRepoFiles_EPEL

        # 更换 WEB 协议（HTTP/HTTPS）
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9 | 8)
            sed -i "s|^#baseurl=https|baseurl=${WEB_PROTOCOL}|g" $Dir_RedHatRepos/epel*
            ;;
        7)
            sed -i "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" $Dir_RedHatRepos/epel*
            ;;
        esac
        # 修改源
        sed -i 's|^metalink=|#metalink=|g' $Dir_RedHatRepos/epel*
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
            sed -i "s|download.example/pub|${SOURCE}|g" $Dir_RedHatRepos/epel*
            ;;
        8 | 7)
            sed -i "s|download.fedoraproject.org/pub|${SOURCE}|g" $Dir_RedHatRepos/epel*
            ;;
        esac
    }
    ## 仅 EPEL 模式
    if [[ "${ONLY_EPEL}" == "true" ]]; then
        EPELMirrors
        return
    fi
    ## 生成基于 RedHat 发行版和及其衍生发行版的官方 repo 源文件
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}")
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
            GenRepoFiles_RockyLinux ${SYSTEM_VERSION_NUMBER:0:1}
            ;;
        *)
            GenRepoFiles_CentOS ${SYSTEM_VERSION_NUMBER:0:1}
            ;;
        esac
        ;;
    "${SYSTEM_CENTOS}")
        GenRepoFiles_CentOS ${SYSTEM_VERSION_NUMBER:0:1}
        ;;
    "${SYSTEM_CENTOS_STREAM}")
        GenRepoFiles_CentOSStream ${SYSTEM_VERSION_NUMBER:0:1}
        ;;
    "${SYSTEM_ROCKY}")
        GenRepoFiles_RockyLinux ${SYSTEM_VERSION_NUMBER:0:1}
        ;;
    "${SYSTEM_ALMA}")
        GenRepoFiles_AlmaLinux ${SYSTEM_VERSION_NUMBER:0:1}
        ;;
    "${SYSTEM_FEDORA}")
        GenRepoFiles_Fedora
        ;;
    esac

    ## 修改源
    cd $Dir_RedHatRepos
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}")
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
            # wget "${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/RPM-GPG-KEY-rockyofficial" -P /etc/pki/rpm-gpg
            # wget "${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/RPM-GPG-KEY-Rocky-9" -P /etc/pki/rpm-gpg
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|^gpgcheck=1|gpgcheck=0|g" \
                -e "s|^gpgkey=|#gpgkey=|g" \
                -e "s|dl.rockylinux.org/\$contentdir|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                rocky.repo \
                rocky-addons.repo \
                rocky-devel.repo \
                rocky-extras.repo
            ;;
        *)
            sed -i "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" CentOS-*
            sed -i 's|^mirrorlist=|#mirrorlist=|g' CentOS-*
            case ${SYSTEM_VERSION_NUMBER:0:1} in
            8)
                sed -i 's|mirror.centos.org/$contentdir|mirror.centos.org/centos-vault|g' CentOS-*
                sed -i "s/\$releasever/8.5.2111/g" CentOS-*
                # 单独处理 CentOS-Linux-Sources.repo
                sed -i "s|vault.centos.org/\$contentdir|${SOURCE_VAULT:-"mirror.centos.org"}/${SOURCE_BRANCH_VAULT:-"centos-vault"}|g" CentOS-Linux-Sources.repo
                ;;
            7)
                sed -i "s|mirror.centos.org/\$contentdir|mirror.centos.org/${SOURCE_BRANCH}|g" CentOS-*
                sed -i "s/\$releasever/7/g" CentOS-*
                # 单独处理 CentOS-Sources.repo
                sed -i "s|vault.centos.org/centos|${SOURCE_VAULT:-"mirror.centos.org"}/${SOURCE_BRANCH_VAULT:-"centos"}|g" CentOS-Sources.repo
                ;;
            esac
            sed -i "s|mirror.centos.org|${SOURCE}|g" CentOS-*
            ;;
        esac
        ;;
    "${SYSTEM_CENTOS}")
        sed -i "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" CentOS-*
        sed -i 's|^mirrorlist=|#mirrorlist=|g' CentOS-*
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        8)
            ## CentOS 8 操作系统版本结束了生命周期（EOL），Linux 社区已不再维护该操作系统版本，最终版本为 8.5.2011
            # 原 centos 镜像中的 CentOS 8 相关内容已被官方移动，从 2022-02 开始切换至 centos-vault 源
            sed -i 's|mirror.centos.org/$contentdir|mirror.centos.org/centos-vault|g' CentOS-*
            sed -i "s/\$releasever/8.5.2111/g" CentOS-*
            # 单独处理 CentOS-Linux-Sources.repo
            sed -i "s|vault.centos.org/\$contentdir|${SOURCE_VAULT:-"mirror.centos.org"}/${SOURCE_BRANCH_VAULT:-"centos-vault"}|g" CentOS-Linux-Sources.repo
            ;;
        7)
            sed -i "s|mirror.centos.org/\$contentdir|mirror.centos.org/${SOURCE_BRANCH}|g" CentOS-*
            sed -i "s|vault.centos.org/centos|${SOURCE_VAULT:-"mirror.centos.org"}/${SOURCE_BRANCH_VAULT:-"centos"}|g" CentOS-Sources.repo # 单独处理 CentOS-Sources.repo
            ;;
        esac
        sed -i "s|mirror.centos.org|${SOURCE}|g" CentOS-*
        ;;
    "${SYSTEM_CENTOS_STREAM}")
        # CentOS Stream 9 使用的是 centos-stream 镜像，而 CentOS Stream 8 使用的是 centos 镜像
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
            sed -e "s|^#baseurl=https|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^metalink=|#metalink=|g" \
                -e "s|mirror.stream.centos.org|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                centos.repo \
                centos-addons.repo
            ;;
        8)
            sed -i "s|vault.centos.org/\$contentdir|${SOURCE_VAULT:-"mirror.centos.org"}/${SOURCE_BRANCH_VAULT:-"centos"}|g" CentOS-Stream-Sources.repo # 单独处理 CentOS-Stream-Sources.repo
            sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|mirror.centos.org/\$contentdir|${SOURCE}/${SOURCE_BRANCH}|g" \
                -i \
                CentOS-Stream-*
            ;;
        esac
        ;;
    "${SYSTEM_ROCKY}")
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
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
    "${SYSTEM_ALMA}")
        case ${SYSTEM_VERSION_NUMBER:0:1} in
        9)
            sed -e "s|^# baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|repo.almalinux.org/almalinux|${SOURCE}/${SOURCE_BRANCH}|g" \
                -e "s|repo.almalinux.org/vault|${SOURCE}/${SOURCE_BRANCH}-vault|g" \
                -i \
                almalinux-*
            ;;
        8)
            sed -e "s|^mirrorlist=|#mirrorlist=|g" \
                -e "s|^# baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
                -e "s|repo.almalinux.org/almalinux|${SOURCE}/${SOURCE_BRANCH}|g" \
                -e "s|repo.almalinux.org/vault|${SOURCE}/${SOURCE_BRANCH}-vault|g" \
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
        sed -e "s|^metalink=|#metalink=|g" \
            -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
            -e "s|download.example/pub/fedora/linux|${SOURCE}/${SOURCE_BRANCH}|g" \
            -i \
            fedora.repo \
            fedora-updates.repo \
            fedora-modular.repo \
            fedora-updates-modular.repo \
            fedora-updates-testing.repo \
            fedora-updates-testing-modular.repo
        ;;
    esac

    ## EPEL 附加软件包（安装/换源）
    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_RHEL}" | "${SYSTEM_CENTOS}" | "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMA}")
        [[ "${INSTALL_EPEL}" == "True" ]] && EPELMirrors
        ;;
    esac
}

## 更换基于 openEuler 发行版的软件源
function openEulerMirrors() {
    GenRepoFiles_openEuler
    cd $Dir_openEulerRepos

    sed -e "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
        -e "s|repo.openeuler.org|${SOURCE}/${SOURCE_BRANCH}|g" \
        -i \
        openEuler.repo
}

## 更换基于 openSUSE 发行版的软件源
function openSUSEMirrors() {
    case "${SYSTEM_ID}" in
    "opensuse-leap")
        GenRepoFiles_openSUSE "leap" "${SYSTEM_VERSION_NUMBER}"
        ;;
    "opensuse-tumbleweed")
        GenRepoFiles_openSUSE "tumbleweed"
        ;;
    esac
    cd $Dir_openSUSERepos

    # 更换 WEB 协议（HTTP/HTTPS）
    sed -i "s|^#baseurl=http|baseurl=${WEB_PROTOCOL}|g" repo-*
    # 更换软件源
    case "${SYSTEM_ID}" in
    opensuse-leap)
        case "${SYSTEM_VERSION_NUMBER}" in
        15.[0-2])
            sed -i "s|download.opensuse.org|${SOURCE}/${SOURCE_BRANCH}|g" \
                repo-debug-non-oss.repo \
                repo-debug.repo \
                repo-debug-update-non-oss.repo \
                repo-debug-update.repo \
                repo-non-oss.repo \
                repo-oss.repo \
                repo-source-non-oss.repo \
                repo-source.repo \
                repo-update-non-oss.repo \
                repo-update.repo
            ;;
        *)
            sed -i "s|download.opensuse.org|${SOURCE}/${SOURCE_BRANCH}|g" \
                repo-backports-debug-update.repo \
                repo-backports-update.repo \
                repo-debug-non-oss.repo \
                repo-debug.repo \
                repo-debug-update-non-oss.repo \
                repo-debug-update.repo \
                repo-non-oss.repo \
                repo-oss.repo \
                repo-sle-debug-update.repo \
                repo-sle-update.repo \
                repo-source.repo \
                repo-update-non-oss.repo \
                repo-update.repo
            ;;
        esac
        ;;
    opensuse-tumbleweed)
        sed -i "s|download.opensuse.org|${SOURCE}/${SOURCE_BRANCH}|g" \
            repo-debug.repo \
            repo-non-oss.repo \
            repo-openh264.repo \
            repo-oss.repo \
            repo-source.repo \
            repo-update.repo
        ;;
    esac
}

## 更换基于 Arch Linux 发行版的软件源
function ArchMirrors() {
    case "${SOURCE_BRANCH}" in
    "archlinuxarm")
        echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$arch/\$repo" >>$File_ArchMirrorList
        ;;
    "archlinuxcn")
        echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$arch" >>$File_ArchMirrorList
        ;;
    *)
        echo "Server = ${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}/\$repo/os/\$arch" >>$File_ArchMirrorList
        ;;
    esac
}

## 生成 CentOS 官方 repo 源文件
function GenRepoFiles_CentOS() {
    case $1 in
    8)
        cat >$Dir_RedHatRepos/CentOS-Linux-AppStream.repo <<\EOF
# CentOS-Linux-AppStream.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[appstream]
name=CentOS Linux $releasever - AppStream
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-BaseOS.repo <<\EOF
# CentOS-Linux-BaseOS.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[baseos]
name=CentOS Linux $releasever - BaseOS
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=BaseOS&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-ContinuousRelease.repo <<\EOF
# CentOS-Linux-ContinuousRelease.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.
#
# The Continuous Release (CR) repository contains packages for the next minor
# release of CentOS Linux.  This repository only has content in the time period
# between an upstream release and the official CentOS Linux release.  These
# packages have not been fully tested yet and should be considered beta
# quality.  They are made available for people willing to test and provide
# feedback for the next release.

[cr]
name=CentOS Linux $releasever - ContinuousRelease
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=cr&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/cr/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Debuginfo.repo <<\EOF
# CentOS-Linux-Debuginfo.repo
#
# All debug packages are merged into a single repo, split by basearch, and are
# not signed.

[debuginfo]
name=CentOS Linux $releasever - Debuginfo
baseurl=http://debuginfo.centos.org/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Devel.repo <<\EOF
# CentOS-Linux-Devel.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[devel]
name=CentOS Linux $releasever - Devel WARNING! FOR BUILDROOT USE ONLY!
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=Devel&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/Devel/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Extras.repo <<\EOF
# CentOS-Linux-Extras.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[extras]
name=CentOS Linux $releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-FastTrack.repo <<\EOF
# CentOS-Linux-FastTrack.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[fasttrack]
name=CentOS Linux $releasever - FastTrack
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/fasttrack/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-HighAvailability.repo <<\EOF
# CentOS-Linux-HighAvailability.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[ha]
name=CentOS Linux $releasever - HighAvailability
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=HighAvailability&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Media.repo <<\EOF
# CentOS-Linux-Media.repo
#
# You can use this repo to install items directly off the installation media.
# Verify your mount point matches one of the below file:// paths.

[media-baseos]
name=CentOS Linux $releasever - Media - BaseOS
baseurl=file:///media/CentOS/BaseOS
        file:///media/cdrom/BaseOS
        file:///media/cdrecorder/BaseOS
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[media-appstream]
name=CentOS Linux $releasever - Media - AppStream
baseurl=file:///media/CentOS/AppStream
        file:///media/cdrom/AppStream
        file:///media/cdrecorder/AppStream
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Plus.repo <<\EOF
# CentOS-Linux-Plus.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[plus]
name=CentOS Linux $releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/centosplus/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-PowerTools.repo <<\EOF
# CentOS-Linux-PowerTools.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[powertools]
name=CentOS Linux $releasever - PowerTools
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=PowerTools&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Linux-Sources.repo <<\EOF
# CentOS-Linux-Sources.repo


[baseos-source]
name=CentOS Linux $releasever - BaseOS - Source
baseurl=http://vault.centos.org/$contentdir/$releasever/BaseOS/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[appstream-source]
name=CentOS Linux $releasever - AppStream - Source
baseurl=http://vault.centos.org/$contentdir/$releasever/AppStream/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[extras-source]
name=CentOS Linux $releasever - Extras - Source
baseurl=http://vault.centos.org/$contentdir/$releasever/extras/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[plus-source]
name=CentOS Linux $releasever - Plus - Source
baseurl=http://vault.centos.org/$contentdir/$releasever/centosplus/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        ;;
    7)
        cat >$Dir_RedHatRepos/CentOS-Base.repo <<\EOF
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates 
[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat >$Dir_RedHatRepos/CentOS-CR.repo <<\EOF
# CentOS-CR.repo
#
# The Continuous Release ( CR )  repository contains rpms that are due in the next
# release for a specific CentOS Version ( eg. next release in CentOS-7 ); these rpms
# are far less tested, with no integration checking or update path testing having
# taken place. They are still built from the upstream sources, but might not map 
# to an exact upstream distro release.
#
# These packages are made available soon after they are built, for people willing 
# to test their environments, provide feedback on content for the next release, and
# for people looking for early-access to next release content.
#
# The CR repo is shipped in a disabled state by default; its important that users 
# understand the implications of turning this on. 
#
# NOTE: We do not use a mirrorlist for the CR repos, to ensure content is available
#       to everyone as soon as possible, and not need to wait for the external
#       mirror network to seed first. However, many local mirrors will carry CR repos
#       and if desired you can use one of these local mirrors by editing the baseurl
#       line in the repo config below.
#

[cr]
name=CentOS-$releasever - cr
baseurl=http://mirror.centos.org/centos/$releasever/cr/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0
EOF
        cat >$Dir_RedHatRepos/CentOS-Debuginfo.repo <<\EOF
# CentOS-Debug.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#

# All debug packages from all the various CentOS-7 releases
# are merged into a single repo, split by BaseArch
#
# Note: packages in the debuginfo repo are currently not signed
#

[base-debuginfo]
name=CentOS-7 - Debuginfo
baseurl=http://debuginfo.centos.org/7/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7
enabled=0
#
EOF
        cat >$Dir_RedHatRepos/CentOS-fasttrack.repo <<\EOF
[fasttrack]
name=CentOS-7 - fasttrack
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/fasttrack/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat >$Dir_RedHatRepos/CentOS-Media.repo <<\EOF
# CentOS-Media.repo
#
#  This repo can be used with mounted DVD media, verify the mount point for
#  CentOS-7.  You can use this repo and yum to install items directly off the
#  DVD ISO that we release.
#
# To use this repo, put in your DVD and use it with the other repos too:
#  yum --enablerepo=c7-media [command]
#  
# or for ONLY the media repo, do this:
#
#  yum --disablerepo=\* --enablerepo=c7-media [command]

[c7-media]
name=CentOS-$releasever - Media
baseurl=file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat >$Dir_RedHatRepos/CentOS-Sources.repo <<\EOF
# CentOS-Sources.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the 
# remarked out baseurl= line instead.
#
#

[base-source]
name=CentOS-$releasever - Base Sources
baseurl=http://vault.centos.org/centos/$releasever/os/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates 
[updates-source]
name=CentOS-$releasever - Updates Sources
baseurl=http://vault.centos.org/centos/$releasever/updates/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras-source]
name=CentOS-$releasever - Extras Sources
baseurl=http://vault.centos.org/centos/$releasever/extras/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus-source]
name=CentOS-$releasever - Plus Sources
baseurl=http://vault.centos.org/centos/$releasever/centosplus/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        ;;
    esac
}

## 生成 CentOS Stream 官方 repo 源文件
function GenRepoFiles_CentOSStream() {
    case $1 in
    9)
        cat >$Dir_RedHatRepos/centos.repo <<\EOF
[baseos]
name=CentOS Stream $releasever - BaseOS
#baseurl=https://mirror.stream.centos.org/$releasever-stream/BaseOS/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[baseos-debug]
name=CentOS Stream $releasever - BaseOS - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[baseos-source]
name=CentOS Stream $releasever - BaseOS - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[appstream]
name=CentOS Stream $releasever - AppStream
#baseurl=https://mirror.stream.centos.org/$releasever-stream/AppStream/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[appstream-debug]
name=CentOS Stream $releasever - AppStream - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[appstream-source]
name=CentOS Stream $releasever - AppStream - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[crb]
name=CentOS Stream $releasever - CRB
#baseurl=https://mirror.stream.centos.org/$releasever-stream/CRB/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[crb-debug]
name=CentOS Stream $releasever - CRB - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[crb-source]
name=CentOS Stream $releasever - CRB - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0
EOF
        cat >$Dir_RedHatRepos/centos-addons.repo <<\EOF
[highavailability]
name=CentOS Stream $releasever - HighAvailability
#baseurl=https://mirror.stream.centos.org/$releasever-stream/HighAvailability/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[highavailability-debug]
name=CentOS Stream $releasever - HighAvailability - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[highavailability-source]
name=CentOS Stream $releasever - HighAvailability - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[nfv]
name=CentOS Stream $releasever - NFV
#baseurl=https://mirror.stream.centos.org/$releasever-stream/NFV/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[nfv-debug]
name=CentOS Stream $releasever - NFV - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[nfv-source]
name=CentOS Stream $releasever - NFV - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[rt]
name=CentOS Stream $releasever - RT
#baseurl=https://mirror.stream.centos.org/$releasever-stream/RT/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[rt-debug]
name=CentOS Stream $releasever - RT - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[rt-source]
name=CentOS Stream $releasever - RT - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[resilientstorage]
name=CentOS Stream $releasever - ResilientStorage
#baseurl=https://mirror.stream.centos.org/$releasever-stream/ResilientStorage/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[resilientstorage-debug]
name=CentOS Stream $releasever - ResilientStorage - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[resilientstorage-source]
name=CentOS Stream $releasever - ResilientStorage - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[extras-common]
name=CentOS Stream $releasever - Extras packages
#baseurl=https://mirror.stream.centos.org/SIGs/$releasever-stream/extras/$basearch/extras-common/
metalink=https://mirrors.centos.org/metalink?repo=centos-extras-sig-extras-common-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[extras-common-source]
name=CentOS Stream $releasever - Extras packages - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-extras-sig-extras-common-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0
EOF
        ;;
    8)
        cat >$Dir_RedHatRepos/CentOS-Stream-AppStream.repo <<\EOF
# CentOS-Stream-AppStream.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[appstream]
name=CentOS Stream $releasever - AppStream
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=AppStream&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-BaseOS.repo <<\EOF
# CentOS-Stream-BaseOS.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[baseos]
name=CentOS Stream $releasever - BaseOS
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=BaseOS&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-Debuginfo.repo <<\EOF
# CentOS-Stream-Debuginfo.repo
#
# All debug packages are merged into a single repo, split by basearch, and are
# not signed.

[debuginfo]
name=CentOS Stream $releasever - Debuginfo
baseurl=http://debuginfo.centos.org/$stream/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-Extras-common.repo <<\EOF
# CentOS-Stream-Extras-common.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[extras-common]
name=CentOS Stream $releasever - Extras common packages
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=extras-extras-common
#baseurl=http://mirror.centos.org/$contentdir/$stream/extras/$basearch/extras-common/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-Extras.repo <<\EOF
# CentOS-Stream-Extras.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[extras]
name=CentOS Stream $releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-HighAvailability.repo <<\EOF
# CentOS-Stream-HighAvailability.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[ha]
name=CentOS Stream $releasever - HighAvailability
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=HighAvailability&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-Media.repo <<\EOF
# CentOS-Stream-Media.repo
#
# You can use this repo to install items directly off the installation media.
# Verify your mount point matches one of the below file:// paths.

[media-baseos]
name=CentOS Stream $releasever - Media - BaseOS
baseurl=file:///media/CentOS/BaseOS
        file:///media/cdrom/BaseOS
        file:///media/cdrecorder/BaseOS
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[media-appstream]
name=CentOS Stream $releasever - Media - AppStream
baseurl=file:///media/CentOS/AppStream
        file:///media/cdrom/AppStream
        file:///media/cdrecorder/AppStream
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-NFV.repo <<\EOF
# CentOS-Stream-NFV.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[nfv]
name=CentOS Stream $releasever - NFV
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=NFV&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/NFV/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-PowerTools.repo <<\EOF
# CentOS-Stream-PowerTools.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[powertools]
name=CentOS Stream $releasever - PowerTools
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=PowerTools&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-RealTime.repo <<\EOF
# CentOS-Stream-RealTime.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[rt]
name=CentOS Stream $releasever - RealTime
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=RT&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/RT/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-ResilientStorage.repo <<\EOF
# CentOS-Stream-ResilientStorage.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for CentOS updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[resilientstorage]
name=CentOS Stream $releasever - ResilientStorage
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=ResilientStorage&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat >$Dir_RedHatRepos/CentOS-Stream-Sources.repo <<\EOF
# CentOS-Stream-Sources.repo

[baseos-source]
name=CentOS Stream $releasever - BaseOS - Source
baseurl=http://vault.centos.org/$contentdir/$stream/BaseOS/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[appstream-source]
name=CentOS Stream $releasever - AppStream - Source
baseurl=http://vault.centos.org/$contentdir/$stream/AppStream/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[powertools-source]
name=CentOS Stream $releasever - PowerTools - Source
baseurl=http://vault.centos.org/$contentdir/$stream/PowerTools/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[extras-source]
name=CentOS Stream $releasever - Extras - Source
baseurl=http://vault.centos.org/$contentdir/$stream/extras/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[ha-source]
name=CentOS Stream $releasever - HighAvailability - Source
baseurl=http://vault.centos.org/$contentdir/$stream/HighAvailability/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[rt-source]
name=CentOS Stream $releasever - RT - Source
baseurl=http://vault.centos.org/$contentdir/$stream/RT/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[resilientstorage-source]
name=CentOS Stream $releasever - ResilientStorage - Source
baseurl=http://vault.centos.org/$contentdir/$stream/ResilientStorage/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[nfv-source]
name=CentOS Stream $releasever - NFV - Source
baseurl=http://vault.centos.org/$contentdir/$stream/NFV/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        ;;
    esac
}

## 生成 Rocky Linux 官方 repo 源文件
function GenRepoFiles_RockyLinux() {
    case $1 in
    9)
        cat >$Dir_RedHatRepos/rocky.repo <<\EOF
# rocky.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[baseos]
name=Rocky Linux $releasever - BaseOS
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[baseos-debug]
name=Rocky Linux $releasever - BaseOS - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[baseos-source]
name=Rocky Linux $releasever - BaseOS - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=BaseOS-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[appstream]
name=Rocky Linux $releasever - AppStream
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[appstream-debug]
name=Rocky Linux $releasever - AppStream - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[appstream-source]
name=Rocky Linux $releasever - AppStream - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=AppStream-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[crb]
name=Rocky Linux $releasever - CRB
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=CRB-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[crb-debug]
name=Rocky Linux $releasever - CRB - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=CRB-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[crb-source]
name=Rocky Linux $releasever - CRB - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=CRB-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9
EOF
        cat >$Dir_RedHatRepos/rocky-addons.repo <<\EOF
# rocky-addons.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[highavailability]
name=Rocky Linux $releasever - High Availability
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[highavailability-debug]
name=Rocky Linux $releasever - High Availability - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[highavailability-source]
name=Rocky Linux $releasever - High Availability - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=HighAvailability-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[resilientstorage]
name=Rocky Linux $releasever - Resilient Storage
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=ResilientStorage-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[resilientstorage-debug]
name=Rocky Linux $releasever - Resilient Storage - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=ResilientStorage-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[resilientstorage-source]
name=Rocky Linux $releasever - Resilient Storage - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=ResilientStorage-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[nfv]
name=Rocky Linux $releasever - NFV
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=NFV-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[nfv-debug]
name=Rocky Linux $releasever - NFV Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[nfv-source]
name=Rocky Linux $releasever - NFV Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[rt]
name=Rocky Linux $releasever - Realtime
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[rt-debug]
name=Rocky Linux $releasever - Realtime Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[rt-source]
name=Rocky Linux $releasever - Realtime Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[sap]
name=Rocky Linux $releasever - SAP
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[sap-debug]
name=Rocky Linux $releasever - SAP Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[sap-source]
name=Rocky Linux $releasever - SAP Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[saphana]
name=Rocky Linux $releasever - SAPHANA
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[saphana-debug]
name=Rocky Linux $releasever - SAPHANA Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[saphana-source]
name=Rocky Linux $releasever - SAPHANA Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9
EOF
        cat >$Dir_RedHatRepos/rocky-devel.repo <<\EOF
# rocky-devel.repo
#
# devel and no-package-left-behind

[devel]
name=Rocky Linux $releasever - Devel WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=devel-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/devel/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9
EOF
        cat >$Dir_RedHatRepos/rocky-extras.repo <<\EOF
# rocky-extras.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[extras]
name=Rocky Linux $releasever - Extras
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[extras-debug]
name=Rocky Linux $releasever - Extras Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[extras-source]
name=Rocky Linux $releasever - Extras Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[plus]
name=Rocky Linux $releasever - Plus
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=plus-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[plus-debug]
name=Rocky Linux $releasever - Plus - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=plus-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9

[plus-source]
name=Rocky Linux $releasever - Plus - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=plus-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9
EOF
        ;;
    8)
        cat >$Dir_RedHatRepos/Rocky-AppStream.repo <<\EOF
# Rocky-AppStream.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[appstream]
name=Rocky Linux $releasever - AppStream
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-BaseOS.repo <<\EOF
# Rocky-BaseOS.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[baseos]
name=Rocky Linux $releasever - BaseOS
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Debuginfo.repo <<\EOF
# Rocky-Debuginfo.repo
#

[baseos-debug]
name=Rocky Linux $releasever - BaseOS - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever-debug
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[appstream-debug]
name=Rocky Linux $releasever - AppStream - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever-debug
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[ha-debug]
name=Rocky Linux $releasever - High Availability - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever-debug
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[powertools-debug]
name=Rocky Linux $releasever - PowerTools - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=PowerTools-$releasever-debug
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/PowerTools/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[resilient-storage-debug]
name=Rocky Linux $releasever - Resilient Storage - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=ResilientStorage-$releasever-debug
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Devel.repo <<\EOF
# Rocky-Devel.repo
#

[devel]
name=Rocky Linux $releasever - Devel WARNING! FOR BUILDROOT AND KOJI USE
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=Devel-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/Devel/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Extras.repo <<\EOF
# Rocky-Extras.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[extras]
name=Rocky Linux $releasever - Extras
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-HighAvailability.repo <<\EOF
# Rocky-HighAvailability.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[ha]
name=Rocky Linux $releasever - HighAvailability
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Media.repo <<\EOF
# Rocky-Media.repo
#
# You can use this repo to install items directly off the installation media.
# Verify your mount point matches one of the below file:// paths.

[media-baseos]
name=Rocky Linux $releasever - Media - BaseOS
baseurl=file:///media/Rocky/BaseOS
        file:///media/cdrom/BaseOS
        file:///media/cdrecorder/BaseOS
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[media-appstream]
name=Rocky Linux $releasever - Media - AppStream
baseurl=file:///media/Rocky/AppStream
        file:///media/cdrom/AppStream
        file:///media/cdrecorder/AppStream
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-NFV.repo <<\EOF
# Rocky-NFV.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[nfv]
name=Rocky Linux $releasever - NFV
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=NFV-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/nfv/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Plus.repo <<\EOF
# Rocky-Plus.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[plus]
name=Rocky Linux $releasever - Plus
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=rockyplus-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-PowerTools.repo <<\EOF
# Rocky-PowerTools.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[powertools]
name=Rocky Linux $releasever - PowerTools
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=PowerTools-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-ResilientStorage.repo <<\EOF
# Rocky-ResilientStorage.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[resilient-storage]
name=Rocky Linux $releasever - ResilientStorage
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=ResilientStorage-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-RT.repo <<\EOF
# Rocky-RT.repo
#
# The mirrorlist system uses the connecting IP address of the client and the
# update status of each mirror to pick current mirrors that are geographically
# close to the client.  You should use this for Rocky updates unless you are
# manually picking other mirrors.
#
# If the mirrorlist does not work for you, you can try the commented out
# baseurl line instead.

[rt]
name=Rocky Linux $releasever - Realtime
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat >$Dir_RedHatRepos/Rocky-Sources.repo <<\EOF
# Rocky-Sources.repo

[baseos-source]
name=Rocky Linux $releasever - BaseOS - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=BaseOS-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[appstream-source]
name=Rocky Linux $releasever - AppStream - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=AppStream-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

#[extras-source]
#name=Rocky Linux $releasever - Extras - Source
#mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=extras-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/source/tree/
#gpgcheck=1
#enabled=0
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

#[plus-source]
#name=Rocky Linux $releasever - Plus - Source
#mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=plus-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/Plus/source/tree/
#gpgcheck=1
#enabled=0
#gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[ha-source]
name=Rocky Linux $releasever - High Availability - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=HighAvailability-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[powertools-source]
name=Rocky Linux $releasever - PowerTools - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=PowerTools-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/PowerTools/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial

[resilient-storage-source]
name=Rocky Linux $releasever - Resilient Storage - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=ResilientStorage-$releasever-source
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        ;;
    esac
}

## 生成 AlmaLinux 官方 repo 源文件
function GenRepoFiles_AlmaLinux() {
    case $1 in
    9)
        cat >$Dir_RedHatRepos/almalinux-appstream.repo <<\EOF
[appstream]
name=AlmaLinux $releasever - AppStream
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=1

[appstream-debug]
name=AlmaLinux $releasever - AppStream - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/AppStream/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[appstream-source]
name=AlmaLinux $releasever - AppStream - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-source
# baseurl=https://repo.almalinux.org/vault/$releasever/AppStream/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-baseos.repo <<\EOF
[baseos]
name=AlmaLinux $releasever - BaseOS
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=1

[baseos-debug]
name=AlmaLinux $releasever - BaseOS - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/BaseOS/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[baseos-source]
name=AlmaLinux $releasever - BaseOS - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-source
# baseurl=https://repo.almalinux.org/vault/$releasever/BaseOS/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-crb.repo <<\EOF
[crb]
name=AlmaLinux $releasever - CRB
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb
# baseurl=https://repo.almalinux.org/almalinux/$releasever/CRB/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[crb-debug]
name=AlmaLinux $releasever - CRB - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/CRB/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[crb-source]
name=AlmaLinux $releasever - CRB - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-source
# baseurl=https://repo.almalinux.org/vault/$releasever/CRB/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-extras.repo <<\EOF
[extras]
name=AlmaLinux $releasever - Extras
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[extras-debug]
name=AlmaLinux $releasever - Extras - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/extras/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[extras-source]
name=AlmaLinux $releasever - Extras - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-source
# baseurl=https://repo.almalinux.org/vault/$releasever/extras/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-highavailability.repo <<\EOF
[highavailability]
name=AlmaLinux $releasever - HighAvailability
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability
# baseurl=https://repo.almalinux.org/almalinux/$releasever/HighAvailability/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[highavailability-debug]
name=AlmaLinux $releasever - HighAvailability - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[highavailability-source]
name=AlmaLinux $releasever - HighAvailability - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability-source
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-nfv.repo <<\EOF
[nfv]
name=AlmaLinux $releasever - NFV
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv
# baseurl=https://repo.almalinux.org/almalinux/$releasever/NFV/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[nfv-debug]
name=AlmaLinux $releasever - NFV - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[nfv-source]
name=AlmaLinux $releasever - NFV - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-source
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-plus.repo <<\EOF
[plus]
name=AlmaLinux $releasever - Plus
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus
# baseurl=https://repo.almalinux.org/almalinux/$releasever/plus/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[plus-debug]
name=AlmaLinux $releasever - Plus - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[plus-source]
name=AlmaLinux $releasever - Plus - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-source
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-resilientstorage.repo <<\EOF
[resilientstorage]
name=AlmaLinux $releasever - ResilientStorage
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage
# baseurl=https://repo.almalinux.org/almalinux/$releasever/ResilientStorage/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[resilientstorage-debug]
name=AlmaLinux $releasever - ResilientStorage - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[resilientstorage-source]
name=AlmaLinux $releasever - ResilientStorage - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-source
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-rt.repo <<\EOF
[rt]
name=AlmaLinux $releasever - RT
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt
# baseurl=https://repo.almalinux.org/almalinux/$releasever/RT/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[rt-debug]
name=AlmaLinux $releasever - RT - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[rt-source]
name=AlmaLinux $releasever - RT - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-source
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-sap.repo <<\EOF
[sap]
name=AlmaLinux $releasever - SAP
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAP/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[sap-debug]
name=AlmaLinux $releasever - SAP - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[sap-source]
name=AlmaLinux $releasever - SAP - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        cat >$Dir_RedHatRepos/almalinux-saphana.repo <<\EOF
[saphana]
name=AlmaLinux $releasever - SAPHANA
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAPHANA/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[saphana-debug]
name=AlmaLinux $releasever - SAPHANA - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-debug
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0

[saphana-source]
name=AlmaLinux $releasever - SAPHANA - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-9
metadata_expire=86400
enabled_metadata=0
EOF
        ;;
    8)
        cat >$Dir_RedHatRepos/almalinux-ha.repo <<\EOF
# almalinux-ha.repo

[ha]
name=AlmaLinux $releasever - HighAvailability
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha
# baseurl=https://repo.almalinux.org/almalinux/$releasever/HighAvailability/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[ha-source]
name=AlmaLinux $releasever - HighAvailability Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha-source
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[ha-debuginfo]
name=AlmaLinux $releasever - HighAvailability debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-nfv.repo <<\EOF
# almalinux-nfv.repo

[nfv]
name=AlmaLinux $releasever - Real Time for NFV
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv
# baseurl=https://repo.almalinux.org/almalinux/$releasever/NFV/$basearch/os/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[nfv-source]
name=AlmaLinux $releasever - Real Time for NFV Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-source
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[nfv-debuginfo]
name=AlmaLinux $releasever - Real Time for NFV Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-plus.repo <<\EOF
# almalinux-plus.repo

[plus]
name=AlmaLinux $releasever - Plus
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus
# baseurl=https://repo.almalinux.org/almalinux/$releasever/plus/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[plus-source]
name=AlmaLinux $releasever - Plus Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-source
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[plus-debuginfo]
name=AlmaLinux $releasever - Plus debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-powertools.repo <<\EOF
# almalinux-powertools.repo

[powertools]
name=AlmaLinux $releasever - PowerTools
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools
# baseurl=https://repo.almalinux.org/almalinux/$releasever/PowerTools/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[powertools-source]
name=AlmaLinux $releasever - PowerTools Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools-source
# baseurl=https://repo.almalinux.org/vault/$releasever/PowerTools/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[powertools-debuginfo]
name=AlmaLinux $releasever - PowerTools debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/PowerTools/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-resilientstorage.repo <<\EOF
# almalinux-resilientstorage.repo

[resilientstorage]
name=AlmaLinux $releasever - ResilientStorage
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage
# baseurl=https://repo.almalinux.org/almalinux/$releasever/ResilientStorage/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[resilientstorage-source]
name=AlmaLinux $releasever - ResilientStorage Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-source
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[resilientstorage-debuginfo]
name=AlmaLinux $releasever - ResilientStorage debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-rt.repo <<\EOF
# almalinux-rt.repo

[rt]
name=AlmaLinux $releasever - Real Time
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt
# baseurl=https://repo.almalinux.org/almalinux/$releasever/RT/$basearch/os/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[rt-source]
name=AlmaLinux $releasever - Real Time Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-source
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[rt-debuginfo]
name=AlmaLinux $releasever - Real Time Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-sap.repo <<\EOF
# almalinux-sap.repo

[sap]
name=AlmaLinux $releasever - SAP
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAP/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[sap-source]
name=AlmaLinux $releasever - SAP Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[sap-debuginfo]
name=AlmaLinux $releasever - SAP Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux-saphana.repo <<\EOF
# almalinux-saphana.repo

[saphana]
name=AlmaLinux $releasever - SAP HANA
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAPHANA/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[saphana-source]
name=AlmaLinux $releasever - SAP HANA Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[saphana-debuginfo]
name=AlmaLinux $releasever - SAP HANA Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat >$Dir_RedHatRepos/almalinux.repo <<\EOF
# almalinux.repo

[baseos]
name=AlmaLinux $releasever - BaseOS
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[appstream]
name=AlmaLinux $releasever - AppStream
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[extras]
name=AlmaLinux $releasever - Extras
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Sources
[baseos-source]
name=AlmaLinux $releasever - BaseOS Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-source
# baseurl=https://repo.almalinux.org/vault/$releasever/BaseOS/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[appstream-source]
name=AlmaLinux $releasever - AppStream Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-source
# baseurl=https://repo.almalinux.org/vault/$releasever/AppStream/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[extras-source]
name=AlmaLinux $releasever - Extras Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-source
# baseurl=https://repo.almalinux.org/vault/$releasever/extras/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

## Debuginfo
[baseos-debuginfo]
name=AlmaLinux $releasever - BaseOS debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/BaseOS/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[appstream-debuginfo]
name=AlmaLinux $releasever - AppStream debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/AppStream/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[extras-debuginfo]
name=AlmaLinux $releasever - Extras debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/extras/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        ;;
    esac
}

## 生成 Fedora 官方 repo 源文件
function GenRepoFiles_Fedora() {
    cat >$Dir_RedHatRepos/fedora-cisco-openh264.repo <<\EOF
[fedora-cisco-openh264]
name=Fedora $releasever openh264 (From Cisco) - $basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-cisco-openh264-$releasever&arch=$basearch
type=rpm
enabled=1
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=True

[fedora-cisco-openh264-debuginfo]
name=Fedora $releasever openh264 (From Cisco) - $basearch - Debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-cisco-openh264-debug-$releasever&arch=$basearch
type=rpm
enabled=0
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=True
EOF
    cat >$Dir_RedHatRepos/fedora.repo <<\EOF
[fedora]
name=Fedora $releasever - $basearch
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/$basearch/os/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-$releasever&arch=$basearch
enabled=1
countme=1
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[fedora-debuginfo]
name=Fedora $releasever - $basearch - Debug
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/$basearch/debug/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-debug-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[fedora-source]
name=Fedora $releasever - Source
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-source-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
    cat >$Dir_RedHatRepos/fedora-updates.repo <<\EOF
[updates]
name=Fedora $releasever - $basearch - Updates
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-f$releasever&arch=$basearch
enabled=1
countme=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-debuginfo]
name=Fedora $releasever - $basearch - Updates - Debug
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-debug-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-source]
name=Fedora $releasever - Updates Source
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Everything/SRPMS/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-source-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
    cat >$Dir_RedHatRepos/fedora-modular.repo <<\EOF
[fedora-modular]
name=Fedora Modular $releasever - $basearch
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Modular/$basearch/os/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-modular-$releasever&arch=$basearch
enabled=1
countme=1
#metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[fedora-modular-debuginfo]
name=Fedora Modular $releasever - $basearch - Debug
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Modular/$basearch/debug/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-modular-debug-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[fedora-modular-source]
name=Fedora Modular $releasever - Source
#baseurl=http://download.example/pub/fedora/linux/releases/$releasever/Modular/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=fedora-modular-source-$releasever&arch=$basearch
enabled=0
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
    cat >$Dir_RedHatRepos/fedora-updates-modular.repo <<\EOF
[updates-modular]
name=Fedora Modular $releasever - $basearch - Updates
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Modular/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-modular-f$releasever&arch=$basearch
enabled=1
countme=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-modular-debuginfo]
name=Fedora Modular $releasever - $basearch - Updates - Debug
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Modular/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-modular-debug-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-modular-source]
name=Fedora Modular $releasever - Updates Source
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Modular/SRPMS/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-released-modular-source-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
    cat >$Dir_RedHatRepos/fedora-updates-testing.repo <<\EOF
[updates-testing]
name=Fedora $releasever - $basearch - Test Updates
#baseurl=http://download.example/pub/fedora/linux/updates/testing/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-f$releasever&arch=$basearch
enabled=0
countme=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-testing-debuginfo]
name=Fedora $releasever - $basearch - Test Updates Debug
#baseurl=http://download.example/pub/fedora/linux/updates/testing/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-debug-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-testing-source]
name=Fedora $releasever - Test Updates Source
#baseurl=http://download.example/pub/fedora/linux/updates/testing/$releasever/Everything/SRPMS/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-source-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
    cat >$Dir_RedHatRepos/fedora-updates-testing-modular.repo <<\EOF
[updates-testing-modular]
name=Fedora Modular $releasever - $basearch - Test Updates
#baseurl=http://download.example/pub/fedora/linux/updates/testing/$releasever/Modular/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-modular-f$releasever&arch=$basearch
enabled=0
countme=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-testing-modular-debuginfo]
name=Fedora Modular $releasever - $basearch - Test Updates Debug
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Modular/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-modular-debug-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False

[updates-testing-modular-source]
name=Fedora Modular $releasever - Test Updates Source
#baseurl=http://download.example/pub/fedora/linux/updates/$releasever/Modular/SRPMS/
metalink=https://mirrors.fedoraproject.org/metalink?repo=updates-testing-modular-source-f$releasever&arch=$basearch
enabled=0
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
EOF
}

## 生成 openSUSE 官方 repo 源文件
function GenRepoFiles_openSUSE() {
    case $1 in
    "leap")
        case $2 in
        15.[0-2])
            cat >$Dir_openSUSERepos/repo-debug-non-oss.repo <<\EOF
[repo-debug-non-oss]
name=Debug Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/non-oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug.repo <<\EOF
[repo-debug]
name=Debug Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug-update-non-oss.repo <<\EOF
[repo-debug-update-non-oss]
name=Update Repository (Debug, Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/non-oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug-update.repo <<\EOF
[repo-debug-update]
name=Update Repository (Debug)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-non-oss.repo <<\EOF
[repo-non-oss]
name=Non-OSS Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/non-oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-oss.repo <<\EOF
[repo-oss]
name=Main Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-source-non-oss.repo <<\EOF
[repo-source-non-oss]
name=Source Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/non-oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-source.repo <<\EOF
[repo-source]
name=Source Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/oss/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-update-non-oss.repo <<\EOF
[repo-update-non-oss]
name=Update Repository (Non-Oss)
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/non-oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-update.repo <<\EOF
[repo-update]
name=Main Update Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/oss/
type=rpm-md
keeppackages=0
EOF
            ;;
        *)
            cat >$Dir_openSUSERepos/repo-backports-debug-update.repo <<\EOF
[repo-backports-debug-update]
name=Update repository with updates for openSUSE Leap debuginfo packages from openSUSE Backports
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/backports_debug/
type=NONE
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-backports-update.repo <<\EOF
[repo-backports-update]
name=Update repository of openSUSE Backports
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/backports/
path=/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug-non-oss.repo <<\EOF
[repo-debug-non-oss]
name=Debug Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/non-oss/
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug.repo <<\EOF
[repo-debug]
name=Debug Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/oss/
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug-update-non-oss.repo <<\EOF
[repo-debug-update-non-oss]
name=Update Repository (Debug, Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/non-oss/
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-debug-update.repo <<\EOF
[repo-debug-update]
name=Update Repository (Debug)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/oss/
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-non-oss.repo <<\EOF
[repo-non-oss]
name=Non-OSS Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/non-oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-oss.repo <<\EOF
[repo-oss]
name=Main Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-sle-debug-update.repo <<\EOF
[repo-sle-debug-update]
name=Update repository with debuginfo for updates from SUSE Linux Enterprise 15
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/sle/
path=/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-sle-update.repo <<\EOF
[repo-sle-update]
name=Update repository with updates from SUSE Linux Enterprise 15
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/sle/
path=/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-source.repo <<\EOF
[repo-source]
name=Source Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/oss/
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-update-non-oss.repo <<\EOF
[repo-update-non-oss]
name=Update Repository (Non-Oss)
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/non-oss/
type=rpm-md
keeppackages=0
EOF
            cat >$Dir_openSUSERepos/repo-update.repo <<\EOF
[repo-update]
name=Main Update Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/oss/
type=rpm-md
keeppackages=0
EOF
            ;;
        esac
        ;;
    "tumbleweed")
        cat >$Dir_openSUSERepos/repo-debug.repo <<\EOF
[repo-debug]
name=openSUSE-Tumbleweed-Debug
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/tumbleweed/repo/oss/
path=/
keeppackages=0
EOF
        cat >$Dir_openSUSERepos/repo-non-oss.repo <<\EOF
[repo-non-oss]
name=openSUSE-Tumbleweed-Non-Oss
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/tumbleweed/repo/non-oss/
path=/
type=rpm-md
keeppackages=0
EOF
        cat >$Dir_openSUSERepos/repo-openh264.repo <<\EOF
[repo-openh264]
name=Open H.264 Codec (openSUSE Tumbleweed)
enabled=1
autorefresh=1
baseurl=http://codecs.opensuse.org/openh264/openSUSE_Tumbleweed
path=/
type=rpm-md
keeppackages=0
EOF
        cat >$Dir_openSUSERepos/repo-oss.repo <<\EOF
[repo-oss]
name=openSUSE-Tumbleweed-Oss
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/tumbleweed/repo/oss/
path=/
type=rpm-md
keeppackages=0
EOF
        cat >$Dir_openSUSERepos/repo-source.repo <<\EOF
[repo-source]
name=openSUSE-Tumbleweed-Source
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/tumbleweed/repo/oss/
path=/
keeppackages=0
EOF
        cat >$Dir_openSUSERepos/repo-update.repo <<\EOF
[repo-update]
name=openSUSE-Tumbleweed-Update
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/tumbleweed/
path=/
type=rpm-md
keeppackages=0
EOF
        ;;
    esac
}

## 生成 EPEL 附加软件包官方 repo 源文件
function GenRepoFiles_EPEL() {
    case ${SYSTEM_VERSION_NUMBER:0:1} in
    9)
        cat >$Dir_RedHatRepos/epel.repo <<\EOF
[epel]
name=Extra Packages for Enterprise Linux $releasever - $basearch
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever

[epel-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Debug
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Source
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-testing.repo <<\EOF
[epel-testing]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Debug
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Source
# It is much more secure to use the metalink, but if you wish to use a local mirror
# place its address here.
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1
EOF
        ;;
    8)
        cat >$Dir_RedHatRepos/epel.repo <<\EOF
[epel]
name=Extra Packages for Enterprise Linux $releasever - $basearch
#baseurl=https://download.fedoraproject.org/pub/epel/8/Everything/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Debug
#baseurl=https://download.fedoraproject.org/pub/epel/8/Everything/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Source
#baseurl=https://download.fedoraproject.org/pub/epel/8/Everything/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-modular.repo <<\EOF
[epel-modular]
name=Extra Packages for Enterprise Linux Modular $releasever - $basearch
#baseurl=https://download.fedoraproject.org/pub/epel/8/Modular/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-modular-debuginfo]
name=Extra Packages for Enterprise Linux Modular $releasever - $basearch - Debug
#baseurl=https://download.fedoraproject.org/pub/epel/8/Modular/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-debug-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-modular-source]
name=Extra Packages for Enterprise Linux Modular $releasever - $basearch - Source
#baseurl=https://download.fedoraproject.org/pub/epel/8/Modular/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-source-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-playground.repo <<\EOF
[epel-playground]
name=Extra Packages for Enterprise Linux $releasever - Playground - $basearch
#baseurl=https://download.fedoraproject.org/pub/epel/playground/$releasever/Everything/$basearch/os
metalink=https://mirrors.fedoraproject.org/metalink?repo=playground-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-playground-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - Playground - $basearch - Debug
#baseurl=https://download.fedoraproject.org/pub/epel/playground/$releasever/Everything/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=playground-debug-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-playground-source]
name=Extra Packages for Enterprise Linux $releasever - Playground - $basearch - Source
#baseurl=https://download.fedoraproject.org/pub/epel/playground/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=playground-source-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-testing.repo <<\EOF
[epel-testing]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Everything/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Debug
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Everything/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Source
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Everything/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-testing-modular.repo <<\EOF
[epel-testing-modular]
name=Extra Packages for Enterprise Linux Modular $releasever - Testing - $basearch
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Modular/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-testing-modular-debuginfo]
name=Extra Packages for Enterprise Linux Modular $releasever - Testing - $basearch - Debug
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Modular/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-debug-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-testing-modular-source]
name=Extra Packages for Enterprise Linux Modular $releasever - Testing - $basearch - Source
#baseurl=https://download.fedoraproject.org/pub/epel/testing/$releasever/Modular/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-source-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        ;;
    7)
        cat >$Dir_RedHatRepos/epel.repo <<\EOF
[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
#baseurl=http://download.fedoraproject.org/pub/epel/7/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux 7 - $basearch - Source
#baseurl=http://download.fedoraproject.org/pub/epel/7/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1
EOF
        cat >$Dir_RedHatRepos/epel-testing.repo <<\EOF
[epel-testing]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch
#baseurl=http://download.fedoraproject.org/pub/epel/testing/7/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=$basearch
failovermethod=priority
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch - Debug
#baseurl=http://download.fedoraproject.org/pub/epel/testing/7/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch - Source
#baseurl=http://download.fedoraproject.org/pub/epel/testing/7/SRPMS
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel7&arch=$basearch
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1
EOF
        ;;
    esac
}

## 处理命令选项
function CommandOptions() {
    ## 命令帮助
    function Output_Help_Info() {
        echo -e "
选项命令(参数名/含义/参数值)：

  --source                 指定软件源地址                          地址
  --source-security        指定 debian-security 软件源地址         地址
  --source-vault           指定 centos-vault 软件源地址            地址
  --branch                 指定软件源分支(路径)                    分支名
  --branch-security        指定 debian-security 软件源分支(路径)   分支名
  --branch-vault           指定 centos-vault 软件源分支(路径)      分支名
  --web-protocol           指定 WEB 协议                           http 或 https
  --install-epel           安装 EPEL 附加软件包                    true 或 false
  --only-epel              仅更换 EPEL 软件源模式                  无
  --backup                 备份原有软件源                          true 或 false
  --ignore-backup-tips     忽略覆盖备份提示                        无

  "
    }

    ## 判断参数
    while [ $# -gt 0 ]; do
        case $1 in
        ## 指定软件源地址
        --source)
            if [ $2 ]; then
                echo "$2" | grep -Eq "\-|\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    Output_Error "检测到无效参数值 ${BLUE}$2${PLAIN} ，请输入有效的地址！"
                else
                    SOURCE="$2"
                    shift
                fi
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        --source-security)
            if [ $2 ]; then
                echo "$2" | grep -Eq "\-|\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    Output_Error "检测到无效参数值 ${BLUE}$2${PLAIN} ，请输入有效的地址！"
                else
                    SOURCE_SECURITY="$2"
                    shift
                fi
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        --source-vault)
            if [ $2 ]; then
                echo "$2" | grep -Eq "\-|\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    Output_Error "检测到无效参数值 ${BLUE}$2${PLAIN} ，请输入有效的地址！"
                else
                    SOURCE_VAULT="$2"
                    shift
                fi
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        ## 指定软件源分支
        --branch)
            if [ $2 ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        --branch-security)
            if [ $2 ]; then
                SOURCE_BRANCH_SECURITY="$2"
                shift
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        --branch-vault)
            if [ $2 ]; then
                SOURCE_BRANCH_VAULT="$2"
                shift
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定软件源地址！"
            fi
            ;;
        ## WEB 协议（HTTP/HTTPS）
        --web-protocol)
            if [ $2 ]; then
                case $2 in
                http | https | HTTP | HTTPS)
                    WEB_PROTOCOL="$2"
                    shift
                    ;;
                *)
                    Output_Error "检测到 ${BLUE}$2${PLAIN} 为无效参数值，请在该参数后指定 http 或 https 作为参数值！"
                    ;;
                esac
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定 WEB 协议（HTTP/HTTPS）！"
            fi
            ;;
        ## 安装 EPEL 附加软件包
        --install-epel)
            if [ $2 ]; then
                case $2 in
                [Tt]rue | [Ff]alse)
                    INSTALL_EPEL="${2,,}"
                    shift
                    ;;
                *)
                    Output_Error "检测到 ${BLUE}$2${PLAIN} 为无效参数值，请在该参数后指定 true 或 false 作为参数值！"
                    ;;
                esac
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定 true 或 false 作为参数值！"
            fi
            ;;
        --only-epel)
            ONLY_EPEL="true"
            INSTALL_EPEL="true"
            ;;
        ## 备份原有软件源
        --backup)
            if [ $2 ]; then
                case $2 in
                [Tt]rue | [Ff]alse)
                    BACKUP="${2,,}"
                    shift
                    ;;
                *)
                    Output_Error "检测到 ${BLUE}$2${PLAIN} 为无效参数值，请在该参数后指定 true 或 false 作为参数值！"
                    ;;
                esac
            else
                Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请在该参数后指定 true 或 false 作为参数值！"
            fi
            ;;
        ## 忽略覆盖备份提示
        --ignore-backup-tips)
            IGNORE_BACKUP_TIPS="true"
            ;;
        --help)
            Output_Help_Info
            exit
            ;;
        *)
            Output_Error "检测到 ${BLUE}$1${PLAIN} 为无效参数，请确认后重新输入！"
            ;;
        esac
        shift
    done
    ## 赋予部分命令参数默认值
    ONLY_EPEL="${ONLY_EPEL:-"false"}"
    BACKUP="${BACKUP:-"true"}"
    IGNORE_BACKUP_TIPS="${IGNORE_BACKUP_TIPS:-"false"}"
}

## 组合函数
function Combin_Function() {
    PermissionJudgment
    EnvJudgment
    CheckCommandOptions
    StartTitle
    ChooseMirrors
    ChooseWebProtocol
    ChooseInstallEPEL
    BackupOriginMirrors
    RemoveOriginMirrors
    ChangeMirrors
}

CommandOptions "$@"
Combin_Function
