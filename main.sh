#!/bin/bash
## Author: SuperManito
## Modified: 2025-10-09
## License: MIT
## GitHub: https://github.com/SuperManito/LinuxMirrors
## Website: https://linuxmirrors.cn

## 定制方法
# 只需要在头部（此处）定义全局变量即可，具体详见官网文档，简单写几个例子
# SOURCE="www.example.com"  # 指定软件源地址
# BRANCH="branch"           # 指定软件源仓库
# WEB_PROTOCOL="https"      # 指定 WEB 协议

## 软件源列表
# 国内格式："名称@地址"
mirror_list_default=(
    "阿里云@mirrors.aliyun.com"
    "腾讯云@mirrors.tencent.com"
    "华为云@mirrors.huaweicloud.com"
    "网易@mirrors.163.com"
    "火山引擎@mirrors.volces.com"
    "清华大学@mirrors.tuna.tsinghua.edu.cn"
    "北京大学@mirrors.pku.edu.cn"
    "浙江大学@mirrors.zju.edu.cn"
    "南京大学@mirrors.nju.edu.cn"
    "兰州大学@mirror.lzu.edu.cn"
    "上海交通大学@mirror.sjtu.edu.cn"
    "重庆邮电大学@mirrors.cqupt.edu.cn"
    "中国科学技术大学@mirrors.ustc.edu.cn"
    "中国科学院软件研究所@mirror.iscas.ac.cn"
    "官方源@__OFFICIAL_SOURCE_TAG__"
)
# 中国大陆教育网格式："名称@地址"
mirror_list_edu=(
    "北京大学@mirrors.pku.edu.cn"
    "北京交通大学@mirror.bjtu.edu.cn"
    "北京外国语大学@mirrors.bfsu.edu.cn"
    "北京邮电大学@mirrors.bupt.edu.cn"
    "重庆大学@mirrors.cqu.edu.cn"
    "重庆邮电大学@mirrors.cqupt.edu.cn"
    "大连东软信息学院@mirrors.neusoft.edu.cn"
    "电子科技大学@mirrors.uestc.cn"
    "华南农业大学@mirrors.scau.edu.cn"
    "华中科技大学@mirrors.hust.edu.cn"
    "吉林大学@mirrors.jlu.edu.cn"
    "荆楚理工学院@mirrors.jcut.edu.cn"
    "江西理工大学@mirrors.jxust.edu.cn"
    "兰州大学@mirror.lzu.edu.cn"
    "南京大学@mirrors.nju.edu.cn"
    "南京工业大学@mirrors.njtech.edu.cn"
    "南京邮电大学@mirrors.njupt.edu.cn"
    "南方科技大学@mirrors.sustech.edu.cn"
    "南阳理工学院@mirror.nyist.edu.cn"
    "齐鲁工业大学@mirrors.qlu.edu.cn"
    "清华大学@mirrors.tuna.tsinghua.edu.cn"
    "山东大学@mirrors.sdu.edu.cn"
    "上海科技大学@mirrors.shanghaitech.edu.cn"
    "上海交通大学（思源）@mirror.sjtu.edu.cn"
    "上海交通大学（致远）@mirrors.sjtug.sjtu.edu.cn"
    "武昌首义学院@mirrors.wsyu.edu.cn"
    "西安交通大学@mirrors.xjtu.edu.cn"
    "西北农林科技大学@mirrors.nwafu.edu.cn"
    "浙江大学@mirrors.zju.edu.cn"
    "中国科学技术大学@mirrors.ustc.edu.cn"
    "官方源@__OFFICIAL_SOURCE_TAG__"
)
# 海外格式："洲 · 名称 · 国家/地区@地址"，修改前请先前往官网阅读添加规范
mirror_list_abroad=(
    "亚洲 · xTom · 香港@mirrors.xtom.hk"
    "亚洲 · 01Link · 香港@mirror.01link.hk"
    "亚洲 · 新加坡国立大学(NUS) · 新加坡@download.nus.edu.sg/mirror"
    "亚洲 · SG.GS · 新加坡@mirror.sg.gs"
    "亚洲 · xTom · 新加坡@mirrors.xtom.sg"
    "亚洲 · 自由软件实验室(NCHC) · 台湾@free.nchc.org.tw"
    "亚洲 · OSS Planet · 台湾@mirror.ossplanet.net"
    "亚洲 · 国立阳明交通大学 · 台湾@linux.cs.nctu.edu.tw"
    "亚洲 · 淡江大学 · 台湾@ftp.tku.edu.tw"
    "亚洲 · AniGil Linux Archive · 韩国@mirror.anigil.com"
    "亚洲 · 工业网络安全中心(ICSCoE) · 日本@ftp.udx.icscoe.jp/Linux"
    "亚洲 · 北陆先端科学技术大学院大学(JAIST) · 日本@ftp.jaist.ac.jp/pub/Linux"
    "亚洲 · 山形大学 · 日本@linux2.yz.yamagata-u.ac.jp/pub/Linux"
    "亚洲 · xTom · 日本@mirrors.xtom.jp"
    "亚洲 · GB Network Solutions · 马来西亚@mirrors.gbnetwork.com"
    "亚洲 · 孔敬大学 · 泰国@mirror.kku.ac.th"
    "欧洲 · Vorboss Ltd · 英国@mirror.vorboss.net"
    "欧洲 · QuickHost · 英国@mirror.quickhost.uk"
    "欧洲 · dogado · 德国@mirror.dogado.de"
    "欧洲 · xTom · 德国@mirrors.xtom.de"
    "欧洲 · 亚琛工业大学(RWTH Aachen) · 德国@ftp.halifax.rwth-aachen.de"
    "欧洲 · 德累斯顿大学(AG DSN) · 德国@ftp.agdsn.de"
    "欧洲 · CCIN2P3 · 法国@mirror.in2p3.fr/pub/linux"
    "欧洲 · Ircam · 法国@mirrors.ircam.fr/pub"
    "欧洲 · Crans · 法国@eclats.crans.org"
    "欧洲 · CRIHAN · 法国@ftp.crihan.fr"
    "欧洲 · xTom · 荷兰@mirrors.xtom.nl"
    "欧洲 · DataPacket · 荷兰@mirror.datapacket.com"
    "欧洲 · Linux Kernel · 荷兰@eu.edge.kernel.org"
    "欧洲 · xTom · 爱沙尼亚@mirrors.xtom.ee"
    "欧洲 · netsite · 丹麦@mirror.netsite.dk"
    "欧洲 · Dotsrc · 丹麦@mirrors.dotsrc.org"
    "欧洲 · Academic Computer Club · 瑞典@mirror.accum.se"
    "欧洲 · Lysator · 瑞典@ftp.lysator.liu.se"
    "欧洲 · Yandex · 俄罗斯@mirror.yandex.ru"
    "欧洲 · ia64 · 俄罗斯@mirror.linux-ia64.org"
    "欧洲 · Truenetwork · 俄罗斯@mirror.truenetwork.ru"
    "欧洲 · Belgian Research Network · 比利时@ftp.belnet.be/mirror"
    "欧洲 · 克里特大学计算机中心 · 希腊@ftp.cc.uoc.gr/mirrors/linux"
    "欧洲 · 马萨里克大学信息学院 · 捷克@ftp.fi.muni.cz/pub/linux"
    "欧洲 · 捷克理工大学学生会俱乐部(Silicon Hill) · 捷克@ftp.sh.cvut.cz"
    "欧洲 · Vodafone · 捷克@mirror.karneval.cz/pub/linux"
    "欧洲 · CZ.NIC · 捷克@mirrors.nic.cz"
    "欧洲 · 苏黎世联邦理工学院 · 瑞士@mirror.ethz.ch"
    "北美 · Linux Kernel · 美国@mirrors.kernel.org"
    "北美 · 麻省理工学院(MIT) · 美国@mirrors.mit.edu"
    "北美 · 普林斯顿大学数学系 · 美国@mirror.math.princeton.edu/pub"
    "北美 · 俄勒冈州立大学开源实验室 · 美国@ftp-chi.osuosl.org/pub"
    "北美 · Fremont Cabal Internet Exchange(FCIX) · 美国@mirror.fcix.net"
    "北美 · xTom · 美国@mirrors.xtom.com"
    "北美 · Steadfast · 美国@mirror.steadfast.net"
    "北美 · 不列颠哥伦比亚大学 · 加拿大@mirror.it.ubc.ca"
    "北美 · GoCodeIT · 加拿大@mirror.xenyth.net"
    "北美 · Switch · 加拿大@mirrors.switch.ca"
    "南美 · PoP-SC · 巴西@mirror.pop-sc.rnp.br/mirror"
    "南美 · 蓬塔格罗萨州立大学 · 巴西@mirror.uepg.br"
    "南美 · UFSCar · 巴西@mirror.ufscar.br"
    "南美 · Sysarmy Community · 阿根廷@mirrors.eze.sysarmy.com"
    "大洋 · Fremont Cabal Internet Exchange(FCIX) · 澳大利亚@gsl-syd.mm.fcix.net"
    "大洋 · AARNet · 澳大利亚@mirror.aarnet.edu.au/pub"
    "大洋 · DataMossa · 澳大利亚@mirror.datamossa.io"
    "大洋 · Amaze · 澳大利亚@mirror.amaze.com.au"
    "大洋 · xTom · 澳大利亚@mirrors.xtom.au"
    "大洋 · Over the Wire · 澳大利亚@mirror.overthewire.com.au"
    "大洋 · Free Software Mirror Group · 新西兰@mirror.fsmg.org.nz"
    "非洲 · Liquid Telecom · 肯尼亚@mirror.liquidtelecom.com"
    "非洲 · Dimension Data · 南非@mirror.dimensiondata.com"
    "官方源@__OFFICIAL_SOURCE_TAG__"
)

## 配置需要区分公网地址和内网地址的软件源（不分地域）
# 需要同时在两个数组变量中分别定义软件源地址，并且保证排列顺序一致
# 软件源公网地址列表
mirror_list_extranet=(
    "mirrors.aliyun.com"
    "mirrors.tencent.com"
    "mirrors.huaweicloud.com"
    "mirrors.volces.com"
)
# 软件源内网地址列表
mirror_list_intranet=(
    "mirrors.cloud.aliyuncs.com"
    "mirrors.tencentyun.com"
    "mirrors.myhuaweicloud.com"
    "mirrors.ivolces.com"
)

