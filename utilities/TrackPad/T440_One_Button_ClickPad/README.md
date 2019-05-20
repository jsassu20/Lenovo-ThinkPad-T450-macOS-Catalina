#
# If You've Installed The Lenovo ThinkPad T440 ClickPad

For people who have installed the Lenovo T440 TrackPad Synaptic UltraNav ClickPad...

Run my ".command" file to make changes automatically. If the ".command" script doesn't work do the following:

Replace the SSDT-VPS2.aml file in:
* "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

with SSDT-ASTP.aml...

Replace VoodooPS2controller.kext in the following 3 folders:
* "/Library/Extensions/" *** (if you installed it there or ran my script to install system kexts) ***
* "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
* "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

with ApplePS2SmartTouchpad.kext...

Run the _kextcache.command script (requires admin password)