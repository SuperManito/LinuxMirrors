#!/bin/bash
## Author: SuperManito
## Modified: 2022-06-05
## License: GPL-2.0
## Github: https://github.com/SuperManito/LinuxMirrors
## Gitee: https://gitee.com/SuperManito/LinuxMirrors

function AuthorSignature() {
    echo -e "\n${GREEN} ------------ 脚本执行结束 ------------ ${PLAIN}\n"
    echo -e '\033[0;1;35;95m┌─\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m─┐\033[0m'
    echo -e '\033[0;1;31;91m│\033[0m   \033[0;1;32;92m__\033[0;1;36;96m__\033[0;1;34;94m_\033[0m                       \033[0;1;34;94m__\033[0m  \033[0;1;31;91m__\033[0;1;33;93m_\033[0m            \033[0;1;33;93m_\033[0m \033[0;1;32;92m_\033[0;1;36;96m_\033[0m      \033[0;1;31;91m│\033[0m'
    echo -e '\033[0;1;33;93m│\033[0m  \033[0;1;32;92m/\033[0m \033[0;1;36;96m_\033[0;1;34;94m__\033[0;1;35;95m/_\033[0;1;31;91m_\033[0m  \033[0;1;33;93m_\033[0;1;32;92m__\033[0;1;36;96m__\033[0;1;34;94m_\033[0m  \033[0;1;35;95m_\033[0;1;31;91m__\033[0m  \033[0;1;32;92m__\033[0;1;36;96m__\033[0;1;34;94m_/\033[0m  \033[0;1;31;91m|/\033[0m  \033[0;1;32;92m/_\033[0;1;36;96m__\033[0m \033[0;1;34;94m_\033[0;1;35;95m__\033[0;1;31;91m__\033[0m  \033[0;1;32;92m(_\033[0;1;36;96m)\033[0m \033[0;1;34;94m/_\033[0;1;35;95m__\033[0;1;31;91m__\033[0m \033[0;1;33;93m│\033[0m'
    echo -e '\033[0;1;32;92m│\033[0m  \033[0;1;36;96m\\\033[0;1;34;94m__\033[0m \033[0;1;35;95m\\\033[0;1;31;91m/\033[0m \033[0;1;33;93m/\033[0m \033[0;1;32;92m/\033[0m \033[0;1;36;96m/\033[0m \033[0;1;34;94m__\033[0m \033[0;1;35;95m\\\033[0;1;31;91m/\033[0m \033[0;1;33;93m_\033[0m \033[0;1;32;92m\/\033[0m \033[0;1;36;96m_\033[0;1;34;94m__\033[0;1;35;95m/\033[0m \033[0;1;31;91m/|\033[0;1;33;93m_/\033[0m \033[0;1;32;92m/\033[0m \033[0;1;36;96m_\033[0;1;34;94m_\033[0m \033[0;1;35;95m`/\033[0m \033[0;1;31;91m_\033[0;1;33;93m_\033[0m \033[0;1;32;92m\/\033[0m \033[0;1;36;96m/\033[0m \033[0;1;34;94m_\033[0;1;35;95m_/\033[0m \033[0;1;31;91m_\033[0;1;33;93m_\033[0m \033[0;1;32;92m\│\033[0m'
    echo -e '\033[0;1;36;96m│\033[0m \033[0;1;34;94m__\033[0;1;35;95m_/\033[0m \033[0;1;31;91m/\033[0m \033[0;1;33;93m/\033[0;1;32;92m_/\033[0m \033[0;1;36;96m/\033[0m \033[0;1;34;94m/\033[0;1;35;95m_/\033[0m \033[0;1;31;91m/\033[0m  \033[0;1;32;92m__\033[0;1;36;96m/\033[0m \033[0;1;34;94m/\033[0m  \033[0;1;35;95m/\033[0m \033[0;1;31;91m/\033[0m  \033[0;1;32;92m/\033[0m \033[0;1;36;96m/\033[0m \033[0;1;34;94m/_\033[0;1;35;95m/\033[0m \033[0;1;31;91m/\033[0m \033[0;1;33;93m/\033[0m \033[0;1;32;92m/\033[0m \033[0;1;36;96m/\033[0m \033[0;1;34;94m/\033[0m \033[0;1;35;95m/_\033[0;1;31;91m/\033[0m \033[0;1;33;93m/_\033[0;1;32;92m/\033[0m \033[0;1;36;96m/│\033[0m'
    echo -e '\033[0;1;34;94m│/\033[0;1;35;95m__\033[0;1;31;91m__\033[0;1;33;93m/\\\033[0;1;32;92m__\033[0;1;36;96m,_\033[0;1;34;94m/\033[0m \033[0;1;35;95m._\033[0;1;31;91m__\033[0;1;33;93m/\\\033[0;1;32;92m__\033[0;1;36;96m_/\033[0;1;34;94m_/\033[0m  \033[0;1;31;91m/_\033[0;1;33;93m/\033[0m  \033[0;1;32;92m/\033[0;1;36;96m_/\033[0;1;34;94m\_\033[0;1;35;95m_,\033[0;1;31;91m_/\033[0;1;33;93m_/\033[0m \033[0;1;32;92m/\033[0;1;36;96m_/\033[0;1;34;94m_/\033[0;1;35;95m\_\033[0;1;31;91m_/\033[0;1;33;93m\_\033[0;1;32;92m__\033[0;1;36;96m_/\033[0m \033[0;1;34;94m│\033[0m'
    echo -e '\033[0;1;35;95m│\033[0m          \033[0;1;34;94m/\033[0;1;35;95m_/\033[0m                                               \033[0;1;35;95m│\033[0m'
    echo -e '\033[0;1;31;91m└─\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m──\033[0;1;33;93m──\033[0;1;32;92m──\033[0;1;36;96m──\033[0;1;34;94m──\033[0;1;35;95m──\033[0;1;31;91m─┘\033[0m\n'

    echo -e " \033[1;34m官方网站\033[0m https://supermanito.github.io/LinuxMirrors\n"
}

