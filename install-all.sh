#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: PHP Dev + Python Dev + Kubernetes Dev
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: MIT

# ----------- VARIABLES FOR DIFFERENT VERSIONS ------------------- #
PHP_VERSIONS="5.6 7.0 7.1 7.2 7.3 7.4";
PYTHON_VERSIONS="2.7 3.5 3.6 3.7 3.8";
OH_MY_ZSH="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh";
LINUX_BREW="https://raw.githubusercontent.com/Homebrew/install/master/install.sh";
MULTI_PHP="https://github.com/INDIAN2020/PHP-Python-Kubernetes/blob/master/php-multi.sh";
MULTI_PYTHON="https://github.com/INDIAN2020/php-python-kubernetes/blob/master/python-multi.sh";
KUBERNETES="https://github.com/INDIAN2020/php-python-kubernetes/blob/master/kubernetes.sh";
TERRAFORM="https://github.com/INDIAN2020/php-python-kubernetes/blob/master/terraform.sh";
# ----------- VARIABLES FOR DIFFERENT VERSIONS ------------------- #

if [ "$(whoami)" != "root" ]; then
    echo "$(tput setaf 4)$(tput bold)This script must be run as root.$(tput sgr 0)";
    exit 2;
else
	echo "-----------------------------------------------------";
	echo "PHP Dev + Python Dev + Kubernetes Dev + Terraform Dev";
	echo "-----------------------------------------------------";
fi

__install_PHP(){
	sh -c "$(curl -fsSL $MULTI_PHP)";
}

__install_Python(){
	sh -c "$(curl -fsSL $MULTI_PYTHON)";
}

__install_Kubernetes(){
	sh -c "$(curl -fsSL $KUBERNETES)";
}

__install_Terraform(){
	sh -c "$(curl -fsSL $TERRAFORM)";
}

# ---------------------------------------------------------------- #
# -------------------  DO NOT CHANGE BELOW  ---------------------- #
# ---------------------------------------------------------------- #
# Install script dependencies:
setup_script_dependencies() {
    APT_TO_INSTALL="";
    [[ ! -x $(which curl) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} curl";
    [[ ! -x $(which libnss3-tools) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} libnss3-tools";
    [[ ! -x $(which jq) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} jq";
    [[ ! -x $(which xsel) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} xsel";
    [[ ! -x $(which wget) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} wget";
    [[ ! -x $(which gettext) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} gettext";
    [[ ! -x $(which phpenmod) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} phpenmod";
    [[ ! -x $(which unrar) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} unrar";
    [[ ! -x $(which unzip) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} unzip";
    [[ ! -x $(which zip) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} zip";
    [[ ! -x $(which git) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} git";
    [[ ! -x $(which add-apt-repository) ]] && APT_TO_INSTALL="${APT_TO_INSTALL} add-apt-repository";
    if [[ "${APT_TO_INSTALL}" != "" ]]; then
        echo -e "Installing script dependencies collection...";
        sudo apt update && sudo apt upgrade;
        sudo apt-get install -y ${APT_TO_INSTALL};
    fi
}
get_install_commands() {
    re='(?<=^__install_)(.+?)(?=\()';
    commands=$(cat ${BASH_SOURCE[0]} | grep -o -P ${re});
    echo ${commands};
}

functions="$(get_install_commands)";
for func in ${functions}; do
    read -p "You need ${func} ?" yn
    case $yn in
        [yY] | [yY][Ee][Ss] )
            __install_${func};
        ;;
        [nN] | [nN][Oo] ) ;;    
        * ) echo "Please answer yes or no.";;
    esac
done