## 赞助商广告
SPONSOR_ADS=(
    "1Panel · Linux 面板｜极简运维 ➜  \033[3mhttps://1panel.cn\033[0m"
    "多途云 · 智能化防护，每一次连接皆在安全之下 ➜  \033[3mhttps://www.duotuyun.com\033[0m"
    "毫秒镜像 · 专为中国开发者提供Docker镜像加速下载服务 ➜  \033[3mhttps://1ms.run\033[0m"
    "不死鸟CDN · 香港日本高防CDN，免实名/免备案，轻松阻断DDOS/CC攻击 ➜  \033[3mhttps://www.bsncdn.org\033[0m"
    "青叶云 · 香港1T高防｜自助防火墙，无视CC｜大带宽回国优化线路 ➜  \033[3mhttps://www.qingyeyun.com\033[0m"
    "莱卡云 · 专业云计算服务器提供商 ➜  \033[3m https://www.lcayun.com\033[0m"
    "云悠YUNYOO · 全球高性价比云服务器｜低至15.99元起 ➜  \033[3mhttps://yunyoo.cc\033[0m"
    "速拓云 · 国内高防云28元/月｜香港云100M优化线路9元/月 ➜  \033[3mhttps://www.sutuoyun.com\033[0m"
    "林枫云 · 专注独立IP高频VPS｜R9/i9系列定制 ➜  \033[3mhttps://www.dkdun.cn\033[0m"
    "语鹿云盾 · 专业CDN加速、防御，亚太百兆三网优化CDN低至9元起 ➜  \033[3mhttps://www.lucdn.cn\033[0m"
    "不二云 · 国内外建站快响应服务器的不二之选 ➜  \033[3mhttps://cb2.cn\033[0m"
    "HKGserver · 全球家宽｜双ISP｜住宅原生云服务器54元/月起 ➜  \033[3mhttps://www.hkgserver.com\033[0m"
    "浪浪云 · BGP网络让每一次连接都纵享丝滑，明码标价、无套路续费 ➜  \033[3mhttps://langlangy.cn\033[0m"
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
File_openKylinVersion=/etc/kylin-version/kylin-system-version.conf
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
File_ProxmoxAPLInfo=/usr/share/perl5/PVE/APLInfo.pm
File_LinuxMintSourceList=$Dir_AptAdditionalSources/official-package-repositories.list
File_LinuxMintSourceListBackup=$File_LinuxMintSourceList.bak
File_RaspberryPiSourceList=$Dir_AptAdditionalSources/raspi.list
File_RaspberryPiSourceListBackup=$File_RaspberryPiSourceList.bak
File_PacmanMirrorList=/etc/pacman.d/mirrorlist
File_PacmanMirrorListBackup=$File_PacmanMirrorList.bak
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
WARN="\033[1;43m 警告 ${PLAIN}"
ERROR="\033[1;31m✘${PLAIN}"
FAIL="\033[1;31m✘${PLAIN}"
TIP="\033[1;44m 提示 ${PLAIN}"
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
    function output_command_help() {
        echo -e "\n命令选项(名称/含义/值)：

  --abroad                     使用境外以及海外软件源                                             无
  --edu                        使用中国大陆教育网软件源                                           无
  --source                     指定软件源地址(域名或IP)                                           地址
  --source-epel                指定 EPEL 附加软件包仓库的软件源地址(域名或IP)                     地址
  --source-security            指定 Debian / Ubuntu 系统 security 仓库的软件源地址(域名或IP)      地址
  --source-vault               指定 CentOS / AlmaLinux 系统 vault 仓库的软件源地址(域名或IP)      地址
  --source-portage             指定 Gentoo 系统 portage 仓库的软件源地址(域名或IP)                地址
  --source-base-system         指定 Linux Mint / Raspberry Pi OS 底层系统的软件源地址(域名或IP)   地址
  --branch                     指定软件源仓库(路径)                                               仓库名
  --branch-epel                指定 EPEL 附加软件包仓库的软件源仓库(路径)                         仓库名
  --branch-security            指定 Debian 系统 security 仓库的软件源仓库(路径)                   仓库名
  --branch-vault               指定 CentOS / AlmaLinux 系统 vault 仓库的软件源仓库(路径)          仓库名
  --branch-portage             指定 Gentoo 系统 portage 仓库的软件源仓库(路径)                    仓库名
  --branch-base-system	       指定 Linux Mint / Raspberry Pi OS 底层系统的软件源仓库(路径)       仓库名
  --codename                   指定 Debian 系 / openKylin 操作系统的版本代号                      代号名称
  --protocol                   指定 WEB 协议                                                      http 或 https
  --use-intranet-source        是否优先使用内网软件源地址                                         true 或 false
  --use-official-source        是否使用目标操作系统的官方软件源                                   true 或 false
  --use-official-source-epel   是否使用 EPEL 附加软件包的官方软件源                               true 或 false
  --install-epel               是否安装 EPEL 附加软件包                                           true 或 false
  --backup                     是否备份原有软件源                                                 true 或 false
  --upgrade-software           是否更新软件包                                                     true 或 false
  --clean-cache                是否在更新软件包后清理下载缓存                                     true 或 false
  --clean-screen               是否在运行前清除屏幕上的所有内容                                   true 或 false
  --only-epel                  仅更换 EPEL 软件源模式                                             无
  --ignore-backup-tips         忽略覆盖备份提示                                                   无
  --print-diff                 打印源文件修改前后差异                                             无
  --pure-mode                  纯净模式，精简打印内容                                             无

问题报告 https://github.com/SuperManito/LinuxMirrors/issues\n"
    }

    while [ $# -gt 0 ]; do
        case "$1" in
        ## 海外模式
        --abroad)
            USE_ABROAD_SOURCE="true"
            ;;
        ## 中国大陆教育网模式
        --edu)
            USE_EDU_SOURCE="true"
            ;;
        ## 指定软件源地址
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
        --source-epel)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_EPEL="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        --source-security)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_SECURITY="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        --source-vault)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_VAULT="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        --source-portage)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_PORTAGE="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        --source-base-system)
            if [ "$2" ]; then
                echo "$2" | grep -Eq "\(|\)|\[|\]|\{|\}"
                if [ $? -eq 0 ]; then
                    command_error "$2" "有效的地址"
                else
                    SOURCE_BASE_SYSTEM="$(echo "$2" | sed -e 's,^http[s]\?://,,g' -e 's,/$,,')"
                    shift
                fi
            else
                command_error "$1" "软件源地址"
            fi
            ;;
        ## 指定软件源仓库
        --branch)
            if [ "$2" ]; then
                SOURCE_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        --branch-epel)
            if [ "$2" ]; then
                SOURCE_EPEL_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        --branch-security)
            if [ "$2" ]; then
                SOURCE_SECURITY_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        --branch-vault)
            if [ "$2" ]; then
                SOURCE_VAULT_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        --branch-portage)
            if [ "$2" ]; then
                SOURCE_PORTAGE_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        --branch-base-system)
            if [ "$2" ]; then
                SOURCE_BASE_SYSTEM_BRANCH="$2"
                shift
            else
                command_error "$1" "软件源仓库"
            fi
            ;;
        ## 指定 Debian 系操作系统的版本代号
        --codename)
            if [ "$2" ]; then
                DEBIAN_CODENAME="$2"
                shift
            else
                command_error "$1" "版本代号"
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
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
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
                    command_error "$2" " true 或 false "
                    ;;
                esac
            else
                command_error "$1" " true 或 false "
            fi
            ;;
        ## 使用内网地址
        --intranet | --use-intranet-source)
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
        ## WEB 协议（HTTP/HTTPS）
        --protocol | --web-protocol)
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
        ## 安装 EPEL 附加软件包
        --install-epel)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    INSTALL_EPEL="${2,,}"
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
        ## 更新软件包
        --upgrade-software | --updata-software)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    UPGRADE_SOFTWARE="${2,,}"
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
        ## 在更新软件包后清理下载缓存
        --clean-cache)
            if [ "$2" ]; then
                case "$2" in
                [Tt]rue | [Ff]alse)
                    CLEAN_CACHE="${2,,}"
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
    ONLY_EPEL="${ONLY_EPEL:-"false"}"
    BACKUP="${BACKUP:-"true"}"
    USE_OFFICIAL_SOURCE="${USE_OFFICIAL_SOURCE:-"false"}"
    IGNORE_BACKUP_TIPS="${IGNORE_BACKUP_TIPS:-"false"}"
    PRINT_DIFF="${PRINT_DIFF:-"false"}"
    PURE_MODE="${PURE_MODE:-"false"}"
}

function run_start() {
    if [ -z "${CLEAN_SCREEN}" ]; then
        [ -z "${SOURCE}" ] && clear
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
    echo -e "欢迎使用 GNU/Linux 更换系统软件源脚本"
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
    output_error "不支持当前操作系统（$1），请前往官网查看支持列表！"
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

function get_os_release_value() {
    grep -E "^${1}=" $File_LinuxRelease | cut -d= -f2- | sed "s/[\'\"]//g"
}

function collect_system_info() {
    if [ ! -s "${File_LinuxRelease}" ]; then
        unsupport_system_error "未知系统"
    fi
    ## 定义系统名称
    SYSTEM_NAME="$(get_os_release_value NAME)"
    SYSTEM_PRETTY_NAME="$(get_os_release_value PRETTY_NAME)"
    ## 定义系统版本号
    SYSTEM_VERSION_ID="$(get_os_release_value VERSION_ID)"
    SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%.*}"
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
    elif [ -s "${File_openKylinVersion}" ]; then
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
    else
        unsupport_system_error "未知系统"
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
            if [[ -z "${SYSTEM_VERSION_ID}" && "${SYSTEM_VERSION_CODENAME}" == "trixie" ]]; then
                SYSTEM_VERSION_ID="13"
                SYSTEM_VERSION_ID_MAJOR="${SYSTEM_VERSION_ID%.*}"
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
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" =~ ^[0-9]{1,2}$ ]]; then
            if [[ "${SYSTEM_VERSION_ID_MAJOR}" -lt 8 || "${SYSTEM_VERSION_ID_MAJOR}" -gt 13 ]]; then
                is_supported="false"
            fi
        fi
        if [[ "${SYSTEM_VERSION_CODENAME}" == "sid" ]]; then
            if [[ "${PURE_MODE}" != "true" ]]; then
                echo -e "\n${WARN} 检测到当前系统为 ${BLUE}unstable(sid)${PLAIN} 版本，可能会产生一些无法预料的问题。\n"
            fi
        fi
        ;;
    "${SYSTEM_UBUNTU}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" -lt 14 || "${SYSTEM_VERSION_ID_MAJOR}" -gt 25 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_LINUX_MINT}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 19 && "${SYSTEM_VERSION_ID_MAJOR}" != 2[0-2] && "${SYSTEM_VERSION_ID_MAJOR}" != 6 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_RHEL}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [7-9] && "${SYSTEM_VERSION_ID_MAJOR}" != 10 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [7-8] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ROCKY}" | "${SYSTEM_ALMALINUX}" | "${SYSTEM_ORACLE}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [8-9] && "${SYSTEM_VERSION_ID_MAJOR}" != 10 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_FEDORA}")
        if [[ "${SYSTEM_VERSION_ID}" != [3-4][0-9] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENEULER}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 2[0-5] ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != [8-9] && "${SYSTEM_VERSION_ID_MAJOR}" != 23 ]] || [[ "${SYSTEM_VERSION_ID_MAJOR}" == 8 && "${SYSTEM_VERSION_ID_MINOR}" -lt 6 ]]; then
            is_supported="false"
        fi
        ;;
    "${SYSTEM_ANOLISOS}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" != 8 && "${SYSTEM_VERSION_ID_MAJOR}" != 23 ]]; then
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
    "${SYSTEM_ARCH}" | "${SYSTEM_MANJARO}" | "${SYSTEM_ALPINE}" | "${SYSTEM_GENTOO}" | "${SYSTEM_NIXOS}") ;;
    *)
        unsupport_system_error "系统版本未知"
        ;;
    esac
    if [[ "${is_supported}" == "false" ]]; then
        unsupport_system_error "不支持当前系统版本"
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
            8 | 9 | 10)
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
        esac
    fi
    ## 定义软件源更新文字
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_DEBIAN}" | "${SYSTEM_ALPINE}" | "${SYSTEM_OPENKYLIN}")
        SYNC_MIRROR_TEXT="更新软件源"
        ;;
    "${SYSTEM_REDHAT}" | "${SYSTEM_OPENEULER}" | "${SYSTEM_OPENCLOUDOS}" | "${SYSTEM_ANOLISOS}")
        SYNC_MIRROR_TEXT="生成软件源缓存"
        ;;
    "${SYSTEM_OPENSUSE}")
        SYNC_MIRROR_TEXT="刷新软件源"
        ;;
    "${SYSTEM_ARCH}" | "${SYSTEM_GENTOO}")
        SYNC_MIRROR_TEXT="同步软件源"
        ;;
    "${SYSTEM_NIXOS}")
        SYNC_MIRROR_TEXT="更新二进制缓存与频道源"
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
    if [[ "${USE_ABROAD_SOURCE}" == "true" && "${USE_EDU_SOURCE}" == "true" ]]; then
        output_error "不可同时使用两种软件源模式，请确认后重试！"
    fi
    if [[ "${DEBIAN_CODENAME}" ]]; then
        if [[ "${SYSTEM_FACTIONS}" != "${SYSTEM_DEBIAN}" && "${SYSTEM_FACTIONS}" != "${SYSTEM_OPENKYLIN}" ]]; then
            output_error "当前系统不支持使用指定版本代号命令选项，请确认后重试！"
        fi
    fi
    if [[ "${ONLY_EPEL}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_REDHAT}")
            if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]]; then
                output_error "当前系统不支持安装 EPEL 附件软件包，请确认后重试！"
            fi
            ;;
        *)
            output_error "当前系统不支持安装 EPEL 附件软件包，请确认后重试！"
            ;;
        esac
    fi
}

