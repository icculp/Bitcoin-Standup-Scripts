#!/bin/bash

exec > >(tee -a /root/standup.log) 2> >(tee -a /root/standup.log /root/standup.err >&2)

sudo apt-get update -y && sudo apt-get install git -y
cd ~
git clone https://github.com/icculp/Bitcoin-Standup-Scripts.git
cd ~/Bitcoin-Standup-Scripts/Scripts/scripts
echo "Modify ss.conf as required, or get started right away with: source ss_00_main.sh"