
# Asus-S510UA-DS71-Hackintosh
**Hackintosh Method for Asus VivoBook S10UA-DS71**

## Preface
This unit was a bit of a stubborn bitch to hackintosh *(as it was my first Kaby Lake and Intel UHD 620 based model)* and warranted me to create this repo to track my installation and configuration steps for not only myself, but others as well.

This installation and guide was done in *May of 2020* using **macOS 10.15.5**

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
 6. Reboot and boot from USB and complete macOS installation!


## Post-Installation Notes
 1. Install [Clover](https://github.com/CloverHackyColor/CloverBootloader/releases) to the macOS installation partition and choose `Customize` before installation and ensure that `Clover for UEFI booting only` is checked, along with `Install Clover in the ESP` and `UEFI Drivers -> Recommended drivers`,  as well as `File System drivers -> ApfsDriverLoader`, and also ensure that `Memory fix drivers -> AptioMemoryFix` is checked.

You should also select a Theme *(or all of them)* as well, and also check off `Install Clover Preference Pane` to easily check for Clover Updates in the future from within System Preferences in macOS.

2. The EFI volume for this new macOS installation should still be mounted after installing Clover, so open it up and copy the contents of this Clover post-installation folder from this repo to the `/EFI/CLOVER` folder *(replace any existing files if prompted)*

Note that this post-installation folder contains all the kexts and config settings needed to get your `ASUS S510UA-DS71`running.

3. Now reboot and enjoy your fully functional hackintosh! :)
<br>

---

<br>

## Detailed Installation and Configuration Notes
### Pre-Install: 
