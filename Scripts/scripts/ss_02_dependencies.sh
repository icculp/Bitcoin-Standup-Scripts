#!bin/bash

# standup.sh


# Output stdout and stderr to ~root files
exec > >(tee -a /root/standup.log) 2> >(tee -a /root/standup.log /root/standup.err >&2)

# Make sure all packages are up-to-date
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install gnupg2 make git -y

