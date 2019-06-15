// configuration data for other SSDTs in this pack

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "LENOVO", "TP-RMCF", 0)
{
#endif
    Device(RMCF)
    {
        Name(_ADR, 0)   // do not remove

        Method(HELP)
        {
            Store("TYPE indicates type of the computer. 0: desktop, 1: laptop", Debug)
            Store("BKLT indicates the type of backlight control. 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store("LMAX indicates max for IGPU PWM backlight. Ones: Use default, other values must match framebuffer", Debug)
        }

        // TYPE: Indicates the type of computer... desktop or laptop
        //
        //  0: desktop
        //  1: laptop
        Name(TYPE, 1)

        // DAUD: Digital audio
        //
        // 0: "hda-gfx" is disabled, injected as "#hda-gfx" instead
        // 1: (default when not specified) "hda-gfx" is injected
        Name(DAUD, 1)

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
        Name(LMAX, Ones)

        // LEVW: Initialization value for LEVW.
        //
        // Ones: Default will be used (0xC0000000)
        // Other values: determines value to be used
        Name(LEVW, Ones)

        // GRAN: Initialization value for GRAN.
        //
        // Note: value not set for GRAN unless bit2 of BKLT set
        Name(GRAN, 0)

        // DWOU: Disable wake on USB
        // 1: Disable wake on USB
        // 0: Do not disable wake on USB
        Name(DWOU, 1)
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
