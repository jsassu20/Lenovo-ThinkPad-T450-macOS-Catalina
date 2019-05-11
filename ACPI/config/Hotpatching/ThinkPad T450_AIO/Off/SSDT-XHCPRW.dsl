// For solving instant wake by hooking GPRW
#ifndef NO_DEFINITIONBLOCK
//DefinitionBlock("", "SSDT", 2, "hack", "_XHCPRW", 0)
//{
#endif
    External(\_SB.PCI0.XHC, DeviceObj)
    External(\_SB.PCI0.LPC.EC.PUBS, UnknownObj)
    Scope (\_SB.PCI0.XHC)
    {
        Name (_PRW, Package ()  // _PRW: Power Resources for Wake
        {
            0x6D, 
            0x00, 
            \_SB.PCI0.LPCB.EC.PUBS
        })
    }
#ifndef NO_DEFINITIONBLOCK
//}
#endif
//EOF
