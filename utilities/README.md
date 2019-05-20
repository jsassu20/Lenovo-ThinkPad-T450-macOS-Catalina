# Audio Configuration

Everything needed to create a patched AppleHDA kext which controls system sound. This is the Codec configuration that the T450 uses. This kext will provide you with a perfectly configured sound setup with Microphone and AUX working.

Also includes AppleALC.kext file with a modification made for proper support on ALC3232 based configurations (fixes bad mic).

# Clover Configurations 

A collection of config.plist files and tools for hot patching from RehabMan.

# Hackintosh Tools

More files from RehabMan for use with Hackintosh setups.

# HD Graphics 5500 

An old method for configuring DVMT pre allocated memory if your system is stuck at 32MB in the BIOS. I personally have an unlocked BIOS so I can change mine to whatever now. I reccomend unlocking you BIOS which can be done from BIOS-Mods.com along with an SPI programmer and a clip.

# Hotpatching

All of my current files used for HotPatching Lenovo ThinkPad T450 and a bunch of other ".dsl" files which can be used as well. 

# Kernel Extensions 

The kext fils I use along with the scripts for installing them directly to the system (/Library/Extensions). You have your normal clover kext folder along with the required system kexts in place. Just run the script to install.

# maciASL Patches

Different patches for maciASL (static patching DSDT)

# Reference Guides

A collection of PDF files which are based on actual Clover configurations for similar hardware to the Lenovo thinkPad T450 and some universal guides.

# Static Patching

My T450 Static patch method. This should only be used with T450s and may not work. The SSDTs are universal but you may have to patch your own DSDT to use. You can look over mine for reference. Especially in the battery section.


# TrackPad

Contains different TrackPad configuration options including VoodooPS2Controller, ApplePS2SmartTouchPad, a Preference Pane for extra trackpad control which works with both Voodoo and ApplePS2 setups. Also includes a way for people who have installed the Lenovo T440 TrackPad Synaptic UltraNav ClickPad to automatically remove VoodooController and associated files and replaces them with ApplePs2SmartTouchPad and it's files.

# Utilities 

Some binararies and other tools for use with the system. 

