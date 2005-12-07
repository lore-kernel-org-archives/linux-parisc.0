From: Fabio Bizzi <fbizzi@gmail.com>
Subject: Again Troubles on My C200 :)
Date: Wed, 07 Dec 2005 11:16:50 +0100
Message-ID: <4396B692.8070503__38222.8144830607$1416624572$gmane$org@gmail.com>
References: <438D64F0.7080307@albacom.net> <438D70C4.4080003@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="------------070302050001060700010402"
To: parisc-linux <parisc-linux@parisc-linux.org>,
 debian-hppa@lists.debian.org
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <438D70C4.4080003@tausq.org>
Resent-Message-ID: <86rd0.A.4uB.WarlDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

This is a multi-part message in MIME format.
--------------070302050001060700010402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everybody! :)

Yesterday I've got a monitor and I've connected it to my C200.
At the boot I've selectet 1280x1024@75Hz VESA and the screen is 
correctly displayed.
The Graphic adapter is an HCRX-24 (A4071B) on GSC.
The distribution is a Sarge with etch kernel 2.6.12-1
The system boots correctly, but no one consolle is displayed on the 
monitor only a blank screen (no other problems), I've checked inittab 
and it's ok with all the consoles started!
Here some DMESG output:

Kernel command line: root=/dev/sda5 HOME=/ console=tty0 sti=8/4 
sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux

14. Coral SGC Graphics at 0xf8000000 [10/8] { 10, 0x0, 0x004, 0x00077 }

STI GSC/PCI core graphics driver Version 0.9a
     id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI init_graph failed (ret -1, errno 258)
sti: probe of 10:8 failed with error 1

Complete dmesg is attached.

I've also tried to change boot args in palo from sti=8/4 to sti=10/0 but 
  it didin't worked!

At Parisc-Linux Hardware Database is reported that Coral SGC Graphics is 
supported and the version is the same "0x0,0x4,0x77" 
(http://hwdb.parisc-linux.org/view.php?type=padevice&name=Coral%20SGC%20Graphics)

So, why this damned kernel does not initialize it? :)

PA-GURUS please help me! :)

Thanks!!!

Ciao.

	Fabio.

--------------070302050001060700010402
Content-Type: text/plain;
 name="dmesg_c200.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg_c200.txt"

root
Password: 
Last login: Tue Dec  6 22:45:47 2005 on ttyS0
Linux c200 2.6.12-1-parisc #1 Tue Sep 27 10:16:14 UTC 2005 parisc GNU/Linux

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
c200:~# dmesg 
Linux version 2.6.12-1-parisc (buildd@sarti) (gcc version 4.0.2 (Debian 4.0.1-9)) #1 Tue Sep 27 10:16:14 UTC 2005
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 000059d0 00000481 00000000 00000002 77d9d5ae 100000f0 00000008 000000b2 000000b2
vers  00000400
CPUID vers 14 rev 16 (0x000001d0)
capabilities 0x2
model 9000/782/C200+
Total Memory: 768 MB
initrd: 3fc99000-3ffee000
initrd: reserving 2fc99000-2ffee000 (mem_max 30000000)
On node 0 totalpages: 196608
  DMA zone: 196608 pages, LIFO batch:31
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: root=/dev/sda5 HOME=/ console=tty0 sti=8/4 sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 786432k available
Calibrating delay loop... 398.95 BogoMIPS (lpj=1994752)
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
checking if image is initramfs...it isn't (bad gzip magic numbers); looks like an initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
2. Dino PCI Bridge at 0xf2000000 [8/0] { 13, 0x3, 0x680, 0x0000a },  additional addresses: 0xf2800000 
3. Raven U/L2 Dino RS-232 at 0xf2003000 [8/0/63] { 10, 0x0, 0x006, 0x0008c }
4. Raven+ w SE FWSCSI Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x056, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000 
5. Raven+ w SE FWSCSI Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x056, 0x0008c }
6. Raven+ w SE FWSCSI Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x056, 0x00082 }
7. Raven+ w SE FWSCSI Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x056, 0x00074 },  additional addresses: 0xffd01000 0xffd03000 
8. Raven+ w SE FWSCSI Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x056, 0x0007b }
9. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x056, 0x00084 }
10. Raven+ w SE FWSCSI Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x056, 0x00084 }
11. U2-IOA BC GSC+ Port at 0xf203f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
12. Raven U/L2 Dino PS/2 Port at 0xf2001000 [8/1] { 10, 0x0, 0x006, 0x00096 }
13. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
14. Coral SGC Graphics at 0xf8000000 [10/8] { 10, 0x0, 0x004, 0x00077 }
15. U2-IOA BC GSC+ Port at 0xf103f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
16. Cujo PCI Bridge at 0xf1000000 [10/0] { 13, 0x1, 0x682, 0x0000a }
17. Dino RS-232 at 0xf1003000 [10/3] { 10, 0x0, 0x007, 0x0008c }
18. Raven U 200 (9000/780/C200) at 0xfffa0000 [32] { 0, 0x0, 0x59d, 0x00004 }
19. Memory at 0xfffb1000 [49] { 1, 0x0, 0x05d, 0x00009 }
CPU(s): 1 x PA8200 (PCX-U+) at 200.000000 MHz
Whole cache flush 357333 cycles, flushing 273117008 bytes 68094819 cycles
Setting cache flush threshold to 40 (1 CPUs online)
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xf2000000
Cujo version 2.0 found at 0xf1000000
Enabling Cujo 2.0 bug workaround
Cujo: No PCI devices enabled.
SCSI subsystem initialized
TC classifier action (bugs to netdev@vger.kernel.org cc hadi@cyberus.ca)
unwind_init: start = 0x1033aaa0, end = 0x1035a120, entries = 8040
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
PDC Stable Storage facility v0.09
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
    id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI init_graph failed (ret -1, errno 258)
