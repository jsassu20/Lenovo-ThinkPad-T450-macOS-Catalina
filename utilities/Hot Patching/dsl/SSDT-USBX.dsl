// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-USBX...
//
// This Configuration Injects The Proper _DSM Info For The EH01 & XHCI Controller...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-USBX", 0)
{
    External (_SB_.PCI0.EH01, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC, DeviceObj)    // (from opcode)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x1B) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2700,
            "AAPL,current-in-sleep", 1000,
            "AAPL,current-extra-in-sleep", 2100,
            "AAPL,max-port-current-in-sleep", 2700,
            "AAPL,device-internal", 2,
            "name", Buffer() { "Intel 9 Series Chipset Family USB xHCI Host Controller" }, 
            "model", Buffer() { "Intel 9 Series Chipset Family USB 3.1 Host (Intel Broadwell Wildcat Point-LP USB xHCI Controller)" }, 
            "device_type", Buffer() { "USB Controller" }, 
            "device-id", Buffer() { 0xB1, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9cb1" },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
    
    Method (_SB.PCI0.EH01._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        Store (Package (0x1B) {
            "AAPL,slot-name", Buffer() { "Built In" },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2700,
            "AAPL,current-in-sleep", 1000,
            "AAPL,current-extra-in-sleep", 2100,
            "AAPL,max-port-current-in-sleep", 2700,
            "AAPL,device-internal", 2,
            "name", Buffer() { "Intel 9 Series Chipset Family USB Enhanced Host Controller" }, 
            "model", Buffer() { "Intel 9 Series Chipset Family USB 2.0 Host (Intel Broadwell Wildcat Point-LP USB Enhanced Controller)" }, 
            "device_type", Buffer() { "USB Controller" }, 
            "device-id", Buffer() { 0xA6, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9ca6" },
            Buffer (One) {0x00}
        }, Local0)
        DTGP (Arg0, Arg1, Arg2, Arg3, RefOf (Local0))
        Return (Local0)
    }
}
//EOF