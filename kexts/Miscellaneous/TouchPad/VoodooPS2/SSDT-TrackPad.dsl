// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | Keyboard Function Keys & TrackPad & TrackPoint Configuration...
//
// This Configuration Fixes Device KBD_ For The Proper FN Button Mapping | Also Defines The TrackPad Controller And Enables Apple Trackpad Options In Settings...
//
// If This Does Not Work You Can Download Keyboard Maestro And Create The Proper Function Keys Configuration From There...
//
//DefinitionBlock("", "SSDT", 1, "TP-T450", "_INPUT", 0)
//{
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)
    External (_SB_.PCI0.LPC_.KBD_, DeviceObj)

    Scope (_SB_.PCI0.LPC_.EC__)
    {
        Method (_Q14, 0, NotSerialized)  // F6 Brightness Up
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0206)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0286)

        }

        Method (_Q15, 0, NotSerialized)  // F5 Brightness Down
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0205)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0285)

        }

        Method (_Q6A, 0, NotSerialized)  // F4 Microphone Mute - Siri (SysPrefs>Siri>Keyboard Shortcut)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0168)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E8)

        }

        Method (_Q16, 0, NotSerialized)  // F7 Projector / Mirror Mode
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x026E)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x02EE)

        }

        Method (_Q64, 0, NotSerialized)  // F8 Wireless ON/OFF - Notification Center (SysPrefs>Keyboard>Shortcuts)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0169)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E9)

        }

        Method (_Q66, 0, NotSerialized)  // F9 Settings - System Preferences (SysPrefs>Keyboard>Shortcuts)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0164)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E4)

        }

        Method (_Q67, 0, NotSerialized)  //F10 Windows Search (Cortana) - Spotlight Search (SysPrefs>Keyboard>Shortcuts)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0165)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E5)

        }

        Method (_Q68, 0, NotSerialized)  //F18 ALT+TAB Menu - Mission Control (SysPrefs>Keyboard>Shortcuts)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0166)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E6)

        }

        Method (_Q69, 0, NotSerialized)  // Win Key Start Menu - Launchpad (SysPrefs>Keyboard>Shortcuts)
        {
            
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x0167)
            Notify (\_SB_.PCI0.LPC_.KBD_, 0x01E7)

        }
    }
    
    Scope(_SB_.PCI0.LPC_.KBD_)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "Lenovo",
                "RM,oem-table-id", "Thinkpad_TrackPad",
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
                "FakeMiddleButton", ">y",
                "HWResetOnStart", ">y",
                //"ForcePassThrough", ">y",
                //"SkipPassThrough", ">y",
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
//}
//EOF