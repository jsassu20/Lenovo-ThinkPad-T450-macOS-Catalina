# VoodooPS2Controller Static Patched AML 

This folder contains .aml file should be used with the Hotpatched setup. It's needed because the LPC device is named LPCB (not LPC) and the KBD device is named PS2K (not KBD_). My Hotpatched configuration defines LPC as LPC and KBD_ as KBD_.

#

SSDT-VPS2.aml

- ASL based configuration file which is used to modify functionality of specific hardware in the macOS enviornment. In this case the file will control the fine point functionality of the TrackPad on the T450 (specifically the 3 button trackpad). This includes the responseiveness of the trackpad across multiple points and the functionality of the function keys to match up with real Apple keyboards.





