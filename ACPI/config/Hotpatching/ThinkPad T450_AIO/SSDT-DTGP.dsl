// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | DTGP MethodObj Configuration In The DSDT & SSDT Files...
//
// This MethodObj Is Required For Custom _DSM Method Entries Allowing System To Display PCIe Custom Device Information Properly...
//
// Enable The "change _DSM to XDSM" ACPI/Patches Fix In Clover Configurator If You Can't Boot After Enabling This...
// 
//DefinitionBlock ("", "SSDT", 2, "T450", "_DTPG", 0)
//{
    Method (DTGP, 5, NotSerialized)
    {
        If ((Arg0 == ToUUID ("a0b5b7c6-1318-441c-b0c9-fe695eaf949b")))
        {
            If ((Arg1 == One))
            {

                If ((Arg2 == Zero))
                {
                    Arg4 = Buffer (One)
                        {
                             0x03                                             // .
                        }
                    Return (One)                }

                If ((Arg2 == One))
                {
                    Return (One)
                }
            }
        }

        Arg4 = Buffer (One)
            {
                 0x00                                             // .
            }
        Return (Zero)
    }
//}
//EOF