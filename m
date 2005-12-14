From: Heiner991@gmx.de
Subject: [parisc-linux] B1000 freeze after sym0:
Date: Wed, 14 Dec 2005 13:16:21 +0100 (MET)
Message-ID: <17461.1134562581@www66.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi!

I installed Debian 3.1_r0 on my B1000, but now i got problems at boot.
The machine hangs after the following message:

[...]
NET: Registered protocol family 1
sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking

After that it does not react to any keyboard input, even the power button
doesn't work, i have to pull the power cord.

The strange thing is: if i search for bootable devices in the boot menu, and
select the harddrive (boot p1), everything works fine and the machine boots
to shell. I want to use the B1000 without keyboard an monitor, so this is
not an option an on every boot.

Any suggestions? Perhaps a few PALO options i dont know?

Thanks in advance,
  Oliver


Attached: /etc/palo.conf, partition table, dmesg from a working boot

/etc/palo.conf
--commandline=2/vmlinux root=/dev/sda4 initrd=2/initrd.img HOME=/
--recoverykernel=/boot/vmlinux-2.6.8-2-32-smp
--init-partitioned=/dev/sda

fdisk /dev/sda -l
Disk /dev/sda: 9100 MB, 9100044288 bytes
255 heads, 63 sectors/track, 1106 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1           4       32098+  f0  Linux/PA-RISC boot
/dev/sda2               5           8       32130   83  Linux
/dev/sda3            1045        1106      498015   82  Linux swap /Solaris
/dev/sda4               9        1044     8321670   83  Linux

Partition table entries are not in disk order

dmesg:
Linux version 2.6.8-2-32-smp (kyle@caradhras) (gcc version 3.3.5 (Debian
1:3.3.5-7)) #1 SMP Mon Feb 7 22:19:10 EST 2005
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005bc0 00000481 00000000 00000002 7802fefc 100000f0 00000008
000000b2 000000b2
vers  00000203
CPUID vers 17 rev 7 (0x00000227)
capabilities 0x3
model 9000/785/B1000
Total Memory: 256 Mb
initrd: 1fb29000-1ffee000
initrd: reserving 0fb29000-0ffee000 (mem_max 10000000)
On node 0 totalpages: 65536
  DMA zone: 65536 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LCD display at f05d0008,f05d0000 registered
SMP: bootstrap CPU ID is 0
Built 1 zonelists
Kernel command line: root=/dev/sda4 HOME=/ console=tty0 sti=10/6/2/0
sti_font=VGA8x16 TERM=linux palo_kernel=2/vmlinux
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 262144k available
Calibrating delay loop... 598.01 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Brought up 1 CPUs
CPU0:  online
 domain 0: span ffffffff
  groups: 00000001 00000002 00000004 00000008 00000010 00000020 00000040
00000080 00000100 00000200 00000400 00000800 00001000 00002000 00004000
00008000 00010000 00020000 00040000 00080000 00100000 00200000 00400000
00800000 01000000 02000000 04000000 08000000 10000000 20000000 40000000
80000000
CPU1: offline
 domain 0: span ffffffff
  groups: 00000002 00000004 00000008 00000010 00000020 00000040 00000080
00000100 00000200 00000400 00000800 00001000 00002000 00004000 00008000
00010000 00020000 00040000 00080000 00100000 00200000 00400000 00800000
01000000 02000000 04000000 08000000 10000000 20000000 40000000 80000000
00000001
CPU2: offline
 domain 0: span ffffffff
  groups: 00000004 00000008 00000010 00000020 00000040 00000080 00000100
00000200 00000400 00000800 00001000 00002000 00004000 00008000 00010000
00020000 00040000 00080000 00100000 00200000 00400000 00800000 01000000
02000000 04000000 08000000 10000000 20000000 40000000 80000000 00000001
00000002

[message CPU3 - CPU31 cut]

