#!/bin/bash
echo "********************************************************"
echo "This Script Will Allow You To Repair Your Display Overrides Folder."
echo "Author: Sass860h | James Anthony"
echo "********************************************************"
sudo chown -R root:wheel /System/Library/Displays/Contents/Resources/Overrides/
sudo chmod -R 755 /System/Library/Displays/Contents/Resources/Overrides/
sudo chmod -R 755 /System/Library/Extensions
sudo chmod -R 755 /Library/Extensions
sudo chown -R root:wheel /System/Library/Extensions
sudo chown -R root:wheel /Library/Extensions
sudo kextcache -i /
echo "Rebuilding Kext Cache..."
sudo touch /System/Library/Extensions
sudo touch /Library/Extensions
sudo kextcache -u / 
sudo kextcache -q -update-volume /
sudo kextcache -system-caches
echo "Repairing Display Overrides Folder..."
echo "."
echo "Process Complete..." 
echo "All System Display Overrides Have Been Repaired"
read -p "Press Any Key To Exit"