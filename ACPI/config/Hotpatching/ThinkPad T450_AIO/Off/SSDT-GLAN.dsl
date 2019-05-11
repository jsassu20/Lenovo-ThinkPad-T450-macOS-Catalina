#ifndef NO_DEFINITIONBLOCK
//DefinitionBlock ("", "SSDT", 2, "hack", "_GLAN", 0x00000000)
//{
#endif
    External (_SB_.PCI0.GLAN, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.GLAN._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LNot (Arg2))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "built-in", 
            Buffer (One)
            {
                 0x01                                           
            }
        })
    }
#ifndef NO_DEFINITIONBLOCK
//}
#endif

