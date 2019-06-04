// Lenovo ThinkPad T440 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-UIAC...
//
// This Configuration Injects The USB Ports On XHC USB 3.1 Controller...
//
// Proper USB Ports Injection Mapping | XHC USB 3.0 Controller | USBInjectAll.kext required...
//
#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-UIAC", 0)
{
#endif
    External(_SB.PCI0.XHC, DeviceObj)
    
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "HUB1", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HP15", Package() // TouchScreen
                    {
                        "portType", 2,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                },
            },
            "EH01", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "PR11", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                },
            },            
            "8086_9c31", Package()
            {
                "port-count", Buffer() { 13, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB3 Port(USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB3 Port(USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // USB3 Port(USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    //"HS06", Package() // FingerPrint Reader
                    //{
                        //"UsbConnector", 255,
                        //"port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HS07", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // Integrated Camera
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SSP1", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "SSP2", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "SSP3", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                },
            },
        })
    }
    
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
    External(ZPTS, MethodObj)
    External(_SB.PCI0.XHC.PMEE, FieldUnitObj)
    Method(_PTS, 1)
    {
        ZPTS(Arg0)
        If (5 == Arg0)
        {
            // fix "auto start after shutdown if a USB Device is Plugged In"
            \_SB.PCI0.XHC.PMEE = 0
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
