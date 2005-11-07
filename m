From: Andy Walker <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] Cannot mount installation CD after boot
Date: Mon, 07 Nov 2005 21:50:25 +0100
Message-ID: <436FBE11.8040405@broadpark.no>
References: <mailman.0.1131378614.29728.parisc-linux@lists.parisc-linux.org>
	<20051107172054.GI23749@parisc-linux.org>
	<436FA972.7030007@broadpark.no>
	<200511072058.35129.eggert.ehmke@berlin.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="Boundary_(ID_24Z/Hnb6/lCwIuiHFjTutw)"
Cc: parisc-linux@lists.parisc-linux.org
To: Eggert Ehmke <eggert.ehmke@berlin.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200511072058.35129.eggert.ehmke@berlin.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

This is a multi-part message in MIME format.

--Boundary_(ID_24Z/Hnb6/lCwIuiHFjTutw)
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7BIT

Eggert Ehmke wrote:
> 
> It's a  Hp 8132+, this is the output of 
> cat /proc/cpuinfo:
> processor       : 0
> cpu family      : PA-RISC 1.1e
> cpu             : PA7300LC (PCX-L2)
> cpu MHz         : 132.000000
> model           : 9000/778/B132L+
> model name      : Merlin L2+ 132 (9000/778/B132L)
> hversion        : 0x00005030
> 
> It runs under Debian right now.
> Eggert
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Just burnt a fresh copy of the 2005.1 minimal install iso and fired
it up on my B132L (not quite the same as your B132L+ model - but
pretty darned close).

CDROM is connected internally to the narrow SE bus (lasi). 9GB
disk on the high voltage diff controller (you have regular fast+wide
instead of HVD don't you).

Worked like a charm. CD was found on /dev/cdroms/cdrom0 as expected.

CPUINFO:
processor       : 0
cpu family      : PA-RISC 1.1e
cpu             : PA7300LC (PCX-L2)
cpu MHz         : 132.000000
model           : 9000/778/B132L
model name      : Merlin L2 132 (9000/778/B132L)
hversion        : 0x00005010
sversion        : 0x00000481
I-cache         : 64 KB
D-cache         : 64 KB (WB, 0-way associative)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 87.85
software id     : 2012763504

dmesg is attached.

Do you have the external CDROM on the narrow or wide SCSI bus?
Put it on the narrow interface if it isn't already and double
check your termination. Is the CDROM detected and listed during
SCSI probing?

Try burning another copy of the cd. What did you use to burn it -
I used plain old cdrecord.

Sorry I can 't be more helpful, but on the evidence so far I don't
know what more to suggest.

-Andy




--Boundary_(ID_24Z/Hnb6/lCwIuiHFjTutw)
Content-type: text/plain; name=dmesg.weasel
Content-transfer-encoding: 7BIT
Content-disposition: inline; filename=dmesg.weasel

Linux version 2.6.12.2-pa2-livecd32 (root@hake) (gcc version 3.3.5 (Gentoo 3.3.5-r1, pie-8.7.7.1)) #1 Thu Jul 28 17:56:02 UTC 2005
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005010 00000481 00000000 02020202 77f85570 100000f0 00000004 000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B132L
Total Memory: 384 MB
initrd: 27f09000-27fef455
initrd: reserving 17f09000-17fef455 (mem_max 18000000)
On node 0 totalpages: 98304
  DMA zone: 98304 pages, LIFO batch:31
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Built 1 zonelists
Kernel command line:  TERM=linux root=/dev/ram0 init=/linuxrc cdroot looptype=squashfs loop=/livecd.squashfs hda=scsi console=tty0 sti=8/24 sti_font=VGA8x16 palo_kernel=0/vmlinux
ide_setup: hda=scsi
PID hash table entries: 2048 (order: 11, 32768 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 393216k available
Calibrating delay loop... 87.85 BogoMIPS (lpj=439296)
Mount-cache hash table entries: 512
checking if image is initramfs... it is
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
2. Merlin 132 Core FW-SCSI at 0xfff8c000 [8/12] { 4, 0x0, 0x03c, 0x00089 }
3. Merlin 132 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03c, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000 
4. Merlin 132 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03c, 0x0008c }
5. Merlin 132 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x03c, 0x00082 }
6. Merlin 132 Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x03c, 0x0008a }
7. Merlin 132 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03c, 0x00074 },  additional addresses: 0xffd01000 0xffd03000 
8. Merlin 132 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03c, 0x0007b }
9. Merlin 132 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03c, 0x00084 }
10. Merlin 132 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03c, 0x00084 }
11. Merlin 132 Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x040, 0x0008e }
12. Merlin 132 Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x040, 0x00090 },  additional addresses: 0xf0184000 
13. Merlin 132 Wax HIL at 0xffe01000 [8/20/1] { 10, 0x0, 0x040, 0x00073 }
14. Merlin 132 Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x040, 0x0008c }
15. Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 }
16. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085 },  additional addresses: 0xf0011000 
17. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x1, 0x680, 0x0000a }
18. Merlin L2 132 (9000/778/B132L) at 0xfffbe000 [62] { 0, 0x0, 0x501, 0x00004 }
19. Memory at 0xfffbf000 [63] { 1, 0x0, 0x060, 0x00009 }
20. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096 }
21. Merlin+ 132 Dino RS-232 at 0xfff83000 [3] { 10, 0x0, 0x022, 0x0008c }
CPU(s): 1 x PA7300LC (PCX-L2) at 132.000000 MHz
Whole cache flush 18808 cycles, flushing 275038852 bytes 39507518 cycles
Setting cache flush threshold to 40 (1 CPUs online)
Lasi version 0 at 0xffd00000 found.
wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
Enumerating EISA bus
EISA: Probing bus 0 at 8:20:5
EISA: Mainboard HWPC000 detected.
EISA: Detected 0 cards.
Dino version 2.1 found at 0xfff80000
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

