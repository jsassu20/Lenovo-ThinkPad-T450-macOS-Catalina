// Lenovo ThinkPad T440 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-IMEI...
//
// Adds Missing IMEI DeviceObj Into DSDT | Patched On The Fly | Fixes Issues With iTunes Store and macOS App Store DRM Verification...
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-IMEI", 0)
{
#endif
    External(_SB.PCI0.IMEI, DeviceObj)
    
    // Note: If your ACPI set (DSDT+SSDTs) already defines IMEI (or HECI),
    // remove this Device definition, swap for External below
    Device(_SB.PCI0.IMEI) { Name(_ADR, 0x00160000) }
    #ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
