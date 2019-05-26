# AppleALC Lilu Plugin for Dynamic Audio Patching

#

AppleALC.kext is a Lilu Plugin for patching AppleHDA.kext for system sound functionality. Credit AcidAnthera for creating this excellent Lilu Plugin (Lilu is also AcidAnthera's

#

### Clover Configurator: /Devices/Properties/PciRoot(0x0)/Pci(0x1b,0x0)
   
* layout-id (DATA) - 1C000000 | or (NUMBER) - 28 |
   
* hda-gfx (STRING) - onboard-1
   
* device_type (STRING) - Audio Device
   
* device-id (DATA) - 02920000
   
* vendor-id (DATA) - EC100000
   
* codec-id (DATA) - 0292EC10
   
* PinConfigurations (DATA) - (leave blank)
   
* AAPL,slot-name (STRING) - Built In

* model (STRING) - Realtek ALC3232 High Definition Audio (Intel Broadwell Wildcat Point-LP HD Audio Controller) 
	  
* MAKE SURE YOU INCLUDE THE ALC3.aml IN YOUR ACPI/patched FOLDER (or ALC3.dsl IN YOUR HOTPATCHED CONFIGURATION)