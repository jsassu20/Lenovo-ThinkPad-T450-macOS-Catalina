#!/bin/bash
 
#set -x


clear

echo "v1.2 (c) 2018 - MaLd0n"
echo "Credits: Micky1979"
echo "Attention: You may not publish or Distribute this Script and 
your content without permission of the author(s)."
echo "This Script Requires Administrator Privileges!"
cd ~/Desktop/RepairPermissions
sudo ./InsanelyRepairPermission -rt /
echo "Rebuild Caches:"
echo "---------------"
sudo rm -f /System/Library/Caches/com.apple.kext.caches/Startup/kernelcache && sudo kextcache -i / && sudo touch /System/Library/Extensions && sudo kextcache -u / && sudo update_dyld_shared_cache -force && sudo nvram -c && sudo purge
sudo defaults write com.apple.frameworks.diskimages skip-verify true
sudo spctl --master-disable
xcode-select --install
sudo pmset -a autopoweroff 0
sudo pmset -a standby 0
sudo pmset -a hibernatemode 0
echo
echo "Hibernatemode, standby, and autopoweroff set to 0..."
sudo rm /private/var/vm/sleepimage
echo
echo "Sleepimage deleted..."
sudo touch /private/var/vm/sleepimage
sudo chflags uchg /private/var/vm/sleepimage
echo
echo "Zero-byte sleepimage created and locked from further writes."
echo "Clearing Your NVRAM:"
echo "--------------------"
sudo nvram -c
sudo purge
sleep 1
echo
echo "Done!!!"
echo "Enjoy!!!"
osascript -e 'tell app "loginwindow" to «event aevtrrst»'