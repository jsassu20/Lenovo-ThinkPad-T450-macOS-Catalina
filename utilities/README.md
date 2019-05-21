# Tools For Lenovo T450 Hackintosh Setup

This folder contains a number of different useful tools I find helpful with setting up the full macOS system on the Lenovo ThinkPad T450 Ultrabook. You may not find them useful but they're here for anyone to checkout and use if they want.

#

Audio Configuration

- Everything needed to create a patched AppleHDA kext which controls system sound. This is the Codec configuration that the T450 uses. This kext will provide you with a perfectly configured sound setup with Microphone and AUX working.

- Also includes AppleALC.kext file with a modification made for proper support on ALC3232 based configurations (fixes bad mic).

#

Clover Configurations 

- A collection of config.plist files and tools for hot patching from RehabMan.

#

Hackintosh Tools

- More files from RehabMan for use with Hackintosh setups.

#

Hotpatching

- All of my current files used for HotPatching Lenovo ThinkPad T450 and a bunch of other ".dsl" files which can be used as well. 

#

Static Patching

- My T450 Static patch method. This should only be used with T450's and may not work. The SSDTs are universal but you may have to patch your own DSDT to use. You can look over mine for reference. Especially in the battery section.

#

TrackPad

- Contains different TrackPad configuration options including VoodooPS2Controller, ApplePS2SmartTouchPad, a Preference Pane for extra trackpad control which works with both Voodoo and ApplePS2 setups. Also includes a way for people who have installed the Lenovo T440 TrackPad Synaptic UltraNav ClickPad to automatically remove VoodooController and associated files and replaces them with ApplePs2SmartTouchPad and it's files.

#

Tools

- Different folders for different purposes like installing useful binaries to the /usr/local/bin folder which can be very helpful with Hackintosh computers. It also contains clover startup scripts, a folder with a script that fixes permissions automatically, ssdtPRgen for automatically generating the SSDT.aml file for system power and CPU power configuration, lspci for pulling info on PCI devices, some launch daemons for Clover, a picture which can be used as the System Info photo for the T450, a folder for configuring hardlinked folders, a script for fixing the home and end buttons on the T450 to match macOs. Check out the files. A few .command scripts reside in the utilities folder which this directory lives and and they can automate some of the processes. Make sure you study the scripts before using them if you're unsure of how they work.

#

Scripts 

_clover_scripts.command

- Installs the clover startup scripts and daemons.

_gatekeeper.command

- Disables macOS gatekeeper and allows opening any app on macOS.

_install_tools.command

- Installs binaries and other tools for hackintosh builds.

_kextcache.command

- Repairs and rebuilds kextcache and system kexts.

_sleepwatcher.command

- Installs sleepwatcher commands.