## 定义系统判定变量
DebianRelease="lsb_release"
ARCH=$(uname -m)
SYSTEM_DEBIAN="Debian"
SYSTEM_UBUNTU="Ubuntu"
SYSTEM_KALI="Kali"
SYSTEM_REDHAT="RedHat"
SYSTEM_RHEL="RedHat"
SYSTEM_CENTOS="CentOS"
SYSTEM_FEDORA="Fedora"

## 定义目录和文件
LinuxRelease=/etc/os-release
RedHatRelease=/etc/redhat-release
DebianVersion=/etc/debian_version
DebianSourceList=/etc/apt/sources.list
DebianExtendListDir=/etc/apt/sources.list.d
RedHatReposDir=/etc/yum.repos.d
SelinuxConfig=/etc/selinux/config

## 定义 Docker 相关变量
DockerSourceList=$DebianExtendListDir/docker.list
DockerRepo=$RedHatReposDir/download.docker.com_linux_*.repo
DockerDir=/etc/docker
DockerConfig=$DockerDir/daemon.json
DockerConfigBackup=$DockerDir/daemon.json.bak
DockerCompose=/usr/local/bin/docker-compose
DockerVersionFile=docker-version.txt
DockerCEVersionFile=docker-ce-version.txt
DockerCECLIVersionFile=docker-ce-cli-version.txt
PROXY_URL=https://ghproxy.com/
DOCKER_COMPOSE_VERSION=1.29.2
DOCKER_COMPOSE_DOWNLOAD_URL=https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64

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

## 组合函数
function Combin_Function() {
    PermissionJudgment
    NetWorkJudgment
    EnvJudgment
    ChooseMirrors
    InstallationEnvironment
    ConfigureDockerCEMirror
    DockerEngine
    DockerCompose
    ShowVersion
    AuthorSignature
}

