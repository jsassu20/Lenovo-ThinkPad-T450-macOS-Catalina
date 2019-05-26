# Lenovo T440 TrackPad Configuration Files

This folder contains the files necessary for implementing my preferred trackpad configuration after installing the Synaptic One Button Clickpad in my Lenovo ThinkPad T450. I don't recommend using these files unless you have installed the T440 trackpad as well. I recommend using my !install.command script as it will make all the required changes for you automatically.    

#

### !install.command

- A command script which will automatically make all of the necessary changes to the proper folders if you choose to use this configuration after installing the Lenovo Thinkpad T440 ClickPad. It is not required to use this configuration but I recommend using it like this because this configuration will disable the 3 physical buttons present on the stock T450 trackpad.

#

### !kextcache.command

- Command script for fixing system kexts and their respective permissions in "/S/L/E" as well as "/L/E" if you choose to install this configuration manually then run this script after copying the ApplePS2SmartTouchPad.kext file into "/L/E" in order to fix the folder permissions and rebuild the kextcache so that it loads after rebooting the system.

#

### config_ASTP.plist

- The plist configuration which my system utilizes with this configuration. It's meant to properly enable the usage of the brightness keys as this can be an issue for users who ran the VoodooPS2Controller configuration prior to using this setup due to the FN Keys Hot Patch configuration that method uses.

#

### SSDT-ASPT.aml

- AML configuration which should be placed in "/ESP/EFI/CLOVER/ACPI/patched" after removing SSDT-VPS2.aml (because they conflict with each other). This is a method for ensuring proper brightness key functionality will in fact work after installing ApplePS2SmartTouchPad.kext.

#

### ApplePS2SmartTouchPad.kext

- The kernel extension that makes this entire configuration method possible. Its full of features which can be customized by editing the Info.plist file in the kexts main folder. This is not for beginners, you should be somewhat familiar with the hackintosh process as a whole or macOS functionality before attempting to change its settings.

# 

# Instructions:

1. Run my ".command" file to make changes automatically.

# 

### If the ".command" script doesn't work do the following:

#

1. Replace the SSDT-VPS2.aml in the folder listed below with SSDT-ASTP.aml.
   - "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

2. Replace VoodooPS2controller.kext in the following 3 folders listed below with ApplePS2SmartTouchpad.kext.
   - "/Library/Extensions/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

3. Run the _kextcache.command script (requires admin password).