DefinitionBlock ("", "SSDT", 2, "OCLT", "SKBV", 0x00001000)
{
    External (\_SB.PCI0.LPCB.EC0.WRAM, MethodObj)
    External (\_SB.PCI0.LPCB.EC0.ST9E, MethodObj)
    External (\_SB.ATKD, DeviceObj)

    Scope (\)
    {
        Name (KBLV, Zero) // Define KBLV as zero
    }

    Scope (\_SB)
    {
        Device (ALS0)
        {
            Name (_HID, "ACPI0008")
            Name (_CID, "smc-als")
            Name (_ALI, 150)
            Name (_ALR, Package () { Package () {100, 150} })
        }
    }

    Scope (\_SB.ATKD)
    {
        Method (SKBV, 1, NotSerialized)
        {
            \_SB.PCI0.LPCB.EC0.WRAM (0x09F0, KBLV)
            \_SB.PCI0.LPCB.EC0.ST9E (0x1F, 0xFF, Arg0)
            Return (Arg0)
        }
    }
}