## 系统判定变量
function EnvJudgment() {
    ## 判定当前系统基于 Debian or RedHat
    if [ -s $RedHatRelease ]; then
        SYSTEM_FACTIONS=${SYSTEM_REDHAT}
    elif [ -s $DebianVersion ]; then
        SYSTEM_FACTIONS=${SYSTEM_DEBIAN}
    else
        echo -e "\n$ERROR 无法判断当前运行环境，请先确认本脚本针对当前操作系统是否适配！\n"
        exit
    fi
    ## 定义系统名称
    SYSTEM_NAME=$(cat $LinuxRelease | grep -E "^NAME=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")
    ## 定义系统版本号
    SYSTEM_VERSION_NUMBER=$(cat $LinuxRelease | grep -E "VERSION_ID=" | awk -F '=' '{print$2}' | sed "s/[\'\"]//g")
    ## 判定系统名称、版本、版本号
    case ${SYSTEM_FACTIONS} in
    Debian)
        SYSTEM_JUDGMENT=$(${DebianRelease} -is)
        SYSTEM_VERSION=$(${DebianRelease} -cs)
        ;;
    RedHat)
        SYSTEM_JUDGMENT=$(cat $RedHatRelease | sed 's/ //g' | cut -c1-6)
        if [[ ${SYSTEM_JUDGMENT} = ${SYSTEM_CENTOS} || ${SYSTEM_JUDGMENT} = ${SYSTEM_RHEL} ]]; then
            CENTOS_VERSION=$(echo ${SYSTEM_VERSION_NUMBER} | cut -c1)
        else
            CENTOS_VERSION=""
        fi
        ;;
    esac
    ## 判定系统处理器架构
    case ${ARCH} in
    x86_64)
        SYSTEM_ARCH="x86_64"
        SOURCE_ARCH="amd64"
        ;;
    aarch64)
        SYSTEM_ARCH="ARM64"
        SOURCE_ARCH="arm64"
        ;;
    armv7l)
        SYSTEM_ARCH="ARMv7"
        SOURCE_ARCH="armhf"
        ;;
    armv6l)
        SYSTEM_ARCH="ARMv6"
        SOURCE_ARCH="armhf"
        ;;
    i386 | i686)
        SYSTEM_ARCH="x86_32"
        echo -e "\n${RED}---------- Docker Engine 不支持安装在 x86_32 架构的环境上！ ----------${PLAIN}\n"
        exit
        ;;
    *)
        SYSTEM_ARCH=${ARCH}
        SOURCE_ARCH=armhf
        ;;
    esac
    ## 定义软件源分支名称
    if [ ${SYSTEM_JUDGMENT} = ${SYSTEM_RHEL} ]; then
        SOURCE_BRANCH="centos"
    else
        SOURCE_BRANCH=${SYSTEM_JUDGMENT,,}
    fi
    ## 定义软件源同步/更新文字
    case ${SYSTEM_FACTIONS} in
    Debian)
        SYNC_TXT="更新"
        ;;
    RedHat)
        SYNC_TXT="同步"
        ;;
    esac
}

## 基础环境判断
function PermissionJudgment() {
    if [ $UID -ne 0 ]; then
        echo -e "\n$ERROR 权限不足，请使用 Root 用户\n"
        exit
    fi
}
function NetWorkJudgment() {
    ping -c 1 www.baidu.com >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "\n${RED} ----- Network connection error, please check the network environment and try again later! ----- ${PLAIN}\n"
        exit
    fi
}

## 关闭防火墙
function CloseFirewall() {
    if [[ $(systemctl is-active firewalld) == "active" ]]; then
        systemctl disable --now firewalld >/dev/null 2>&1
        [ -s $SelinuxConfig ] && sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" $SelinuxConfig && setenforce 0 >/dev/null 2>&1
    fi
}

## 安装环境包
function InstallationEnvironment() {
    case ${SYSTEM_FACTIONS} in
    Debian)
        sed -i '/docker-ce/d' $DebianSourceList
        rm -rf $DockerSourceList
        ;;
    RedHat)
        rm -rf $DockerRepo
        ;;
    esac
    echo -e "${WORKING} 开始${SYNC_TXT}软件源...\n"
    case ${SYSTEM_FACTIONS} in
    Debian)
        apt-get update
        ;;
    RedHat)
        yum makecache
        ;;
    esac
    VERIFICATION_SOURCESYNC=$?
    if [ ${VERIFICATION_SOURCESYNC} -ne 0 ]; then
        echo -e "\n$ERROR 软件源${SYNC_TXT}出错，请先确保软件包管理工具可用！\n"
        exit
    fi
    echo -e "\n$COMPLETE 软件源${SYNC_TXT}结束\n"
    case ${SYSTEM_FACTIONS} in
    Debian)
        apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
        ;;
    RedHat)
        yum install -y yum-utils device-mapper-persistent-data lvm2
        ;;
    esac

}

