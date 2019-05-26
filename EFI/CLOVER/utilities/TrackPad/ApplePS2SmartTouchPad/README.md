# ApplePS2SmartTouchPad TrackPad Kext Configuration

This folder contains the ApplePS2SmartTouchPad TrackPad configuration files from OSXDaily.com (Credit to whomever created the actual kernel extension because I don't know their handle to give them their credit because it's an amazing kext). It's complete withe the kernel extension (kext) and the two .aml files needed for FN key setup for brightness controls since the other FN keys are handled by the kext itself in both the Hotpatched and Static Patched configurations.

#

### Hot Patched

- This folder contains the .aml configuration to be used with my Hot Patched setup for the T450. The file is needed because the LPC configuration is named as LPC (instead of of LPCB) and the keyboard configuration (KBD_) is named as KBD.

#

### Kext

- The actual ApplePS2SmartTouchPad kernel extension resides in this folder (Credit to OSXDaily.com since it's their user's creation).

#

### Static Patch

- This folder contains .aml file should be used with the Static Patched setup because the LPC device is named LPCB and the KBD_ device is named PS2K so its necessary to have two different setups.

#

### Disclaimer

- I recommend only using this configuration if you've installed the Lenovo ThinkPad T440 Synaptic One Button ClickPad over the T450's stock 3 button TrackPad. This is because this kext will disable the physical 3 buttons on the T450's trackpad. This kext is full of configuration options which can be edited by right clicking on the kext and selecting "show package contents" then opening the folder and then opening the Info.plist with a proper plist editor (Plist Edit Pro or Clover Configurator Pro). All of the available configuration options can be edited from here. The resources folder in the same folder as the Info.plist contains the write up on the available configuration options. This kext can be used with the 3 button trackpad too if you want to try it out.


