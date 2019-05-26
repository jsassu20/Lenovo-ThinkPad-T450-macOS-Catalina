DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-PCI0", 0)
{
    External (_SB.PCI0, DeviceObj)
    External (_SB.PCI0.IGPU, DeviceObj)
    External (_SB.PCI0.MCHC, DeviceObj)
    External (_SB.PCI0.XHC, DeviceObj)
    External (_SB.PCI0.HDAU, DeviceObj)
    External (_SB.PCI0.IMEI, DeviceObj)
    External (_SB.PCI0.HDEF, DeviceObj)
    External (_SB.PCI0.RP01, DeviceObj)
    External (_SB.PCI0.GLAN, DeviceObj)
    External (_SB.PCI0.RP02, DeviceObj)
    External (_SB.PCI0.THRM, DeviceObj)
    External (_SB.PCI0.SMBU, DeviceObj)
    External (_SB.PCI0.LPC, DeviceObj)
    External (_SB.PCI0.SATA, DeviceObj)
    
    Device (_SB.PCI0)
    {
        Name (_ADR, 0x00000000)
        Device (IGPU)
        {
	        Name (_ADR, 0x00020000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "AAPL,GfxYTile", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			    "framebuffer-unifiedmem", Buffer () { 0x00, 0x00, 0x00, 0x80 },
			    "framebuffer-con2-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			    "framebuffer-portcount", Buffer () { 0x02, 0x00, 0x00, 0x00 },
			    "disable-external-gpu", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			    "device-id", Buffer () { 0x16, 0x16, 0x00, 0x00 },
			    "framebuffer-con1-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
			    "device_type", Buffer () { "VGA Compatible Controller" },
			    "hda-gfx", Buffer () { "onboard-1" },
			    "framebuffer-patch-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			    "framebuffer-con0-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
			    "framebuffer-con1-type", Buffer () { 0x00, 0x08, 0x00, 0x00 },
			    "AAPL,slot-name", Buffer () { "Internal" },
			    "AAPL,ig-platform-id", Buffer () { 0x06, 0x00, 0x26, 0x16 },
			    "framebuffer-con2-index", Buffer () { 0xFF, 0xFF, 0xFF, 0xFF },
			    "model", Buffer () { "Intel HD Graphics 5500" },
			    "framebuffer-con1-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
			    "framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
		        })
	        }
        }
        Device (MCHC)
        {
	        Name (_ADR, 0x00000000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Broadwell-U PCI Express Main Host Bridge OPI" },
			    "device_type", Buffer () { "Host Bridge" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        Device (XHC)
        {
	        Name (_ADR, 0x00140000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel 9 Series Chipset Family Wildcat Point-LP USB 3.1 xHCI Controller" },
			    "device_type", Buffer () { "USB Controller" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        
        Device (HDAU)
        {
	        Name (_ADR, 0x00030000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Broadwell-U HDMI Audio Controller" },
			    "device_type", Buffer () { "Audio Device" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        
        Device (GLAN)
        {
	        Name (_ADR, 0x00190000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Gigabit Local Area Network Ethernet Connection (3) I218-LM" },
			    "device_type", Buffer () { "Ethernet Controller" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        Device (IMEI)
        {
	        Name (_ADR, 0x00160000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Wildcat Point-LP MEI Controller #1" },
			    "device_type", Buffer () { "Communication Controller" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        Device (HDEF)
        {
	        Name (_ADR, 0x001b0000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
		 	    "model", Buffer () { "Realtek High Definition Audio Controller (Intel Broadwell-U Wildcat Point-LP Audio)" },
			    "layout-id", Buffer () { 0x1C, 0x00, 0x00, 0x00 },
			    "hda-gfx", Buffer () { "onboard-2" },
			    "AAPL,slot-name", Buffer () { "Internal" },
			    "device_type", Buffer () { "Audio Device" },
		        })
	        }
        }
        Device (RP01)
        {
	        Name (_ADR, 0x001c0000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
		  	    "model", Buffer () { "Intel Broadwell Wildcat Point-LP PCI Express Root Port #6" },
			    "device_type", Buffer () { "PCI Bridge" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }

            Device (SDXC)
            {
                Name (_ADR, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		            Return (Package ()
		            {
		  	            "model", Buffer () { "Realtek SD High Capacity Memory Card Reader" },
			            "device_type", Buffer () { "Card Reader" },
			            "AAPL,slot-name", Buffer () { "Internal" },
		            }
                })   
            }
        }
        Device (RP02)
        {
	        Name (_ADR, 0x001c0001)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Broadwell Wildcat Point-LP PCI Express Root Port #3" },
			    "device_type", Buffer () { "PCI Bridge" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }

            Device (ARPT)
            {
                Name (_ADR, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		            Return (Package ()
		            {
		  	            "model", Buffer () { "Apple AirPort Extreme (Broadcom BCM4360 Wireless AC Network Controller) " },
			            "device_type", Buffer () { "AirPort Extreme" },
			            "AAPL,slot-name", Buffer () { "Internal" },
		            }
                })   
            }
        }
        Device (THRM)
        {
	        Name (_ADR, 0x001f0006)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Wildcat Point-LP Thermal Management Controller" },
			    "device_type", Buffer () { "Signal Processing Controller" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }

            Device (ARPT)
            {
                Name (_ADR, Zero)
                Method (_DSM, 4, NotSerialized)
                {
                    
                }   
            }
        }
        Device (SMBU)
        {
	        Name (_ADR, 0x001f0003)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Broadwell Wildcat Point-LP SMBus Controller" },
			    "device_type", Buffer () { "SMBus" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        Device (LPC)
        {
	        Name (_ADR, 0x001f0000)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Wildcat Point-LP LPC Controller" },
			    "device_type", Buffer () { "ISA Bridge" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
	        }
        }
        Device (SATA)
        {
	        Name (_ADR, 0x001f0002)
	        Method (_DSM, 4, NotSerialized)
	        {
		        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
		        Return (Package ()
		        {
			    "model", Buffer () { "Intel Wildcat Point-LP SATA Controller [AHCI Mode]" },
			    "device_type", Buffer () { "SATA Controller" },
			    "AAPL,slot-name", Buffer () { "Internal" },
		        })
            }
	    }
    } 
}