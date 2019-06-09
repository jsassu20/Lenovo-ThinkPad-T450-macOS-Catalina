#!/bin/bash
dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"
echo "********************************************************"
echo "This Script Will Remove VoodooPS2Controller.kext from /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System and replace it with ApplePS2SmartTouchPad.kext, and repair all required permissions..."
echo "Use this if you've installed the T440 TouchPad in your Hackintosh T450"
echo "MAKE SURE YOUR EFI PARTITION THAT CONTAINS CLOVER IS CURRENTLY MOUNTED..."
echo "Author: Jsassu20 | James Anthony Sassu..."
echo "********************************************************"
sudo rm -rf /Library/Extensions/VoodooPS2Controller.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/Other/VoodooPS2Controller.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/System/VoodooPS2Controller.kext
echo "Removing VoodooPS2Controller.kext from /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System..."
echo "Complete..."
echo "Installing ApplePS2SmartTouchPad.kext to /Library/Extensions, /Volumes/ESP/EFI/CLOVER/kexts/Other, and /Volumes/ESP/EFI/CLOVER/kexts/System..."
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
echo "Replacing SSDT-VPS2.aml with SSDT-ASTP.aml in /Volumes/ESP/EFI/CLOVER/ACPI/patched/..."
sudo rm /Volumes/ESP/EFI/CLOVER/ACPI/patched/SSDT-VPS2.aml
sudo cp -R *.aml /Volumes/ESP/EFI/CLOVER/ACPI/patched/
echo "Complete..."
echo "."
echo "Process Complete, Your Touchpad configuration has been successfully changed, please restart your system..." 
read -p "Press Any Key To Exit"