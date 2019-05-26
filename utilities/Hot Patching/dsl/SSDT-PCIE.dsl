// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-PCIE...
//
// Injects The Proper _DSM Info For All PCI Express Devices | Enables Proper Device Info Reporting In System Information...
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-PCIE", 0)
{
#endif
    External (_SB.PCI0.SATA, DeviceObj)
    External (_SB.PCI0.RP01, DeviceObj)
    External (_SB.PCI0.RP02, DeviceObj)
    External (_SB.PCI0.RP03, DeviceObj)
    External (_SB.PCI0.IMEI, DeviceObj)
    External (_SB.PCI0.HDEF, DeviceObj)
    External (_SB.PCI0.HDAU, DeviceObj)
    External (_SB.PCI0.IGPU, DeviceObj)
    External (_SB.PCI0.SBUS, DeviceObj)
    External (_SB.PCI0.LAN0, DeviceObj)
    External (_SB.PCI0.EH01, DeviceObj)    // (from opcode)
    External (_SB.PCI0.XHC_, DeviceObj)
    External (_SB.PCI0.LPC_, DeviceObj)
    External (_SB.PCI0, DeviceObj)
    External (DTGP, MethodObj)
    
    Method (_SB.PCI0.SATA._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        { 
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Intel 9 Series Chipset Family SATA Host Controller" }, 
            "model", Buffer() { "Intel 9 Series Chipset Family SATA Host (Intel Broadwell Wildcat Point-LP AHCI Controller)" }, 
            "device_type", Buffer() { "SATA Controller" }, 
            "device-id", Buffer() { 0x83, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9c83" },
        })
    }
    Method (_SB.PCI0.LPC_._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        { 
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple LPC Power Bus Controller" }, 
            "model", Buffer() { "Apple PCI Express ISA Bridge (Intel Broadwell Wildcat Point-LP LPC Controller)" }, 
            "device_type", Buffer() { "ISA Bridge" }, 
            "device-id", Buffer() { 0xC3, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9cc3" },
        })
    }
    Method (_SB.PCI0.EH01._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        { 
            "AAPL,slot-name", Buffer() { "Built In" },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2700,
            "AAPL,current-in-sleep", 1000,
            "AAPL,current-extra-in-sleep", 2100,
            "AAPL,max-port-current-in-sleep", 2700,
            "AAPL,device-internal", 2,
            "name", Buffer() { "Intel 9 Series Chipset Family USB Enhanced Host Controller" }, 
            "model", Buffer() { "Intel 9 Series Chipset Family USB 2.0 Host (Intel Broadwell Wildcat Point-LP USB EHCI Controller)" }, 
            "device_type", Buffer() { "USB Controller" }, 
            "device-id", Buffer() { 0xA6, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9ca6" },
        })
    }
    Method (_SB.PCI0.XHC_._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        { 
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
        })
    }

    Method (_SB.PCI0.LAN0._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        { 
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple Gigabit Ethernet Network Controller" }, 
            "model", Buffer() { "Apple Gigabit Ethernet Network Controller (Intel Corporation I218-LM Gigabt Ethernet Adapter | LAN0 | 1000 MB/s)" }, 
            "device_type", Buffer() { "Ethernet Controller" }, 
            "device-id", Buffer() { 0xA2, 0x15, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,15a2" },
        })
    }
    Method (_SB.PCI0.SBUS._DSM, 4)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {   
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple PCI Express SMBus Controller" }, 
            "model", Buffer() { "Apple PCI Express SMBus Controller (Intel Broadwell Wildcat Point-LP SMBus Controller)" }, 
            "device_type", Buffer() { "SMBus" }, 
            "device-id", Buffer() { 0xA2, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9ca2" },
        })
    }
    Method(_SB.PCI0.HDEF._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "AAPL,slot-name", Buffer() { "Built In" },
            "layout-id", Buffer() { 28, 0, 0, 0 },
            "codec-id", Buffer() { 0x92, 0x02, 0xEC, 0x10 },
            "name", Buffer() { "Realtek ALC3232 High Definition Audio Controller" },
            "model", Buffer() { "Realtek ALC3232 High Definition Audio (Intel Broadwell Wildcat Point-LP HD Audio Controller)" },
            "device_type", Buffer() { "Audio Device" },
            "device-id", Buffer() { 0x92, 0x02, 0x00, 0x00 },
            "vendor-id", Buffer() { 0xEC, 0x10, 0x00, 0x00 },
            "built-in", Buffer() { 0x00 },
            "hda-gfx", Buffer() { "onboard-1" },
            "PinConfigurations", Buffer() { },
            //"MaximumBootBeepVolume", 77,
      
        })   
    }    
    Method(_SB.PCI0.HDAU._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "layout-id", Buffer() { 28, 0, 0, 0 },
            "hda-gfx", Buffer() { "onboard-1" },
            "AAPL,slot-name", Buffer() { "Built In" },
            "model", Buffer() { "Apple High Definition Audio Controller (Intel Broadwell-U HDMI Audio Controller)" },
            "device_type", Buffer() { "Audio Device" },
            "device-id", Buffer() { 0x0C, 0x16, 0x00, 0x00 },
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "built-in", Buffer() { 0x00 },
            "compatible", Buffer() { "pci8086,160c" },
            
        })
    }
    
    Method(_SB.PCI0.IMEI._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple PCI Express IMEI DRM Controller" }, 
            "model", Buffer() { "Apple PCI Express IMEI DRM Controller (Intel Broadwell Wildcat Point-LP IMEI DRM Controller)" }, 
            "device_type", Buffer() { "Communications Controller" }, 
            "device-id", Buffer() { 0xBA, 0x9C, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,9cba" },
        })
    }
    
    Method(_SB.PCI0._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "AAPL,slot-name", Buffer() { "Built In" },
            "name", Buffer() { "Apple PCI Express MCHC Host Bridge" }, 
            "model", Buffer() { "Apple PCI Express MCHC Host Bridge (Intel Broadwell-U Wildcat Point-LP Host Bridge OPI)" }, 
            "device_type", Buffer() { "Host Bridge" }, 
            "device-id", Buffer() { 0x04, 0x16, 0x00, 0x00 }, 
            "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
            "compatible", Buffer() { "pci8086,1604" }
        })        
    }
    Device (_SB.PCI0.RP01)
    {
        Name (_ADR, 0x001c0000)  // _ADR: Address
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {       
                "AAPL,slot-name", Buffer() { "Built In" },
                "name", Buffer() { "Apple PCI Express Root Port #3" }, 
                "model", Buffer() { "Apple PCI Express Root Port #3 (Intel Broadwell Wildcat Point-LP PCIe Root Port #3)" }, 
                "device_type", Buffer() { "PCI Bridge" }, 
                "device-id", Buffer() { 0x94, 0x9C, 0x00, 0x00 }, 
                "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
                "compatible", Buffer() { "pci8086,9c94" },
            })
        }
        Device (SDXC)
        {
            Name (_ADR, 0x02000000)
            Method (_DSM, 4)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return(Package()
                {   
                    "AAPL,slot-name", Buffer() { "Built In" },
                    "name", Buffer() { "Apple Internal SDXC Memory Card Reader" }, 
                    "model", Buffer() { "Apple Internal SDXC Card Reader (Realtek Semiconductor Corporation PCI Express SDHC Card Reader)" }, 
                    "device_type", Buffer() { "Card Reader" },
                    "device-id", Buffer() { 0x27, 0x52, 0x00, 0x00 }, 
                    "vendor-id", Buffer() { 0xEC, 0x10, 0x00, 0x00 },  
                    "compatible", Buffer() { "pci10ec,5227" },
                })    
            }
        }
    }
    Device (_SB.PCI0.RP02)
    {
        Name (_ADR, 0x001c0001)  // _ADR: Address
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {   
                "AAPL,slot-name", Buffer() { "Built In" },
                "name", Buffer() { "Apple PCI Express Root Port #6" }, 
                "model", Buffer() { "Apple PCI Express Root Port #6 (Intel Broadwell Wildcat Point-LP PCIe Root Port #6)" }, 
                "device_type", Buffer() { "PCI Bridge" }, 
                "device-id", Buffer() { 0x94, 0x9C, 0x00, 0x00 }, 
                "vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },  
                "compatible", Buffer() { "pci8086,9c94" },
            })
        }
        Device (ARPT)
        {
            Name (_ADR, 0x03000000)
            Method (_DSM, 4)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return(Package()
                {   
                    "AAPL,slot-name", Buffer() { "Built In" },
                    "name", Buffer() { "Apple AirPort Extreme Gigabit WiFi Adapter" }, 
                    "model", Buffer() { "AirPort Extreme Wireless Network Adapter (Broadcom BCM4360 802.11ac Gigabit WiFi Adapter| MIMO 3x3 | 1300 MB/s)" }, 
                    "device_type", Buffer() { "Network Controller" }, 
                    "device-id", Buffer() { 0xA0, 0x43, 0x00, 0x00 }, 
                    "vendor-id", Buffer() { 0xE4, 0x14, 0x00, 0x00 },  
                    "compatible", Buffer() { "pci14e4,43a0" },
               })
            }
        }
    }
    Device (_SB.PCI0.RP03)
    {
        Name (_ADR, 0x001c0002)  // _ADR: Address
        Method (_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {   
                "AAPL,slot-name", Buffer() { "Built In" },
                "name", Buffer() { "Apple PCI Express Root Port #9" }, 
                "model", Buffer() { "Apple PCI Express Root Port #9 (Intel Broadwell Wildcat Point-LP PCIe Root Port #9)" }, 
                "device_type", Buffer() { "PCI Bridge" },
            })
        }
        Device (BLTH)
        {
            Name (_ADR, 0x04000000) // _ADR: Address
            Method (_DSM, 4)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return(Package()
                {   
                    "AAPL,slot-name", Buffer() { "Built In" },
                    "name", Buffer() { "AirPort Extreme Bluetooth 4.0 LE Reciever" }, 
                    "model", Buffer() { "Apple AirPort Extreme Bluetooth 4.0 LE (Broadcom BCM20702B0 Bluetoothe 4.0 Low Energy Controller)" }, 
                    "device_type", Buffer() { "Bluetooth Controller" }, 
                    "device-id", Buffer() { 0x89, 0x82, 0x00, 0x00 }, 
                    "vendor-id", Buffer() { 0xAC, 0x05, 0x00, 0x00 },  
                    "compatible", Buffer() { "pci05ac,8289" },
               })
            }
        }    
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif    
//EOF
