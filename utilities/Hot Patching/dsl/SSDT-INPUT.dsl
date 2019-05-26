// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)                       //
//                                                                                                                                             //                                     
// Clover UEFI Hotpatch | Keyboard Function Keys & TrackPad & TrackPoint Configuration method for Lenovo systems (works with others too)       //
//                                                                                                                                             //
// There are two options for trackpad functionality on hackintosh laptops which I consider to be be the only real solutions...                 //
//                                                                                                                                             //
// Option #1 - RehabMan's VoodooPS2controller.kext:                                                                                            //
//                                                                                                                                             //
// Which is probably the most popular in that its always up to date, it's easy to use, and it                                                  //
// allows for a solid configuration both in that it provides a functional method for using a large number of PC based hardware with            //
// a useable configuration, multitouch functionality (albeit only a few gestures but they are the most likely gestures which you'll            //
// utilize 90% of the time) and it also has the ability to configure specific aspects of the hardware functions by way of editing the          //
// info.plist inside of the kexts file itself or from within this file.                                                                        //
//                                                                                                                                             //                                   
// Option #2 - ApplePS2smartTouchPad.kext                                                                                                      //
//                                                                                                                                             //
// This option is a bit more in depth to configure but the benefit is that it offers a far greater amount of features if you're willing.       //
// to roll up your sleeves and figure out how it works. For the ThinkPad T450 you wont be able to use the physical buttons on the 3 button     //
// trackpad if you go with this option. You also wont have the ability to use the trackpoint like you can with the other method. However       //
// the features which this method is capeable of offering are more than enough to justify the loss of those two basic options and I            //
// actually enjoy this method so much that I purchased the regular one button trackpad from the T440 to replace the 3 button hardware          //
// which came stock with my T450. I did this because its a bigger touch area and it wliminates the physical buttons from becomming just        //
// a waste of space and it offers me a better experience overall in macOS.                                                                     //
//                                                                                                                                             //
// This file enables basic functionality, volume control and brightness controll plus gestures for both kext options as is and also has the    //
// ability to designate functionality on the stock KBD_ device or you can rename it to PS2K for both the FN keys and trackpad as well as the   //
// option to have the fn keys on one device (KBD or PS2K0 and the track pad on the MOU_ device but this is not a requirement and is strictly   //
// for having two seperate system devices which are assigned to each hardware interface.                                                       //               
//                                                                                                                                             //
// - So decide which kext file youre going to choose and install it to CLOVER/kexts/other & also inside of Mac's /Library/Extensions folder    //
//                                                                                                                                             //
// - Next decide on which device configuration in this file youre going to use with your hardware.. If you want to change devices just // out  //
//   the devices you don't want to handle whihever device you choose.                                                                          //
//                                                                                                                                             //
// - The majority of users will be just filne with the default configuration. | // *** = ACTIVE                                                //
//                                                                                                                                             //
DefinitionBlock("", "SSDT", 1, "LENOVO", "TP-INPUT", 0)                                                                                          //
{
    // CHOOSE THE PROPER DEVICES BASED ON YOUR PREFERED SETTINGS. WITH THIS CONFIGURATION BOTH TRACKPAD AND KEBOARD WILL BE ON DEVICE KBD_ AS A SINGLE HARDWARE ENTITY
    External (_SB.PCI0.LPC.EC, DeviceObj)   // ***
    External (_SB.PCI0.LPC.KBD, DeviceObj)  // ***  
    External (_SB.PCI0.LPC.PS2K, DeviceObj)    
    
    Scope (_SB.PCI0.LPC.EC)  // DONT CHANGE THIS SCOPE! ONLY THE ONE FOR THE TRACKPAD
    {

//        Method (_Q6A, 0, NotSerialized)   // _Q6A (F4 key -> F17) Microphone Mute key | CHOOSE THE PROPER NOTIFIER SETTINGS BASED ON THE NAME OF YOUR PS2 CONTROLLER OR IF YOU RENAME KBD_
//        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0168)     // VoodooPS2controller.kext 
//            Notify (\_SB.PCI0.LPC.KBD, 0x01E8)        
//            
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0168)
//            Notify (\_SB.PCI0.LPC.PS2K, 0x01E8)             
//        }


        Method (_Q14, 0, NotSerialized)   // _Q14 (F6 key) Brightness Up Key | CHOOSE THE PROPER NOTIFIER SETTINGS BASED ON THE NAME OF YOUR PS2 CONTROLLER OR IF YOU RENAME KBD_
        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0406)     // VoodooPS2controller.kext
//            Notify (\_SB.PCI0.LPC.KBD, 0x0486)         
//            
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0406)        
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0486)                
//
            Notify (\_SB.PCI0.LPC.KBD, 0x10)       // ApplePS2smartTouchPad.kext  // *** ACTIVE ON KBD_
//            Notify (\_SB.PCI0.LPC.PS2K, 0x10)                   
        }

        Method (_Q15, 0, NotSerialized)   // _Q15 (F5 key) Brightness Down Key | CHOOSE THE PROPER NOTIFIER SETTINGS BASED ON THE NAME OF YOUR PS2 CONTROLLER OR IF YOU RENAME KBD_
        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0405)     // VoodooPS2controller.kext  
//            Notify (\_SB.PCI0.LPC.KBD, 0x0485)       
//            
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0405)    
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0485)           
//
            Notify (\_SB.PCI0.LPC.KBD, 0x20)       // ApplePS2smartTouchPad.kext  // *** ACTIVE ON KBD_
//            Notify (\_SB.PCI0.LPC.PS2K, 0x20)           
        }


//        Method (_Q64, 0, NotSerialized)   // _Q64 (F8 key -> F18 ) Wireless disable key | CHOOSE THE PROPER NOTIFIER SETTINGS BASED ON THE NAME OF YOUR PS2 CONTROLLER OR IF YOU RENAME KBD_
//        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0169)     // VoodooPS2controller.kext  
//            Notify (\_SB.PCI0.LPC.KBD, 0x01E9)   
//            
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0169)
//            Notify (\_SB.PCI0.LPC.PS2K, 0x01E9)           
//        }

//        Method (_Q66, 0, NotSerialized)   // _Q66 (F9 key -> F19 ) Settings key | CHOOSE THE PROPER NOTIFIER SETTINGS BASED ON THE NAME OF YOUR PS2 CONTROLLER OR IF YOU RENAME KBD_
//        {
//            Notify (\_SB.PCI0.LPC.KBD, 0x0364)     // VoodooPS2controller.kext 
//            Notify (\_SB.PCI0.LPC.KBD, 0x03E4)       
//            
//            Notify (\_SB.PCI0.LPC.PS2K, 0x0364)
//            Notify (\_SB.PCI0.LPC.PS2K, 0x03E4)           
//        }
        
    }
    // Select the desired device for the TracPad to be assigned to depending on your system
    
    Scope(_SB.PCI0.LPC.KBD)   // TrackPad ON KBD_  // *** ACTIVE   
    //Scope(_SB.PCI0.LPC.PS2K)  // TrackPad ON PS2K
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "Lenovo",
                //"RM,oem-table-id", "T420",
                //"RM,oem-table-id", "T440",
                //"RM,oem-table-id", "T450",
                //"RM,oem-table-id", "T460",
                "RM,oem-table-id", "ThinkPad_ClickPad", // *** ACTIVE
                //"RM,oem-table-id", "ThinkPad_TrackPad",
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
                //">n"
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
                "TrackpointScrollYMultiplier", 2, 
                "TrackpointScrollXMultiplier", 2,
            }
        })
    }
}    
//EOF

