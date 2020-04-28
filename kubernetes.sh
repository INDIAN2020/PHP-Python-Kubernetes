#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: Kubernetes Installation
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: MIT

#Download the latest release with the command:
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
#Make the kubectl binary executable
chmod +x ./kubectl
#Move the binary in to your PATH.
sudo mv ./kubectl /usr/local/bin/kubectl
