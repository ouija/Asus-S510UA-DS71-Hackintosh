

# Asus-S510UA-DS71-Hackintosh (macOS 14)
**Hackintosh Installation Guide for Asus VivoBook S10UA-DS71 and macOS 14.4.1 "Sonoma"**
<p align="center" style="margin:0 auto !important;text-align:center !important;"><img src="Images/Asus-S510UA-DS71-Hackintosh-14.4.1.png"></p>

Please consider [donating](https://paypal.me/djouija) to support this project. Thanks!

## Preface
**This guide is a <u>work in progress</u> and will be updated accordingly.**

After a long hiatus from the hackintosh scene, I'm back in action wasting time trying to get this awful operating system running on this unit again for development purposes.

I've finally managed to get OpenCore running on this machine, after realizing that I was trying to base my configuration _incorrectly_ for the longest time, basing it off other **Kaby Lake** configurations and guides, only to finally realize that referencing **Coffee Lake** configurations actually works better, given that this unit is a **Kaby Lake R** based model. 


## Hardware Specs
- Intel Core i7-8550U [Kaby Lake Refresh] Processor 1.8 GHz (Turbo up to 4.0 GHz)
- Intel UHD Graphics 620
- Intel Dual Band Wireless-AC 8265
- Conexant Audio CX8050
- Realtek Card Reader (RTL8411B_RTS5226_RTS5227)
- ELAN 1300 Trackpad

## Quick Installation Notes

- Built the macOS USB installer using [OCLP](https://dortania.github.io/OpenCore-Legacy-Patcher/INSTALLER.html) for macOS Sonoma 14.4.1
	-  _Note this now requires a USB **larger than** 16GB!_
- Based my initial OpenCore USB installer EFI off of [this](https://olarila.com/files/OPENCORE1/EFI.Opencore.NoteBook.Coffee.Lake.Whiskey.Lake.zip) prebuilt package for the _"NoteBook CoffeeLake and WhiskeyLake"_ from [olarila.com](https://www.olarila.com/topic/5676-hackintosh-efi-folder-with-clover-and-opencore/)  _(thank you to [@MaLd0n](https://github.com/MaLd0n))_
- After successful install, then copied EFI folder to internal EFI partition and [generated SMBIOS](https://github.com/corpnewt/GenSMBIOS) for `MacBookPro15,2`
- Modified OpenCore `config.plist` and tweaked some values that this olarila.com prebuilt EFI folder came with: 
	- Note that the `igfxfw=2` boot arg is set which causes [ failure when loading IGPU firmware](https://elitemacx86.com/threads/how-to-improve-igpu-performance-intel-graphics-on-macos.1059/); This should be removed.
	- Changed boot arg from `alcid=3` to instead use `alcid=13` to better match Conexant Audio CX8050 and fix internal microphone
	- Modified graphic properties to better match Intel UHD 620 model of the Asus-S510UA-DS71 and fix HDMI output _(see below)_
	- Wifi for the Intel Dual Band Wireless-AC 8265 can be enabled via the [itlwm 2.3.0-alpha version](https://github.com/OpenIntelWireless/itlwm/releases/tag/v2.3.0-alpha) kext.
		- _Debating if I should set country code via `itlwm_cc=` boot arg_
	- Update kexts via [kextupdater](https://github.com/MacThings/kextupdater)
	- _Todo:_ Generate [USB Map](https://github.com/corpnewt/USBMap) _(under Windows)_ and replace `USBInjectAll.kext`
	- Still tweaking and improving, will update here accordingly.

## DeviceProperties

The following tables display the added PCI devices and their child keys.


### PciRoot(0x0)/Pci(0x2,0x0)

Intel UHD 620 Graphics

| **Key**                  | **Type** |   **Value**  |
|--------------------------|:--------:|:------------:|
| AAPL,ig-platform-id      |   Data   | ``00001B59`` |
| device-id                |   Data   | ``16590000`` |
| framebuffer-con1-alldata |   Data   | ``01050A00 00080000 87010000 02040A00 00080000 87010000 FF000000 01000000 20000000`` |
| framebuffer-con1-enable  |   Data   | ``01000000`` |
| framebuffer-con2-enable  |   Data   | ``01050A00 00080000 87010000 03060A00 00040000 87010000 FF000000 01000000 20000000 `` |
| framebuffer-fbmem        |   Data   | ``00009000`` |
| framebuffer-patch-enable |   Data   | ``01000000`` |
| framebuffer-stolenmem    |   Data   | ``00003001`` |
