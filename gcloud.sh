#!/usr/bin/env bash
# set -xv;

#Name: Script v1.0
#Description: Google Cloud SDK Installation
#Brief: In development
#Author: Gogula <gogula.sivannarayana@gmail.com>
#License: MIT

#Get latest stable release
LATEST_URL=$(curl -sL https://cloud.google.com/sdk/docs/quickstart-linux | grep "linux-x86_64.tar.gz" | sed 's/.*href="//' | sed 's/".*//' | head -10);
#Download the latest to temp folder
sudo wget -c ${LATEST_URL} -O - | sudo tar -xz -C ${HOME}
#Add Cloud SDK tools to your path
./google-cloud-sdk/install.sh
#Run gcloud init to initialize the SDK:
./google-cloud-sdk/bin/gcloud init
