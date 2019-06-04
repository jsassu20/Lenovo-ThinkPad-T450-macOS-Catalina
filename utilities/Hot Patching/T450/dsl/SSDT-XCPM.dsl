// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-XCPM...
//
// This Configuration Injects PLUGIN-TYPE = 1 for Dynamic CPU Power Management In Clover Configurator...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-XCPM", 0x00003000)
{
    External (_PR_.CPU0, DeviceObj)    // (from opcode)

    Scope (\_PR.CPU0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            Store ("Writing plugin-type to Registry!", Debug)
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Return (Package (0x02)
            {
                "plugin-type", 
                One
            })
        }
    }
}
//EOF
