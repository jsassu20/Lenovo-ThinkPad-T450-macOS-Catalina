// Clover UEFI Hotpatch | DTGP MethodObj Configuration | Lenovo ThinkPad T450 Ultrabook | Hackintosh (macOS Mojave) | Compiled By: Sass86oh |

// This MethodObj Is Required For Custom _DSM Methods Entries To Be See To Display PCIe Custom Device Information Properly |
// Enable/Add The "change _DSM to XDSM" Clover Device Rename DSDT Fix If You Can't Boot After Enabling This | 

DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-DTPG", 0)
{
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
}
//EOF
