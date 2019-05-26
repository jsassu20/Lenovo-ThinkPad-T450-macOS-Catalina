#!/bin/bash
dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"
echo "********************************************************"
echo "This Script Will Remove ApplePS2SmartTouchPad.kext from /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System and replace it with VoodooPS2Controller.kext, and repair all required permissions..."
echo "Use this if you don't like the ApplePS2SmartTouchPad configuration that I created for the T440 TouchPad and you want to return to the original configuration..."
echo "MAKE SURE YOUR EFI PARTITION THAT CONTAINS CLOVER IS CURRENTLY MOUNTED..."
echo "Author: Jsassu20 | James Anthony Sassu..."
echo "********************************************************"
sudo rm -rf /Library/Extensions/ApplePS2SmartTouchPad.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/Other/ApplePS2SmartTouchPad.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/System/ApplePS2SmartTouchPad.kext
echo "Removing ApplePS2SmartTouchPad.kext from /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System..."
echo "Complete..."
echo "Installing VoodooPS2Controller.kext to /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System..."
sudo cp -R *.kext /Library/Extensions
sudo cp -R *.kext /Volumes/ESP/EFI/CLOVER/kexts/Other/
sudo cp -R *.kext /Volumes/ESP/EFI/CLOVER/kexts/System/
echo "Complete..."
echo "Repairing permissions in /Library/Extensions..."
sudo chmod -R 755 /Library/Extensions
sudo chown -R root:wheel /Library/Extensions
echo "Complete..."
echo "Repairing system kextcache..."
sudo touch /Library/Extensions
sudo kextcache -u / 
sudo kextcache -q -update-volume /
sudo kextcache -system-caches
echo "Complete..."
echo "Replacing SSDT-ASTP.aml with SSDT-VPS2.aml in /Volumes/ESP/EFI/CLOVER/ACPI/patched/..."
sudo rm /Volumes/ESP/EFI/CLOVER/ACPI/patched/SSDT-ASTP.aml
sudo cp -R *.aml /Volumes/ESP/EFI/CLOVER/ACPI/patched/
echo "Complete..."
echo "."
echo "Process Complete, Your original Touchpad configuration has been successfully restored, please restart your system..." 
read -p "Press Any Key To Exit"