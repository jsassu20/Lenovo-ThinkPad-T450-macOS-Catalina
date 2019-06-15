#!/bin/bash

dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"

sudo cp Archey-OSX/ /usr/local/
sudo ln -s /usr/local/Archey-OSX/bin/archey /usr/local/bin/archey
echo archey >> ./.bashrc
echo "[[ -s ~/.bashrc ]] && source ~/.bashrc" >> ./.bash_profile
source ./.bashrc && source ./.bash_profile
