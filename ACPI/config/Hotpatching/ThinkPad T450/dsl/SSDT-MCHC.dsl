// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | MCHC Device _DSM Injection...
//
// This Configuration Injects The MCHC Controller | This Is The Main PCI Express Bridge...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-MCHC", 0x00000000)
{
    External(_SB.PCI0, DeviceObj)

    Scope(_SB.PCI0)
    {
        Device (MCHC)
        {
            Name (_ADR, 0)
        }
    }    
}
//EOF