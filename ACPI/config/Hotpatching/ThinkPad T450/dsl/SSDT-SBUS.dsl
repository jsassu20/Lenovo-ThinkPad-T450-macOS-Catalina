// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu)...
//
// Clover UEFI Hotpatch | SSDT-SMBUS...
//
// Add Missing SBUS _DSM Info Into DSDT | Patched On The Fly...
//  
// Enable Clover Configurator's ACPI/Patches Option For "change SMBU to SBUS"...
//
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-SBUS", 0)
{ 
    External (_SB.PCI0.SBUS, DeviceObj)
    
    Device (_SB.PCI0.SBUS)
    {
        Device (BUS0)
        {
            Name (_CID, "smbus")
            Name (_ADR, Zero)
            Device(DVL0)
            {
                Name(_ADR, 0x57)
                Name(_CID, "diagsvault")
                Method(_DSM, 4)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
                    Return (Package() { "address", 0x57 })
                        
                }
            }
        }        
    }
}
//EOF