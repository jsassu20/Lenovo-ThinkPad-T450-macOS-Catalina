// Clover UEFI Hotpatch | Configuration Table | Lenovo ThinkPad T450 Ultrabook | Hackintosh (macOS Mojave)

// Intel 5th Generation Architecture (Broadwell) | Intel Core i7-5600U) | Intel Series 9 Chipset | Intel HD 5500 Integrated Graphics | Unlocked UEFI BIOS |
// Apple Airport Extreme WiFi (BCM94360CSX) | USB 3.1 (x3) | Mini Display (4K) | 3x Samsung Evo SSDs | LTE Ready | AUX In/Out | SDHC Reader | Gigabit LAN | 720p HD WebCam |
//
// This SSDT Controls Merges All Hotpatched ACPI Files Into A Single SSDT File | It Can Also Control Certain Functions With The Change Of A Single Code Entry Below 
//
DefinitionBlock("", "SSDT", 2, "T450 ", "T450", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)   // do not remove

        Method(HELP)
        {
            Store("TYPE 0: desktop, 1: laptop", Debug)
            Store("HIGH 1: high resolution, 2: low resolution", Debug)
            Store("BKLT 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store("LMAX Ones: Use default, other values must match framebuffer", Debug)
        }

        // TYPE: Set form factor
        //
        //  0: desktop
        //  1: laptop
        Name(TYPE, 1)

        // HIGH: High resolution/low resolution selection.  Affects IGPU injection.
        //
        // For 1600x900+ on Sandy/Ivy, use 1
        // For UHD/QHD+ on Haswell/Broadwell, use 1
        Name(HIGH, 1)

        // BKLT: Backlight control type
        //
        // bit0=1: Using AppleBacklightFixup.kext
        Name(BKLT, 1)

        // LMAX: Backlight PWM MAX.  Must match framebuffer in use.
        //
        // Ones: (0x710 for Ivy/Sandy, 0xad9 for Haswell/Broadwell)
        Name(LMAX, 0x0AD9)

    }
    
    #include "SSDT-XOSI.dsl"
    #include "SSDT-ARPT.dsl"
    #include "SSDT-DHCI.dsl" 
    #include "SSDT-UIAC.dsl"
    #include "SSDT-FALS.dsl"
    #include "SSDT-PNLF.dsl"
    #include "SSDT-BATT.dsl"
    #include "SSDT-DTGP.dsl"
    #include "SSDT-XCPM.dsl"
    #include "SSDT-AUDIO.dsl"
    #include "SSDT-USBX.dsl"
    #include "SSDT-ALC3.dsl"
    #include "SSDT-IMEI.dsl"
    #include "SSDT-MCHC.dsl"
    #include "SSDT-KBD.dsl"
    #include "SSDT-DMAC.dsl"
    #include "SSDT-MEM2.dsl"
    #include "SSDT-PWRB.dsl"
    #include "SSDT-RMDT.dsl"
   
}
//EOF