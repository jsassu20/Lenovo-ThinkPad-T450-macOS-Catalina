// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-DSAT2...
//
// Disables the SATB device...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-DSAT2", 0)
{
    External (_SB_.PCI0.SAT2, DeviceObj)

    Scope (_SB.PCI0.SAT2)
    {
        Name (_STA, Zero)  // _STA: Status
    }
}

