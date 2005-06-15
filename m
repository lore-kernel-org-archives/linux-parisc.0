From: "J. L. Lee" <jllee@singnet.com.sg>
Subject: [parisc-linux] Trident video card caused Kernel Panic on HP
 Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Wed, 15 Jun 2005 22:59:21 +0800
Message-ID: <5.1.1.6.1.20050615221250.02a429c0__29729.9456120983$1416623802$gmane$org@pop.singnet.com.sg>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii";
  format=flowed
To: <debian-hppa@lists.debian.org>,
 <parisc-linux@lists.parisc-linux.org>
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

Hi,

I have just successfully set up a Matrox Millennum II PCI video card on an 
HPPA RISC B2000 workstation. I now able to connect an HP910 to the Matrox 
video port running as a text console. (Yet to figure out how to configure X 
Windows.)

However when I plugged in a Trident video card (also configured as a module 
in the kernel) it causes the kernel to panic!

The basic h/w configuration are as follows:

1) HP Visualize 785/B2000 with 256 MB of memory, 400 MHz processor & 10 GB 
disk;
2) HP 910 monitor connected to a STI fxe video card (in trouble, I switched 
to ttys0 as the console);
3) Additional Trident video card with no monitor connected;
4) No HP/UX. Only Debian GNU/Linux;

Software configuration:

5) Sarge distribution from 27 April ISO images were used for the base 
installation;
6) All packages installed updated/upgraded to the latest available 
(regardless bugs or no bugs, 14 June?);
7) No security updates applied as security.debian.org site can't be 
accessed for some reasons;
8) Kernel source from "linux-2.6.12-rc6-pa1.tar.bz2";

Built the kernel using instructions from "PARISC-LINUX: Building The Kernel 
documentation" by following their "The Old, Grotty Way To Build a Kernel" 
and chose to compile the Matrox acceleration, Matrox Millennum II & 
Mystique and Trident supports into the Kernel as modules. I have also 
created the initial RAM disk by "mkinitrd -o 
/usr/src/linux-2.6.12-rc6-pa1/initrd.img-2.6.12-rc6-pa1 2.6.12-rc6-pa1".

The B2000 booted past the initial RAM disk, discovered the built-in 
hardware and the PCI Trident card, then disaster struck. Kernel panic after 
the discovery of the Trident card.

The boot process and the Kernel panic and associated error messages are 
appended next for your perusal.

Rgds,
Lee

ps. Boot messages captured:

Booting...

Boot IO Dependent Code (IODC) revision 0




HARD Booted.

palo ipl 1.5 root@c3k Fri May 14 16:17:38 MDT 2004

Partition Start(MB) End(MB) Id Type


1               1      31   f0 Palo


2    	     8427    8678   82 swap


3              32     157   83 ext2


4             158    8426   83 ext2




PALO(F0) partition contains:

     0/vmlinux32 4968722 bytes @ 0x44000

Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently used by firmware (serial).


Command line for kernel: 'root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux'



Selected kernel: /vmlinux from partition 3



Selected ramdisk: /initrd.img from partition 3



ELF32 executable



Entry 00100080 first 00100000 n 2



Segment 0 load 00100000 size 3279168 mediaptr 0x1000



Segment 1 load 00424000 size 393350 mediaptr 0x322000



Loading ramdisk 4804608 bytes @ 0fb59000...



Branching to kernel entry point 0x00100080.  If this is the last



message you see, you may need to switch your console.  This is



a common symptom -- search the FAQ and mailing list at parisc-linux.org



Linux version 2.6.12-rc6-pa1 (root@DebianHPPA.example.com)
(gcc version 3.3.5 (Debian 1:3.3.5-13)) #1 Wed Jun 15 18:27:54 SGT 2005

FP[0] enabled: Rev 1 Model 16

The 32-bit Kernel has started...

Initialized PDC Console for debugging.

Determining PDC firmware type: System Map.

model 00005d00 00000481 00000000 00000002 775714fc 100000f0 00000008 
000000b2 000000b2
vers  00000204
CPUID vers 17 rev 8 (0x00000228)
capabilities 0x3
model 9000/785/B2000
Total Memory: 256 MB
initrd: 1fb59000-1ffee000
initrd: reserving 0fb59000-0ffee000 (mem_max 10000000)
LCD display at f05d0008,f05d0000 registered
Built 1 zonelists
Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102 
palo_kernel=3/vmlinux
PID hash table entries: 2048 (order: 11, 32768 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Memory: 262144k available
Security Framework v1.0.0 initialized
Capability LSM initialized
Mount-cache hash table entries: 512
checking if image is initramfs...it isn't (bad gzip magic numbers); looks 
like an initrd
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }
4. Kazoo W+ at 0xfffa0000 [32] { 0, 0x0, 0x5d0, 0x00004 }
5. Memory at 0xfed10200 [49] { 1, 0x0, 0x09d, 0x00009 }
CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
Setting cache flush threshold to 40 (1 CPUs online)
SBA found Astro 2.1 at 0xfed00000
LBA version TR2.1 (0x2) found at 0xfed30000
PCI: Enabled native mode for NS87415 (pif=0x8f)
LBA version TR2.1 (0x2) found at 0xfed32000
SCSI subsystem initialized
TC classifier action (bugs to netdev@oss.sgi.com cc hadi@cyberus.ca)
unwind_init: start = 0x10367b40, end = 0x1038cf00, entries = 9532
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
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
STI PCI graphic ROM found at f4c20000 (128 kB), fb at fb000000 (16 MB)
     id 35acda16-9a02587, conforms to spec rev. 8.0c
     graphics card name: HPA4982A
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
tridentfb: Trident framebuffer 0.7.8-NEWAPI initializing


Backtrace:
  [<10113650>] inb+0x60/0x7c
  [<102469c4>] trident_pci_probe+0x438/0x4d4
  [<1020ceb8>] pci_device_probe_static+0x60/0x78
  [<1020cf10>] __pci_device_probe+0x40/0x60
  [<1020cf5c>] pci_device_probe+0x2c/0x58
  [<1026f200>] driver_probe_device+0x38/0x88
  [<1026f3a8>] driver_attach+0x84/0xc0
  [<1026f914>] bus_add_driver+0xa4/0xcc
  [<1020d27c>] pci_register_driver+0x70/0xa0
  [<1044378c>] tridentfb_init+0x50/0x64
  [<10430954>] do_initcalls+0x8c/0x130
  [<10103914>] init+0x3c/0x10c
  [<1010bc5c>] ret_from_kernel_thread+0x1c/0x24


High Priority Machine Check (HPMC): Code=1 regs=10397080 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001101 Not tainted
r00-03  00000000 104a8810 10113650 104ad810
r04-07  00008000 1f440c00 10340000 10482150
r08-11  1032d000 1f440c00 1032d000 1032d000
r12-15  10332800 1032d000 10493810 103a6010
r16-19  f00008c4 f000017c f0000174 fee003c5
r20-23  0000000f 00000000 10214594 00000002
r24-27  00000009 000003c5 1fffd580 1038d010
r28-31  000000ff 40000000 1fb04400 10113650
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102145a8 102145ac
  IIR: 0e60001c    ISR: a607fffb  IOR: 802003c5
  CPU:        0   CR30: 1fb04000 CR31: 10428000
  ORIG_R28: 00000000
  IAOQ[0]: lba_astro_in8+0x14/0x24
  IAOQ[1]: lba_astro_in8+0x18/0x24
  RP(r2): inb+0x60/0x7c
Kernel panic - not syncing: High Priority Machine Check (HPMC)



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
