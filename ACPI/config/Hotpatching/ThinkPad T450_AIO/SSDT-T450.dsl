DefinitionBlock("", "SSDT", 2, "T450", "TP-T450", 0)
{
    Device(RMCF)
    {
        Name(_ADR, 0)   // do not remove

        Method(HELP)
        {
            Store("TYPE indicates type of the computer. 0: desktop, 1: laptop", Debug)
            Store("HIGH selects display type. 1: high resolution, 2: low resolution", Debug)
            Store("BKLT indicates the type of backlight control. 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store("LMAX indicates max for IGPU PWM backlight. Ones: Use default, other values must match framebuffer", Debug)
        }

        // TYPE: Indicates the type of computer... desktop or laptop
        //
        //  0: desktop
        //  1: laptop
        Name(TYPE, 1)

        // HIGH: High resolution/low resolution selection.  Affects IGPU injection.
        //
        // For 1600x900+ on Sandy/Ivy, use 1
        // For UHD/QHD+ on Haswell/Broadwell, use 1
        // Others (low resolution), use 0
        Name(HIGH, 1)

        // BKLT: Backlight control type
        //
        // bit0=0: Using IntelBacklight.kext
        // bit0=1: Using AppleBacklight.kext + AppleBacklightInjector.kext
        // bit1=1: do not set LEVW
        // bit2=1: set GRAN
        Name(BKLT, 1)

        // LMAX: Backlight PWM MAX.  Must match framebuffer in use.
        //
        // Ones: Default will be used (0x710 for Ivy/Sandy, 0xad9 for Haswell/Broadwell)
        // Other values: must match framebuffer
        Name(LMAX, 0xad9)

    }
    
    #include "SSDT-XOSI.dsl"
    #include "SSDT-USB.dsl"
    #include "SSDT-DEHC.dsl"
    #include "SSDT-BATC.dsl"
    #include "SSDT-PNLF.dsl"
    //#include "SSDT-ALS0.dsl"
    #include "SSDT-ALC3.dsl"
    #include "SSDT-DTGP.dsl"
    #include "SSDT-KBD.dsl"
    #include "SSDT-ARPT.dsl"

}
//EOF