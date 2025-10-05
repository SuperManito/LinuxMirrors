``` bash
# !/bin/bash
function install_docker() {
    if command -v docker &>/dev/null; then
        return
    fi

    bash <(curl -sSL https://${script_host}/docker.sh) \
        --install-latest true \
        --ignore-backup-tips

    if command -v docker &>/dev/null; then
        echo -e "\n# Docker installation successful.\n# Please run this script again manually after installation."
        exit 0
    else
        echo -e "\n# Docker installation failed.\n# Please check the error message above."
        exit 1
    fi
}

install_docker
```