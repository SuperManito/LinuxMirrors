``` bash
# !/bin/bash
function install_docker() {
    if command -v docker &>/dev/null; then
        return
    fi

    # script options
    local script_host="linuxmirrors.cn" # official host (CDN), more host see official site
    local close_firewall="true"         # close firewalld service and selinux (redhat systems need)
    # mirrors options
    local source_docker_ce_address="mirrors.tencent.com/docker-ce" # global high availability address
    local source_docker_ce_protocol="https"                        # https or http
    local source_docker_registry_address="registry.hub.docker.com"

    # judge network environment
    local region_code="$(curl -s ipinfo.io/country)"
    if [[ "${region_code}" == "CN" ]]; then
        local source_intranet_address=""
        # use intranet source if possible
        if [ -s "/sys/class/dmi/id/sys_vendor" ]; then
            local sys_vendor="$(cat /sys/class/dmi/id/sys_vendor)"
            if [[ "${sys_vendor}" == *"Alibaba"* ]]; then
                source_intranet_address="mirrors.cloud.aliyuncs.com/docker-ce"
            elif [[ "${sys_vendor}" == *"Huawei"* ]]; then
                source_intranet_address="mirrors.myhuaweicloud.com/docker-ce"
            elif [[ "${sys_vendor}" == *"Tencent"* ]]; then
                source_intranet_address="mirrors.tencentyun.com/docker-ce"
            elif [[ "${sys_vendor}" == *"Inspur"* ]]; then
                source_intranet_address="mirrors.ivolces.com/docker-ce"
            fi
        else
            cat /etc/motd | grep "Alibaba Cloud " -q
            if [ $? -eq 0 ]; then
                source_intranet_address="mirrors.cloud.aliyuncs.com/docker-ce"
            fi
        fi
        # check connectivity
        if [ -n "${source_intranet_address}" ]; then
            if ping -c1 -W1 "${source_intranet_address%%/*}" >/dev/null 2>&1; then
                source_docker_ce_address="${source_intranet_address}"
                source_docker_ce_protocol="http"
            fi
        fi
        # registry mirror (best choice for Chinese mainland)
        source_docker_registry_address="docker.1ms.run"
    else
        # use official source
        source_docker_ce_address="download.docker.com"
        source_docker_registry_address="registry.hub.docker.com"
    fi

    # install docker engine
    bash <(curl -sSL https://${script_host}/docker-lite.sh) \
        --source "${source_docker_ce_address}" \
        --source-registry "${source_docker_registry_address}" \
        --protocol "${source_docker_ce_protocol}" \
        --close-firewall "${close_firewall}"
}

install_docker
```