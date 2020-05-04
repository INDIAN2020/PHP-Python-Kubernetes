#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: Kubernetes Installation
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: MIT

LATEST_CONSUL=$(curl -s https://releases.hashicorp.com/consul/index.json | jq -r '.versions[].builds[].url' | egrep -v 'rc|beta' | egrep 'linux.*amd64' |tail -1)
