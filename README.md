---


---

<h1 id="asus-s510ua-ds71-hackintosh">Asus-S510UA-DS71-Hackintosh</h1>
<p><strong>Hackintosh Method for Asus VivoBook S10UA-DS71</strong></p>
<h2 id="preface">Preface</h2>
<p>This unit was a bit of a stubborn bitch to hackintosh <em>(as it was my first Kaby Lake and Intel UHD 620 based model)</em> and warranted me to create this repo to track my installation and configuration steps for not only myself, but others as well.</p>
<h2 id="hardware-specs">Hardware Specs</h2>
<ul>
<li>Intel Core i7-8550U [Kaby Lake] Processor 1.8 GHz (Turbo up to 4.0 GHz)</li>
<li>Intel UHD Graphics 620</li>
<li>Intel Dual Band Wireless-AC 8265</li>
<li>Conexant Audio CX8050</li>
<li>Realtek Card Reader (RTL8411B_RTS5226_RTS5227)</li>
<li>ELAN 1300 Trackpad</li>
</ul>
<h2 id="quick-installation-notes">Quick Installation Notes</h2>
<ol>
<li>Create macOS 15.15 Catalina USB Installer via <a href="https://www.tonymacx86.com/resources/unibeast-10-1-0-catalina.469/">UniBeast</a> (EFI Method)</li>
<li>Mount EFI partition of USB Installer <em>(use <a href="https://github.com/headkaze/Hackintool/releases">Hackintool</a> or <a href="https://mackie100projects.altervista.org/download-clover-configurator/">Clover Configurator</a> if necessary)</em></li>
<li>Replace the <code>EFI/CLOVER/config.plist</code> file with the version from this repo <em>(see detailed installation notes  below regarding necessary modifications to this file to enable installation)</em></li>
<li>Add <a href="#">these kexts</a> to the <code>/EFI/CLOVER/kexts/Other</code> folder</li>
</ol>

