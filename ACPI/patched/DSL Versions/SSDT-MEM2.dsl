// Fix IGPU MEM2 to match real MacBook Pro

DefinitionBlock ("", "SSDT", 2, "T450", "_MEM2", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)

    Scope (_SB.PCI0.IGPU)
    {
        Device (^^MEM2)
        {
            Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
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
                Return (CRS) /* \_SB_.MEM2.CRS_ */
            }
        }
    }
}

