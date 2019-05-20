#
# Users Who've Installed The T440 TrackPad

For people who have installed the Lenovo T440 TrackPad Synaptic UltraNav ClickPad...

Files can be found in:
* "/Volumes/ESP/EFI/CLOVER/utilities/TrackPad/T440_One_Button_ClickPad/"
* "/Volumes/ESP/EFI/CLOVER/kexts/TrackPad/T440_One_Button_ClickPad/"

Run my ".command" located in:
* "/Volumes/ESP/EFI/CLOVER/kexts/TrackPad/T440_One_Button_ClickPad"  

*** If the .command script doesn't work ***

Replace the SSDT-VPS2.aml file in:
* "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

with SSDT-ASTP.aml file in:
* "/Volumes/ESP/EFI/CLOVER/kexts/TrackPad/T440_One_Button_ClickPad/"

Replace VoodooPS2controller.kext in the following 3 folders:
* "/Library/Extensions/" *** (if you installed it there or ran my script to install system kexts) ***
* "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
* "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

with ApplePS2SmartTouchpad.kext that can be found in:
* "/Volumes/ESP/EFI/CLOVER/kexts/TrackPad/T440_One_Button_ClickPad/"