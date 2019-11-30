DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-IGPU", 0x00002000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)

    Method (_SB.PCI0.IGPU._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If ((Arg2 == Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Return (Package (0x32)
        {
            "AAPL,GfxYTile", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "framebuffer-unifiedmem", 
            Buffer (0x04)
            {
                 0x00, 0x00, 0x00, 0x80                           // ....
            }, 

            "framebuffer-con2-enable", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "framebuffer-portcount", 
            Buffer (0x04)
            {
                 0x02, 0x00, 0x00, 0x00                           // ....
            }, 

            "disable-external-gpu", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "device-id", 
            Buffer (0x04)
            {
                 0x16, 0x16, 0x00, 0x00                           // ....
            }, 

            "framebuffer-con1-pipe", 
            Buffer (0x04)
            {
                 0x12, 0x00, 0x00, 0x00                           // ....
            }, 

            "device_type", 
            Buffer (0x1A)
            {
                "VGA Compatible Controller"
            }, 

            "hda-gfx", 
            Buffer (0x0A)
            {
                "onboard-1"
            }, 

            "built-in", 
            Buffer (One)
            {
                 0x00                                             // .
            }, 

            "framebuffer-patch-enable", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "framebuffer-con0-pipe", 
            Buffer (0x04)
            {
                 0x12, 0x00, 0x00, 0x00                           // ....
            }, 

            "framebuffer-con1-type", 
            Buffer (0x04)
            {
                 0x00, 0x08, 0x00, 0x00                           // ....
            }, 

            "AAPL,slot-name", 
            Buffer (0x09)
            {
                "Internal"
            }, 

            "AAPL,ig-platform-id", 
            Buffer (0x04)
            {
                 0x06, 0x00, 0x26, 0x16                           // ..&.
            }, 

            "framebuffer-con2-index", 
            Buffer (0x04)
            {
                 0xFF, 0xFF, 0xFF, 0xFF                           // ....
            }, 

            "model", 
            Buffer (0x17)
            {
                "Intel HD Graphics 5500"
            }, 

            "framebuffer-con1-enable", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "framebuffer-con0-enable", 
            Buffer (0x04)
            {
                 0x01, 0x00, 0x00, 0x00                           // ....
            }, 

            "vendor-id", 
            Buffer (0x04)
            {
                 0x86, 0x80, 0x00, 0x00                           // ....
            }, 

            "subsystem-vendor-id", 
            Buffer (0x04)
            {
                 0xAA, 0x17, 0x00, 0x00                           // ....
            }, 

            "subsystem-device-id", 
            Buffer (0x04)
            {
                 0x34, 0x50, 0x00, 0x00                           // 4P..
            }, 

            "name", 
            Buffer ()
            {
                "Apple Retina Display"
            }, 

            "IOName", 
            Buffer (0x0D)
            {
                "pci8086,1616"
            }, 

            "compatible", 
            Buffer (0x32)
            {
                "pci17aa,5034, pci8086,1616, pciclass,030000, IGPU"
            }
        })
    }
}

