// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | Disables USB EHCI EH01 In DSDT...
//
// This Configuration Disables The EHCI Controller | Routes All USB Traffic Over XHC...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP_DEHC", 0)
{
    External(_SB.PCI0, DeviceObj)
    External(_SB.PCI0.EH01, DeviceObj)
    External(_SB.PCI0.LPC, DeviceObj)

    // registers needed for disabling EHC#1
    Scope(_SB.PCI0.EH01)
    {
        OperationRegion(RMP1, PCI_Config, 0x54, 2)
        Field(RMP1, WordAcc, NoLock, Preserve)
        {
            PSTE, 2  // bits 2:0 are power state
        }
    }
    Scope(_SB.PCI0.LPC)
    {
        OperationRegion(RMP1, PCI_Config, 0xF0, 4)
        Field(RMP1, DWordAcc, NoLock, Preserve)
        {
            RCB3, 32, // Root Complex Base Address
        }
        // address is in bits 31:14
        OperationRegion(FDM1, SystemMemory, (RCB3 & Not((1<<14)-1)) + 0x3418, 4)
        Field(FDM1, DWordAcc, NoLock, Preserve)
        {
            ,15,    // skip first 15 bits
            FDE1,1, // should be bit 15 (0-based) (FD EHCI#1)
        }
    }
    Scope(_SB.PCI0)
    {
        Device(RMD3)
        {
            Name(_HID, "RMD30000")
            Method(_INI)
            {
                // disable EHCI#1
                // put EHCI#1 in D3hot (sleep mode)
                ^^EH01.PSTE = 3
                // disable EHCI#1 PCI space
                ^^LPC.FDE1 = 1
            }
        }
    }
}
//EOF