## 选择软件源
function choose_mirrors() {
    ## 打印软件源列表
    function print_mirrors_list() {
        local tmp_name tmp_index i j
        function StringLength() {
            local text=$1
            echo "${#text}"
        }

        local list_arr=()
        local list_arr_sum="$(eval echo \${#$1[@]})"
        for ((i = 0; i < $list_arr_sum; i++)); do
            list_arr[$i]="$(eval echo \${$1[i]})"
        done
        local name_width=${2:-"30"}
        if command_exists printf; then
            local tmp_uchar_1 tmp_uchar_2 tmp_uchar_3 tmp_uchar_4 tmp_default_length tmp_length tmp_unicode_length tmp_spaces_nums tmp_max_length
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                tmp_name="$(echo "${list_arr[i]}" | awk -F '@' '{print$1}')"
                tmp_index=$((i + 1))
                tmp_default_length="${name_width}"
                tmp_uchar_1=$(echo "${tmp_name}" | grep -c "“")
                tmp_uchar_2=$(echo "${tmp_name}" | grep -c "”")
                tmp_uchar_3=$(echo "${tmp_name}" | grep -c "‘")
                tmp_uchar_4=$(echo "${tmp_name}" | grep -c "’")
                [[ "${tmp_uchar_1}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_1))
                [[ "${tmp_uchar_2}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_2))
                [[ "${tmp_uchar_3}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_3))
                [[ "${tmp_uchar_4}" -gt 0 ]] && ((tmp_default_length += tmp_uchar_4))
                tmp_length=$(StringLength "${tmp_name}")
                tmp_unicode_length=$(StringLength "$(echo "${tmp_name}" | sed "s|[0-9a-zA-Z -~]||g; s| ||g")")
                tmp_max_length=$((tmp_default_length + tmp_unicode_length))
                tmp_spaces_nums=$((((tmp_default_length - tmp_unicode_length - tmp_length)) / 2))
                if [[ $tmp_spaces_nums -gt 0 ]]; then
                    tmp_name="${tmp_name}$(printf '%*s' ${tmp_spaces_nums} '')"
                fi
                printf "❖  %-${tmp_max_length}s %4s\n" "${tmp_name}" "${tmp_index})"
            done
        else
            for ((i = 0; i < ${#list_arr[@]}; i++)); do
                tmp_name="${list_arr[i]%@*}"
                tmp_index=$((i + 1))
                echo -e " ❖  $tmp_index. ${tmp_name}"
            done
        fi
    }

    ## 选择使用软件源内网地址
    function choose_use_intranet_address() {
        local intranet_source
        for ((i = 0; i < ${#mirror_list_extranet[@]}; i++)); do
            if [[ "${SOURCE}" == "${mirror_list_extranet[i]}" ]]; then
                intranet_source="${mirror_list_intranet[i]}"
                break
            else
                continue
            fi
        done
        if [[ -z "${USE_INTRANET_SOURCE}" ]]; then
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}请选择软件源的网络地址(访问方式)：${PLAIN}" "公网" "内网"
                if [[ "${_SELECT_RESULT}" == "false" ]]; then
                    SOURCE="${intranet_source}"
                    ONLY_HTTP="true" # 强制使用 HTTP 协议
                    [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN 已切换至内网专用地址，仅限在特定环境下使用！"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ 默认使用软件源的公网地址，是否继续? [Y/n] ${PLAIN}")"
                read -rp "${CHOICE}" INPUT
                [[ -z "${INPUT}" ]] && INPUT=Y
                case "${INPUT}" in
                [Yy] | [Yy][Ee][Ss]) ;;
                [Nn] | [Nn][Oo])
                    SOURCE="${intranet_source}"
                    ONLY_HTTP="true" # 强制使用 HTTP 协议
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
        time_zone="$(timedatectl status 2>/dev/null | grep "Time zone" | awk -F ':' '{print$2}' | awk -F ' ' '{print$1}')"

        echo -e ''
        echo -e "运行环境 ${BLUE}${system_name} ${arch}${PLAIN}"
        echo -e "系统时间 ${BLUE}${date_time} ${time_zone}${PLAIN}"
    }

    [[ "${PURE_MODE}" != "true" ]] && print_title

    if [[ -z "${SOURCE}" ]]; then
        ## 使用官方源
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            return
        fi
        local mirror_list_name mirror_list_print_length
        if [[ "${USE_ABROAD_SOURCE}" = "true" ]]; then
            mirror_list_name="mirror_list_abroad"
            mirror_list_print_length=56
        elif [[ "${USE_EDU_SOURCE}" = "true" ]]; then
            mirror_list_name="mirror_list_edu"
            mirror_list_print_length=32
        else
            mirror_list_name="mirror_list_default"
            mirror_list_print_length=32
        fi

        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            sleep 1 >/dev/null 2>&1
            eval "interactive_select_mirror \"\${${mirror_list_name}[@]}\" \"\\n \${BOLD}请选择你想使用的软件源：\${PLAIN}\\n\""
            SOURCE="${_SELECT_RESULT#*@}"
            echo -e "\n${GREEN}➜${PLAIN}  ${BOLD}${_SELECT_RESULT%@*}${PLAIN}" | sed "s| · | |g"
        else
            echo ''
            print_mirrors_list "${mirror_list_name}" "${mirror_list_print_length}"
            local CHOICE="$(echo -e "\n${BOLD}└─ 请选择并输入你想使用的软件源 [ 1-$(eval echo \${#${mirror_list_name}[@]}) ]：${PLAIN}")"
            while true; do
                read -rp "${CHOICE}" INPUT
                case "${INPUT}" in
                [1-9] | [1-9][0-9] | [1-9][0-9][0-9])
                    local tmp_source
                    tmp_source="$(eval echo \${${mirror_list_name}[$((INPUT - 1))]})"
                    if [[ -z "${tmp_source}" ]]; then
                        echo -e "\n$WARN 请输入有效的数字序号！"
                    else
                        SOURCE="$(eval echo \${${mirror_list_name}[$((INPUT - 1))]} | awk -F '@' '{print$2}')"
                        break
                    fi
                    ;;
                *)
                    echo -e "\n$WARN 请输入数字序号以选择你想使用的软件源！"
                    ;;
                esac
            done
        fi

        ## 使用官方源
        if [[ "${SOURCE}" == "__OFFICIAL_SOURCE_TAG__" ]]; then
            USE_OFFICIAL_SOURCE="true"
            SOURCE=""
            return
        fi
    fi

    ## 选择软件源内网地址
    if [[ "${mirror_list_extranet[*]}" =~ (^|[^[:alpha:]])"${SOURCE}"([^[:alpha:]]|$) ]]; then
        choose_use_intranet_address
    fi
}

## 选择同步或更新软件源所使用的 WEB 协议（ HTTP/HTTPS）
function choose_protocol() {
    if [[ -z "${WEB_PROTOCOL}" ]]; then
        if [[ "${ONLY_HTTP}" == "true" ]]; then
            WEB_PROTOCOL="http"
        else
            if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
                echo ''
                interactive_select_boolean "${BOLD}请选择软件源协议：${PLAIN}" "HTTP" "HTTPS"
                if [[ "${_SELECT_RESULT}" == "true" ]]; then
                    WEB_PROTOCOL="http"
                else
                    WEB_PROTOCOL="https"
                fi
            else
                local CHOICE="$(echo -e "\n${BOLD}└─ 软件源是否使用 HTTP 协议? [Y/n] ${PLAIN}")"
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

# 选择安装/换源 EPEL 附加软件包（适用于部分红帽系统）
function choose_install_epel_packages() {
    function check_install_status() {
        ## 判断是否已安装 EPEL 软件包
        rpm -qa | grep epel-release -q
        VERIFICATION_EPEL=$?
    }

    ## 判断是否支持且需要处理 EPEL 附加软件包
    case "${SYSTEM_FACTIONS}" in
    "${SYSTEM_REDHAT}")
        if [[ "${SYSTEM_JUDGMENT}" == "${SYSTEM_FEDORA}" ]] || [[ "${INSTALL_EPEL}" == "false" ]]; then
            INSTALL_EPEL="false"
            return
        else
            check_install_status
        fi
        ;;
    *)
        INSTALL_EPEL="false"
        return
        ;;
    esac
    ## 选择是否安装 EPEL 附加软件包
    if [[ -z "${INSTALL_EPEL}" ]]; then
        local ask_text=""
        if [ $VERIFICATION_EPEL -eq 0 ]; then
            ask_text="检测到系统已安装 EPEL 附加软件包，是否替换/覆盖软件源?"
        else
            ask_text="是否安装 EPEL 附加软件包?"
        fi
        if [[ "${CAN_USE_ADVANCED_INTERACTIVE_SELECTION}" == "true" ]]; then
            echo ''
            interactive_select_boolean "${BOLD}${ask_text}${PLAIN}"
            if [[ "${_SELECT_RESULT}" == "true" ]]; then
                INSTALL_EPEL="true"
            else
                INSTALL_EPEL="false"
            fi
        else
            local CHOICE="$(echo -e "\n${BOLD}└─ ${ask_text} [Y/n] ${PLAIN}")"
            read -rp "${CHOICE}" INPUT
            [[ -z "${INPUT}" ]] && INPUT=Y
            case "${INPUT}" in
            [Yy] | [Yy][Ee][Ss])
                INSTALL_EPEL="true"
                ;;
            [Nn] | [Nn][Oo])
                INSTALL_EPEL="false"
                ;;
            *)
                input_error "默认不更换"
                INSTALL_EPEL="false"
                ;;
            esac
        fi
    fi
}

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
            local ask_text="检测到系统存在已备份的 ${type} 源文件，是否跳过覆盖备份?"
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
                    input_error "默认不覆盖"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf "${target_file}" "${backup_file}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE 已备份原有 ${type} 源文件"
            sleep 1s
        fi
    }
    function backup_dir() {
        local target_dir=$1
        local backup_dir=$2
        [ -d "${target_dir}" ] || mkdir -p "${target_dir}"
        [ -d "${backup_dir}" ] || mkdir -p "${backup_dir}"
        ## 判断是否存在 repo 源文件
        ls "${target_dir}" | grep '\.repo$' -q
        if [ $? -ne 0 ]; then
            return
        fi
        ## 判断是否存在已备份的 repo 源文件
        ls "${backup_dir}" | grep '\.repo$' -q
        if [ $? -eq 0 ]; then
            if [[ "${IGNORE_BACKUP_TIPS}" != "false" ]]; then
                return
            fi
            local ask_text="检测到系统存在已备份的 repo 源文件，是否跳过覆盖备份?"
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
                    input_error "默认不覆盖"
                    ;;
                esac
            fi
        else
            echo ''
            cp -rvf $target_dir/* "${backup_dir}" 2>&1
            BACKED_UP="true"
            echo -e "\n$COMPLETE 已备份原有 repo 源文件"
            sleep 1s
        fi
    }

    BACKED_UP="false" # 是否已备份
    if [[ "${BACKUP}" == "true" ]]; then
        case "${SYSTEM_FACTIONS}" in
        "${SYSTEM_DEBIAN}" | "${SYSTEM_OPENKYLIN}")
            # /etc/apt/sources.list
            if [[ "${SYSTEM_JUDGMENT}" != "${SYSTEM_LINUX_MINT}" && -s "${File_AptSourceList}" ]]; then
                backup_file $File_AptSourceList $File_AptSourceListBackup "sources.list"
            fi
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
            # Armbian
            if [ -f "${File_ArmbianRelease}" ]; then
                backup_file $File_ArmbianSourceList $File_ArmbianSourceListBackup "armbian.list"
            fi
            # Proxmox VE
            if [ -f "${File_ProxmoxVersion}" ]; then
                backup_file $File_ProxmoxSourceList $File_ProxmoxSourceListBackup "pve-no-subscription.list"
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
        [ -f "${File_ProxmoxVersion}" ] && clear_file $File_ProxmoxSourceList
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
        local repo_patterns=()
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
        ;;
    "${SYSTEM_ALPINE}")
        clear_file $File_AlpineRepositories
        ;;
    "${SYSTEM_GENTOO}")
        clear_file $File_GentooReposConf
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
                    diff_file $File_ProxmoxSourceListBackup $File_ProxmoxSourceList
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
            esac
        fi
    }

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
    esac
    ## 比较差异
    if [[ "${PRINT_DIFF}" == "true" ]]; then
        print_diff
    fi
    ## 更新软件源
    local commands=()
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
            echo -e "\n$SUCCESS 软件源更换完毕"
        else
            echo -e "\n$FAIL 软件源更换完毕，但${SYNC_MIRROR_TEXT}失败"
            echo -e "\n$TIP 请再次执行脚本并更换相同软件源后进行尝试，若仍然${SYNC_MIRROR_TEXT}失败那么可能由以下原因导致："
            echo -e "\n1. 网络连通性问题：例如连接异常、由地区影响的网络间歇式中断、禁止外部访问、软件源网站防火墙阻断等"
            echo -e "2. 目标软件源异常：请手动前往软件源（镜像站）地址进行验证：${WEB_PROTOCOL}://${SOURCE}/${SOURCE_BRANCH}"
            echo -e "      若报错内容是提示某个文件不存在那么有可能是软件源的问题，多常见于正在同步中的软件源仓库"
            echo -e "      若报错内容是目录（path）不存在也有可能是目标软件源不存在当前系统镜像仓库，即不支持当前系统"
            echo -e "      建议更换其它镜像站进行尝试，少数情况下软件源若处于同步中状态则可能会出现文件同步错误问题"
            echo -e "3. 原有软件源报错：请先排除系统原有的其它软件源报错，因为脚本不会干预这些无关的软件源配置，解决后重新运行脚本即可\n"
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
        ask_text="是否跳过更新软件包?"
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
                input_error "默认不更新"
                ;;
            esac
        fi
    fi
    if [[ "${UPGRADE_SOFTWARE}" == "false" ]]; then
        return
    fi
    if [[ -z "${CLEAN_CACHE}" ]]; then
        CLEAN_CACHE="false"
        ask_text="在更新软件包后，是否自动清理下载缓存?"
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
                input_error "默认不清理"
                ;;
            esac
        fi
    fi
    local commands=()
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
        animate_exec "${exec_cmd}" "更新软件包"
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
    esac
}

##############################################################################

## 更换基于 Debian 系 Linux 发行版的软件源
function change_mirrors_Debian() {
    local source_file=$File_AptSourceList
    local source_content=""
    local deb_src_disabled_tips="## 默认禁用源码镜像以提高更新速度，如需启用请自行取消注释"

    function write_source_file() {
        if [[ -n "${source_content}" ]]; then
            echo "${source_content}" >>$source_file
        fi
        source_content=""
    }

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

    function _template_deb822() {
        echo "Types: ${1}
URIs: ${WEB_PROTOCOL}://${2}/
Suites: ${3}
Components: ${4}
Signed-By: /usr/share/keyrings/${SYSTEM_JUDGMENT,,}-archive-keyring.gpg"
    }
    function gen_deb822() {
        echo "$(_template_deb822 "deb" "${1}" "${2}" "${3}")

${deb_src_disabled_tips}
$(_template_deb822 "deb-src" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb822_disabled() {
        echo "$(_template_deb822 "deb" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")

${deb_src_disabled_tips}
$(_template_deb822 "deb-src" "${1}" "${2}" "${3}" | sed -e "s|^|# |g")"
    }
    function gen_deb_security() {
        echo "## 安全更新软件源
$(gen_deb "${1}" "${2}-security" "${3}")"
    }
    function gen_deb822_security() {
        echo "## 安全更新软件源
$(gen_deb822 "${1}" "${2}-security" "${3}")"
    }

    ## 针对特定系统生成软件源
    function gen_debian_deb() {
        case "${2}" in
        forky | trixie | bookworm | stable | oldstable | testing)
            echo "$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")
$(gen_deb "${1}" "${2}-backports" "${3}")"
            ;;
        *)
            echo "$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")"
            ;;
        esac
    }
    function gen_debian_deb822() {
        case "${2}" in
        forky | trixie | bookworm | stable | oldstable | testing)
            echo "$(gen_deb822 "${1}" "${2} ${2}-updates ${2}-backports" "${3}")"
            ;;
        *)
            echo "$(gen_deb822 "${1}" "${2} ${2}-updates" "${3}")"
            ;;
        esac
    }
    function gen_ubuntu_deb() {
        echo "$(gen_deb "${1}" "${2}" "${3}")
$(gen_deb "${1}" "${2}-updates" "${3}")
$(gen_deb "${1}" "${2}-backports" "${3}")
## 预发布软件源（不建议启用）
$(gen_deb_disabled "${1}" "${2}-proposed" "${3}")"
    }
    function gen_ubuntu_deb822() {
        echo "$(gen_deb822 "${1}" "${2} ${2}-updates ${2}-backports" "${3}")

## 预发布软件源（不建议启用）
$(gen_deb822_disabled "${1}" "${2}-proposed" "${3}")"
    }

    ## 使用官方源
    if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_DEBIAN}")
            SOURCE="deb.debian.org"
            ;;
        "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
            SOURCE="archive.ubuntu.com"
            ;;
        "${SYSTEM_KALI}")
            SOURCE="http.kali.org"
            ;;
        "${SYSTEM_DEEPIN}")
            SOURCE="community-packages.deepin.com"
            ;;
        "${SYSTEM_LINUX_MINT}")
            SOURCE="packages.linuxmint.com"
            ;;
        esac
    fi

    local repository_sections # 仓库区域
    local source_host="${SOURCE}/${SOURCE_BRANCH}"
    local source_security_host=""

    case "${SYSTEM_JUDGMENT}" in
    "${SYSTEM_DEBIAN}")
        case "${SYSTEM_VERSION_ID}" in
        8 | 9 | 10 | 11)
            repository_sections="main contrib non-free"
            ;;
        *)
            repository_sections="main contrib non-free non-free-firmware"
            ;;
        esac
        source_security_host="${SOURCE_SECURITY:-"${SOURCE}"}/${SOURCE_SECURITY_BRANCH:-"${SOURCE_BRANCH}-security"}"
        if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
            source_file="${File_DebianSources}"
            if [[ "${SYSTEM_VERSION_CODENAME}" != "sid" ]]; then
                source_content="$(gen_debian_deb822 "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")

$(gen_deb822_security "${source_security_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
            else
                source_content="$(gen_debian_deb822 "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
            fi
        else
            source_file="${File_AptSourceList}"
            if [[ "${SYSTEM_VERSION_CODENAME}" != "sid" ]]; then
                source_content="${deb_src_disabled_tips}
$(gen_debian_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")
$(gen_deb_security "${source_security_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
            else
                source_content="${deb_src_disabled_tips}
$(gen_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
            fi
        fi
        write_source_file
        ;;

    "${SYSTEM_UBUNTU}" | "${SYSTEM_ZORIN}")
        repository_sections="main restricted universe multiverse"
        source_security_host="${SOURCE_SECURITY:-${SOURCE}}/${SOURCE_BRANCH}"
        if [[ "${USE_DEB822_FORMAT}" == "true" ]]; then
            source_file="${File_UbuntuSources}"
            source_content="$(gen_ubuntu_deb822 "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")

$(gen_deb822_security "${source_security_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
        else
            source_file="${File_AptSourceList}"
            source_content="${deb_src_disabled_tips}
$(gen_ubuntu_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")
$(gen_deb_security "${source_security_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
        fi
        write_source_file
        ;;

    "${SYSTEM_KALI}")
        repository_sections="main contrib non-free non-free-firmware"
        source_content="${deb_src_disabled_tips}
$(gen_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
        write_source_file
        ;;

    "${SYSTEM_DEEPIN}")
        if [[ "${SYSTEM_VERSION_ID_MAJOR}" == "25" ]]; then
            repository_sections="main commercial community"
        else
            repository_sections="main contrib non-free"
        fi
        source_content="${deb_src_disabled_tips}
$(gen_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
        write_source_file
        ;;

    "${SYSTEM_LINUX_MINT}")
        ## 专用源
        repository_sections="main upstream import backport"
        source_file="${File_LinuxMintSourceList}"
        source_content="${deb_src_disabled_tips}
$(gen_deb_unsrc "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")
"
        write_source_file
        ## 底层系统软件源
        local base_system_branch base_system_codename
        if [[ "${SYSTEM_VERSION_ID}" == 6 ]]; then
            # Debian 版（LMDE）
            base_system_branch="debian"
            grep -q "DEBIAN_CODENAME" $File_LinuxRelease
            if [ $? -eq 0 ]; then
                base_system_codename="$(get_os_release_value DEBIAN_CODENAME)"
            else
                base_system_codename="bookworm"
            fi
            repository_sections="main contrib non-free non-free-firmware"
            source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
            source_security_host="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${SOURCE}}}/${SOURCE_SECURITY_BRANCH:-${SOURCE_BASE_SYSTEM_BRANCH:-debian-security}}"
            source_file="${File_LinuxMintSourceList}"
            source_content="$(gen_debian_deb "${source_host}" "${base_system_codename}" "${repository_sections}")
$(gen_deb_security "${source_security_host}" "${base_system_codename}" "${repository_sections}")"
            write_source_file
        else
            # Ubuntu 版
            if [[ "${DEVICE_ARCH_RAW}" == "x86_64" || "${DEVICE_ARCH_RAW}" == *i?86* ]]; then
                base_system_branch="ubuntu"
            else
                base_system_branch="ubuntu-ports"
            fi
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            22)
                base_system_codename="noble"
                ;;
            21)
                base_system_codename="jammy"
                ;;
            20)
                base_system_codename="focal"
                ;;
            19)
                base_system_codename="bionic"
                ;;
            esac
            repository_sections="main restricted universe multiverse"
            source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
            source_security_host="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${SOURCE}}}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
            source_file="${File_LinuxMintSourceList}"
            source_content="$(gen_ubuntu_deb "${source_host}" "${base_system_codename}" "${repository_sections}")
$(gen_deb_security "${source_security_host}" "${base_system_codename}" "${repository_sections}")"
            write_source_file
        fi
        ;;

    "${SYSTEM_RASPBERRY_PI_OS}")
        ## 专用源
        repository_sections="main"
        if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
            SOURCE="archive.raspberrypi.org"
            SOURCE_BRANCH="debian"
            source_host="${SOURCE}/${SOURCE_BRANCH}"
        fi
        source_file="${File_RaspberryPiSourceList}"
        source_content="${deb_src_disabled_tips}
$(gen_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")"
        write_source_file
        ## 底层系统软件源（64位系统为 Debian 官方仓库，32位为 Raspbian 仓库）
        local base_system_branch base_system_codename
        case "${DEVICE_ARCH_RAW}" in
        x86_64 | aarch64)
            case "${SYSTEM_VERSION_ID_MAJOR}" in
            8 | 9 | 10)
                base_system_branch="debian-archive/debian"
                ;;
            *)
                base_system_branch="debian"
                ;;
            esac
            base_system_codename="${SYSTEM_VERSION_CODENAME}"
            case "${SYSTEM_VERSION_ID}" in
            8 | 9 | 10 | 11)
                repository_sections="main contrib non-free"
                ;;
            *)
                repository_sections="main contrib non-free non-free-firmware"
                ;;
            esac
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                SOURCE="deb.debian.org"
            fi
            source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
            source_security_host="${SOURCE_SECURITY:-${SOURCE_BASE_SYSTEM:-${SOURCE}}}/${SOURCE_SECURITY_BRANCH:-${SOURCE_BASE_SYSTEM_BRANCH:-debian-security}}"
            source_file="${File_AptSourceList}"
            source_content="${deb_src_disabled_tips}
$(gen_debian_deb "${source_host}" "${base_system_codename}" "${repository_sections}")
$(gen_deb_security "${source_security_host}" "${base_system_codename}" "${repository_sections}")"
            write_source_file
            ;;
        *)
            base_system_branch="raspbian"
            base_system_codename="${SYSTEM_VERSION_CODENAME}"
            repository_sections="main contrib non-free rpi"
            if [[ "${USE_OFFICIAL_SOURCE}" == "true" ]]; then
                SOURCE="raspbian.raspberrypi.org"
                source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
            else
                source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}/raspbian"
            fi
            source_file="${File_AptSourceList}"
            source_content="${deb_src_disabled_tips}
$(gen_deb "${source_host}" "${base_system_codename}" "${repository_sections}")"
            ## multiarch 源
            if [[ "${DEVICE_ARCH_RAW}" == "armv7l" && "${USE_OFFICIAL_SOURCE}" != "true" ]]; then
                source_host="${SOURCE_BASE_SYSTEM:-"${SOURCE}"}/${SOURCE_BASE_SYSTEM_BRANCH:-"${base_system_branch}"}"
                source_content="${source_content}

# deb [arch=arm64] ${WEB_PROTOCOL}://${source_host}/multiarch/ ${base_system_codename} ${repository_sections}"
            fi
            write_source_file
            ;;
        esac
        ;;
    esac
    ## 处理其它衍生操作系统的专用源
    # Armbian
    if [ -f "${File_ArmbianRelease}" ]; then
        source_file="${File_ArmbianSourceList}"
        source_content="deb [signed-by=/usr/share/keyrings/armbian.gpg] ${WEB_PROTOCOL}://${SOURCE}/armbian ${SYSTEM_VERSION_CODENAME} main ${SYSTEM_VERSION_CODENAME}-utils ${SYSTEM_VERSION_CODENAME}-desktop"
        write_source_file
    fi
    # Proxmox VE
    if [ -f "${File_ProxmoxVersion}" ]; then
        source_host="${SOURCE}/proxmox/debian"
        source_file="${File_ProxmoxSourceList}"
        source_content="$(gen_deb_unsrc "${source_host}/pve" "${SYSTEM_VERSION_CODENAME}" "pve-no-subscription")  
$(gen_deb_unsrc_disabled "${source_host}/pbs" "${SYSTEM_VERSION_CODENAME}" "pbs-no-subscription")
$(gen_deb_unsrc_disabled "${source_host}/pbs-client" "${SYSTEM_VERSION_CODENAME}" "pbs-client-no-subscription")
$(gen_deb_unsrc_disabled "${source_host}/pmg" "${SYSTEM_VERSION_CODENAME}" "pmg-no-subscription")"
        write_source_file
        if [ -s "${File_ProxmoxAPLInfo}" ]; then
            sed -e "s|url => [\"']https\?://[^/]*/images[\"']|url => \"${WEB_PROTOCOL}://${SOURCE}/images\"|g" \
                -i \
                $File_ProxmoxAPLInfo
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
            gen_repo_files_CentOS "${SYSTEM_VERSION_ID_MAJOR}"
            ;;
        *)
            gen_repo_files_CentOSStream "${SYSTEM_VERSION_ID_MAJOR}"
            ;;
        esac
        ;;
    "${SYSTEM_CENTOS}")
        gen_repo_files_CentOS "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}")
        gen_repo_files_CentOSStream "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_ROCKY}")
        gen_repo_files_RockyLinux "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_ALMALINUX}")
        gen_repo_files_AlmaLinux "${SYSTEM_VERSION_ID_MAJOR}"
        ;;
    "${SYSTEM_FEDORA}")
        gen_repo_files_Fedora "${SYSTEM_VERSION_ID}"
        ;;
    "${SYSTEM_OPENCLOUDOS}")
        gen_repo_files_OpenCloudOS "${SYSTEM_VERSION_ID}"
        ;;
    "${SYSTEM_ANOLISOS}")
        gen_repo_files_AnolisOS "${SYSTEM_VERSION_ID}"
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
                sed -e "s|vault.centos.org/\$contentdir|vault.centos.org/${SOURCE_VAULT_BRANCH:-centos-vault}|g" \
                    -i \
                    CentOS-Linux-Sources.repo
                ;;
            7)
                sed -e "s|mirror.centos.org/centos|mirror.centos.org/${SOURCE_BRANCH}|g" \
                    -e "s|\$releasever|7.9.2009|g" \
                    -i \
                    CentOS-*
                sed -e "s|vault.centos.org/centos|vault.centos.org/${SOURCE_VAULT_BRANCH:-centos-vault}|g" \
                    -i \
                    CentOS-Sources.repo
                ;;
            esac
            sed -e "s|mirror.centos.org|${SOURCE}|g" \
                -e "s|vault.centos.org|${SOURCE_VAULT:-"${SOURCE}"}|g" \
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
            sed -e "s|vault.centos.org/\$contentdir|vault.centos.org/${SOURCE_VAULT_BRANCH:-centos-vault}|g" \
                -i \
                CentOS-Linux-Sources.repo
            ;;
        7)
            # 最终版本为 7.9.2009（2024-07）
            sed -e "s|mirror.centos.org/centos|mirror.centos.org/${SOURCE_BRANCH}|g" \
                -e "s|\$releasever|7.9.2009|g" \
                -i \
                CentOS-*
            sed -e "s|vault.centos.org/centos|vault.centos.org/${SOURCE_VAULT_BRANCH:-centos-vault}|g" \
                -i \
                CentOS-Sources.repo
            ;;
        esac
        sed -e "s|mirror.centos.org|${SOURCE}|g" \
            -e "s|vault.centos.org|${SOURCE_VAULT:-"${SOURCE}"}|g" \
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
                -e "s|vault.centos.org/\$contentdir|${SOURCE_VAULT:-"${SOURCE}"}/${SOURCE_VAULT_BRANCH:-centos-vault}|g" \
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
                -e "s|vault.almalinux.org|${SOURCE}/${SOURCE_BRANCH}|g" \
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
                -e "s|repo.almalinux.org/vault|${SOURCE_VAULT:-"${SOURCE}"}/${SOURCE_VAULT_BRANCH:-almalinux-vault}|g" \
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
                -e "s|repo.almalinux.org/vault|${SOURCE_VAULT:-"${SOURCE}"}/${SOURCE_VAULT_BRANCH:-almalinux-vault}|g" \
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
    gen_repo_files_openEuler
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_YumRepos
    sed -e "s|^baseurl=http|baseurl=${WEB_PROTOCOL}|g" \
        -e "s|repo.openeuler.org|${SOURCE}/${SOURCE_BRANCH}|g" \
        -i \
        openEuler.repo
}

