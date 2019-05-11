// Clover UEFI Hotpatch | SATA AHCI _DSM Injection | Lenovo ThinkPad T450 Ultrabook | Hackintosh (macOS Mojave) | Compiled By: Sass86oh |

// This Configuration Injects The Proper _DSM Info For The AHCI Controller | Enables Intel Series 9 Chipset Recognition | Proper SATA Controller Functionality |
//
//DefinitionBlock ("", "SSDT", 2, "T450 ", "SATA", 0x00001000)
//{
    External (_SB_.PCI0.SATA, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.SATA._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package (0x10)
        {
            "AAPL,slot-name", 
            Buffer (0x09)
            {
                "Built In"
            }, 

            "name", 
            Buffer (0x24)
            {
                "Apple Advanced SATA AHCI Controller"
            }, 

            "model", 
            Buffer ()
            {
                "Intel Series 9 Chipset AHCI Controller, (Intel Broadwell Wildcat Point-LP AHCI Controller)"
            }, 

            "device_type", 
            Buffer (0x10)
            {
                "AHCI Controller"
            }, 

            "device-id", 
            Buffer (0x04)
            {
                 0x83, 0x9C, 0x00, 0x00                         
            }, 

            "vendor-id", 
            Buffer (0x04)
            {
                 0x86, 0x80, 0x00, 0x00                         
            }, 

            "built-in", 
            Buffer (One)
            {
                 0x00                                           
            }, 

            "compatible", 
            Buffer (0x0D)
            {
                "pci8086,9c83"
            }
        })
    }
//}
//EOF
