# ApplePS2SmartTouchPad Static Patched AML 

This folder contains .aml file should be used with my Static Patched setup. It's needed because the LPC device is named LPCB (not LPC) and the KBD device is named PS2K (not KBD_). My Hot Patched configuration defines LPC as LPC and KBD_ as KBD_.

#

### SSDT-ASTP.aml

- ASL based configuration file which is used to modify functionality of specific hardware in the macOS environment. In this case the file will control the fine point functionality of the TrackPad on the T450 (specifically the T440 one button clickpad). This includes aml file only delays with the brightness keys functionality.