## 更换 OpenCloudOS 软件源
function change_mirrors_OpenCloudOS() {
    ## 生成 repo 源文件
    gen_repo_files_OpenCloudOS "${SYSTEM_VERSION_ID}"
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
    local repository_sections="main cross pty" # 仓库区域
    local source_host="${SOURCE}/${SOURCE_BRANCH}"
    echo "## 默认禁用源码镜像以提高更新速度，如需启用请自行取消注释
$(gen_deb "${source_host}" "${SYSTEM_VERSION_CODENAME}" "${repository_sections}")" >>$File_AptSourceList
}

## 更换 Anolis OS 软件源
function change_mirrors_AnolisOS() {
    ## 生成 repo 源文件
    gen_repo_files_AnolisOS "${SYSTEM_VERSION_ID}"
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
        gen_repo_files_openSUSE "leap" "${SYSTEM_VERSION_ID}"
        ;;
    "opensuse-tumbleweed")
        gen_repo_files_openSUSE "tumbleweed"
        ;;
    esac
    ## 使用官方源
    [[ "${USE_OFFICIAL_SOURCE}" == "true" ]] && return

    ## 修改源
    cd $Dir_ZYppRepos
    local opensuse_repo_files=()
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
        version_name="v${SYSTEM_VERSION_ID_MAJOR}"
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
sync-uri = rsync://${SOURCE_PORTAGE:-"${SOURCE}"}/${SOURCE_PORTAGE_BRANCH:-gentoo-portage}
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