Dino: No PCI devices enabled.
SCSI subsystem initialized
usbcore: registered new driver hub
unwind_init: start = 0x10499060, end = 0x104ccd70, entries = 13265
Squashfs 2.1 (released 2004/12/10) (C) 2002-2004 Phillip Lougher
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
SGI XFS with ACLs, security attributes, realtime, no debug enabled
SGI XFS Quota Management subsystem
Initializing Cryptographic API
EISA EEPROM at 0xf0184000
PDC Stable Storage facility v0.09
Soft power switch enabled, polling @ 0xf0140000.
STI GSC/PCI core graphics driver Version 0.9a
    id 2bcb015a-9a02587, conforms to spec rev. 8.04
    graphics card name: HPA4071B
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_1280
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, INTERNAL_EG_1280, id: 2d08c0a7, mmio: 0xf8100000
fb1: stifb 1280x1024-32 frame buffer device, HPA4071B, id: 2bcb015a, mmio: 0xf4100000
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 21 @ 8:16:7
serio: GSC PS/2 mouse port at 0xffd08100 irq 21 @ 8:16:8
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 16) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 26) is a 16550A
Serial: device 0xfff83000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
zalon_probe: Zalon version 1, IRQ 67
ncr53c720-0: rev 0xf irq 67
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
  Vendor: SEAGATE   Model: ST39173WD         Rev: 5764
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target0:0:0: Beginning Domain Validation
 target0:0:0: asynchronous.
WIDTH IS 1
 target0:0:0: wide asynchronous.
 target0:0:0: Domain Validation skipping write tests
 target0:0:0: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target0:0:0: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
  Vendor: COMPAQ    Model: CRD-254V          Rev: 1.06
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target1:0:2: Beginning Domain Validation
 target1:0:2: asynchronous.
 target1:0:2: Ending Domain Validation
st: Version 20050312, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17783240 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 17783240 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
 /dev/scsi/host0/bus0/target0/lun0: p1 p2 p3 p4 < p5 p6 p7 p8 >
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
Attached scsi generic sg1 at scsi1, channel 0, id 2, lun 0,  type 5
usbmon: debugs is not available
ehci_hcd: block sizes: qh 128 qtd 96 itd 192 sitd 96
ohci_hcd: 2004 Nov 08 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.01:USB HID core driver
mice: PS/2 mouse device common for all mice
Found HIL bus at 0xffe01000, IRQ 24
input: AT Raw Set 2 keyboard on 8:16:7
HIL: no keyboard present.
input: HIL keyboard, ID -1 at 0xffe01000 (irq 24) found and attached
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP established hash table entries: 16384 (order: 5, 131072 bytes)
TCP bind hash table entries: 16384 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 16384 bind 16384)
NET: Registered protocol family 1
NET: Registered protocol family 10
Disabled Privacy Extensions on device 1052804c(lo)
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
Freeing unused kernel memory: 368k freed
VFS: Can't find ext3 filesystem on dev sr0.
VFS: Can't find an ext2 filesystem on dev sr0.
SQUASHFS error: Can't find a SQUASHFS superblock on sr0
ISO 9660 Extensions: Microsoft Joliet Level 3
Unable to load NLS charset iso8859-15
Unable to load NLS charset iso8859-15
ISO 9660 Extensions: RRIP_1991A
LASI 82596 driver - Revision: 1.30
Found i82596 at 0xffd07000, IRQ 18
eth0: 82596 at 0xffd07000, 00 60 B0 07 1C 2C IRQ 18.
eth0: link ok.
eth0: no IPv6 routers present

--Boundary_(ID_24Z/Hnb6/lCwIuiHFjTutw)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary_(ID_24Z/Hnb6/lCwIuiHFjTutw)--