## 卸载旧版本的 Docker Engine
function RemoveOldVersion() {
    systemctl disable --now docker >/dev/null 2>&1
    sleep 2s
    case ${SYSTEM_FACTIONS} in
    Debian)
        apt-get remove -y docker-ce docker-ce-cli containerd.io runc >/dev/null 2>&1
        apt-get autoremove -y >/dev/null 2>&1
        ;;
    RedHat)
        yum remove -y docker-ce docker-ce-cli containerd.io podman* runc >/dev/null 2>&1
        yum autoremove -y >/dev/null 2>&1
        ;;
    esac
}

## 配置 Docker CE 源
function ConfigureDockerCEMirror() {
    if [[ ${DOCKER_VERSION_INSTALL_LATEST} == "True" ]]; then
        SOURCE_JUDGMENT=${SOURCE}
    else
        SOURCE_JUDGMENT="download.docker.com"
    fi

    case ${SYSTEM_FACTIONS} in
    Debian)
        if [ ${SYSTEM_JUDGMENT} = ${SYSTEM_KALI} ]; then
            curl -fsSL https://${SOURCE_JUDGMENT}/linux/debian/gpg | apt-key add - >/dev/null 2>&1
        else
            curl -fsSL https://${SOURCE_JUDGMENT}/linux/${SOURCE_BRANCH}/gpg | apt-key add - >/dev/null 2>&1
        fi
        echo "deb [arch=${SOURCE_ARCH}] https://${SOURCE_JUDGMENT}/linux/${SOURCE_BRANCH} ${SYSTEM_VERSION} stable" | tee $DockerSourceList >/dev/null 2>&1
        if [ ${SYSTEM_JUDGMENT} = ${SYSTEM_KALI} ]; then
            sed -i "s/${SYSTEM_VERSION}/buster/g" $DockerSourceList
            sed -i "s/${SOURCE_BRANCH}/debian/g" $DockerSourceList
        fi
        apt-get update >/dev/null 2>&1
        ;;
    RedHat)
        yum-config-manager -y --add-repo https://${SOURCE_JUDGMENT}/linux/${SOURCE_BRANCH}/docker-ce.repo
        yum makecache >/dev/null 2>&1
        ;;
    esac
}