## EPEL (Extra Packages for Enterprise Linux) 附加软件包 - 安装或更换软件源
function change_mirrors_or_install_EPEL() {
    if [[ "${INSTALL_EPEL}" != "true" ]]; then
        return
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
        [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$WARN Extra Packages for Enterprise Linux 7 已结束生命周期并被官方移至归档库！"
        [[ "${PURE_MODE}" != "true" ]] && echo -e "\n$TIP 目前部分镜像站没有同步该归档仓库，若换源后出现错误那么请先检查目标镜像站是否支持该仓库。\n\n${GREEN}➜${PLAIN}  ${WEB_PROTOCOL}://${SOURCE_EPEL:-"${SOURCE}"}/${SOURCE_EPEL_BRANCH:-epel}"
    fi
    ## 安装 EPEL 软件包
    if [ $VERIFICATION_EPEL -ne 0 ]; then
        echo -e "\n${WORKING} 安装 epel-release 软件包...\n"
        local package_manager="$(get_package_manager)"
        local package_path="epel/epel-release-latest-${epel_version}"
        case "${epel_version}" in
        7)
            package_path="epel-archive/7/${DEVICE_ARCH_RAW}/Packages/e/epel-release-7-14"
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
    gen_repo_files_EPEL "${SYSTEM_VERSION_ID_MAJOR}"
    if [[ "${epel_version}" == 9 ]]; then
        case "${SYSTEM_JUDGMENT}" in
        "${SYSTEM_CENTOS_STREAM}" | "${SYSTEM_ORACLE}" | "${SYSTEM_RHEL}")
            gen_repo_files_EPEL_NEXT "${SYSTEM_VERSION_ID_MAJOR}"
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
        -e "s|download.example/pub/epel|${SOURCE_EPEL:-"${SOURCE}"}/${SOURCE_EPEL_BRANCH:-epel}|g" \
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
    local positive_title="${2:-是}"
    local negative_title="${3:-否}"
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
        echo -e "\n\033[1;44m 提示 \033[0m \033[31m操作已取消\033[0m\n"
        exit 130
    }
    function draw_menu() {
        echo -e "╭─ ${message}"
        echo -e "│"
        if [ "$selected" -eq 0 ]; then
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

##############################################################################

## 生成 CentOS repo 源文件
function gen_repo_files_CentOS() {
    case "$1" in
    8)
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-AppStream.repo
[appstream]
name=CentOS Linux $releasever - AppStream
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-BaseOS.repo
[baseos]
name=CentOS Linux $releasever - BaseOS
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=BaseOS&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-ContinuousRelease.repo
[cr]
name=CentOS Linux $releasever - ContinuousRelease
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=cr&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/cr/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Debuginfo.repo
[debuginfo]
name=CentOS Linux $releasever - Debuginfo
baseurl=http://debuginfo.centos.org/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Devel.repo
[devel]
name=CentOS Linux $releasever - Devel WARNING! FOR BUILDROOT USE ONLY!
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=Devel&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/Devel/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Extras.repo
[extras]
name=CentOS Linux $releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-FastTrack.repo
[fasttrack]
name=CentOS Linux $releasever - FastTrack
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/fasttrack/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-HighAvailability.repo
[ha]
name=CentOS Linux $releasever - HighAvailability
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=HighAvailability&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Media.repo
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
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Plus.repo
[plus]
name=CentOS Linux $releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/centosplus/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-PowerTools.repo
[powertools]
name=CentOS Linux $releasever - PowerTools
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=PowerTools&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Linux-Sources.repo
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
        cat <<'EOF' >$Dir_YumRepos/CentOS-Base.repo
[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-$releasever - Updates
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-$releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[centosplus]
name=CentOS-$releasever - Plus
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-CR.repo
[cr]
name=CentOS-$releasever - cr
baseurl=http://mirror.centos.org/centos/$releasever/cr/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=0
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Debuginfo.repo
[base-debuginfo]
name=CentOS-7 - Debuginfo
baseurl=http://debuginfo.centos.org/7/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-7
enabled=0
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-fasttrack.repo
[fasttrack]
name=CentOS-7 - fasttrack
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=fasttrack&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/fasttrack/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Media.repo
[c7-media]
name=CentOS-$releasever - Media
baseurl=file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Sources.repo
[base-source]
name=CentOS-$releasever - Base Sources
baseurl=http://vault.centos.org/centos/$releasever/os/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[updates-source]
name=CentOS-$releasever - Updates Sources
baseurl=http://vault.centos.org/centos/$releasever/updates/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

[extras-source]
name=CentOS-$releasever - Extras Sources
baseurl=http://vault.centos.org/centos/$releasever/extras/Source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

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

## 生成 CentOS Stream repo 源文件
function gen_repo_files_CentOSStream() {
    case "$1" in
    10)
        cat <<'EOF' >$Dir_YumRepos/centos.repo
[baseos]
name=CentOS Stream $releasever - BaseOS
#baseurl=https://mirror.stream.centos.org/$releasever-stream/BaseOS/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[baseos-debuginfo]
name=CentOS Stream $releasever - BaseOS - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[baseos-source]
name=CentOS Stream $releasever - BaseOS - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-baseos-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[appstream]
name=CentOS Stream $releasever - AppStream
#baseurl=https://mirror.stream.centos.org/$releasever-stream/AppStream/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1

[appstream-debuginfo]
name=CentOS Stream $releasever - AppStream - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[appstream-source]
name=CentOS Stream $releasever - AppStream - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-appstream-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[crb]
name=CentOS Stream $releasever - CRB
#baseurl=https://mirror.stream.centos.org/$releasever-stream/CRB/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[crb-debuginfo]
name=CentOS Stream $releasever - CRB - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[crb-source]
name=CentOS Stream $releasever - CRB - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-crb-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0
EOF
        cat <<'EOF' >$Dir_YumRepos/centos-addons.repo
[highavailability]
name=CentOS Stream $releasever - HighAvailability
#baseurl=https://mirror.stream.centos.org/$releasever-stream/HighAvailability/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[highavailability-debuginfo]
name=CentOS Stream $releasever - HighAvailability - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[highavailability-source]
name=CentOS Stream $releasever - HighAvailability - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-highavailability-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[nfv]
name=CentOS Stream $releasever - NFV
#baseurl=https://mirror.stream.centos.org/$releasever-stream/NFV/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[nfv-debuginfo]
name=CentOS Stream $releasever - NFV - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[nfv-source]
name=CentOS Stream $releasever - NFV - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-nfv-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[rt]
name=CentOS Stream $releasever - RT
#baseurl=https://mirror.stream.centos.org/$releasever-stream/RT/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[rt-debuginfo]
name=CentOS Stream $releasever - RT - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[rt-source]
name=CentOS Stream $releasever - RT - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-rt-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[resilientstorage]
name=CentOS Stream $releasever - ResilientStorage
#baseurl=https://mirror.stream.centos.org/$releasever-stream/ResilientStorage/$basearch/os/
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=0

[resilientstorage-debuginfo]
name=CentOS Stream $releasever - ResilientStorage - Debug
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-debug-$stream&arch=$basearch&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
enabled=0

[resilientstorage-source]
name=CentOS Stream $releasever - ResilientStorage - Source
metalink=https://mirrors.centos.org/metalink?repo=centos-resilientstorage-source-$stream&arch=source&protocol=https,http
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
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
    9)
        cat <<'EOF' >$Dir_YumRepos/centos.repo
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
        cat <<'EOF' >$Dir_YumRepos/centos-addons.repo
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
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-AppStream.repo
[appstream]
name=CentOS Stream $releasever - AppStream
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=AppStream&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-BaseOS.repo
[baseos]
name=CentOS Stream $releasever - BaseOS
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=BaseOS&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-Debuginfo.repo
[debuginfo]
name=CentOS Stream $releasever - Debuginfo
baseurl=http://debuginfo.centos.org/$stream/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-Extras-common.repo
[extras-common]
name=CentOS Stream $releasever - Extras common packages
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=extras-extras-common
#baseurl=http://mirror.centos.org/$contentdir/$stream/extras/$basearch/extras-common/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-Extras.repo
[extras]
name=CentOS Stream $releasever - Extras
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-HighAvailability.repo
[ha]
name=CentOS Stream $releasever - HighAvailability
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=HighAvailability&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-Media.repo
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
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-NFV.repo
[nfv]
name=CentOS Stream $releasever - NFV
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=NFV&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/NFV/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-PowerTools.repo
[powertools]
name=CentOS Stream $releasever - PowerTools
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=PowerTools&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-RealTime.repo
[rt]
name=CentOS Stream $releasever - RealTime
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=RT&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/RT/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-ResilientStorage.repo
[resilientstorage]
name=CentOS Stream $releasever - ResilientStorage
mirrorlist=http://mirrorlist.centos.org/?release=$stream&arch=$basearch&repo=ResilientStorage&infra=$infra
#baseurl=http://mirror.centos.org/$contentdir/$stream/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/CentOS-Stream-Sources.repo
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

## 生成 Rocky Linux repo 源文件
function gen_repo_files_RockyLinux() {
    case "$1" in
    10)
        cat <<'EOF' >$Dir_YumRepos/rocky.repo
[baseos]
name=Rocky Linux $releasever - BaseOS
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[baseos-debuginfo]
name=Rocky Linux $releasever - BaseOS - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[baseos-source]
name=Rocky Linux $releasever - BaseOS - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=BaseOS-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[appstream]
name=Rocky Linux $releasever - AppStream
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[appstream-debuginfo]
name=Rocky Linux $releasever - AppStream - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[appstream-source]
name=Rocky Linux $releasever - AppStream - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=AppStream-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[crb]
name=Rocky Linux $releasever - CRB
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=CRB-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[crb-debuginfo]
name=Rocky Linux $releasever - CRB - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=CRB-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[crb-source]
name=Rocky Linux $releasever - CRB - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=CRB-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/CRB/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10
EOF
        cat <<'EOF' >$Dir_YumRepos/rocky-addons.repo
[highavailability]
name=Rocky Linux $releasever - High Availability
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[highavailability-debuginfo]
name=Rocky Linux $releasever - High Availability - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[highavailability-source]
name=Rocky Linux $releasever - High Availability - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=HighAvailability-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[nfv]
name=Rocky Linux $releasever - NFV
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=NFV-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[nfv-debuginfo]
name=Rocky Linux $releasever - NFV Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[nfv-source]
name=Rocky Linux $releasever - NFV Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/NFV/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[rt]
name=Rocky Linux $releasever - Realtime
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[rt-debuginfo]
name=Rocky Linux $releasever - Realtime Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[rt-source]
name=Rocky Linux $releasever - Realtime Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[sap]
name=Rocky Linux $releasever - SAP
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[sap-debuginfo]
name=Rocky Linux $releasever - SAP Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[sap-source]
name=Rocky Linux $releasever - SAP Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAP-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAP/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[saphana]
name=Rocky Linux $releasever - SAPHANA
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[saphana-debuginfo]
name=Rocky Linux $releasever - SAPHANA Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[saphana-source]
name=Rocky Linux $releasever - SAPHANA Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=SAPHANA-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/SAPHANA/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10
EOF
        cat <<'EOF' >$Dir_YumRepos/rocky-devel.repo
[devel]
name=Rocky Linux $releasever - Devel WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=devel-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/devel/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[devel-debuginfo]
name=Rocky Linux $releasever - Devel Debug WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=devel-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/devel/$basearch/debug/tree/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[devel-source]
name=Rocky Linux $releasever - Devel Source WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=devel-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/devel/source/tree/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10
EOF
        cat <<'EOF' >$Dir_YumRepos/rocky-extras.repo
[extras]
name=Rocky Linux $releasever - Extras
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[extras-debuginfo]
name=Rocky Linux $releasever - Extras Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[extras-source]
name=Rocky Linux $releasever - Extras Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[plus]
name=Rocky Linux $releasever - Plus
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=plus-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/os/
gpgcheck=1
enabled=0
countme=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[plus-debuginfo]
name=Rocky Linux $releasever - Plus - Debug
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=plus-$releasever-debug$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/debug/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10

[plus-source]
name=Rocky Linux $releasever - Plus - Source
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=source&repo=plus-$releasever-source$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/source/tree/
gpgcheck=1
enabled=0
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-10
EOF
        ;;
    9)
        cat <<'EOF' >$Dir_YumRepos/rocky.repo
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
        cat <<'EOF' >$Dir_YumRepos/rocky-addons.repo
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
        cat <<'EOF' >$Dir_YumRepos/rocky-devel.repo
