// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-PWRB...
//
// This Configuration Injects the physical power button hardware from MacBook Pro...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-PWRB", 0x00000000)
{
    External (_SB.PWRB, DeviceObj)
    
    Device (_SB.PWRB)
    {
        Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
    }
}
//EOF
