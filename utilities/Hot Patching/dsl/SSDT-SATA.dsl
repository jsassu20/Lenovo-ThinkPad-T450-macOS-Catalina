// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-SATA...
//
// This Configuration Injects The Proper _DSM Info For The SATA Controller | Enables Intel Series 9 Chipset Recognition | Proper SATA Controller Functionality...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-SATA", 0x001f0002)
{
    External (_SB_.PCI0.SATA, DeviceObj)    // (from opcode)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.SATA._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x0F) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Intel 9 Series Chipset Family SATA Host Controller" }, 
            "model", Buffer() { "Intel 9 Series Chipset Family SATA Host Controller (Intel Broadwell Wildcat Point-LP PCI Express AHCI Controller)" }, 
            "device_type", Buffer() { "SATA Controller" }, 
            "device-id", Buffer() { 0x83, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9c83" },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
//EOF
