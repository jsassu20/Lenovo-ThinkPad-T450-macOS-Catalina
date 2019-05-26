# Lenovo T450 Default TrackPad Files

### For Reverting Back To Default Setup

Use this folder to help you restore the original trackpad configuration if you've installed my modified T440 Trackpad configuration files and you don't like it. This folder contains all of the required files to restore the configuration to its original functionality.  

#

### !install.command

- A command script which will automatically make all of the necessary changes to the proper folders if you want to revert back to the default TrackPad configuration.

#

### !kextcache.command

- Command script for fixing system kexts and their respective permissions in "/S/L/E" as well as "/L/E" if you choose to install this configuration manually then run this script after copying the ApplePS2SmartTouchPad.kext file into "/L/E" in order to fix the folder permissions and rebuild the kextcache so that it loads after rebooting the system.

#

### SSDT-VPS2.aml

- AML configuration which should be placed in "/ESP/EFI/CLOVER/ACPI/patched" after removing SSDT-ASTP.aml (because they conflict with each other). This is a method for ensuring proper functionality of FN keys with VoodooPS2Controller.kext.

#

### VoodooPS2Controller.kext

- The kernel extension that makes this entire configuration method possible. It was created by RehabMan and it allows for proper functionality of the trackpad on a wide range of hackintosh based laptops.

# 

# Instructions:

1. Run my ".command" file to make changes automatically.

# 

### If the ".command" script doesn't work do the following:

#

1. Replace the SSDT-ASTP.aml in the folder listed below with SSDT-VPS2.aml.
   - "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

2. Replace ApplePS2SmartTouchpad.kext in the following 3 folders listed below with VoodooPS2controller.kext.
   - "/Library/Extensions/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
   - "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

3. Run the _kextcache.command script (requires admin password).