## 安装 Docker Engine
function DockerEngine() {

    ## 导出可安装的版本列表
    function Export_VersionList() {
        case ${SYSTEM_FACTIONS} in
        Debian)
            apt-cache madison docker-ce | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9][0-9].[0-9]{1,2}" >$DockerCEVersionFile
            apt-cache madison docker-ce-cli | awk '{print $3}' | grep -Eo "[0-9][0-9].[0-9][0-9].[0-9]{1,2}" >$DockerCECLIVersionFile
            grep -wf $DockerCEVersionFile $DockerCECLIVersionFile >$DockerVersionFile
            ;;
        RedHat)
            yum list docker-ce --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9][0-9].[0-9]{1,2}" >$DockerCEVersionFile
            yum list docker-ce-cli --showduplicates | sort -r | awk '{print $2}' | grep -Eo "[0-9][0-9].[0-9][0-9].[0-9]{1,2}" >$DockerCECLIVersionFile
            grep -wf $DockerCEVersionFile $DockerCECLIVersionFile >$DockerVersionFile
            ;;
        esac
        rm -rf $DockerCEVersionFile $DockerCECLIVersionFile
    }

    ## 安装
    function Install() {
        if [[ ${DOCKER_VERSION_INSTALL_LATEST} == "True" ]]; then
            case ${SYSTEM_FACTIONS} in
            Debian)
                apt-get install -y docker-ce docker-ce-cli containerd.io
                ;;
            RedHat)
                yum install -y docker-ce docker-ce-cli containerd.io
                ;;
            esac
        else
            Export_VersionList
            echo -e "\n${GREEN} --------- 请选择你要安装的版本，如：19.03.15 ---------- ${PLAIN}\n"
            cat $DockerVersionFile
            echo -e '\n注：以上可供选择的安装版本由官方源提供，若系统过新可能无法安装较旧的版本'
            while true; do
                CHOICE_F=$(echo -e "\n${BOLD}└─ 请根据上面的列表，输入你想要安装的具体版本号：${PLAIN}\n")
                read -p "${CHOICE_F}" DOCKER_VERSION
                echo ''
                cat $DockerVersionFile | grep -Ew "${DOCKER_VERSION}" >/dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo ${DOCKER_VERSION} | grep -Ew '[1,2][0,8,9].[0,1][0-9].[0-9]{1,2}' >/dev/null 2>&1
                    if [ $? -eq 0 ]; then
                        rm -rf $DockerVersionFile
                        break
                    else
                        echo -e "$ERROR 请输入正确的版本号！"
                    fi
                else
                    echo -e "$ERROR 输入错误请重新输入！"
                fi
            done
            case ${SYSTEM_FACTIONS} in
            Debian)
                CheckVersion=$(echo ${DOCKER_VERSION} | cut -c1-2)
                CheckSubversion=$(echo ${DOCKER_VERSION} | cut -c4-5)
                case ${CheckVersion} in
                21 | 20 | 19)
                    INSTALL_JUDGMENT="5:"
                    ;;
                18)
                    if [ ${CheckSubversion} == "09" ]; then
                        INSTALL_JUDGMENT="5:"
                    else
                        INSTALL_JUDGMENT=""
                    fi
                    ;;
                *)
                    INSTALL_JUDGMENT=""
                    ;;
                esac
                apt-get install -y docker-ce=${INSTALL_JUDGMENT}${DOCKER_VERSION}* docker-ce-cli=5:${DOCKER_VERSION}* containerd.io
                ;;
            RedHat)
                yum install -y docker-ce-${DOCKER_VERSION} docker-ce-cli-${DOCKER_VERSION} containerd.io
                ;;
            esac
        fi
    }

    ## 修改 Docker Hub 源
    function ConfigureMirror() {
        if [[ ${REGISTRY_SOURCE_OFFICIAL} == "False" ]]; then
            if [ -d $DockerDir ] && [ -e $DockerConfig ]; then
                if [ -e $DockerConfigBackup ]; then
                    CHOICE_BACKUP=$(echo -e "\n${BOLD}└─ 检测到已备份的 Docker 配置文件，是否覆盖备份? [Y/n] ${PLAIN}")
                    read -p "${CHOICE_BACKUP}" INPUT
                    [ -z ${INPUT} ] && INPUT=Y
                    case $INPUT in
                    [Yy] | [Yy][Ee][Ss])
                        cp -rf $DockerConfig $DockerConfigBackup >/dev/null 2>&1
                        ;;
                    [Nn] | [Nn][Oo]) ;;
                    *)
                        echo -e "\n$WARN 输入错误，默认不覆盖！"
                        ;;
                    esac
                else
                    cp -rf $DockerConfig $DockerConfigBackup >/dev/null 2>&1
                    echo -e "\n$COMPLETE 已备份原有 Docker 配置文件至 $DockerConfigBackup\n"
                fi
                sleep 2s
            else
                mkdir -p $DockerDir >/dev/null 2>&1
                touch $DockerConfig
            fi
            echo -e '{\n  "registry-mirrors": ["https://SOURCE"]\n}' >$DockerConfig
            sed -i "s/SOURCE/$REGISTRY_SOURCE/g" $DockerConfig
            systemctl daemon-reload
        fi
    }

    ## 判定是否已安装
    case ${SYSTEM_FACTIONS} in
    Debian)
        dpkg -l | grep docker-ce-cli -q
        ;;
    RedHat)
        rpm -qa | grep docker-ce-cli -q
        ;;
    esac
    if [ $? -eq 0 ]; then
        Export_VersionList
        DOCKER_INSTALLED_VERSION=$(docker -v | grep -Eo "[0-9][0-9].[0-9][0-9].[0-9]{1,2}")
        DOCKER_VERSION_LATEST=$(cat $DockerVersionFile | head -n 1)
        if [[ ${DOCKER_INSTALLED_VERSION} == ${DOCKER_VERSION_LATEST} ]]; then
            if [[ ${DOCKER_VERSION_INSTALL_LATEST} == "True" ]]; then
                echo -e "\n$COMPLETE 检测到已安装最新版本的 Docker Engine，跳过安装"
                ConfigureMirror
                if [[ $(systemctl is-active docker) == "active" ]]; then
                    systemctl restart docker
                fi
                echo ''
                systemctl enable --now docker >/dev/null 2>&1
                DockerCompose
                ShowVersion
                AuthorSignature
                exit
            else
                CHOICE_E=$(echo -e "\n${BOLD}└─ 检测到已安装最新版本的 Docker Engine，是否继续安装其它版本? [Y/n] ${PLAIN}")
            fi
        else
            if [[ ${DOCKER_VERSION_INSTALL_LATEST} == "True" ]]; then
                CHOICE_E=$(echo -e "\n${BOLD}└─ 检测到已安装旧版本的 Docker Engine，是否覆盖安装为最新版本? [Y/n] ${PLAIN}")
            else
                CHOICE_E=$(echo -e "\n${BOLD}└─ 检测到已安装旧版本的 Docker Engine，是否继续安装其它版本? [Y/n] ${PLAIN}")
            fi
        fi
        read -p "${CHOICE_E}" INPUT
        [ -z ${INPUT} ] && INPUT=Y
        case $INPUT in
        [Yy] | [Yy][Ee][Ss])
            echo -en "\n${WORKING} 正在卸载之前的版本..."
            RemoveOldVersion
            echo -e "\n\n$COMPLETE 卸载完毕\n"
            Install
            ;;
        [Nn] | [Nn][Oo]) ;;
        *)
            echo -e "\n$WARN 输入错误，默认不覆盖安装！\n"
            ;;
        esac
        rm -rf $DockerVersionFile
    else
        RemoveOldVersion
        Install
    fi
    ConfigureMirror
    systemctl stop docker >/dev/null 2>&1
    systemctl enable --now docker >/dev/null 2>&1
}