sti: probe of 10:8 failed with error 1
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 20 @ 8:16:7
serio: GSC PS/2 mouse port at 0xffd08100 irq 20 @ 8:16:8
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
ttyS1 at MMIO 0xf2003800 (irq = 21) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
mice: PS/2 mouse device common for all mice
NET: Registered protocol family 2
input: AT Raw Set 2 keyboard on 8:16:7
IP: routing cache hash table of 8192 buckets, 64Kbytes
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 3412KiB [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: 332k freed
sym0: <875> rev 0x4 at pci 0000:00:13.0 irq 22
sym0: No NVRAM, ID 7, Fast-20, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.1
  Vendor: QUANTUM   Model: ATLAS10K2-TY367L  Rev: DA40
  Type:   Direct-Access                      ANSI SCSI revision: 03
 target0:0:6: tagged command queuing enabled, command queue depth 16.
 target0:0:6: Beginning Domain Validation
 target0:0:6: asynchronous.
WIDTH IS 1
 target0:0:6: wide asynchronous.
 target0:0:6: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 16)
 target0:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
  Vendor: PLEXTOR   Model: CD-ROM PX-12TS    Rev: 1.02
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target1:0:3: Beginning Domain Validation
 target1:0:3: asynchronous.
 target1:0:3: Domain Validation skipping write tests
 target1:0:3: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
 target1:0:3: Ending Domain Validation
usbcore: registered new driver hub
usbcore: registered new driver usbkbd
drivers/usb/input/usbkbd.c: :USB HID Boot Protocol keyboard driver
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.01:USB HID core driver
Linux Tulip driver version 1.1.13 (December 15, 2004)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 7809 advertising 0061.
eth0: Digital DS21142/DS21143 Tulip rev 48 at 80000080, 00:60:B0:EA:14:4A, IRQ 23.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
SCSI device sda: drive cache: write back
 /dev/scsi/host0/bus0/target6/lun0: p1 p2 p3 < p5 p6 >
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 3, lun 0
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Adding 1317288k swap on /dev/sda6.  Priority:-1 extents:1
EXT3 FS on sda5, internal journal
ehci_hcd: block sizes: qh 128 qtd 96 itd 192 sitd 96
ohci_hcd: 2004 Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
Attached scsi generic sg0 at scsi0, channel 0, id 6, lun 0,  type 0
Attached scsi generic sg1 at scsi1, channel 0, id 3, lun 0,  type 5
NET: Registered protocol family 10
Disabled Privacy Extensions on device 103b367c(lo)
IPv6 over IPv4 tunneling driver
eth0: no IPv6 routers present
c200:~# uname -a
Linux c200 2.6.12-1-parisc #1 Tue Sep 27 10:16:14 UTC 2005 parisc GNU/Linux
c200:~# 
--------------070302050001060700010402--


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
