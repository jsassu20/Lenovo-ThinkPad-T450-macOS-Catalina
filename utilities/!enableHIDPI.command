#!/bin/bash
dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"

sh ./HIDPI-Enabler/hidpi.sh
