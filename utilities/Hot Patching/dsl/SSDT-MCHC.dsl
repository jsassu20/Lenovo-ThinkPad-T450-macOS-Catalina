// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-MCHC...
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