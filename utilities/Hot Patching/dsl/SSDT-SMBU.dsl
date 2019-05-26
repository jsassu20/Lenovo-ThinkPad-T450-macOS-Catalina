// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-SMBU...
//
// Add Missing SMBU _DSM Info Into DSDT | Patched On The Fly...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-SMBU", 0x00000000)
{
    External (_SB_.PCI0.SMBU, DeviceObj)

    Device (_SB.PCI0.SMBU)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")  // _CID: Compatible ID
            Name (_ADR, Zero)  // _ADR: Address
            Device (DVL0)
            {
                Name (_ADR, 0x57)  // _ADR: Address
                Name (_CID, "diagsvault")  // _CID: Compatible ID
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x02)
                    {
                        "address", 
                        0x57
                    })
                }
            }
        }
    }
}

