# ALC3232.kext (Modified AppleHDA.kext)

Use ALC3232.kext for system sound functionality. (Add SSDT to ACPI/patched as well)

* ALC3232.kext is specifically for the Lenovo ThinkPad T450 (macOS Mojave) ***

* This kext is specifically configured to use as a system audio configuration, microphone and the AUX/Line In configured perfectly. 

Clover Configurator: /Devices/Properties/PciRoot(0x0)/Pci(0x1b,0x0)
   
* layout-id (DATA) - 02000000 | or (NUMBER) - 2 |
   
* hda-gfx (STRING) - onboard-1
   
* device_type (STRING) - Audio Device
   
* device-id (DATA) - 02920000
   
* vendor-id (DATA) - EC100000
   
* codec-id (DATA) - 0292EC10
   
* PinConfigurations (DATA) - (leave blank)
   
* AAPL,slot-name (STRING) - Built In

* model (STRING) - Realtek ALC3232 High Definition Audio (Intel Broadwell Wildcat Point-LP HD Audio Controller) 
	  
* MAKE SURE YOU INCLUDE THE ALC3.aml IN YOUR ACPI/patched FOLDER (or ALC3.dsl IN YOUR HOTPATCHED CONFIGURATION)