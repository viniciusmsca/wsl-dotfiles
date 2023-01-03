#!/bin/bash

ME="/home/$(whoami)"
EXA_VERSION=v0.10.1

echo "Updating the system, please wait..."

sudo apt -y update  && sudo apt -y upgrade 

echo "Installing basic packages, please wait..."

sudo apt -y install unzip neofetch build-essential

if [ -f /usr/local/bin/exa ]; then
    echo "exa already installed"
else
    echo "Installing exa, please wait..."
    cd /tmp/
    mkdir exa
    cd exa
    wget https://github.com/ogham/exa/releases/download/$EXA_VERSION/exa-linux-x86_64-$EXA_VERSION.zip
    unzip exa-linux-x86_64-$EXA_VERSION.zip
    sudo cp bin/exa /usr/local/bin
    sudo cp completions/exa.bash /etc/bash_completion.d
    cd ..
    rm -rf exa
    cd $ME
fi

echo "Installing nvm, please wait..."

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Installing NODE LTS, please wait..."

nvm install --lts