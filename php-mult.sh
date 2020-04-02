#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: PHP Dev + Python Dev + Kubernetes Dev
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: GPL3

if [[ "${PHP_VERSIONS}" != "" ]]; then
	# sudo apt install -y php-mysql php-fpm php-curl php-gd php-mbstring php-gettext php-token-stream php-gmagick php-tokenizer php-xdebug php-apcu php-memcache php-zip
	for version in $PHP_VERSIONS; do
		read -p "You need PHP ${version} ?" yn
	    case $yn in
		[yY] | [yY][Ee][Ss] )
			echo -e "sudo apt install php$version php$version-fpm";
			echo -e "sudo apt install -y php-gmagick php$version-xml php-ssh2 php$version-curl php$version-gd php$version-mbstring php$version-mysql php$version-bcmath php$version-bz2";
		;;
		[nN] | [nN][Oo] ) ;;
		* ) echo "Please answer yes or no.";;
	    esac
	done
fi	
