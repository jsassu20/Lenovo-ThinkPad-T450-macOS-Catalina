// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//                                    
// Clover UEFI Hotpatch | Keyboard Function Keys Definition...
// 
// Designed to work with VooDooPS2controller.kext
//
//DefinitionBlock("", "SSDT", 2, "T450", "_KBD", 0)
//{
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

        Method (_Q6A, 0, NotSerialized)  //F4 Microphone Mute - Siri (SysPrefs>Siri>Keyboard Shortcut)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x033E)
        }

        Method (_Q16, 0, NotSerialized)  // Projector / Mirror mode
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x046E)
        }

        Method (_Q64, 0, NotSerialized)  //F8 Wireless ON/OFF - Notification Center (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0342)
        }

        Method (_Q66, 0, NotSerialized)  // F16 Settings - System Preferences (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0367)
        }

        Method (_Q67, 0, NotSerialized)  //F17 Windows Search (Cortana) - Spotlight Search (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0368)
        }

        Method (_Q68, 0, NotSerialized)  //F18 ALT+TAB Menu - Mission Control (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0369)
        }

        Method (_Q69, 0, NotSerialized)  //F19 Start Menu - Launchpad (SysPrefs>Keyboard>Shortcuts)
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x036A)
        }
    }
//}
//EOF