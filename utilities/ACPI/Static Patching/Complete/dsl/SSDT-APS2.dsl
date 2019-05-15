// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)
//
// Clover UEFI Hotpatch | SSDT-APS2...
//
// This Configuration controls the brightness keys while using ApplePs2SmartTouchPad.kext...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-APS2", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.KBD, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC)
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
            Notify (\_SB.PCI0.LPCB.KBD, 0x10) // Reserved
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
            Notify (\_SB.PCI0.LPCB.KBD, 0x20) // Reserved
        }
    }
}

