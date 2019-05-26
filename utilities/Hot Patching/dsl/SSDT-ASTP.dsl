// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-APS2...
// 
// Keyboard Brightness Keys Definition | Designed to work with ApplePS2SmartTouchPad.kext.kext...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-ASTP", 0)
{
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.KBD, DeviceObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)  // Brightness Up
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x010)
        }

        Method (_Q15, 0, NotSerialized)  // Brightness Down
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x20)
        }
    }
}
//EOF