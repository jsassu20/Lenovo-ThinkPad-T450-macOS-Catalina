// Clover UEFI Hotpatch | Keyboard & TrackPad Configuration | Lenovo ThinkPad T450 Ultrabook | Hackintosh (macOS Mojave) | Compiled By: Sass86oh |

// This Configuration Changes The KBD_ Device To PS2K For Proper FN Button Mapping | Also Defines The TrackPad Controller And Enables Apple Trackpad Options In Settings |
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-INPUT", 0)
{

    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.KBD, DeviceObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)  // Brightness Up
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0406)
//            Notify (\_SB.PCI0.LPC.KBD, 0x10) // ApplePS2SmartTouchPad.kext Brightness Up
        }

        Method (_Q15, 0, NotSerialized)  // Brightness Down
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0405)
//            Notify (\_SB.PCI0.LPC.KBD, 0x20) // ApplePS2SmartTouchPad.kext Brightness Down
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
    
    Scope(_SB.PCI0.LPC.KBD)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "Lenovo",
                "RM,oem-table-id", "T460",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Mouse", 
            Package (0x02)
            {
                "ActLikeTrackpad", 
                ">y"
            },
            
            "Keyboard", 
            Package (0x08)
            {
                "ActionSwipeLeft", 
                "37 d, 21 d, 21 u, 37 u", 
                "ActionSwipeRight", 
                "37 d, 1e d, 1e u, 37 u", 
                "SleepPressTime", 
                "1500", 
                "Swap command and option", 
                ">y"
            },  
            
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 800,
                "BogusDeltaThreshY", 800,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                "ForcePassThrough", ">y",
                "SkipPassThrough", ">y",
                "PalmNoAction When Typing", ">y",
                "ScrollResolution", 800,
                "SmoothInput", ">y",
                "UnsmootInput", ">y",
                "Thinkpad", ">y",
                "EdgeBottom", 0,
                "FingerZ", 30,
                "MaxTapTime", 100000000,
                "MomentumScrollThreshY", 32,
                "MouseMultiplierX", 8,
                "MouseMultiplierY", 8,
                "MouseScrollMultiplierX", 8,
                "MouseScrollMultiplierY", 8,
                "TrackpointScrollYMultiplier", 2, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                "TrackpointScrollXMultiplier", 2, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            }
        })
    }
}
//EOF