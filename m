From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI Drive Enumeration
Date: Sun, 21 Jul 2013 14:57:44 -0400
Message-ID: <BLU0-SMTP36352120304E67D025161D976D0@phx.gbl>
References: <BLU0-SMTP12B5A8FFEF5AE17F38634E976C0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Dave Anglin <Dave.Anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP12B5A8FFEF5AE17F38634E976C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Changing crypto: crc_t10dif from a module to builtin fixed the boot.   
See
http://www.mail-archive.com/linux-crypto@vger.kernel.org/msg09061.html

Dave

On 20-Jul-13, at 7:08 PM, Dave Anglin wrote:

> Hi Helge,
>
> Have you tried 3.11-rc1?  It doesn't boot for me because SCSI drives  
> no longer are enumerated as sda, sdb, ...
>
> ehci-pci: EHCI PCI platform driver
> scsi0 : pata_cmd64x
> scsi1 : pata_cmd64x
> ata1: PATA max UDMA/100 cmd 0xd18 ctl 0xd24 bmdma 0xd00 irq 69
> ata2: DUMMY
> ehci-pci 0000:00:01.2: EHCI Host Controller
> ehci-pci 0000:00:01.2: new USB bus registered, assigned bus number 1
> ehci-pci 0000:00:01.2: irq 68, io mem 0xffffffff80000000
> ehci-pci 0000:00:01.2: USB 2.0 started, EHCI 0.95
> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> usb usb1: Product: EHCI Host Controller
> usb usb1: Manufacturer: Linux 3.11.0-rc1+ ehci_hcd
> usb usb1: SerialNumber: 0000:00:01.2
> hub 1-0:1.0: USB hub found
> hub 1-0:1.0: 5 ports detected
> ata1.00: ATAPI: DW-224E, C.0B, max UDMA/33
> ata1.00: configured for UDMA/33
> scsi 0:0:0:0: CD-ROM            TEAC     DW-224E          C.0B PQ: 0  
> ANSI: 5
> usb 1-2: new high-speed USB device number 2 using ehci-pci
> sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
> cdrom: Uniform CD-ROM driver Revision: 3.20
> usb 1-2: New USB device found, idVendor=1058, idProduct=0748
> usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=5
> usb 1-2: Product: My Passport 0748
> usb 1-2: Manufacturer: Western Digital
> usb 1-2: SerialNumber: 575836314542325A33383231
> sr 0:0:0:0: Attached scsi generic sg0 type 5
> usb-storage 1-2:1.0: USB Mass Storage device detected
> scsi2 : usb-storage 1-2:1.0
> usbcore: registered new interface driver usb-storage
> tg3 0000:20:02.0 eth0: Tigon3 [partno(BCM95700A6) rev 0105] (PCI: 
> 66MHz:64-bit) MAC address 00:30:6e:4b:16:4d
> tg3 0000:20:02.0 eth0: attached PHY is 5701 (10/100/1000Base-T  
> Ethernet) (WireSpeed[1], EEE[0])
> tg3 0000:20:02.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0]  
> TSOcap[0]
> tg3 0000:20:02.0 eth0: dma_rwctrl[76ff2d0f] dma_mask[32-bit]
> sym0: <1010-66> rev 0x1 at pci 0000:20:01.0 irq 70
> sym0: No NVRAM, ID 7, Fast-80, LVD, parity checking
> sym0: SCSI BUS has been reset.
> scsi3 : sym-2.2.3
> scsi 2:0:0:0: Direct-Access     WD       My Passport 0748 1022 PQ: 0  
> ANSI: 6
> scsi 2:0:0:0: Attached scsi generic sg1 type 0
> scsi 3:0:0:0: Direct-Access     FUJITSU  MAJ3364MC        HP12 PQ: 0  
> ANSI: 2
> scsi target3:0:0: tagged command queuing enabled, command queue  
> depth 16.
> scsi target3:0:0: Beginning Domain Validation
> scsi target3:0:0: FAST-80 WIDE SCSI 160.0 MB/s DT (12.5 ns, offset 31)
> scsi target3:0:0: Ending Domain Validation
> scsi 3:0:0:0: Attached scsi generic sg2 type 0
> sym1: <1010-66> rev 0x1 at pci 0000:20:01.1 irq 71
> sym1: No NVRAM, ID 7, Fast-80, LVD, parity checking
> sym1: SCSI BUS has been reset.
> scsi4 : sym-2.2.3
> scsi 4:0:2:0: Direct-Access     SEAGATE  ST318203LC       HP04 PQ: 0  
> ANSI: 2
> scsi target4:0:2: tagged command queuing enabled, command queue  
> depth 16.
> scsi target4:0:2: Beginning Domain Validation
> scsi target4:0:2: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
> scsi target4:0:2: Domain Validation skipping write tests
> scsi target4:0:2: Ending Domain Validation
> scsi 4:0:2:0: Attached scsi generic sg3 type 0
> Begin: Loading essential drivers ... done.
> Begin: Running /scripts/init-premount ... done.
> Begin: Mounting root file system ... Begin: Running /scripts/local- 
> top ... device-mapper: ioctl: 4.25.0-ioctl (2013-06-26) initialised: dm-devel@redhat.com
> done.
> Begin: Waiting for root file system ... done.
> Gave up waiting for root device.  Common problems:
> - Boot args (cat /proc/cmdline)
>   - Check rootdelay= (did the system wait long enough?)
>   - Check root= (did the system wait for the right device?)
> - Missing modules (cat /proc/modules; ls /dev)
> ALERT!  /dev/sdb5 does not exist.  Dropping to a shell!
> modprobe: module i8042 not found in modules.dep
> modprobe: module uhci-hcd not found in modules.dep
> ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
>
>
> BusyBox v1.20.2 (Debian 1:1.20.0-8) built-in shell (ash)
> Enter 'help' for a list of built-in commands.
>
> Thoughts?
>
> Dave
>

--
John David Anglin	dave.anglin@bell.net



