#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: PHP Dev + Python Dev + Kubernetes Dev
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: MIT

LATEST_URL=$(curl -sL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|beta' | egrep 'linux.*amd64' |tail -1)
curl ${LATEST_URL} > /tmp/terraform.zip
mkdir -p ${HOME}/bin
(cd ${HOME}/bin && unzip /tmp/terraform.zip)
if [[ -z $(grep 'export PATH=${HOME}/bin:${PATH}' ~/.bashrc) ]]; then
  echo 'export PATH=${HOME}/bin:${PATH}' >> ~/.bashrc
fi
source ~/.bashrc
