// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)
//
// Clover UEFI Hotpatch | SSDT-IMEI...
//
// Adds Missing IMEI DeviceObj Into DSDT | Patched On The Fly | Fixes Issues With iTunes Store and macOS App Store DRM Verification...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-IMEI", 0)
{
    External (_SB.PCI0, DeviceObj)
    External (SB.PCI0.IMEI, DeviceObj)
    
    Scope (_SB.PCI0)
    {
        Device(IMEI) 
        { 
            Name(_ADR, 0x00160000) 
        }
    }
}    
//EOF