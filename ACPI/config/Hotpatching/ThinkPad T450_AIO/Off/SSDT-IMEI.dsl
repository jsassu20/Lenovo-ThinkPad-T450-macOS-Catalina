// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | Adds IMEI Device To DSDT And Injects _DSM Info...
//
// Adds Missing IMEI DeviceObj Into DSDT | Patched On The Fly | Fixes Issues With iTunes Store and macOS App Store DRM Verification...
//  
// Enable Clover Configurator's ACPI/Patches Option For "change MEI to IMEI"...
//
//DefinitionBlock("", "SSDT", 2, "T450", "_IMEI", 0)
//{
    // Note: If your ACPI set (DSDT+SSDTs) already defines IMEI (or HECI)
    // remove this Device definition
    Device(_SB.PCI0.IMEI) { Name(_ADR, 0x00160000) }
//}
//EOF