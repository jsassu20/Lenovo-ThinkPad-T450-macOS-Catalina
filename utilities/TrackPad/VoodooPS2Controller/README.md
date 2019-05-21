# VoodooPS2Controller TrackPad Kext Configuration

This folder contains RehabMan's VoodooPS2Controller TrackPad configuration. It's complete withe the kernel extension (kext) and the two .aml files needed for FN key setup in both the Hotpatched and Static Patched configurations.

#

Hotpatch

- This folder contains the .aml configuration to be used with my Hotpatched setup for the T450. The file is needed because the LPC configuration is named as LPC (insteadof of LPCB) and the keyboard configuration (KBD_) is named as KBD.

#

Kext

- The actual VoodooPS2Controller kernel extension resides in this folder (Credit to RehabMan since it's his creation).

#

Static Patch

- This folder contains .aml file should be used with the Static Patched setup because the LPC device is named LPCB and the KBD_ device is named PS2K so its necessary to have two different setups.



