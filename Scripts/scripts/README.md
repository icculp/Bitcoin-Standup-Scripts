# Bitcoin Standup Scripts - Blockchain Commons

Contributors: 
Primary jodobear[github.com/jodobear] 20-07-03
Secondary icculp[github.com/icculp]

**DISCLAIMER:** It is not a good idea to store large amounts of Bitcoin on a VPS, ideally you should use this as a watch-only wallet. This script is a work-in-progress and has not been widely tested. The creators are not responsible for loss of funds. If you are not familiar with running a node or how Bitcoin works then we urge you to use this in testnet so that you can use it as a learning tool.


## Usage

The script is inteded for a fresh bitcoin setup. Re-running the script on an already setup server is intended only for advanced users.

It downloads Bitcoin Core over Tor. You can specify any path for the blockchain data and Electrs data.

To run this script you need to be logged in as root, and enter in the commands listed below:

curl -s this_repo_url | sudo bash



If you don't already have a password for the root user, go ahead and set one now.
```
# Give the root user a password, enter the following command and set a password:
sudo passwd

# Switch to the root user:
sudo su
```

3. Might need to install git and clone the repo, which will require an update, or you can copy 02_dependencies.sh and run it:
```
sudo apt-get update -y && apt-get install git -y
cd ~
git clone https://github.com/icculp/Bitcoin-Standup-Scripts.git
cd Bitcoin-Standup-Scripts/Scripts/scripts
echo "Modify ss.conf as required, or jump straight to source ss_00_main.sh"
```

3. Edit config for your node setup using your favourite text editor:
```
nano ss.conf
```

4. Source the script:
```
source ss_00_main.sh
```

Display help:
```
source ss_00_main.sh -h
```

This script can be installed on any Debian based system. By default this script will:

- Update the OS
- Set Automatic Updates On
- Create User: standup
- Install UFW, haveguard, gnupg2, git & make
- Install Tor
- Install Bitcoin Core on mainnet with txindex=1 if setting up unpruned node.
- Setup Bitcoin Core as systemd service and to start at reboot or after a crash.
- Start Bitcoin Core

Optionally you can install:
---------------------------
- Install c-lightning or LND
- Install Esplora*
- Install BTCPay*
- Install Cypherpunkpay*

* Work-in-progress

QR Code:
--------
Upon completion of the script there will be a QR code saved to /qrcode.png which you can open and scan:

1. Install fim:
`sudo apt-get install fim -y`
2. Then, display the QR code in terminal (as root):
`fim -a qrcode.png`

It is highly recommended to add a Tor V3 pubkey for cookie authentication so that even if your QR code is compromised an attacker would not be able to access your node.

It is recommended to delete the /qrcode.png.
Additionally, unless you face installation issues and need to assisstance delete /standup.log, and /standup.err


## TODO

1. Conclude the Esplora `dist` [issue](https://github.com/Blockstream/esplora/issues/156)
2. Find solution to BTCPay Server corrupting blockchain directory when creating a softlink.
3. Check implementation & test FastSync.
4. C-lightning HTTP plugin.
5. Explore HWI.


6. Additional hardening
7. Esplora, BTCPay, Cypherpunkpay
