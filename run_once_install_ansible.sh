#!/bin/bash

install_on_fedora() {
    sudo dnf install -y ansible
}

install_on_ubuntu() {
    if command -v curl > /dev/null; then
        sudo apt install curl
    fi
    if command -v brew > /dev/null; then
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
        sudo apt-get install build-essential
        brew install gcc
    fi
    # Install wezterm
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo apt-get update
    sudo install wezterm
    # Install Ansible
    sudo apt-get install -y ansible
}

install_on_mac() {
    if command -v brew > /dev/null; then
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    fi
    # Install wezterm
    brew install wezterm
    # Install Ansible
    brew install ansible
}

OS="$(uname -s)"
case "${OS}" in
    Linux*)
        if [ -f /etc/fedora-release ]; then
            install_on_fedora
        elif [ -f /etc/lsb-release ]; then
            install_on_ubuntu
        else
            echo "Unsupported Linux distribution"
            exit 1
        fi
        ;;
    Darwin*)
        install_on_mac
        ;;
    *)
        echo "Unsupported operating system: ${OS}"
        exit 1
        ;;
esac

# Install tailscale
#curl -fsSL https://tailscale.com/install.sh | sh
# sudo tailscale up

# Ansible playbook
## ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
