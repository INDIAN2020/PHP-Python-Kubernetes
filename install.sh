#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: PHP Dev + Python Dev + Kubernetes Dev
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: GPL3

# ----------- VARIABLES FOR DIFFERENT VERSIONS ------------------- #
PHP_VERSIONS="5.6 7.0 7.1 7.2 7.3 7.4";
PYTHON_VERSIONS="2.7 3.5 3.6 3.7 3.8";
OH_MY_ZSH="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh";
LINUX_BREW="https://raw.githubusercontent.com/Homebrew/install/master/install.sh";
MULTI_PHP="https://github.com/INDIAN2020/PHP-Python-Kubernetes/blob/master/php-multi.sh";
VALET="";
# ----------- VARIABLES FOR DIFFERENT VERSIONS ------------------- #

if [ "$(whoami)" != "root" ]; then
    echo "$(tput setaf 4)$(tput bold)This script must be run as root.$(tput sgr 0)"
    exit 2
else
	echo "-------------------------------------"
	echo "PHP Dev + Python Dev + Kubernetes Dev"
	echo "-------------------------------------"
fi

if [[ ! -x $(which php) ]]: then
	sh -c "$(curl -fsSL $MULTI_PHP)"
fi
