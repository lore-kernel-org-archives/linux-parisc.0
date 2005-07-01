From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [dave@hiauly1.hia.nrc.ca: Re: [parisc-linux] Why gas kills the
	hppa-linux kernel and what you can]
Date: Fri, 1 Jul 2005 15:05:18 -0400
Message-ID: <20050701190518.GV5269@systemhalted.org>
References: <20050701175316.GS5269@systemhalted.org>
	<1120241244.5046.16.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Randolph Chung <tausq@debian.org>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1120241244.5046.16.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jul 01, 2005 at 02:07:24PM -0400, James Bottomley wrote:
> On Fri, 2005-07-01 at 13:53 -0400, Carlos O'Donell wrote:
> > journal_alloc_journal_head() can return a null pointer causing
> > the kernel to die in memset.  I think the fix is to skip calling
> > memset when new_jh is null.  The rest of the code looks ok except
> > for possibly
> 
> That's true (and needs fixing), but isn't what happened in this case.
> Look at the traceback:
> 
> > Kernel Fault: Code=15 regs=3249c840 (Addr=73c9d7ba)
> 
> The address wasn't NULL, it was something really strange above the
> addressable virtual memory in the system.
> 
> This fault is consistent with a class of faults we've been seeing since
> 2.6.11-rc1-pa0 where kmem_cache_alloc() is returning memory that can't
> be written to (usually just slightly above the end of virtual memory).

James you wanted the dmesg of this box, provided below:

---
Linux version 2.6.12-pa1 (carlos@churchill) (gcc version 3.3.6 (Debian 1:3.3.6-6)) #37 Mon Jun 20 01:24:28 EDT 2005
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005bb0 00000481 00000000 00000002 77e816ae 100000f0 00000008 000000b2 000000b2
vers  00000200
CPUID vers 17 rev 4 (0x00000224)
capabilities 0x3
model 9000/785/C3000
Total Memory: 1024 MB
On node 0 totalpages: 262144
  DMA zone: 262144 pages, LIFO batch:31
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists
Kernel command line: root=/dev/sda2 HOME=/ console=ttyS0 profile=2 pdcchassis=0 palo_kernel=2/boot/vmlinux-test
kernel profiling enabled (shift: 2)
PID hash table entries: 4096 (order: 12, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 131072 (order: 7, 524288 bytes)
Memory: 1048576k available
Calibrating delay loop... 796.67 BogoMIPS (lpj=398336)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }
6. AllegroHigh W at 0xfffa0000 [32] { 0, 0x0, 0x5bb, 0x00004 }
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x086, 0x00009 }
CPU(s): 1 x PA8500 (PCX-W) at 400.000000 MHz
Whole cache flush 260339 cycles, flushing 273920028 bytes 36322075 cycles
Setting cache flush threshold to 80 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
LBA version TR2.1 (0x2) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
LBA version TR2.1 (0x2) found at 0xfed32000
iosapic: no IRTE for 0000:01:05.0 (IRQ not connected?)
LBA version TR2.1 (0x2) found at 0xfed38000
iosapic: hpa not registered for 0000:02:03.0
LBA version TR2.1 (0x2) found at 0xfed3c000
SCSI subsystem initialized
unwind_init: start = 0x10366f40, end = 0x1038d8b0, entries = 9879
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 67) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
PDC Stable Storage facility v0.09
Soft power switch enabled, polling @ 0xf0400804.
STI GSC/PCI core graphics driver Version 0.9a
STI PCI ROM enabled at 0xf4840000
STI PCI graphic ROM found at f4840000 (64 kB), fb at fa000000 (32 MB)
Trying PCI STI ROM at f4840000, PCI hpa at fa000000
PCI ROM size (from header) = 64 kB
PCI region Mapper offset = 00000034: 10 10 10 10 10 00 00 00 00 00 00 00 00 00 00 00 
sig 55aa0000, PCI STI ROM at f4840044
    word mode ROM at f4840044, hpa at fa000000
selected 8x8 fb-font VGA8x8
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
      supports 15 monitors
      font start 00007730
      region list 00007718
      init_graph 00000890
      bus support 20
      ext bus support 00
      alternate code type 0
region #0: phys fa000000, virt fa000000, len=64kB, btlb=1, sysonly=0, cache=0, last=0
region #1: phys fb000000, virt fb000000, len=16384kB, btlb=1, sysonly=0, cache=0, last=0
region #2: phys fa100000, virt fa100000, len=2560kB, btlb=1, sysonly=0, cache=0, last=0
region #3: phys fac00000, virt fac00000, len=4096kB, btlb=1, sysonly=0, cache=0, last=0
region #4: phys fa380000, virt fa380000, len=4kB, btlb=0, sysonly=1, cache=0, last=1
STI PCI ROM disabled
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 2048 layout
regions at fa000000 fb000000 fa100000 fac00000
regions at fa380000 00000000 00000000 00000000
reent_lvl 0
save_addr 012d1400
monitor 0
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 012f6580 (size=256 bytes)
8 bits per pixel
8 used bits
16 planes
attributes 0000b836
    graphics card name: PCI_GRAFFITIDX1280