## 安装 Docker Compose
function DockerCompose() {
    if [[ ${DOCKER_COMPOSE} == "True" ]]; then
        [ -e $DockerCompose ] && rm -rf $DockerCompose
        if [[ ${ARCH} == "x86_64" ]]; then
            echo -e ''
            if [ ${DOCKER_COMPOSE_DOWNLOAD_PROXY} == "True" ]; then
                curl -L ${PROXY_URL}${DOCKER_COMPOSE_DOWNLOAD_URL} -o $DockerCompose
            else
                curl -L ${DOCKER_COMPOSE_DOWNLOAD_URL} -o $DockerCompose
            fi
            chmod +x $DockerCompose
        else
            echo -e "\n${WORKING} 由于本机非 x86 架构，开始通过 pip3 安装 Docker Compose ...\n"
            if [ ${SYSTEM_FACTIONS} = ${SYSTEM_DEBIAN} ]; then
                apt-get install -y python3-pip python3-dev gcc libffi-dev openssl >/dev/null 2>&1
            elif [ ${SYSTEM_FACTIONS} = ${SYSTEM_REDHAT} ]; then
                yum install -y python3-pip python3-devel gcc libffi-devel openssl-devel >/dev/null 2>&1
            fi
            pip3 install --upgrade pip
            if [ ${DOCKER_COMPOSE_DOWNLOAD_PROXY} == "True" ]; then
                pip3 install -i https://mirrors.aliyun.com/pypi/simple docker-compose
            else
                pip3 install docker-compose
            fi
            [ $? -ne 0 ] && echo -e "\n$ERROR Docker Compose 安装失败\n\n检测到当前处理器架构为 ${ARCH} ，无法绝对保证安装成功，自行查看 pip 报错原因"
        fi
    fi
    echo -e ''
}

