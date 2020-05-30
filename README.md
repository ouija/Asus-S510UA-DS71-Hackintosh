
# Asus-S510UA-DS71-Hackintosh
**Hackintosh Method for Asus VivoBook S10UA-DS71**

## Preface
This unit was a bit of a stubborn bitch to hackintosh *(as it was my first Kaby Lake and Intel UHD 620 based model)* and warranted me to create this repo to track my installation and configuration steps for not only myself, but others as well.

This installation and guide was done in *May of 2020* using **macOS 10.15.5** and supports *ALL NATIVE HARDWARE*, including the oem wifi card!

## Hardware Specs
- Intel Core i7-8550U [Kaby Lake] Processor 1.8 GHz (Turbo up to 4.0 GHz)
- Intel UHD Graphics 620
- Intel Dual Band Wireless-AC 8265
- Conexant Audio CX8050
- Realtek Card Reader (RTL8411B_RTS5226_RTS5227)
- ELAN 1300 Trackpad

## Quick Installation Notes

 1. Create macOS 10.15.5 Catalina USB Installer via [UniBeast](https://www.tonymacx86.com/resources/unibeast-10-1-0-catalina.469/) (EFI Method)
 2. Mount EFI partition of USB Installer *(using [Hackintool](https://github.com/headkaze/Hackintool/releases) or [Clover Configurator](https://mackie100projects.altervista.org/download-clover-configurator/) if necessary)*
 3. Replace the `EFI/CLOVER/config.plist` file with [the version from this repo](https://github.com/ouija/Asus-S510UA-DS71-Hackintosh/blob/master/Installation/EFI/CLOVER/config.plist) *(see detailed installation notes  below regarding necessary modifications to this file to enable installation)*
 4. Copy/replace [these kexts](https://github.com/ouija/Asus-S510UA-DS71-Hackintosh/tree/master/Installation/EFI/CLOVER/kexts/Other) in the `/EFI/CLOVER/kexts/Other` folder
 5. Ensure BIOS has Display Memory set to 64MB and that both Secure Boot and CSM mode is disabled.
 6. Reboot and boot from USB and complete macOS installation! *(note that you need a usb mouse to complete installation)*


## Post-Installation Notes
 1. Install [Clover](https://github.com/CloverHackyColor/CloverBootloader/releases) to the macOS installation partition and choose `Customize` before installation and ensure that `Clover for UEFI booting only` is checked, along with `Install Clover in the ESP` and `UEFI Drivers -> Recommended drivers`,  as well as `File System drivers -> ApfsDriverLoader`, and also ensure that `Memory fix drivers -> OSXAptioFix3Drv` OR  `AptioMemoryFix`is checked.

You should also select a Theme *(or all of them)* as well, and also check off `Install Clover Preference Pane` to easily check for Clover Updates in the future from within System Preferences in macOS.

2. The EFI volume for this new macOS installation should still be mounted after installing Clover, so open it up and copy the contents of this Clover post-installation folder from this repo to the `/EFI/CLOVER` folder *(replace any existing files if prompted)*

Note that this post-installation folder contains all the kexts and config settings needed to get your `ASUS S510UA-DS71`running.

3. Now reboot and select the macOS installation partition to boot Clover from.  

*Note:  If you **don't** see an entry in the BIOS boot menu for Clover on the macOS installation partition, you'll need to **manually create it** through the BIOS.* 

4. Once booted into MacOS, Install the kext package for supporting the `Intel Dual Band Wireless-AC 8265` card by downloading this file, extracting the contents and running the `install.command` file from the terminal under the directory you extracted the files to.

Note: [This driver](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/issues/330#issuecomment-633257017) is still very experimental at the time *(being released only a few days before this writing)* and has some limitations in terms of performance and operation.  

Most notably is the fact that you *cannot* actually connect to any wireless networks directly from the Wireless dropdown in the macOS  menu bar, but actually have to add your Wireless SSID and password as strings to the NVRAM *(recommended)* or as entries in the Clover config.plist to run as boot arguments.

It also doesn't support running the card at full speed yet, but I've managed to get fairly decent performance at an average of 60mb down and 15up *(which is much better than nothing!)*

<img src="https://github.com/ouija/Asus-S510UA-DS71-Hackintosh/raw/master/Images/speedtest.png" align="center">

<br>

---

<br>

## Detailed Installation and Configuration Notes
### Pre-Install: 
Just getting the macOS Installer to load took me more time than it did to configure all the hardware!  There were a couple tricks to it that I hadn't come across before in all my years of Hackintoshin', and I struggled figuring them out.

First off, you need to have the two `Prevent Apple I2C kexts from attaching to I2C controllers` [patches by CoolStar](https://github.com/RehabMan/OS-X-Clover-Laptop-Config/blob/bcd876e93df197c1cbf04ba5923b5479f94988d4/config_patches.plist#L54) added to the Clover configuration of the USB Installer or you'll see a number of errors in the console related to the `appleintellpssi2ccontroller`timing out, due to the native AppleIntelPSSI2Controller trying to attach to the I2C devices in the machine.

Second, you need to also ensure that the [VoodooTSSync.kext](https://bitbucket.org/RehabMan/VoodooTSCSync/downloads/) is also installed to the `EFI/CLOVER/kexts/Other` folder of the USB Installer or you'll get a kernel panic on installation as well.

And finally, you need to have the Intel injection method enabled with the proper `FakeID` of `0x59168086` for the IntelGFX and `ig-platform-id`of `0x591b0000`for supporting the Intel UHD 620 or you'll have no video output.

### Post-Install: 

Getting most things setup was relatively painless, minor a couple issues that took some debugging.  But I'm 
