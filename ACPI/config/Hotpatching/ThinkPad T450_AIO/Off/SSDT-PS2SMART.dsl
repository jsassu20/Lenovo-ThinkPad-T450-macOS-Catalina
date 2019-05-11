// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//                                     
// Clover UEFI Hotpatch | Keyboard Brightness Controller Definition...
// 
// Designed to work with ApplePS2SmartTouchPad.kext
//
//DefinitionBlock("", "SSDT", 2, "T450", "_APS2", 0)
//{
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.KBD, DeviceObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)  // Brightness Up
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x10)
        }

        Method (_Q15, 0, NotSerialized)  // Brightness Down
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x20)
        }
    }        
//}
//EOF