STI PCI ROM enabled at 0xf6000000
STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
Trying PCI STI ROM at f6000000, PCI hpa at f8000000
PCI ROM size (from header) = 64 kB
PCI region Mapper offset = 00000034: 10 10 10 10 10 00 00 00 00 00 00 00 00 00 00 00 
sig 55aa0000, PCI STI ROM at f6000044
    word mode ROM at f6000044, hpa at f8000000
    id 2d08c0a7-9a02587, conforms to spec rev. 8.0a
      supports 15 monitors
      font start 00007730
      region list 00007718
      init_graph 00000890
      bus support 20
      ext bus support 00
      alternate code type 0
region #0: phys f8000000, virt f8000000, len=64kB, btlb=1, sysonly=0, cache=0, last=0
region #1: phys f9000000, virt f9000000, len=16384kB, btlb=1, sysonly=0, cache=0, last=0
region #2: phys f8100000, virt f8100000, len=2560kB, btlb=1, sysonly=0, cache=0, last=0
region #3: phys f8c00000, virt f8c00000, len=4096kB, btlb=1, sysonly=0, cache=0, last=0
region #4: phys f8380000, virt f8380000, len=4kB, btlb=0, sysonly=1, cache=0, last=1
STI PCI ROM disabled
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 2048 layout
regions at f8000000 f9000000 f8100000 f8c00000
regions at f8380000 00000000 00000000 00000000
reent_lvl 0
save_addr 012d1000
monitor 0
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 012f6380 (size=256 bytes)
8 bits per pixel
8 used bits
8 planes
attributes 0000b836
    graphics card name: PCI_GRAFFITIX1280
sticon: Initializing STI text console.
Console: switching to colour STI console 160x128
Console: switching to colour frame buffer device 160x128
fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIDX1280, id: 2d08c0a7, mmio: 0xfa100000
fb1: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf8100000
Generic RTC Driver v1.07
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13 (December 15, 2004)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/DS21143 Tulip rev 48 at 80001000, 00:60:B0:EA:28:2B, IRQ 65.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block.
tulip1:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21142/DS21143 Tulip rev 33 at 80012000, 00:60:B0:7A:02:E1, IRQ 71.
sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 68
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
sym0: SCSI BUS has been reset.
scsi0 : sym-2.2.1
sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 68
sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.1
  Vendor: HP 73.4G  Model: ST373405LC        Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:5: tagged command queuing enabled, command queue depth 16.
 target1:0:5: Beginning Domain Validation
 target1:0:5: asynchronous.
WIDTH IS 1
 target1:0:5: wide asynchronous.
 target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
 target1:0:5: Ending Domain Validation
  Vendor: HP        Model: 9.10GB B 80-1205  Rev:     
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:6: tagged command queuing enabled, command queue depth 16.
 target1:0:6: Beginning Domain Validation
 target1:0:6: asynchronous.
WIDTH IS 1
 target1:0:6: wide asynchronous.
 target1:0:6: Domain Validation skipping write tests
 target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 15)
 target1:0:6: Ending Domain Validation
sym2: <1010-66> rev 0x1 at pci 0000:01:04.0 irq 69
sym2: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.2.1
sym3: <1010-66> rev 0x1 at pci 0000:01:04.1 irq 70
sym3: PA-RISC Firmware, ID 7, Fast-80, LVD, parity checking
sym3: SCSI BUS has been reset.
scsi3 : sym-2.2.1
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sda: drive cache: write through
SCSI device sda: 143374738 512-byte hdwr sectors (73408 MB)
SCSI device sda: drive cache: write through
 sda: sda1 sda2 sda3 sda4
Attached scsi disk sda at scsi1, channel 0, id 5, lun 0
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdb: drive cache: write through
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
SCSI device sdb: drive cache: write through
 sdb: sdb1
Attached scsi disk sdb at scsi1, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi1, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi1, channel 0, id 6, lun 0,  type 0
mice: PS/2 mouse device common for all mice
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP: routing cache hash table of 8192 buckets, 64Kbytes
TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 568k freed
Adding 2097136k swap on /dev/sda3.  Priority:-1 extents:1
EXT3 FS on sda2, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda4, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sdb1, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
eth0: Setting full-duplex based on MII#1 link partner capability of 41e1.
---

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
