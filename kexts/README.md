                                                                                                                                                                                                                                                                                                                                                                          # Kernel Extensions

This folder contains all of the kernel extensions (kext files) which are used in this hackintosh build. Kernel extensions are basically the same as drivers in Windows. They allow certain hardware to communicate with the macOS operating system and function properly. This folder is important because with Clover the system can not load without the detection of the SMC device which is emulated via a kernel extension called VirtualSMC. This kext happens to be a plugin for another kext named Lilu. Because the SMC is required for functionality the presence of both Lilu and VirtualSMC is required in the "/Volumes/ESP/EFI/CLOVER/kext/Other/" folder at all times in order for the system to load properly. This can be canceled out when you install both Lilu and VirtualSMC to the "/Library/Extensions/" folder so that the system loads the two extensions automatically instead of having Clover inject them during the boot sequence. All other kext files are not required but can provide benefits and fixes by being present in either "/Library/Extensions/" or "/Volumes/ESP/EFI/CLOVER/kext/Other/" folder. Its up to you which method you choose, I recommend installing all of your kext files to "/Library/Extensions/" but its not required.

#

### Miscellaneous

- A collection of different kernel extensions that I could use with this build but are currently not in use. I keep them in this folder for quick access if I find my self in a situation where I need them so that I do not have to download them all over again. The most important kext in this directory is the USB-T450-Injector.kext file. It can be used to inject the systems proper USB configuration in the absence of a properly configured USBInjectall + .aml configuration file. Don't get rid of it. If your USB ports ever stop working just load this kext into the "Other" folder and reboot.

#

### Other

- This is Clovers system kext folder. Its used as the directory where Clover will inject all kext files present into the system during the boot process. It is essential in getting a clean system to boot the first time so that you can install kexts directly in the system folders to allow for proper loading of third party kext files which is the recommended method. However you can run your setup with only injecting your kexts with Clover and not installing directly in the system directory. Kext files that are in this folder do not need to have their permissions set a specific way. They will be injected regardless and will load every time unless they conflict with some other kext files. Thats probably the best part about this method for loading kexts. Even if you decide to install to system keep essential kext files in this location so that you can boot recovery if you have to.

#

### System

- This folder holds all of the kexts that I install to the system folder upon booting a fresh version of macOS. Just run the "!install_kexts.command" and all kernel extensions that are present in this folder will automatically be installed directly in to the "/Library/Extensions/" folder and the permissions will be repaired followed by the the kextcache being rebuilt. When the process finishes just reboot the system and you'll be good. You can add or remove whatever kexts you want. Just make sure you understand their purpose before you install a kext in the system because its much harder to remove them from the system folder than from the "Other" folder if they cause some issue.

#

### !repair_kexts.command

- Command script that automatically repairs all system kext permissions and rebuilds the kextcache. Just execute the script by double clicking it and entering your password and it will automatically fix any issues with newly installed kernel extensions if they have incorrect permissions or the cache isn't rebuilt. This is mainly for use when you install kexts to the system by copying and pasting. Just run this command script and it will take care of the heavy work.  