[devel]
name=Rocky Linux $releasever - Devel WARNING! FOR BUILDROOT ONLY DO NOT LEAVE ENABLED
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=devel-$releasever$rltype
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/devel/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Rocky-9
EOF
        cat <<'EOF' >$Dir_YumRepos/rocky-extras.repo
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
        cat <<'EOF' >$Dir_YumRepos/Rocky-AppStream.repo
[appstream]
name=Rocky Linux $releasever - AppStream
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=AppStream-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-BaseOS.repo
[baseos]
name=Rocky Linux $releasever - BaseOS
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=BaseOS-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-Debuginfo.repo
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
        cat <<'EOF' >$Dir_YumRepos/Rocky-Devel.repo
[devel]
name=Rocky Linux $releasever - Devel WARNING! FOR BUILDROOT AND KOJI USE
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=Devel-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/Devel/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-Extras.repo
[extras]
name=Rocky Linux $releasever - Extras
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=extras-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-HighAvailability.repo
[ha]
name=Rocky Linux $releasever - HighAvailability
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=HighAvailability-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-Media.repo
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
        cat <<'EOF' >$Dir_YumRepos/Rocky-NFV.repo
[nfv]
name=Rocky Linux $releasever - NFV
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=NFV-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/nfv/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-Plus.repo
[plus]
name=Rocky Linux $releasever - Plus
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=rockyplus-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/plus/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-PowerTools.repo
[powertools]
name=Rocky Linux $releasever - PowerTools
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=PowerTools-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-ResilientStorage.repo
[resilient-storage]
name=Rocky Linux $releasever - ResilientStorage
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=ResilientStorage-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-RT.repo
[rt]
name=Rocky Linux $releasever - Realtime
mirrorlist=https://mirrors.rockylinux.org/mirrorlist?arch=$basearch&repo=RT-$releasever
#baseurl=http://dl.rockylinux.org/$contentdir/$releasever/RT/$basearch/os/
gpgcheck=1
enabled=0
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rockyofficial
EOF
        cat <<'EOF' >$Dir_YumRepos/Rocky-Sources.repo
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

## 生成 AlmaLinux repo 源文件
function gen_repo_files_AlmaLinux() {
    case "$1" in
    10)
        cat <<'EOF' >$Dir_YumRepos/almalinux-appstream.repo
[appstream]
name=AlmaLinux $releasever - AppStream
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream
# baseurl=https://repo.almalinux.org/almalinux/$releasever/AppStream/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=1

[appstream-debuginfo]
name=AlmaLinux $releasever - AppStream - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-debug
# baseurl=https://vault.almalinux.org/$releasever/AppStream/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[appstream-source]
name=AlmaLinux $releasever - AppStream - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/appstream-source
# baseurl=https://vault.almalinux.org/$releasever/AppStream/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-baseos.repo
[baseos]
name=AlmaLinux $releasever - BaseOS
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos
# baseurl=https://repo.almalinux.org/almalinux/$releasever/BaseOS/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=1

[baseos-debuginfo]
name=AlmaLinux $releasever - BaseOS - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-debug
# baseurl=https://vault.almalinux.org/$releasever/BaseOS/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[baseos-source]
name=AlmaLinux $releasever - BaseOS - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/baseos-source
# baseurl=https://vault.almalinux.org/$releasever/BaseOS/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-crb.repo
[crb]
name=AlmaLinux $releasever - CRB
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb
# baseurl=https://repo.almalinux.org/almalinux/$releasever/CRB/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[crb-debuginfo]
name=AlmaLinux $releasever - CRB - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-debug
# baseurl=https://vault.almalinux.org/$releasever/CRB/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[crb-source]
name=AlmaLinux $releasever - CRB - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/crb-source
# baseurl=https://vault.almalinux.org/$releasever/CRB/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-extras.repo
[extras]
name=AlmaLinux $releasever - Extras
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras
# baseurl=https://repo.almalinux.org/almalinux/$releasever/extras/$basearch/os/
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[extras-debuginfo]
name=AlmaLinux $releasever - Extras - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-debug
# baseurl=https://vault.almalinux.org/$releasever/extras/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[extras-source]
name=AlmaLinux $releasever - Extras - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/extras-source
# baseurl=https://vault.almalinux.org/$releasever/extras/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-highavailability.repo
[highavailability]
name=AlmaLinux $releasever - HighAvailability
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability
# baseurl=https://repo.almalinux.org/almalinux/$releasever/HighAvailability/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[highavailability-debuginfo]
name=AlmaLinux $releasever - HighAvailability - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability-debug
# baseurl=https://vault.almalinux.org/$releasever/HighAvailability/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[highavailability-source]
name=AlmaLinux $releasever - HighAvailability - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/highavailability-source
# baseurl=https://vault.almalinux.org/$releasever/HighAvailability/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-nfv.repo
[nfv]
name=AlmaLinux $releasever - NFV
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv
# baseurl=https://repo.almalinux.org/almalinux/$releasever/NFV/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[nfv-debuginfo]
name=AlmaLinux $releasever - NFV - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-debug
# baseurl=https://vault.almalinux.org/$releasever/NFV/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[nfv-source]
name=AlmaLinux $releasever - NFV - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-source
# baseurl=https://vault.almalinux.org/$releasever/NFV/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-rt.repo
[rt]
name=AlmaLinux $releasever - RT
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt
# baseurl=https://repo.almalinux.org/almalinux/$releasever/RT/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[rt-debuginfo]
name=AlmaLinux $releasever - RT - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-debug
# baseurl=https://vault.almalinux.org/$releasever/RT/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[rt-source]
name=AlmaLinux $releasever - RT - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-source
# baseurl=https://vault.almalinux.org/$releasever/RT/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-saphana.repo
[saphana]
name=AlmaLinux $releasever - SAPHANA
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAPHANA/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[saphana-debuginfo]
name=AlmaLinux $releasever - SAPHANA - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-debug
# baseurl=https://vault.almalinux.org/$releasever/SAPHANA/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[saphana-source]
name=AlmaLinux $releasever - SAPHANA - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-source
# baseurl=https://vault.almalinux.org/$releasever/SAPHANA/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-sap.repo
[sap]
name=AlmaLinux $releasever - SAP
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAP/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[sap-debuginfo]
name=AlmaLinux $releasever - SAP - Debug
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-debug
# baseurl=https://vault.almalinux.org/$releasever/SAP/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0

[sap-source]
name=AlmaLinux $releasever - SAP - Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-source
# baseurl=https://vault.almalinux.org/$releasever/SAP/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux-10
metadata_expire=86400
enabled_metadata=0
EOF
        ;;
    9)
        cat <<'EOF' >$Dir_YumRepos/almalinux-appstream.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-baseos.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-crb.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-extras.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-highavailability.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-nfv.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-plus.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-resilientstorage.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-rt.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-sap.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-saphana.repo
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
        cat <<'EOF' >$Dir_YumRepos/almalinux-ha.repo
[ha]
name=AlmaLinux $releasever - HighAvailability
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha
# baseurl=https://repo.almalinux.org/almalinux/$releasever/HighAvailability/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[ha-source]
name=AlmaLinux $releasever - HighAvailability Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha-source
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[ha-debuginfo]
name=AlmaLinux $releasever - HighAvailability debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/ha-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/HighAvailability/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-nfv.repo
[nfv]
name=AlmaLinux $releasever - Real Time for NFV
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv
# baseurl=https://repo.almalinux.org/almalinux/$releasever/NFV/$basearch/os/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[nfv-source]
name=AlmaLinux $releasever - Real Time for NFV Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-source
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[nfv-debuginfo]
name=AlmaLinux $releasever - Real Time for NFV Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/nfv-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/NFV/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-plus.repo
[plus]
name=AlmaLinux $releasever - Plus
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus
# baseurl=https://repo.almalinux.org/almalinux/$releasever/plus/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[plus-source]
name=AlmaLinux $releasever - Plus Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-source
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[plus-debuginfo]
name=AlmaLinux $releasever - Plus debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/plus-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/plus/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-powertools.repo
[powertools]
name=AlmaLinux $releasever - PowerTools
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools
# baseurl=https://repo.almalinux.org/almalinux/$releasever/PowerTools/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[powertools-source]
name=AlmaLinux $releasever - PowerTools Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools-source
# baseurl=https://repo.almalinux.org/vault/$releasever/PowerTools/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[powertools-debuginfo]
name=AlmaLinux $releasever - PowerTools debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/powertools-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/PowerTools/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-resilientstorage.repo
[resilientstorage]
name=AlmaLinux $releasever - ResilientStorage
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage
# baseurl=https://repo.almalinux.org/almalinux/$releasever/ResilientStorage/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[resilientstorage-source]
name=AlmaLinux $releasever - ResilientStorage Source
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-source
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[resilientstorage-debuginfo]
name=AlmaLinux $releasever - ResilientStorage debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/resilientstorage-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/ResilientStorage/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-rt.repo
[rt]
name=AlmaLinux $releasever - Real Time
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt
# baseurl=https://repo.almalinux.org/almalinux/$releasever/RT/$basearch/os/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[rt-source]
name=AlmaLinux $releasever - Real Time Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-source
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[rt-debuginfo]
name=AlmaLinux $releasever - Real Time Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/rt-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/RT/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-sap.repo
[sap]
name=AlmaLinux $releasever - SAP
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAP/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[sap-source]
name=AlmaLinux $releasever - SAP Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[sap-debuginfo]
name=AlmaLinux $releasever - SAP Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/sap-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/SAP/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux-saphana.repo
[saphana]
name=AlmaLinux $releasever - SAP HANA
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana
# baseurl=https://repo.almalinux.org/almalinux/$releasever/SAPHANA/$basearch/os/
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[saphana-source]
name=AlmaLinux $releasever - SAP HANA Sources
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-source
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/Source/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux

[saphana-debuginfo]
name=AlmaLinux $releasever - SAP HANA Debuginfo
mirrorlist=https://mirrors.almalinux.org/mirrorlist/$releasever/saphana-debuginfo
# baseurl=https://repo.almalinux.org/vault/$releasever/SAPHANA/debug/$basearch/
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
EOF
        cat <<'EOF' >$Dir_YumRepos/almalinux.repo
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

