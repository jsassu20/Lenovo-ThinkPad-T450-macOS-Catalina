# System Sound Configuration Methods

Configurations for patching the sound setup on this hackintosh build

#

### ALC3232
 
- JCSNIDER's method for physically patching AppleHDA.kext in order to produce a patched kernel extension for handling system sound functionality in place of using the stock AppleHDA kext and its included codec files. There are scripts and files present in here which are specifically for devices with ALC3232 codec based hardware and thats what the ThinkPad T450 is based on. This can create a perfect sound configuration for this device. It is a bit difficult to understand.

#

### AppleALC

- AcidAnthera's Lilu plugin AppleALC.kext which is another option for sound functionality on this device. This kext works different by patching the sound configuration on the fly every time the system is loaded unlike the option above which creates a physical kext just for this configuration. AppleALC.kext will function on many different devices provided you have the proper layout-id to reference in the config.plist so that it knows what configuration you're using and it can make the proper adjustments when its loaded.
