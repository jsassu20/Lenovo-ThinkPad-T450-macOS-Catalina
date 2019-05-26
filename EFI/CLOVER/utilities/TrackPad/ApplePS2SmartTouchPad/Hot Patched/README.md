# ApplePS2SmartTouchPad Hot Patched AML 

This folder contains .aml file should be used with the Hot Patched setup. It's needed because the LPC device is named LPC (not LPCB) and the KBD device is named KBD_ (not PS2K). My StaticPatched configuration defines LPC as LPCB and KBD_ as PS2K.

#

### SSDT-ASTP.aml

- ASL based configuration file which is used to modify functionality of specific hardware in the macOS environment. In this case the file will control the fine point functionality of the TrackPad on the T450 (specifically the T440 one button clickpad). This includes aml file only delays with the brightness keys functionality.





