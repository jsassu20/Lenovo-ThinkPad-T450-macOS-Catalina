// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-HPET...
//
// This SSDT disables the HPET device in the DSDT.
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-HPET", 0)
{
    External(_SB.PCI0.LPC.HPET, DeviceObj)

    Scope(_SB.PCI0.LPC.HPET)
    {
        Name (_STA, 0x0)
    }
}
//EOF
