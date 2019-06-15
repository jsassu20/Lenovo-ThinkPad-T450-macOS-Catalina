// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-DMOU...
//
// Disables the SPKR device...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-DSPKR", 0)
{
    External (_SB_.PCI0.LPC.SPKR, DeviceObj)

    Scope (_SB.PCI0.LPC.SPKR)
    {
        Name (_STA, Zero)  // _STA: Status
    }
}

