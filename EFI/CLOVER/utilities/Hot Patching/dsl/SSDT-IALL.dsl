// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-IALL...
//
// Intel 5th Generation Architecture (Broadwell)  Intel Core i7-5600U)  Intel Series 9 Chipset  Intel HD 5500 Integrated Graphics  Unlocked UEFI BIOS 
// Apple Airport Extreme WiFi (BCM94360CSX)  USB 3.1 (x3)  Mini Display (4K)  3x Samsung Evo SSDs  LTE Ready  AUX In/Out  SDHC Reader  Gigabit LAN  720p HD WebCam 
//
// This SSDT Controls Merges All Hotpatched ACPI Files Into A Single SSDT File  It Can Also Control Certain Functions With The Change Of A Single Code Entry Below...
// 
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-IALL", 0)
{
    //             Compile your HOTPATCHED .aml configuration by defining the SSDT files you want in it and then point a terminal to this files  location, and enter: iasl SSDT-T450.dsl  
    //             it will create a new .aml file with the same name. Put that file into CLOVER/ACPI/patched. Every file you include needs to have the Definition block,  the { under it  
    //             and the final } of each SSDT nulled out using the normal // method. Refer to each of my SSDT files and youll see what I mean. Its the first two and last active lines  
    //             of every SSDT file, except for the config SSDT (THIS FILE). You need to have iasl binary present in /usr/bin directory. You can get it from RehabMan's BitBucket page   
    //             and download it then choose "Go" from top bar and enter /usr/bin in "Go To Folder" option then copy the binary into the folder that opens after pressing enter in box                                                     


    //           |  Active files which I want in my final HOTPATCH .aml | 

    #include "SSDT-BAT.dsl"        // DSDT: BATC  Combines dual batteries into BATC for  proper battery functionality  on the ThinPad T450. This might work with other ThinkPads                                                
    
    //#include "SSDT-AUDIO.dsl"      // DSDT: HDEF & HDAU  Injects proper layout id for HDEF and HDAU (System Sound and HDMI Devices) also injects _DSM info in system information (_DSM)  
    
    //#include "SSDT-PS2INPUT.dsl"   // DSDT: KBD_, PS2K, PS2M, MOU_  Handles the proper configuration of T450 3 button trackpad and FN keys. MILTIPLE CONFIGS VOODOOPS2 APPLESMART  
    
    //#include "SSDT-PS2SMART.dsl"   // DSDT: KBD_, PS2K, PS2M, MOU_  Handles FN Key Brightness configuration keys for ApplePS2SmartTouchPad.kext. Can also configure more keys
    
    //#include "SSDT-VOODOO.dsl"     // DSDT: KBD_, PS2K, PS2M, MOU_  Proper FN Key and Trackpad configuration made specifically for VooDooPS2controller.kext from RehabMan 
    
    #include "SSDT-USB.dsl"        // DSDT: UIAC  Injects the USB ports which are needed and disables all the other ones (not needed). This is used with RehabMan's USBInjectAll  
    
    //#include "SSDT-PS2INPUT.dsl"   // DSDT: KBD_, PS2K, PS2M, MOU_  Handles the proper configuration of T450 3 button trackpad and FN keys. MILTIPLE CONFIGS VOODOOPS2 APPLESMART 
    
    #include "SSDT-XOSI.dsl"       // DSDT: XOSI  Disables _OSI Method and replaces it with XOSI used to spoof Windows as the operating  system reported when ACPI calls on XOSI  
    
    //#include "SSDT-IMEI.dsl"       // DSDT: IMEI (renamed from MEI_)  Communications controller used forthe proper DRM rights verification   
                                                                                                                                                                                         
    //#include "SSDT-IGPU.dsl"       // DSDT: IGPU (renamed from VID_)  Graphics controller handles proper HD video display and acceleration (_DSM)  
    
    //#include "SSDT-ARPT.dsl"       // DSDT: ARPT & SDXC  ARPT is the WiFi network card device and SDXC the SDHC+ memory card reader inside (_DSM)    
    
    #include "SSDT-DMAC.dsl"       // DSDT: DMAC  ADDS THE LPC DMAC configuration for the Low Pin Countunt Bus (LPC) 
    
    #include "SSDT-MEM2.dsl"       // DSDT: MEM2  Adds the defunctional MEM2 device present in MacBook Pro devices 
    
    #include "SSDT-PWRB.dsl"       // DSDT: PWRB  Adds the power button hardware                   

    #include "SSDT-DTGP.dsl"       // DSDT: DTGP  This file adds the DTGP  MethodObj to DSDT and allows for adding in custom fields to system the information reporting settings 
    
    #include "SSDT-PNLF.dsl"       // DSDT: PNLF  This file is for injecting backlight information. Should be used with AppleBacklightFixup.kext. Im using Clover method instead (_DSM) 
    
    //#include "SSDT-DEHC.dsl"         // DSDT: EH01  Disables the EHCI  device  (EH01)  and routes USB 2.0 traffic onto XHC device instead. Less power consumption with this method 
                           
    //#include "SSDT-ALS0.dsl"       // DSDT: ALS0  Injects fake ambient sensor in the DSDT. The T450 doesn't have one so  its not really needed. Enables some options in settings  
    
    //#include "SSDT-RMDT.dsl"       // DSDT: RMDT  Allows for debugging the ACPI to help deal with issues. Requires RehabMans ACPIPoller.kext for proper the device functionality  
    
    #include "SSDT-XCPM.dsl"       // DSDT: CPU01-CPU04  Enables Clover Configurators CPU power management functionality  Same as enabling Plugin Type=1 in Clover Configurator
    
    #include "SSDT-ALC3.dsl"       // DSDT: HDEF  ALC3232 codec configuration, used with ALC3232.kext, AppleHDA patched configuration for proper system-hdmi sound functionality                                                         
                        
    //#include "SSDT.dsl"            // DSDT: CPU01-CPU04  Used to enable CPU power management as well as proper battery functionality Im using Clover Plugin Type=1 instead of it  
    
    //#include "SSDT-PCIE.dsl"       // DSDT: HDAU, HDEF, IGPU, ARPT, IMEI, SMBU, MCHC, RP01, RP02, RP03, SDXC, ARPT, XHC, EH01, GIGE, LPC, SATA  About this Mac System Info field (_DSM)
    
    //#include "SSDT-GIGE.dsl"       // DSDT: IGBE (renamed from IGBE)  Ethernet port  controller for a wired internet connection capability (_DSM)
    
    //#include "SSDT-LPC.dsl"        // DSDT: LPC_ (Or LPCB if you rename it)  ISA  Bridge, handles power distribution throughout the system (_DSM)  
                 
    //#include "SSDT-MCHC.dsl"       // DSDT: PCI0  The PCIe bridge which controls all PCIe devices functionality and traffic on this laptop (_DSM)   
    
    //#include "SSDT-RP0X.dsl"       // DSDT: RP01-RP03 (renamed from EXP1 - EXP3)  The M2 SATA ports for varios devices such as the AirPort (_DSM)  
    
    //#include "SSDT-SATA.dsl"       // DSDT: SATA (renamed from SAT1)  Controls the up to 3 solid state drives connected to available ports (_DSM) 
    
    //#include "SSDT-SBUS.dsl"       // DSDT: SBUS (renamed from SMBU)  SMBus (System Bus) controller. Handles PCI bus traffic of the system (_DSM)  
     
    //#include "SSDT-USBX.dsl"       // DSDT: EH01 and XHC_ (renamed from EHC1 and XHCI)  The USB 2 or 3 traffic control HUBS internal usage (_DSM)  
    
}
