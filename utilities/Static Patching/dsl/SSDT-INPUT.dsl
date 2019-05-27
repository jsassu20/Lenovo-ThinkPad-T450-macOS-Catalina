// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)
//
// Clover UEFI Hotpatch | SSDT-INPUT...
//
// This Configuration controls the 3 Button Touchpad TouchPad with VoodooPS2controller.kext and fixes the physical buttons function (Fixes Left Click, TouchPoint Scrolling, and Right Click Actions)...
//
// If your LPC Bus is named LPCB then leave everything the way it is. If its named LPC then enable the 2 lines with { // A } and disable the 2 with { // B }...
//
// If You rename KBD to PS2K, enable the PS2K device under the TouchPad configuration and disable the KBD above it... ALSO DISABLE ALL NOTIFY KBD LINES IN FUNCTION KEY CONFIGURATION AREA AND ENABLE PS2K LINES...  
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-INPUT", 0x00000000)
{
    // FUNCTION KEYS CONFIGURATION
    
    External (_SB_.PCI0.LPCB.EC__, DeviceObj)
    External (_SB_.PCI0.LPC.EC__, DeviceObj)

    // IF YOU RENAME KBD TO PS2K THEN DISABLE ALL NOTIFY KBD LINES BELOW AND ENABLE ALL NOTIFY PS2K LINES INSTEAD OR FN KEYS WON'T WORK...
    
    //Scope (_SB.PCI0.LPC.EC) // A (1)
    Scope (_SB.PCI0.LPCB.EC)  // B (1)  
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0406)
            //Notify (\PS2K, 0x0406)
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0405)
            //Notify (\PS2K, 0x0405)
        }

        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x033E)
            //Notify (\PS2K, 0x033E)
        }

        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x046E)
            //Notify (\PS2K, 0x046E)
        }

        Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0342)
            //Notify (\PS2K, 0x0342)
        }

        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0367)
            //Notify (\PS2K, 0x0367)
        }

        Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0368)
            //Notify (\PS2K, 0x0368)
        }

        Method (_Q68, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x0369)
            //Notify (\PS2K, 0x0369)
        }

        Method (_Q69, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Notify (\KBD, 0x036A)
            //Notify (\PS2K, 0x036A)
        }
    }
    
    // TOUCHPAD CONFIGURATION
    
    External (_SB_.PCI0.LPC, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (KBD, DeviceObj)
    External (PS2K, DeviceObj)
    
    //Scope (_SB.PCI0.LPC) // A (2)
    Scope (_SB.PCI0.LPCB)  // B (2)
    {   
        Device (KBD)     
        //Device (PS2K)   // ENABLE THIS LINE IF YOU'VE RENAMED KBD TO PS2K AND DISABLE THE LINE ABOVE FOR KBD DEVICE
        {
            Name (_ADR, Zero)
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x04)
                {
                    "RM,oem-id", 
                    "Lenovo", 
                    "RM,oem-table-id", 
                    "Thinkpad_TrackPad"
                })
            }

            Name (RMCF, Package (0x06)
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

                "Synaptics TouchPad", 
                Package (0x30)
                {
                    "BogusDeltaThreshX", 
                    0x0320, 
                    "BogusDeltaThreshY", 
                    0x0320, 
                    "Clicking", 
                    ">y", 
                    "DragLockTempMask", 
                    0x00040004, 
                    "DynamicEWMode", 
                    ">n", 
                    "FakeMiddleButton", 
                    ">y", 
                    "HWResetOnStart", 
                    ">y", 
                    "ForcePassThrough", 
                    ">y", 
                    "SkipPassThrough", 
                    ">y", 
                    "PalmNoAction When Typing", 
                    ">y", 
                    "ScrollResolution", 
                    0x0320, 
                    "SmoothInput", 
                    ">y", 
                    "UnsmootInput", 
                    ">y", 
                    "Thinkpad", 
                    ">y", 
                    "EdgeBottom", 
                    Zero, 
                    "FingerZ", 
                    0x1E, 
                    "MaxTapTime", 
                    0x05F5E100, 
                    "MomentumScrollThreshY", 
                    0x20, 
                    "MouseMultiplierX", 
                    0x08, 
                    "MouseMultiplierY", 
                    0x08, 
                    "MouseScrollMultiplierX", 
                    0x08, 
                    "MouseScrollMultiplierY", 
                    0x08, 
                    "TrackpointScrollYMultiplier", 
                    0x02, 
                    "TrackpointScrollXMultiplier", 
                    0x02
                }    
            })
        }
    }
}    
//EOF
