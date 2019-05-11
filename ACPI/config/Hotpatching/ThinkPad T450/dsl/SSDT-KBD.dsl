// Thinkpad Keyboard
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-KBD", 0x00000000)
{
    External (_SB.PCI0.LPC.EC, DeviceObj)    // (from opcode)
    External (_SB.PCI0.LPC.KBD, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.LPC.EC)
    {
        /*
        Method (_Q6A, 0, NotSerialized)  // _Q6A (F4 key -> F17) Microphone Mute key
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0168)
            Notify (\_SB.PCI0.LPC.KBD, 0x01E8)
        }
        */

        Method (_Q14, 0, NotSerialized)  // _Q14 (F6 key) Brightness up key
        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0406)
//            Notify (\_SB.PCI0.LPC.KBD, 0x0486)
              Notify (\_SB.PCI0.LPC.KBD, 0x10)
        }

        Method (_Q15, 0, NotSerialized)  // _Q15 (F5 key) Brightness down key
        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0405)
//            Notify (\_SB.PCI0.LPC.KBD, 0x0485)
              Notify (\_SB.PCI0.LPC.KBD, 0x20)
        }

/*
        Method (_Q64, 0, NotSerialized)  // _Q64 (F8 key -> F18 ) Wireless disable key
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0169)
            Notify (\_SB.PCI0.LPC.KBD, 0x01E9)
        }

        Method (_Q66, 0, NotSerialized)  // _Q66 (F9 key -> F19 ) Settings key
        {
            Notify (\_SB.PCI0.LPC.KBD, 0x0364)
            Notify (\_SB.PCI0.LPC.KBD, 0x03E4)
        }
        */
    }
}    

/*
    Scope(_SB.PCI0.LPC.KBD)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_ClickPad",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 800,
                "BogusDeltaThreshY", 800,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
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
                "MouseMultiplierX", 2,
                "MouseMultiplierY", 2,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                //"TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                //"TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            },
        })
    }
    
    External(_SB.PCI0.LPC.MOU, DeviceObj)
    Scope(_SB.PCI0.LPC.MOU)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_ClickPad",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 800,
                "BogusDeltaThreshY", 800,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
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
                "MouseMultiplierX", 2,
                "MouseMultiplierY", 2,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                //"TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                //"TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            },
        })
    }
   */
#ifndef NO_DEFINITIONBLOCK
//}
#endif

