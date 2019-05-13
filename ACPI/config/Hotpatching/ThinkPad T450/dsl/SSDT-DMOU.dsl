// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)...
//
// Clover UEFI Hotpatch | SSDT-DMOU...
//
// Disables the MOU device...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-DMOU", 0)
{
    External (_SB_.PCI0.LPC.MOU, DeviceObj)

    Scope (_SB.PCI0.LPC.MOU)
    {
        Name (_STA, Zero)  // _STA: Status
    }
}