## 查看版本并验证安装结果
function ShowVersion() {
    echo -e "${WORKING} 验证安装版本...\n"
    docker -v
    VERIFICATION_DOCKER=$?
    [[ ${DOCKER_COMPOSE} == "True" ]] && docker-compose -v
    if [ ${VERIFICATION_DOCKER} -eq 0 ]; then
        echo -e "\n$COMPLETE 安装完成"
    else
        echo -e "\n$ERROR 安装失败"
        case ${SYSTEM_FACTIONS} in
        Debian)
            echo -e "\n检查源文件： cat $DockerSourceList"
            echo -e '请尝试手动执行安装命令： apt-get install -y docker-ce docker-ce-cli containerd.io\n'
            echo ''
            ;;
        RedHat)
            echo -e "\n检查源文件： cat $DockerRepo"
            echo -e '请尝试手动执行安装命令： yum install -y docker-ce docker-ce-cli containerd.io\n'
            ;;
        esac
        exit
    fi
    if [[ $(systemctl is-active docker) != "active" ]]; then
        sleep 2
        systemctl disable --now docker >/dev/null 2>&1
        sleep 2
        systemctl enable --now docker >/dev/null 2>&1
        sleep 2
        if [[ $(systemctl is-active docker) != "active" ]]; then
            echo -e "\n$ERROR 检测到 Docker 服务启动异常，可能由于重复安装相同版本导致"
            echo -e "\n请执行 systemctl start docker 或 service docker start 命令尝试启动"
            echo -e "\n官方安装文档：https://docs.docker.com/engine/install"
        fi
    fi
}

