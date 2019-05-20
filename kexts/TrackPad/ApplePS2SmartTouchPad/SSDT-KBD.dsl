// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//                                    
// Clover UEFI Hotpatch | Keyboard Function Keys Definition...
// 
// Designed to work with VooDooPS2controller.kext
//
DefinitionBlock("", "SSDT", 2, "LEVOVO", "TP-KBD", 0)
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