checking if image is initramfs...it isn't (ungzip failed); looks like an
initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. AllegroLow W at 0xfffa0000 [32] { 0, 0x0, 0x5bc, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x087, 0x00009 }
CPU(s): 1 x PA8500 (PCX-W) at 300.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR2.1 (0x2) found at 0xfed30000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
PCI: Enabled native mode for NS87415 (pif=0x8f)
lba version TR2.1 (0x2) found at 0xfed32000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
lba version TR2.1 (0x2) found at 0xfed38000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
lba version TR2.1 (0x2) found at 0xfed3c000
WARNING: Ignoring enabled ELMMIO BASE 0xf8000000  SIZE 0xfc000000
iosapic: hpa not registered for 0000:03:02.0
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
STI GSC/PCI core graphics driver Version 0.9a
STI PCI graphic ROM found at f7000000 (2048 kB), fb at fa000000 (32 MB)
    id 2fc1066b-9a02587, conforms to spec rev. 8.09
    graphics card name: HPA4552A
stifb: 'HPA4552A' (id: 0x2fc1066b) not supported.
unwind_init: start = 0x103b5720, end = 0x103d6f20, entries = 8576
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 64)
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
Soft power switch enabled, polling @ 0xf0400804.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 25 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq = 99) is a 16550A
ttyS1 at I/O 0x2f8 (irq = 100) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
mice: PS/2 mouse device common for all mice
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 12Kbytes
TCP: Hash tables configured (established 4096 bind 6553)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 4884 blocks [1 disk] into ram disk... done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: 344k freed
NET: Registered protocol family 1
sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 65
sym0: No NVRAM, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
scsi0 : sym-2.1.18k
Using anticipatory io scheduler
sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 65
sym1: No NVRAM, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.1.18k
  Vendor: QUANTUM   Model: ATLAS10K-9LVD     Rev: HP06
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym1:6:0: tagged command queuing enabled, command queue depth 16.
scsi(1:0:6:0): Beginning Domain Validation
sym1:6: wide asynchronous.
sym1:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25.0 ns, offset 31)
scsi(1:0:6:0): Domain Validation skipping write tests
scsi(1:0:6:0): Ending Domain Validation
usbcore: registered new driver hub
ohci_hcd: 2004 Feb 02 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
ohci_hcd 0000:00:0e.2: National Semiconductor Corporation USB Controller
ohci_hcd 0000:00:0e.2: reset, control = 0x110
ohci_hcd 0000:00:0e.2: irq 97, pci mem f4007000
ohci_hcd 0000:00:0e.2: new USB bus registered, assigned bus number 1
ohci_hcd 0000:00:0e.2: Using NSC SuperIO setup
usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: default language 0x0409
usb usb1: Product: National Semiconductor Corporation USB Controller
usb usb1: Manufacturer: Linux 2.6.8-2-32-smp ohci_hcd
usb usb1: SerialNumber: 0000:00:0e.2
usb usb1: hotplug
usb usb1: adding 1-0:1.0 (config #1, interface 0)
usb 1-0:1.0: hotplug
hub 1-0:1.0: usb_probe_interface
hub 1-0:1.0: usb_probe_interface - got id
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 3 ports detected
hub 1-0:1.0: standalone hub
hub 1-0:1.0: ganged power switching
hub 1-0:1.0: no over-current protection
hub 1-0:1.0: power on to power good time: 0ms
hub 1-0:1.0: local power source is good
hub 1-0:1.0: enabling power on all ports
ohci_hcd 0000:00:0e.2: created debug files
ohci_hcd 0000:00:0e.2: OHCI controller state
ohci_hcd 0000:00:0e.2: OHCI 1.0, with legacy support registers
ohci_hcd 0000:00:0e.2: control 0x083 HCFS=operational CBSR=3
ohci_hcd 0000:00:0e.2: cmdstatus 0x00000 SOC=0
ohci_hcd 0000:00:0e.2: intrstatus 0x00000044 RHSC SF
ohci_hcd 0000:00:0e.2: intrenable 0x8000001a MIE UE RD WDH
ohci_hcd 0000:00:0e.2: hcca frame #0021
ohci_hcd 0000:00:0e.2: roothub.a 00001003 POTPGT=0 NOCP NDP=3
ohci_hcd 0000:00:0e.2: roothub.b 00000000 PPCM=0000 DR=0000
ohci_hcd 0000:00:0e.2: roothub.status 00008000 DRWE
ohci_hcd 0000:00:0e.2: roothub.portstatus [0] 0x00010301 CSC LSDA PPS CCS
ohci_hcd 0000:00:0e.2: roothub.portstatus [1] 0x00010301 CSC LSDA PPS CCS
ohci_hcd 0000:00:0e.2: roothub.portstatus [2] 0x00000100 PPS
usbcore: registered new driver usbkbd
drivers/usb/input/usbkbd.c: :USB HID Boot Protocol keyboard driver
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1200 status 7809 advertising 01e1.
ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [0] = 0x00010301 CSC
LSDA PPS CCS
hub 1-0:1.0: port 1, status 0301, change 0001, 1.5 Mb/s
eth0: Digital DS21143 Tulip rev 65 at 0xf4008000, 00:10:83:CF:A6:DC, IRQ 66.
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
hub 1-0:1.0: debounce: port 1: total 100ms stable 100ms status 0x301
ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [0] = 0x00100303 PRSC
LSDA PPS PES CCS
usb 1-1: new low speed USB device using address 2
usb 1-1: skipped 1 descriptor after interface
usb 1-1: new device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-1: default language 0x0409
usb 1-1: Product: N43
usb 1-1: Manufacturer: Logitech
usb 1-1: hotplug
usb 1-1: adding 1-1:1.0 (config #1, interface 0)
usb 1-1:1.0: hotplug
usbhid 1-1:1.0: usb_probe_interface
usbhid 1-1:1.0: usb_probe_interface - got id
input: USB HID v1.00 Mouse [Logitech N43] on usb-0000:00:0e.2-1
ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [1] = 0x00010301 CSC
LSDA PPS CCS
hub 1-0:1.0: port 2, status 0301, change 0001, 1.5 Mb/s
hub 1-0:1.0: debounce: port 2: total 100ms stable 100ms status 0x301
ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [1] = 0x00100303 PRSC
LSDA PPS PES CCS
usb 1-2: new low speed USB device using address 3
usb 1-2: skipped 1 descriptor after interface
usb 1-2: skipped 1 descriptor after interface
usb 1-2: new device strings: Mfr=1, Product=2, SerialNumber=0
usb 1-2: default language 0x0409
usb 1-2: Product: USB Keyboard and Mouse
usb 1-2: Manufacturer: SILITEK
usb 1-2: hotplug
usb 1-2: adding 1-2:1.0 (config #1, interface 0)
usb 1-2:1.0: hotplug
usbkbd 1-2:1.0: usb_probe_interface
usbkbd 1-2:1.0: usb_probe_interface - got id
input: SILITEK USB Keyboard and Mouse on usb-0000:00:0e.2-2
usb 1-2: adding 1-2:1.1 (config #1, interface 1)
usb 1-2:1.1: hotplug
usbhid 1-2:1.1: usb_probe_interface
usbhid 1-2:1.1: usb_probe_interface - got id
input: USB HID v1.00 Mouse [SILITEK USB Keyboard and Mouse] on
usb-0000:00:0e.2-2
NS87415: IDE controller at PCI slot 0000:00:0e.0
NS87415: chipset revision 3
NS87415: 100% native mode on irq 103
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
hda: CD-532E-B, ATAPI CD/DVD-ROM drive
ide0 at 0xf00-0xf07,0xe02 on irq 103
hda: ATAPI 32X CD-ROM drive, 128kB Cache
Uniform CD-ROM driver Revision: 3.20
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sda: drive cache: write back
 /dev/scsi/host1/bus0/target6/lun0: p1 p2 p3 p4
Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
Adding 498004k swap on /dev/sda3.  Priority:-1 extents:1
ad1889: ad1889 at 0xf400c000 IRQ 67
ac97_codec: AC97 Audio codec, id: ADS3 (Analog Devices AD1819)
ehci_hcd: block sizes: qh 128 qtd 96 itd 192 sitd 96
USB Universal Host Controller Interface driver v2.2
ts: Compaq touchscreen protocol output
NET: Registered protocol family 17
module ipv6 relocation of symbol capable is out of range (0x3ffeffdc in 17
bits)
eth0: Setting full-duplex based on MII#1 link partner capability of 45e1.


-- 
GMX DSL-Flatrate 1 Jahr kostenlos* + WLAN-Router ab 0,- Euro*
Bis 31.12.2005 einsteigen! Infos unter: http://www.gmx.net/de/go/dsl
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
