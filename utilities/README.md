#
# Different Tools For Lenovo ThinkPad T450

This repository will hold the tools and scripts I personally use for my own setup but you're free to use as well. The applications that can be found here are not my creation nor do I take any sort of credit for the benefits they provide in the Hackintosh community. All credit for the abilities they provide should go directly to the creators of each app which can be found in the "About this app" section of the applications info.

#
# Audio Configuration

Everything needed to create a patched AppleHDA kext which controls system sound. This is the Codec configuration that the T450 uses. This kext will provide you with a perfectly configured sound setup with Microphone and AUX working.

Also includes AppleALC.kext file with a modification made for proper support on ALC3232 based configurations (fixes bad mic).

#
# Clover Configurations 

A collection of config.plist files and tools for hot patching from RehabMan.

#
# Hackintosh Tools

More files from RehabMan for use with Hackintosh setups.

#
# HD Graphics 5500 

An old method for configuring DVMT pre allocated memory if your system is stuck at 32MB in the BIOS. I personally have an unlocked BIOS so I can change mine to whatever now. I reccomend unlocking you BIOS which can be done from BIOS-Mods.com along with an SPI programmer and a clip.

#
# Hotpatching

All of my current files used for HotPatching Lenovo ThinkPad T450 and a bunch of other ".dsl" files which can be used as well. 

#
# Kernel Extensions 

The kext fils I use along with the scripts for installing them directly to the system (/Library/Extensions). You have your normal clover kext folder along with the required system kexts in place. Just run the script to install.

#
# maciASL Patches

Different patches for maciASL (static patching DSDT)

#
# Reference Guides

A collection of PDF files which are based on actual Clover configurations for similar hardware to the Lenovo thinkPad T450 and some universal guides.

#
# Static Patching

My T450 Static patch method. This should only be used with T450s and may not work. The SSDTs are universal but you may have to patch your own DSDT to use. You can look over mine for reference. Especially in the battery section.


#
# Users Who've Installed The T440 TrackPad

For people who have installed the Lenovo T440 TrackPad Synaptic UltraNav ClickPad...

Files can be found in:
* "TrackPad/T440_One_Button_ClickPad/"

Run my ".command" located in:
* "TrackPad/T440_One_Button_ClickPad"  

*** If the .command script doesn't work ***

Replace the SSDT-VPS2.aml file in:
* "/Volumes/ESP/EFI/CLOVER/ACPI/patched/"

with SSDT-ASTP.aml file in:
* "TrackPad/T440_One_Button_ClickPad/"

Replace VoodooPS2controller.kext in the following 3 folders:
* "/Library/Extensions/" *** (if you installed it there or ran my script to install system kexts) ***
* "/Volumes/ESP/EFI/CLOVER/kexts/Other/"
* "/Volumes/ESP/EFI/CLOVER/kexts/System/" 

with ApplePS2SmartTouchpad.kext that can be found in:
* "TrackPad/T440_One_Button_ClickPad/"

#
# Utilities 

Some binararies and other tools for use with the system. 