## 生成 Fedora repo 源文件
function gen_repo_files_Fedora() {
    cat <<'EOF' >$Dir_YumRepos/fedora.repo
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
    cat <<'EOF' >$Dir_YumRepos/fedora-updates.repo
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
    cat <<'EOF' >$Dir_YumRepos/fedora-updates-testing.repo
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
    ## 自 Fedora 39 起不再使用 modular 仓库
    if [[ $1 -lt 39 ]]; then
        cat <<'EOF' >$Dir_YumRepos/fedora-modular.repo
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
        cat <<'EOF' >$Dir_YumRepos/fedora-updates-modular.repo
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
        cat <<'EOF' >$Dir_YumRepos/fedora-updates-testing-modular.repo
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
    fi
}

## 生成 openEuler repo 源文件
function gen_repo_files_openEuler() {
    cat <<'EOF' >$Dir_YumRepos/openEuler.repo
[OS]
name=OS
baseurl=http://repo.openeuler.org/openEuler-version/OS/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/OS/$basearch/RPM-GPG-KEY-openEuler

[everything]
name=everything
baseurl=http://repo.openeuler.org/openEuler-version/everything/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/everything/$basearch/RPM-GPG-KEY-openEuler

[EPOL]
name=EPOL
baseurl=http://repo.openeuler.org/openEuler-version/EPOL/main/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/OS/$basearch/RPM-GPG-KEY-openEuler

[debuginfo]
name=debuginfo
baseurl=http://repo.openeuler.org/openEuler-version/debuginfo/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/debuginfo/$basearch/RPM-GPG-KEY-openEuler

[source]
name=source
baseurl=http://repo.openeuler.org/openEuler-version/source/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/source/RPM-GPG-KEY-openEuler

[update]
name=update
baseurl=http://repo.openeuler.org/openEuler-version/update/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/OS/$basearch/RPM-GPG-KEY-openEuler

[update-source]
name=update-source
baseurl=http://repo.openeuler.org/openEuler-version/update/source/
enabled=1
gpgcheck=1
gpgkey=http://repo.openeuler.org/openEuler-version/source/RPM-GPG-KEY-openEuler
EOF
    ## 替换版本号
    local version_name="$(get_os_release_value VERSION | sed 's/["()]//g; s/[_ ]\+/-/g; s/^-\+\|-\+$//g')"
    sed -e "s|openEuler-version|openEuler-${version_name}|g" \
        -i \
        $Dir_YumRepos/openEuler.repo
}

## 生成 OpenCloudOS repo 源文件
function gen_repo_files_OpenCloudOS() {
    case "${1%.*}" in
    23)
        cat <<'EOF' >$Dir_YumRepos/OpenCloudOS-Stream.repo
[BaseOS]
name=BaseOS $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/BaseOS/$basearch/Packages/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream

[AppStream]
name=AppStream $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/AppStream/$basearch/Packages/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream

[BaseOS-debug]
name=BaseOS-debug $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/BaseOS/$basearch/debug/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream

[AppStream-debug]
name=AppStream-debug $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/AppStream/$basearch/debug/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream

[BaseOS-source]
name=BaseOS-source $releasever
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/BaseOS/source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream

[AppStream-source]
name=AppStream-source $releasever
baseurl=https://mirrors.opencloudos.tech/opencloudos-stream/releases/$releasever/AppStream/source/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-Stream
EOF
        ;;
    9)
        cat <<'EOF' >$Dir_YumRepos/OpenCloudOS.repo
[BaseOS]
name=BaseOS $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[AppStream]
name=AppStream $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[extras]
name=extras $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[BaseOS-debuginfo]
name=BaseOS-debuginfo $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[AppStream-debuginfo]
name=AppStream-debuginfo $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[extras-debuginfo]
name=extras-debuginfo $releasever - $basearch
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/extras/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[BaseOS-source]
name=BaseOS-source $releasever
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[AppStream-source]
name=AppStream-source $releasever
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9

[extras-source]
name=extras-source $releasever
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/extras/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS-9
EOF
        ;;
    8)
        cat <<'EOF' >$Dir_YumRepos/OpenCloudOS-Debuginfo.repo
[BaseOS-debuginfo]
name=OpenCloudOS $releasever - BaseOS-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[AppStream-debuginfo]
name=OpenCloudOS $releasever - AppStream-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Extras-debuginfo]
name=OpenCloudOS $releasever - Extras-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Extras/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[HighAvailability-debuginfo]
name=OpenCloudOS $releasever - HighAvailability-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/HighAvailability/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[PowerTools-debuginfo]
name=OpenCloudOS $releasever - PowerTools-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/PowerTools/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[ResilientStorage-debuginfo]
name=OpenCloudOS $releasever - ResilientStorage-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/ResilientStorage/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Plus-debuginfo]
name=OpenCloudOS $releasever - Plus-debuginfo
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Plus/$basearch/debug/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS
EOF
        if [[ "${1}" == "8.6" ]]; then
            cat <<'EOF' >$Dir_YumRepos/OpenCloudOS.repo
[BaseOS]
name=OpenCloudOS $releasever - BaseOS
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[AppStream]
name=OpenCloudOS $releasever - AppStream
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Extras]
name=OpenCloudOS $releasever - Extras
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[HighAvailability]
name=OpenCloudOS $releasever - HighAvailability
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[PowerTools]
name=OpenCloudOS $releasever - PowerTools
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[ResilientStorage]
name=OpenCloudOS $releasever - ResilientStorage
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Plus]
name=OpenCloudOS $releasever - Plus
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Plus/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS
EOF
        else
            cat <<'EOF' >$Dir_YumRepos/OpenCloudOS.repo
[BaseOS]
name=OpenCloudOS $releasever - BaseOS
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[AppStream]
name=OpenCloudOS $releasever - AppStream
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Extras]
name=OpenCloudOS $releasever - Extras
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Extras/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[HighAvailability]
name=OpenCloudOS $releasever - HighAvailability
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/HighAvailability/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[NFV]
name=OpenCloudOS $releasever - NFV
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/NFV/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[PowerTools]
name=OpenCloudOS $releasever - PowerTools
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/PowerTools/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[ResilientStorage]
name=OpenCloudOS $releasever - ResilientStorage
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/ResilientStorage/$basearch/os/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Plus]
name=OpenCloudOS $releasever - Plus
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Plus/$basearch/os/
gpgcheck=1
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS
EOF
        fi
        cat <<'EOF' >$Dir_YumRepos/OpenCloudOS-Sources.repo
[BaseOS-source]
name=OpenCloudOS $releasever - Base-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/BaseOS/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[AppStream-source]
name=OpenCloudOS $releasever - AppStream-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/AppStream/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Extras-source]
name=OpenCloudOS $releasever - Extras-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Extras/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[HighAvailability-source]
name=OpenCloudOS $releasever - HighAvailability-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/HighAvailability/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[PowerTools-source]
name=OpenCloudOS $releasever - PowerTools-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/PowerTools/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[ResilientStorage-source]
name=OpenCloudOS $releasever - ResilientStorage-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/ResilientStorage/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS

[Plus-source]
name=OpenCloudOS $releasever - Plus-source
baseurl=https://mirrors.opencloudos.tech/opencloudos/$releasever/Plus/source/tree/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-OpenCloudOS
EOF
        ;;
    esac
}

## 生成 Anolis OS repo 源文件
function gen_repo_files_AnolisOS() {
    case "${1%.*}" in
    23)
        cat <<'EOF' >$Dir_YumRepos/AnolisOS.repo
[os]
name=AnolisOS-$releasever - os
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/os/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[updates]
name=AnolisOS-$releasever - updates
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/updates/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[kernel-6]
name=AnolisOS-$releasever - kernel-6
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/kernel-6/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Source.repo
[os-source]
name=AnolisOS-$releasever - os Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/os/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[updates-source]
name=AnolisOS-$releasever - updates Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/updates/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[kernel-source]
name=AnolisOS-$releasever - kernel-6 Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/kernel-6/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Debuginfo.repo
[os-debuginfo]
name=AnolisOS-$releasever - os Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/os/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[updates-debuginfo]
name=AnolisOS-$releasever - updates Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/updates/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[kernel-6-debuginfo]
name=AnolisOS-$releasever - kernel-6 Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/kernel-6/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        ;;
    8)
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-AppStream.repo
[AppStream]
name=AnolisOS-$releasever - AppStream
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/AppStream/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-BaseOS.repo
[BaseOS]
name=AnolisOS-$releasever - BaseOS
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/BaseOS/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-DDE.repo
[DDE]
name=AnolisOS-$releasever - DDE
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/DDE/$basearch/os
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Debuginfo.repo
[AppStream-debuginfo]
name=AnolisOS-$releasever - AppStream Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/AppStream/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[BaseOS-debuginfo]
name=AnolisOS-$releasever - BaseOS Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/BaseOS/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[Plus-debuginfo]
name=AnolisOS-$releasever - Plus Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/Plus/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
          
[PowerTools-debuginfo]
name=AnolisOS-$releasever - PowerTools Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/PowerTools/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[DDE-debuginfo]
name=AnolisOS-$releasever - DDE Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/DDE/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Extras.repo
[Extras]
name=AnolisOS-$releasever - Extras
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/Extras/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-HighAvailability.repo
[HighAvailability]
name=AnolisOS-$releasever - HighAvailability
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/HighAvailability/$basearch/os
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Plus.repo
[Plus]
name=AnolisOS-$releasever - Plus
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/Plus/$basearch/os
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-PowerTools.repo
[PowerTools]
name=AnolisOS-$releasever - PowerTools
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/PowerTools/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/AnolisOS-Source.repo
[AppStream-source]
name=AnolisOS-$releasever - AppStream Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/AppStream/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[BaseOS-source]
name=AnolisOS-$releasever - BaseOS Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/BaseOS/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[Plus-source]
name=AnolisOS-$releasever - Plus Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/Plus/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
          
[PowerTools-source]
name=AnolisOS-$releasever - PowerTools Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/PowerTools/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[DDE-source]
name=AnolisOS-$releasever - DDE Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/DDE/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        ## 8.8 新增
        if [[ "${1#*.}" -ge 8 ]]; then
            cat <<'EOF' >$Dir_YumRepos/AnolisOS-kernel-5.10.repo
[kernel-5.10]
name=AnolisOS-$releasever - Kernel 5.10
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/kernel-5.10/$basearch/os
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[kernel-5.10-source]
name=AnolisOS-$releasever - Kernel 5.10 source
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/kernel-5.10/source
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[kernel-5.10-debug]
name=AnolisOS-$releasever - Kernel 5.10 debug
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/kernel-5.10/$basearch/debug
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        fi
        ## 8.10 新增
        if [[ "${1#*.}" -eq 10 ]]; then
            cat <<'EOF' >$Dir_YumRepos/AnolisOS-Devel.repo
[Devel]
name=AnolisOS-$releasever - Devel
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/Devel/$basearch/os
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
            cat <<'EOF' >$Dir_YumRepos/AnolisOS-NDE.repo
[NDE]
name=AnolisOS-$releasever - NDE
baseurl=http://mirrors.openanolis.cn/anolis/$releasever/NDE/$basearch/os
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[NDE-debuginfo]
name=AnolisOS-$releasever - NDE Debuginfo
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/NDE/$basearch/debug
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1

[NDE-source]
name=AnolisOS-$releasever - NDE Source
baseurl=https://mirrors.openanolis.cn/anolis/$releasever/NDE/source/
enabled=0
gpgkey=https://mirrors.openanolis.cn/anolis/RPM-GPG-KEY-ANOLIS
gpgcheck=1
EOF
        fi
        ;;
    esac
}

## 生成 openSUSE repo 源文件
function gen_repo_files_openSUSE() {
    case "$1" in
    "leap")
        case "${2%.*}" in
        16)
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-non-oss-debug.repo
[openSUSE:repo-non-oss-debug]
name=repo-non-oss-debug (${releasever})
enabled=0
autorefresh=1
baseurl=http://cdn.opensuse.org/debug/distribution/leap/${releasever}/repo/non-oss/$basearch
gpgkey=http://cdn.opensuse.org/debug/distribution/leap/${releasever}/repo/non-oss/$basearch/repodata/repomd.xml.key
EOF
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-non-oss.repo
[openSUSE:repo-non-oss]
name=repo-non-oss (${releasever})
enabled=0
autorefresh=1
baseurl=http://cdn.opensuse.org/distribution/leap/${releasever}/repo/non-oss/$basearch
gpgkey=http://cdn.opensuse.org/distribution/leap/${releasever}/repo/non-oss/$basearch/repodata/repomd.xml.key
EOF
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-openh264.repo
[openSUSE:repo-openh264]
name=repo-openh264 (${releasever})
enabled=1
autorefresh=1
baseurl=http://codecs.opensuse.org/openh264/openSUSE_Leap_16
gpgkey=https://codecs.opensuse.org/openh264/openSUSE_Leap_16/repodata/repomd.xml.key
EOF
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-oss-debug.repo
[openSUSE:repo-oss-debug]
name=repo-oss-debug (${releasever})
enabled=0
autorefresh=1
baseurl=http://cdn.opensuse.org/debug/distribution/leap/${releasever}/repo/oss/$basearch
gpgkey=http://cdn.opensuse.org/debug/distribution/leap/${releasever}/repo/oss/$basearch/repodata/repomd.xml.key
EOF
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-oss.repo
[openSUSE:repo-oss]
name=repo-oss (${releasever})
enabled=1
autorefresh=1
baseurl=http://cdn.opensuse.org/distribution/leap/${releasever}/repo/oss/$basearch
gpgkey=http://cdn.opensuse.org/distribution/leap/${releasever}/repo/oss/$basearch/repodata/repomd.xml.key
EOF
            cat <<'EOF' >$Dir_ZYppRepos/openSUSE:repo-oss-source.repo
