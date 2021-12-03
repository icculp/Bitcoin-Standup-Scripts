#!/bin/bash

# standup - install btcpayserver

echo "
----------------
  $MESSAGE_PREFIX Installing Cypherpunkpay
----------------
"

if [[ "$USE_CYPHERPUNKPAY" == "YES" ]]
then
    echo "$0 - Bonus: Installing Cypherpunkpay"
    wget -qO - https://deb.cypherpunkpay.org/cypherpunkpay-package-signer.asc | sudo apt-key add -

    echo 'deb [arch=amd64] https://deb.cypherpunkpay.org/apt/ubuntu/ focal main' | sudo tee /etc/apt/sources.list.d/cypherpunkpay.list

    sudo apt-get update -y && sudo apt-get install -y cypherpunkpay

    USE_NODE='true'
    if [[ "$CPPLITE" == 'YES' ]]
    then
        USE_NODE='false'
    fi

    echo "$0 - Editing Cypherpunkpay Conf"
    sed -i -e  "s/listen = 127.0.0.1:8080/listen = 127.0.0.1:8081/;
                s/btc_network = testnet/btc_network = mainnet/;
                s/# btc_mainnet_account_xpub = REPLACE_ME_WITH_BTC_MAINNET_ACCOUNT_XPUB/btc_mainnet_account_xpub = $XPUB/;
                s/btc_mainnet_node_enabled = false/btc_mainnet_node_enabled = $USE_NODE/;
                s/btc_mainnet_node_rpc_user = bitcoin/btc_mainnet_node_rpc_user = StandUp/;
                s/btc_mainnet_node_rpc_password = secret/btc_mainnet_node_rpc_password = $RPCPASSWORD/;
                s/use_tor = false/use_tor = true/;
                s/donations_cause =.*$/donations_cause = $CPPCAUSE/" /etc/cypherpunkpay.conf


    echo "$0 - Starting Cypherpunkpay"
    sudo systemctl enable cypherpunkpay
    sudo systemctl start cypherpunkpay
fi
