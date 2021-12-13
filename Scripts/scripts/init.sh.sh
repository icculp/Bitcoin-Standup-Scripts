#!/bin/bash

sudo apt-get update -y && sudo apt-get install git -y
cd ~
git clone https://github.com/icculp/Bitcoin-Standup-Scripts.git
cd Bitcoin-Standup-Scripts/Scripts/scripts
echo "Modify ss.conf as required, or jump straight to source ss_00_main.sh"