function ChooseMirrors() {
    clear
    echo -e '+---------------------------------------------------+'
    echo -e '|                                                   |'
    echo -e '|   =============================================   |'
    echo -e '|                                                   |'
    echo -e '|            欢迎使用 Docker 一键安装脚本           |'
    echo -e '|                                                   |'
    echo -e '|   =============================================   |'
    echo -e '|                                                   |'
    echo -e '+---------------------------------------------------+'
    echo -e ''
    echo -e '#####################################################'
    echo -e ''
    echo -e '    提供以下 Docker CE 和 Docker Hub 源可供选择：'
    echo -e ''
    echo -e '#####################################################'
    echo -e ''
    echo -e ' Docker CE'
    echo -e ''
    echo -e ' ❖   阿里云           1)'
    echo -e ' ❖   腾讯云           2)'
    echo -e ' ❖   华为云           3)'
    echo -e ' ❖   Azure            4)'
    echo -e ' ❖   网易             5)'
    echo -e ' ❖   清华大学         6)'
    echo -e ' ❖   中科大           7)'
    echo -e ' ❖   官方             8)'
    echo -e ''
    echo -e ' Docker Hub'
    echo -e ''
    echo -e ' ❖   阿里云（北京）   1)'
    echo -e ' ❖   阿里云（杭州）   2)'
    echo -e ' ❖   阿里云（成都）   3)'
    echo -e ' ❖   阿里云（广州）   4)'
    echo -e ' ❖   阿里云（香港）   5)'
    echo -e ' ❖   腾讯云           6)'
    echo -e ' ❖   华为云           7)'
    echo -e ' ❖   Azure            8)'
    echo -e ' ❖   DaoCloud         9)'
    echo -e ' ❖   中科大          10)'
    echo -e ' ❖   谷歌云          11)'
    echo -e ' ❖   官方            12)'
    echo -e ''
    echo -e '#####################################################'
    echo -e ''
    echo -e "        运行环境  ${SYSTEM_NAME} ${SYSTEM_VERSION_NUMBER} ${SYSTEM_ARCH}"
    echo -e "        系统时间  $(date "+%Y-%m-%d %H:%M:%S")"
    echo -e ''
    echo -e '#####################################################'
    CHOICE_A=$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的 Docker CE 源 [ 1~8 ]：${PLAIN}")
    read -p "${CHOICE_A}" INPUT
    case $INPUT in
    1)
        SOURCE="mirrors.aliyun.com/docker-ce"
        ;;
    2)
        SOURCE="mirrors.tencent.com/docker-ce"
        ;;
    3)
        SOURCE="repo.huaweicloud.com/docker-ce"
        ;;
    4)
        SOURCE="mirror.azure.cn/docker-ce"
        ;;
    5)
        SOURCE="mirrors.163.com/docker-ce"
        ;;
    6)
        SOURCE="mirrors.tuna.tsinghua.edu.cn/docker-ce"
        ;;
    7)
        SOURCE="mirrors.ustc.edu.cn/docker-ce"
        ;;
    8)
        SOURCE="download.docker.com"
        ;;
    *)
        SOURCE="mirrors.aliyun.com/docker-ce"
        echo -e "\n$WARN 输入错误，默认使用阿里云！"
        sleep 1s
        ;;
    esac
    ## 是否手动选择安装版本
    CHOICE_C=$(echo -e "\n  ${BOLD}└─ 是否安装最新版本的 Docker Engine? [Y/n] ${PLAIN}")
    read -p "${CHOICE_C}" INPUT
    [ -z ${INPUT} ] && INPUT=Y
    case $INPUT in
    [Yy] | [Yy][Ee][Ss])
        DOCKER_VERSION_INSTALL_LATEST="True"
        ;;
    [Nn] | [Nn][Oo])
        DOCKER_VERSION_INSTALL_LATEST="False"
        if [ ${SOURCE} != "download.docker.com" ]; then
            echo -e "\n$WARN Docker CE 源已替换成官方源！"
        fi
        ;;
    *)
        DOCKER_VERSION_INSTALL_LATEST="True"
        echo -e "\n$WARN 输入错误，默认安装最新版本！"
        ;;
    esac
    CHOICE_B=$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的 Docker Hub 源 [ 1~12 ]：${PLAIN}")
    read -p "${CHOICE_B}" INPUT
    case $INPUT in
    1)
        REGISTRY_SOURCE="registry.cn-beijing.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    2)
        REGISTRY_SOURCE="registry.cn-hangzhou.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    3)
        REGISTRY_SOURCE="registry.cn-chengdu.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    4)
        REGISTRY_SOURCE="registry.cn-guangzhou.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    5)
        REGISTRY_SOURCE="registry.cn-hongkong.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    6)
        REGISTRY_SOURCE="mirror.ccs.tencentyun.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    7)
        REGISTRY_SOURCE="0bab0ef02500f24b0f31c00db79ffa00.mirror.swr.myhuaweicloud.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    8)
        REGISTRY_SOURCE="dockerhub.azk8s.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    9)
        REGISTRY_SOURCE="f1361db2.m.daocloud.io"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    10)
        REGISTRY_SOURCE="docker.mirrors.ustc.edu.cn"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    11)
        REGISTRY_SOURCE="gcr.io"
        REGISTRY_SOURCE_OFFICIAL="False"
        ;;
    12)
        REGISTRY_SOURCE="registry.docker-cn.com"
        REGISTRY_SOURCE_OFFICIAL="True"
        ;;
    *)
        REGISTRY_SOURCE="registry.cn-hangzhou.aliyuncs.com"
        REGISTRY_SOURCE_OFFICIAL="False"
        echo -e "\n$WARN 输入错误，默认使用 ${BLUE}阿里云（杭州）${PLAIN}！"
        sleep 1s
        ;;
    esac
    if [ -x $DockerCompose ]; then
        CHOICE_D=$(echo -e "\n${BOLD}└─ 检测到已安装 Docker Compose ，是否覆盖安装? [Y/n] ${PLAIN}")
    else
        CHOICE_D=$(echo -e "\n${BOLD}└─ 是否安装 Docker Compose? [Y/n] ${PLAIN}")
    fi
    read -p "${CHOICE_D}" INPUT
    [ -z ${INPUT} ] && INPUT=Y
    case $INPUT in
    [Yy] | [Yy][Ee][Ss])
        DOCKER_COMPOSE="True"
        CHOICE_D1=$(echo -e "\n  ${BOLD}└─ 是否使用国内代理进行下载? [Y/n] ${PLAIN}")
        read -p "${CHOICE_D1}" INPUT
        [ -z ${INPUT} ] && INPUT=Y
        case $INPUT in
        [Yy] | [Yy][Ee][Ss])
            DOCKER_COMPOSE_DOWNLOAD_PROXY="True"
            ;;
        [Nn] | [Nn][Oo])
            DOCKER_COMPOSE_DOWNLOAD_PROXY="False"
            ;;
        *)
            DOCKER_COMPOSE_DOWNLOAD_PROXY="False"
            echo -e "\n$WARN 输入错误，默认不使用！\n"
            ;;
        esac
        ;;
    [Nn] | [Nn][Oo])
        DOCKER_COMPOSE="False"
        ;;
    *)
        DOCKER_COMPOSE="False"
        echo -e "\n$WARN 输入错误，默认不安装！\n"
        ;;
    esac
    echo -e ''

    [ ${SYSTEM_FACTIONS} == ${SYSTEM_REDHAT} ] && CloseFirewall
}

Combin_Function
