// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
// Clover UEFI Hotpatch | SSDT-MEM2...
//
// This Configuration Injects defunctional MEM2 device present in real MacBook Pros...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-MEM2", 0)
{
    External (_SB.PCI0.IGPU, DeviceObj)
    
    Scope (_SB.PCI0.IGPU)
    {    
        Device (^^MEM2)
        {
            Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x20000000,         // Address Base
                    0x00200000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0x40000000,         // Address Base
                    0x00200000,         // Address Length
                    )
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (CRS)
            }
        }
    }
}
//EOF