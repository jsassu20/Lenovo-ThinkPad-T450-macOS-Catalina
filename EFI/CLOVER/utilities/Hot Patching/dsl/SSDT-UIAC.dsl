// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave)
//
// Clover UEFI Hotpatch | SSDT-UIAC...
//
// This Configuration Injects The USB Ports On XHC USB 3.1 Controller...
//
// Proper USB Ports Injection Mapping | 8086:9cb1 | XHC USB 3.0 Controller | USBInjectAll.kext required...
//
DefinitionBlock ("", "SSDT", 2, "LENOVO", "TP-UIAC", 0x00140000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)
    
    Name (_ADR, 0x00140000)
    Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (!Arg2) { Return (Buffer (One){ 0x03 } )}Local0 = Package (){
                
                "AAPL,current-available", Buffer(){0x34, 0x08, 0x00, 0x00}, 
                "AAPL,current-extra", Buffer(){0x98, 0x08, 0x00, 0x00}, 
                "AAPL,current-extra-in-sleep", Buffer(){0x40, 0x06, 0x00, 0x00},
                "AAPL,device-internal", Buffer(){0x02},   
                "AAPL,max-port-current-in-sleep", Buffer() {0x34, 0x08, 0x00, 0x00},
                "AAPL,slot-name", Buffer(){"Built In"},
                "device-id", Buffer(){0x9C, 0xB1, 0x00, 0x00},
                "vendor-id", Buffer(){0x80, 0x86, 0x00, 0x00},
                "device_type", Buffer() {"USB Controller"},
                "model", Buffer(){"Intel 9 Series Chipset Family Wildcat Point-LP USB 3.1 xHCI Controller"}} Return (Local0)}

    Device (UIAC)
    {
        Name (_HID, "UIA00000")  // _HID: Hardware ID
        Name (RMCF, Package ()
        {
            "AppleBusPowerControllerUSB", Package(){"kUSBSleepPortCurrentLimit", 0x0834, "kUSBSleepPowerSupply", 0x0A28, "kUSBWakePortCurrentLimit", 0x0834, "kUSBWakePowerSupply", 0x0C80}, 
            
            "8086_9cb1", Package()
            {
                "port-count", Buffer(){0x0F, 0x00, 0x00, 0x00}, 
                "ports", 
                Package()
                {
                    "HSP0", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x01, 0x00, 0x00, 0x00 }}, // USB 2.0 | External | Left side port near power input 
                    "HSP1", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x02, 0x00, 0x00, 0x00 }}, // USB 2.0 | External | Left side prt near Mini Display port
                    "HSP2", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x03, 0x00, 0x00, 0x00 }}, // USB 2.0 | External | Right side single port
                    "HSP3", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x04, 0x00, 0x00, 0x00 }}, // USB 2.0 | Internal | Synaptic Touchpad
                    "HSP4", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x05, 0x00, 0x00, 0x00 }}, // USB 2.0 | Internal | Sierra LTE Card power
                    //"HSP5", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x06, 0x00, 0x00, 0x00 }}, // USB 2.0 | Internal | Fingerprint sensor Card power
                    "HSP6", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x07, 0x00, 0x00, 0x00 }}, // USB 2.0 | Internal | Broadcom Bluetooth power 
                    "HSP7", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x08, 0x00, 0x00, 0x00 }}, // USB 2.0 | Internal | FaceTime WebCam power
                    "SSP0", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x0C, 0x00, 0x00, 0x00 }}, // USB 3.1 | External | Left side port near power input
                    "SSP1", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x0D, 0x00, 0x00, 0x00 }}, // USB 3.1 | External | Left side prt near Mini Display port
                    "SSP2", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x0E, 0x00, 0x00, 0x00 }}, // USB 3.1 | External | Right side single port
                    //"SSP3", Package(){ "UsbConnector", 0x03, "port", Buffer(){ 0x0F, 0x00, 0x00, 0x00 }}, // USB 3.1 | Internal | Not Used 
                }
            }
        })
    }
}

