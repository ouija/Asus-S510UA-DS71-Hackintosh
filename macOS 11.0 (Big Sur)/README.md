

# Asus-S510UA-DS71-Hackintosh (macOS 11.0)
**Hackintosh Installation Guide for Asus VivoBook S10UA-DS71 and macOS 11.0 "Big Sur"**
<p align="center" style="margin:0 auto !important;text-align:center !important;"><img src="../Images/Asus-S510UA-DS71-Hackintosh-10.15.5.png"></p>

Please consider [donating](https://paypal.me/djouija) to support this project. Thanks!

## Preface
**NOTE: This guide is <u>outdated</u> and is for archival purposes only.**

The information outlined here is in relation to upgrading macOS Catalina to Big Sur -- Follow the steps that were outlined in [this readme](../macOS%2010.15%20%28Catalina%29/README.md)
 previously which preceeds this information below.


## macOS 11.0 Big Sur Update

I've recently upgraded this machine to macOS 11.0 Big Sur *(as of Dec 2020)* with relatively little issues.  Here's the steps I took to do so:

- Download a copy of the Big Sur update from the App Store but do not complete the installation before all the following steps.

- Update [Clover](https://github.com/CloverHackyColor/CloverBootloader/releases) to v5123 or greater (which includes OpenCore's `OpenRuntime.efi` integration to replace `AptioMemoryFix.efi`, `OsxAptioFix3Drv.efi`, and `OSXAptioFixDrv.efi` and now includes several **Quirks** that you need to enable *(via Clover Configurator)* else you'll have troubles with it not booting:
	 - AvoidRuntimeDefrag
	 - EnableSafeModeSlide
	 - EnableWriteUnprotector
	 - ProvideCustomSlide
	 - SetupVitrualMap
	 - DsiableIoMapper *(if VT-d enabled in BIOS)* 
	 - XhciPortLimit

- Remove the SSD TRIM patch from Clover's `config.plist` *(but keep the I2C patches in place)*

- Update all other kexts to latest versions (AppleALC, VistualSMC, AsusSMC, VoodooI2C, Whatevergreen, etc).

- Download the newer [AirportItlwm](https://github.com/OpenIntelWireless/itlwm/releases/) driver for Big Sur to use for wireless support *after* the upgrade.

- Also download the [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases) driver to install after the upgrade as well.

- Remove the old [driver package](https://stackedit.io/Post-Install/WiFi) for supporting the `Intel Dual Band Wireless-AC 8265` card by downloading [this file](https://stackedit.io/Post-Install/WiFi), extracting the contents and running the `uninstall.command` file from the terminal under the directory you extracted the files to. 
	- Note you can also remove the `WiFi-PW` and `WiFi-SSID` settings from NVRAM as well *(using Hackintool)*

- Complete the Big Sur upgrade and the machine should reboot; Select the macOS install partition and allow the installation to complete; It will take 45-60 minutes to complete, and note the initial progress bar may appear to stall when the update first begins, but just be patient as macOS is creating 'snapshots' and eventually it will show the estimated time remaining and the upgrade will complete.

- After upgrading, boot back into macOS, mount the EFI and copy the kexts for the [AirportItlwm](https://github.com/OpenIntelWireless/itlwm/releases/) and [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases) drivers to the `EFI/CLOVER/kexts/Other` folder.

- To enable TRIM support for SSD, open terminal and type in the following command: `sudo trimforce enable` and follow the prompts to enable and system will reboot

That should be everything needed to get Big Sur up and running!   Note that I experience some odd issues where AppleALC.kext didn't load (sound not working), but rebooting seemed to fix it.

All kexts and associated files have been updated to latest versions as of this commit date, and you can download the files from under this folder.

Enjoy.


