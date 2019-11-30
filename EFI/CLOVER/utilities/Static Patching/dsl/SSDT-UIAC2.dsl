// Lenovo ThinkPad T450 Ultrabook | Hackintosh Build (macOS Mojave) | Build By: Jsassu20 (James Sassu) | May 2nd 2019...
//
// Clover UEFI Hotpatch | Proper XHC USB Port Injection When Using RehabMan's USBInjectAll.kext For Proper USB Port Functionality...
//
// Proper USB Ports Injection Mapping | 8086:9cb3 | XHCI USB 3.0 Controller...
//
DefinitionBlock ("", "SSDT", 1, "LENOVO", "TP-UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        Name(RMCF, Package()
        {
            "8086_9cb3", Package()
            {
                "port-count", Buffer() { 15, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB 2.0 | External Port | Left Side Near Power Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB 2.0 | External Port | Left Side Near Mini Display Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // USB 2.0 | External Port | Right Side Near SDHC Card Reader |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    //"HS04", Package() // Internal USB Input | Internal SDHC Card Reader Control |
                    //{ 
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 4, 0, 0, 0 },
                    //},
                    //"HS05", Package() // Internal USB | Internal | Motorola LTE Modem | M.2 SATA NGFF WWAN Port |
                    //{
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 5, 0, 0, 0 },
                    //},
                    //"HS06", Package() //  Internal USB | Fingerprint Reader | Onboard |
                    //{
                    //    "UsbConnector", 255,
                    //    "port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HS07", Package() // Internal USB | Broadcom BCM2070280 BLUETOOTH 4.0 Controller | M.2 SATA NGFF WLAN Port |
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // Internal USB | Lenovo 720P HD WebCamera | Onboard |
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SSP1", Package() // USB3 3.0 | External Port | Left Side Near Power Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                    "SSP2", Package() // USB 3.0 | External Port | Left Side Near Mini Display Port |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 13, 0, 0, 0 },
                    },
                    "SSP3", Package() // USB 3.0 | External Port | Right Side Near SDHC Card Reader |
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 14, 0, 0, 0 },
                    },
                   // "SSP4", Package() // Internal USB | Not Sure What It Controls | Possibly Docking Port |
                   // {
                   //     "UsbConnector", 255,
                   //     "port", Buffer() { 15, 0, 0, 0 },
                   // },
                },
            },
        })
    }
}
//EOF