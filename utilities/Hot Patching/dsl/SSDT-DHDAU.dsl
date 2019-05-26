// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-DHDAU...
//
// Disables the HDAU Audio device...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-DHDAU", 0)
{
    External (_SB_.PCI0.HDAU, DeviceObj)

    Scope (_SB.PCI0.HDAU)
    {
        Name (_STA, Zero)  // _STA: Status
    }
}

