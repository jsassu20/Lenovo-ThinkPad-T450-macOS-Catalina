# Lenovo T440 TrackPad Configuration Files

This folder contains the files necessary for implementing my preferred trackpad configuration after installing the Synaptic One Button Clickpad in my Lenovo ThinkPad T450. I don't recommend using these files unless you have installed the T440 trackpad as well.    

#

Instructions:

1. Run my ".command" file to make changes automatically.

# 

If the ".command" script doesn't work do the following:

1. Replace the SSDT-VPS2.aml in the folder listed below with SSDT-ASTP.aml.
* "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

2. Replace VoodooPS2controller.kext in the following 3 folders listed below with ApplePS2SmartTouchpad.kext.
* "/Library/Extensions/"
* "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
* "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

3. Run the _kextcache.command script (requires admin password).