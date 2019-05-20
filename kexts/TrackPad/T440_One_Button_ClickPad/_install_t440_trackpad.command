#!/bin/bash
dir=${0%/*}
if [[ "$dir" == "" ]]; then dir="."; fi
cd "$dir"
echo "********************************************************"
echo "This Script Will Remove VoodooPS2Controller.kext from /Library/Extensions, replace it with ApplePS2SmartTouchPad.kext, and repaid permissions..."
echo "Use this if you've replaced the 3 button trackpad in the T450 with the one button clickpad from the T440..."
echo "MAKE SURE YOUR EFI PARTITION THAT CONTAINS CLOVER IS CURRENTLY MOUNTED..."
echo "Author: Sass860h | James Anthony..."
echo "********************************************************"
sudo rm -rf /Library/Extensions/VoodooPS2Controller.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/Other/VoodooPS2Controller.kext
sudo rm -rf /Volumes/ESP/EFI/CLOVER/kexts/System/VoodooPS2Controller.kext
echo "Removing VoodooPS2controller.kext from /Library/Extensions, /EFI/EFI/CLOVER/kexts/Other, and /EFI/EFI/CLOVER/kexts/System..."
echo "Complete..."
echo "Installing ApplePS2SmartTouchPad.kext to /Library/Extensions, /EFI/EFI/CLOVER/kexts/Other, and /EFI/EFI/CLOVER/kexts/System..."
sudo cp -R *.kext /Library/Extensions
sudo cp -R *.kext /Volumes/ESP/EFI/CLOVER/kexts/Other/
sudo cp -R *.kext /Volumes/ESP/EFI/CLOVER/kexts/System/
echo "Complete..."
echo "Repairing /Library/Extensions permissions..."
sudo chmod -R 755 /Library/Extensions
sudo chown -R root:wheel /Library/Extensions
echo "Complete..."
echo "Repairing system kextcache..."
sudo touch /Library/Extensions
sudo kextcache -u / 
sudo kextcache -q -update-volume /
sudo kextcache -system-caches
echo "Complete..."
echo "Replacing SSDT-VPS2.aml with SSDT-ASTP.aml..."
sudo rm /Volumes/ESP/EFI/CLOVER/ACPI/patched/SSDT-VPS2.aml
echo "Complete..."
sudo cp -R *.aml /Volumes/ESP/EFI/CLOVER/ACPI/patched/
echo "."
echo "Process Complete..." 
echo "All changes have been made please restart your system"
read -p "Press Any Key To Exit"