[openSUSE:repo-oss-source]
name=repo-oss-source (${releasever})
enabled=0
autorefresh=1
baseurl=http://cdn.opensuse.org/source/distribution/leap/${releasever}/repo/oss
gpgkey=http://cdn.opensuse.org/source/distribution/leap/${releasever}/repo/oss/repodata/repomd.xml.key
EOF
            ;;
        15)
            case "${2#*.}" in
            [0-2])
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-non-oss.repo
[repo-debug-non-oss]
name=Debug Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/non-oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug.repo
[repo-debug]
name=Debug Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-update-non-oss.repo
[repo-debug-update-non-oss]
name=Update Repository (Debug, Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/non-oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-update.repo
[repo-debug-update]
name=Update Repository (Debug)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-non-oss.repo
[repo-non-oss]
name=Non-OSS Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/non-oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-oss.repo
[repo-oss]
name=Main Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-source-non-oss.repo
[repo-source-non-oss]
name=Source Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/non-oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-source.repo
[repo-source]
name=Source Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/oss/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-update-non-oss.repo
[repo-update-non-oss]
name=Update Repository (Non-Oss)
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/non-oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-update.repo
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
                cat <<'EOF' >$Dir_ZYppRepos/repo-backports-debug-update.repo
[repo-backports-debug-update]
name=Update repository with updates for openSUSE Leap debuginfo packages from openSUSE Backports
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/backports_debug/
type=NONE
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-backports-update.repo
[repo-backports-update]
name=Update repository of openSUSE Backports
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/backports/
path=/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-non-oss.repo
[repo-debug-non-oss]
name=Debug Repository (Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/non-oss/
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug.repo
[repo-debug]
name=Debug Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/distribution/leap/$releasever/repo/oss/
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-update-non-oss.repo
[repo-debug-update-non-oss]
name=Update Repository (Debug, Non-OSS)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/non-oss/
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-debug-update.repo
[repo-debug-update]
name=Update Repository (Debug)
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/oss/
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-non-oss.repo
[repo-non-oss]
name=Non-OSS Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/non-oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-openh264.repo
[repo-openh264]
name=Open H.264 Codec (openSUSE Leap)
enabled=1
autorefresh=1
baseurl=http://codecs.opensuse.org/openh264/openSUSE_Leap/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-oss.repo
[repo-oss]
name=Main Repository
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/distribution/leap/$releasever/repo/oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-sle-debug-update.repo
[repo-sle-debug-update]
name=Update repository with debuginfo for updates from SUSE Linux Enterprise 15
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/update/leap/$releasever/sle/
path=/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-sle-update.repo
[repo-sle-update]
name=Update repository with updates from SUSE Linux Enterprise 15
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/sle/
path=/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-source.repo
[repo-source]
name=Source Repository
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/distribution/leap/$releasever/repo/oss/
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-update-non-oss.repo
[repo-update-non-oss]
name=Update Repository (Non-Oss)
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/update/leap/$releasever/non-oss/
type=rpm-md
keeppackages=0
EOF
                cat <<'EOF' >$Dir_ZYppRepos/repo-update.repo
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
        esac
        ;;
    "tumbleweed")
        cat <<'EOF' >$Dir_ZYppRepos/repo-debug.repo
[repo-debug]
name=openSUSE-Tumbleweed-Debug
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/debug/tumbleweed/repo/oss/
path=/
keeppackages=0
EOF
        cat <<'EOF' >$Dir_ZYppRepos/repo-non-oss.repo
[repo-non-oss]
name=openSUSE-Tumbleweed-Non-Oss
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/tumbleweed/repo/non-oss/
path=/
type=rpm-md
keeppackages=0
EOF
        cat <<'EOF' >$Dir_ZYppRepos/repo-openh264.repo
[repo-openh264]
name=Open H.264 Codec (openSUSE Tumbleweed)
enabled=1
autorefresh=1
baseurl=http://codecs.opensuse.org/openh264/openSUSE_Tumbleweed
path=/
type=rpm-md
keeppackages=0
EOF
        cat <<'EOF' >$Dir_ZYppRepos/repo-oss.repo
[repo-oss]
name=openSUSE-Tumbleweed-Oss
enabled=1
autorefresh=1
baseurl=http://download.opensuse.org/tumbleweed/repo/oss/
path=/
type=rpm-md
keeppackages=0
EOF
        cat <<'EOF' >$Dir_ZYppRepos/repo-source.repo
[repo-source]
name=openSUSE-Tumbleweed-Source
enabled=0
autorefresh=1
baseurl=http://download.opensuse.org/source/tumbleweed/repo/oss/
path=/
keeppackages=0
EOF
        cat <<'EOF' >$Dir_ZYppRepos/repo-update.repo
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

## 生成 EPEL 附加软件包 repo 源文件
function gen_repo_files_EPEL() {
    case "${1}" in
    10)
        cat <<'EOF' >$Dir_YumRepos/epel.repo
[epel]
name=Extra Packages for Enterprise Linux $releasever - $basearch
#baseurl=https://download.example/pub/epel/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
countme=1
enabled=1

[epel-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Debug
#baseurl=https://download.example/pub/epel/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
enabled=0

[epel-source]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Source
#baseurl=https://download.example/pub/epel/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
enabled=0
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-testing.repo
[epel-testing]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch
#baseurl=https://download.example/pub/epel/testing/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
countme=1
enabled=0

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Debug
#baseurl=https://download.example/pub/epel/testing/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
enabled=0

[epel-testing-source]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Source
#baseurl=https://download.example/pub/epel/testing/$releasever_major${releasever_minor:+.$releasever_minor}/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever_major${releasever_minor:+.$releasever_minor}&arch=$basearch
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever_major
gpgcheck=1
repo_gpgcheck=0
metadata_expire=24h
enabled=0
EOF
        ;;
    9)
        cat <<'EOF' >$Dir_YumRepos/epel.repo
[epel]
name=Extra Packages for Enterprise Linux $releasever - $basearch
#baseurl=https://download.example/pub/epel/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever

[epel-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Debug
#baseurl=https://download.example/pub/epel/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux $releasever - $basearch - Source
#baseurl=https://download.example/pub/epel/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-testing.repo
[epel-testing]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Debug
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux $releasever - Testing - $basearch - Source
#baseurl=https://download.example/pub/epel/testing/$releasever/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel$releasever&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
gpgcheck=1
EOF
        ## 此仓库特殊，默认不启用
        cat <<'EOF' >$Dir_YumRepos/epel-cisco-openh264.repo
[epel-cisco-openh264]
name=Extra Packages for Enterprise Linux $releasever openh264 (From Cisco) - $basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-cisco-openh264-$releasever&arch=$basearch
type=rpm
enabled=0
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
skip_if_unavailable=True

[epel-cisco-openh264-debuginfo]
name=Extra Packages for Enterprise Linux $releasever openh264 (From Cisco) - $basearch - Debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-cisco-openh264-debug-$releasever&arch=$basearch
type=rpm
enabled=0
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
skip_if_unavailable=True

[epel-cisco-openh264-source]
name=Extra Packages for Enterprise Linux $releasever openh264 (From Cisco) - $basearch - Source
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-cisco-openh264-source-$releasever&arch=$basearch
type=rpm
enabled=0
metadata_expire=14d
repo_gpgcheck=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-$releasever
skip_if_unavailable=True
EOF
        ;;
    8)
        cat <<'EOF' >$Dir_YumRepos/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 8 - $basearch
#baseurl=https://download.example/pub/epel/8/Everything/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 8 - $basearch - Debug
#baseurl=https://download.example/pub/epel/8/Everything/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux 8 - $basearch - Source
#baseurl=https://download.example/pub/epel/8/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-testing.repo
[epel-testing]
name=Extra Packages for Enterprise Linux 8 - Testing - $basearch
#baseurl=https://download.example/pub/epel/testing/8/Everything/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux 8 - Testing - $basearch - Debug
#baseurl=https://download.example/pub/epel/testing/8/Everything/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux 8 - Testing - $basearch - Source
#baseurl=https://download.example/pub/epel/testing/8/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-modular.repo
[epel-modular]
name=Extra Packages for Enterprise Linux Modular 8 - $basearch - RETIRED
#baseurl=https://download.example/pub/epel/8/Modular/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-modular-debuginfo]
name=Extra Packages for Enterprise Linux Modular 8 - $basearch - Debug - RETIRED
#baseurl=https://download.example/pub/epel/8/Modular/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-debug-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-modular-source]
name=Extra Packages for Enterprise Linux Modular 8 - $basearch - Source - RETIRED
#baseurl=https://download.example/pub/epel/8/Modular/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-modular-source-8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-testing-modular.repo
[epel-testing-modular]
name=Extra Packages for Enterprise Linux Modular 8 - Testing - $basearch - RETIRED
#baseurl=https://download.example/pub/epel/testing/8/Modular/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8

[epel-testing-modular-debuginfo]
name=Extra Packages for Enterprise Linux Modular 8 - Testing - $basearch - Debug - RETIRED
#baseurl=https://download.example/pub/epel/testing/8/Modular/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-debug-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1

[epel-testing-modular-source]
name=Extra Packages for Enterprise Linux Modular 8 - Testing - $basearch - Source - RETIRED
#baseurl=https://download.example/pub/epel/testing/8/Modular/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-modular-source-epel8&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8
gpgcheck=1
EOF
        ;;
    7)
        cat <<'EOF' >$Dir_YumRepos/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 7 - $basearch
#baseurl=http://download.example/pub/epel/7/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-debuginfo]
name=Extra Packages for Enterprise Linux 7 - $basearch - Debug
#baseurl=http://download.example/pub/epel/7/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-debug-7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1

[epel-source]
name=Extra Packages for Enterprise Linux 7 - $basearch - Source
#baseurl=http://download.example/pub/epel/7/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-source-7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-testing.repo
[epel-testing]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch
#baseurl=http://download.example/pub/epel/testing/7/$basearch
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7

[epel-testing-debuginfo]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch - Debug
#baseurl=http://download.example/pub/epel/testing/7/$basearch/debug
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1

[epel-testing-source]
name=Extra Packages for Enterprise Linux 7 - Testing - $basearch - Source
#baseurl=http://download.example/pub/epel/testing/7/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel7&arch=$basearch&infra=$infra&content=$contentdir
failovermethod=priority
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
gpgcheck=1
EOF
        ;;
    esac
}

## 生成 EPEL 附加软件包 NEXT repo 源文件
function gen_repo_files_EPEL_NEXT() {
    case "${1}" in
    9)
        cat <<'EOF' >$Dir_YumRepos/epel-next.repo
[epel-next]
name=Extra Packages for Enterprise Linux 9 - Next - $basearch
#baseurl=https://download.example/pub/epel/next/9/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-next-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=1
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9

[epel-next-debuginfo]
name=Extra Packages for Enterprise Linux 9 - Next - $basearch - Debug
#baseurl=https://download.example/pub/epel/next/9/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-next-debug-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9
gpgcheck=1

[epel-next-source]
name=Extra Packages for Enterprise Linux 9 - Next - $basearch - Source
#baseurl=https://download.example/pub/epel/next/9/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-next-source-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9
gpgcheck=1
EOF
        cat <<'EOF' >$Dir_YumRepos/epel-next-testing.repo
[epel-next-testing]
name=Extra Packages for Enterprise Linux 9 - Next - Testing - $basearch
#baseurl=https://download.example/pub/epel/testing/next/9/Everything/$basearch/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-testing-next-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgcheck=1
countme=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9

[epel-next-testing-debuginfo]
name=Extra Packages for Enterprise Linux 9 - Next - Testing - $basearch - Debug
#baseurl=https://download.example/pub/epel/testing/next/9/Everything/$basearch/debug/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-testing-next-debug-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9
gpgcheck=1

[epel-next-testing-source]
name=Extra Packages for Enterprise Linux 9 - Next - Testing - $basearch - Source
#baseurl=https://download.example/pub/epel/testing/next/9/Everything/source/tree/
metalink=https://mirrors.fedoraproject.org/metalink?repo=epel-testing-next-source-9&arch=$basearch&infra=$infra&content=$contentdir
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9
gpgcheck=1
EOF
        ;;
    esac
}

##############################################################################

handle_command_options "$@"
main
