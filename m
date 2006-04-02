From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 02 Apr 2006 11:18:50 +0000
Message-ID: <442FB31A.5040308@tiscali.be>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be> <200604010935.42819.deller@gmx.de> <1143901853.3368.0.camel@mulgrave.il.steeleye.com> <200604021129.31095.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200604021129.31095.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

Hello Helge,

Helge Deller wrote:
> On Saturday 01 April 2006 16:30, James Bottomley wrote:
> 
>>On Sat, 2006-04-01 at 09:35 +0200, Helge Deller wrote:
>>
>>>I'm pretty sure.
>>>We never vmalloc'ed IOmem before.
>>
>>Where are you taking the ioremap virtual range from?  If it's the
>>vmalloc range, which is the only one I can think we have available for
>>arbitrary kernel mappings, then that would explain the behaviour.
> 
> 
> Correct.
> ioremap() calls get_vm_area(), which in turn gets it from __get_vm_area(size, flags, VMALLOC_START, VMALLOC_END);
> VMALLOC_START seems to be at 32KB, while VMALLOC_END at around 240MB.
> This means we have ~240MB of IO-Space which seems to little for the N4k.
> 
> Willy said in another mail:
> 
>>Either we're leaking vmalloc space, we allocate too much of it, or we
>>need to drastically increase it the amount of it we have available.
> 
> 
> I think Willy is right.
> We probably don't leak in ioremap(), since we use the standard Linux kernel functions.
> I would propose to analyze how much the 14 PCI busses wants to allocate, and if they free it correctly and if they might leak.
> 
> Might this be the culprit: 
> (lba_pci.c:1216)
> case PAT_PIOP:
>                         /*
>                         ** Postable I/O port space is per PCI host adapter.
>                         ** base of 64MB PIOP region
>                         */
>                         lba_dev->iop_base = ioremap_nocache(p->start, 64 * 1024 * 1024);
> It allocates 64MB in a loop.
> 
> Joel, can you apply the attached patch and send us the bootlog of the N4k with it ?
> 
> Helge

Here there are:
[snip]
Interact with IPL (Y, N, or Cancel)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.9 root@c3k Wed Jul 20 12:51:49 MDT 2005
Skipping extended partition 7 - beyond reach of IPL

Partition Start(MB) End(MB) Id Type
1               1      61   f0 Palo
2              62     306   82 swap
3             307     367   83 ext2
5             368    1953   83 ext2
6            1954    2197   83 ext2

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda5 HOME=/ panic=30 profile=2 console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux'
Selected kernel: /vmlinux from partition 3
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 4417856 mediaptr 0x1000
Segment 1 load 00538000 size 344208 mediaptr 0x438000
Segment 2 load 00590000 size 303760 mediaptr 0x48d000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.16.1-pa10-n4kmp (root@patst006) (gcc version 4.0.3 (Debian 4.0.3-1)) #698 SMP Sun Apr 2 12:22:58 CEST 2006
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model 00005d30 00000491 00000000 00000002 27988e5d 100000f1 00000008 000000b2 000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/N4000-55
Memory Ranges:
  0) Start 0x0000000000000000 End 0x000000007fffffff Size   2048 MB
  1) Start 0x0000000180000000 End 0x00000001ffffffff Size   2048 MB
Total Memory: 4096 MB
SMP: bootstrap CPU ID is 0
Built 2 zonelists
Kernel command line: root=/dev/sda5 HOME=/ panic=30 profile=2 console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux
kernel profiling enabled (shift: 2)
PID hash table entries: 4096 (order: 12, 131072 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
Memory: 4194304k available
Mount-cache hash table entries: 256
Brought up 1 CPUs
migration_cost=0
NET: Registered protocol family 16
Searching for devices...
Found devices:
1. Unknown machine at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000 }
2. Unknown machine at 0xfffffffffed2d000 [45] { 0, 0x0, 0x5d3, 0x00000 }
3. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000c }
4. DEW BC Runway Port at 0xfffffffffed2c000 [44] { 7, 0x0, 0x584, 0x0000c }
5. Memory at 0xfffffffffedc0000 [192] { 1, 0x0, 0x090, 0x00009 }
6. IKE I/O BC Merced Port at 0xfffffffffed00000 [0] { 7, 0x0, 0x803, 0x0000c }
7. Elroy PCI Bridge at 0xffffffffbffe0000 [0/0] { 13, 0x0, 0x782, 0x0000a }
8. Elroy PCI Bridge at 0xffffffffbffe2000 [0/1] { 13, 0x0, 0x782, 0x0000a }
9. Elroy PCI Bridge at 0xffffffffbffe4000 [0/2] { 13, 0x0, 0x782, 0x0000a }
10. Elroy PCI Bridge at 0xffffffffbffe8000 [0/4] { 13, 0x0, 0x782, 0x0000a }
11. Elroy PCI Bridge at 0xffffffffbffea000 [0/5] { 13, 0x0, 0x782, 0x0000a }
12. Elroy PCI Bridge at 0xffffffffbfff0000 [0/8] { 13, 0x0, 0x782, 0x0000a }
13. Elroy PCI Bridge at 0xffffffffbfff4000 [0/10] { 13, 0x0, 0x782, 0x0000a }
14. Elroy PCI Bridge at 0xffffffffbfff8000 [0/12] { 13, 0x0, 0x782, 0x0000a }
15. IKE I/O BC Merced Port at 0xfffffffffed40000 [1] { 7, 0x0, 0x803, 0x0000c }
16. Elroy PCI Bridge at 0xfffffffffece0000 [1/0] { 13, 0x0, 0x782, 0x0000a }
17. Elroy PCI Bridge at 0xfffffffffece4000 [1/2] { 13, 0x0, 0x782, 0x0000a }
18. Elroy PCI Bridge at 0xfffffffffece8000 [1/4] { 13, 0x0, 0x782, 0x0000a }
19. Elroy PCI Bridge at 0xfffffffffecf0000 [1/8] { 13, 0x0, 0x782, 0x0000a }
20. Elroy PCI Bridge at 0xfffffffffecf4000 [1/10] { 13, 0x0, 0x782, 0x0000a }
21. Elroy PCI Bridge at
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       OFF           OFF       ON         ON
LED State: System running normally.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
Releasing cpu 1 now, hpa=fffffffffed2d000
FP[1] enabled: Rev 1 Model 16
migration_cost=1000
CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
Setting cache flush threshold to ad700 (2 CPUs online)
IOREMAP: phys=fffffffffed00000, size=1000
IOREMAP: remapped to 0000000000008000
SBA found Ike rev 2 at 0xfffffffffed00000
IOREMAP: phys=fffffffffed02000, size=1000
IOREMAP: remapped to 000000000000a000
IOREMAP: phys=fffffffffed03000, size=1000
IOREMAP: remapped to 000000000000c000
IOREMAP: phys=ffffffffbffe0000, size=1000
IOREMAP: remapped to 000000000000e000
IOREMAP: phys=ffffffffbffe2000, size=1000
IOREMAP: remapped to 0000000000010000
IOREMAP: phys=ffffffffbffe4000, size=1000
IOREMAP: remapped to 0000000000012000
IOREMAP: phys=ffffffffbffe8000, size=1000
IOREMAP: remapped to 0000000000014000
IOREMAP: phys=ffffffffbffea000, size=1000
IOREMAP: remapped to 0000000000016000
IOREMAP: phys=ffffffffbfff0000, size=1000
IOREMAP: remapped to 0000000000018000
IOREMAP: phys=ffffffffbfff4000, size=1000
IOREMAP: remapped to 000000000001a000
IOREMAP: phys=ffffffffbfff8000, size=1000
IOREMAP: remapped to 000000000001c000
IOREMAP: phys=fffffffffed40000, size=1000
IOREMAP: remapped to 000000000001e000
SBA found Ike rev 2 at 0xfffffffffed40000
IOREMAP: phys=fffffffffed42000, size=1000
IOREMAP: remapped to 0000000000020000
IOREMAP: phys=fffffffffed43000, size=1000
IOREMAP: remapped to 0000000000022000
IOREMAP: phys=fffffffffece0000, size=1000
IOREMAP: remapped to 0000000000024000
IOREMAP: phys=fffffffffece4000, size=1000
IOREMAP: remapped to 0000000000026000
IOREMAP: phys=fffffffffece8000, size=1000
IOREMAP: remapped to 0000000000028000
IOREMAP: phys=fffffffffecf0000, size=1000
IOREMAP: remapped to 000000000002a000
IOREMAP: phys=fffffffffecf4000, size=1000
IOREMAP: remapped to 000000000002c000
IOREMAP: phys=fffffffffecf8000, size=1000
IOREMAP: remapped to 000000000002e000
IOREMAP: phys=ffffffffbffe0000, size=1000
IOREMAP: remapped to 0000000000030000
LBA version TR4.0 (0x5) found at 0xffffffffbffe0000
IOREMAP: phys=ffffffffbffe0000, size=2000
IOREMAP: remapped to 0000000000034000
IOREMAP: phys=fffffff000000000, size=4000000
IOREMAP: remapped to 0000000000080000
iosapic: no IRTE for 0000:00:04.0 (IRQ not connected?)
IOREMAP: phys=ffffffffbffe2000, size=1000
IOREMAP: remapped to 0000000000032000
LBA version TR4.0 (0x5) found at 0xffffffffbffe2000
IOREMAP: phys=ffffffffbffe2000, size=2000
IOREMAP: remapped to 0000000000038000
IOREMAP: phys=fffffff080000000, size=4000000
IOREMAP: remapped to 0000000004100000
IOREMAP: phys=ffffffffbffe4000, size=1000
IOREMAP: remapped to 000000000003c000
LBA version TR4.0 (0x5) found at 0xffffffffbffe4000
IOREMAP: phys=ffffffffbffe4000, size=2000
IOREMAP: remapped to 0000000000040000
IOREMAP: phys=fffffff100000000, size=4000000
IOREMAP: remapped to 0000000008180000
IOREMAP: phys=ffffffffbffe8000, size=1000
IOREMAP: remapped to 000000000003e000
LBA version TR4.0 (0x5) found at 0xffffffffbffe8000
IOREMAP: phys=ffffffffbffe8000, size=2000
IOREMAP: remapped to 0000000000044000
IOREMAP: phys=fffffff200000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=ffffffffbffea000, size=1000
IOREMAP: remapped to 0000000000048000
LBA version TR4.0 (0x5) found at 0xffffffffbffea000
IOREMAP: phys=ffffffffbffea000, size=2000
IOREMAP: remapped to 000000000004c000
IOREMAP: phys=fffffff280000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=ffffffffbfff0000, size=1000
IOREMAP: remapped to 000000000004a000
LBA version TR4.0 (0x5) found at 0xffffffffbfff0000
IOREMAP: phys=ffffffffbfff0000, size=2000
IOREMAP: remapped to 0000000000050000
IOREMAP: phys=fffffff400000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=ffffffffbfff4000, size=1000
IOREMAP: remapped to 0000000000054000
LBA version TR4.0 (0x5) found at 0xffffffffbfff4000
IOREMAP: phys=ffffffffbfff4000, size=2000
IOREMAP: remapped to 0000000000058000
IOREMAP: phys=fffffff500000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=ffffffffbfff8000, size=1000
IOREMAP: remapped to 0000000000056000
LBA version TR4.0 (0x5) found at 0xffffffffbfff8000
IOREMAP: phys=ffffffffbfff8000, size=2000
IOREMAP: remapped to 000000000005c000
IOREMAP: phys=fffffff600000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffece0000, size=1000
IOREMAP: remapped to 0000000000060000
LBA version TR4.0 (0x5) found at 0xfffffffffece0000
IOREMAP: phys=fffffffffece0000, size=2000
IOREMAP: remapped to 0000000000064000
IOREMAP: phys=fffffff800000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffece4000, size=1000
IOREMAP: remapped to 0000000000062000
LBA version TR4.0 (0x5) found at 0xfffffffffece4000
IOREMAP: phys=fffffffffece4000, size=2000
IOREMAP: remapped to 0000000000068000
IOREMAP: phys=fffffff900000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffece8000, size=1000
IOREMAP: remapped to 000000000006c000
LBA version TR4.0 (0x5) found at 0xfffffffffece8000
IOREMAP: phys=fffffffffece8000, size=2000
IOREMAP: remapped to 0000000000070000
IOREMAP: phys=fffffffa00000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffecf0000, size=1000
IOREMAP: remapped to 000000000006e000
LBA version TR4.0 (0x5) found at 0xfffffffffecf0000
IOREMAP: phys=fffffffffecf0000, size=2000
IOREMAP: remapped to 0000000000074000
IOREMAP: phys=fffffffc00000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffecf4000, size=1000
IOREMAP: remapped to 0000000000078000
LBA version TR4.0 (0x5) found at 0xfffffffffecf4000
IOREMAP: phys=fffffffffecf4000, size=2000
IOREMAP: remapped to 000000000007c000
IOREMAP: phys=fffffffd00000000, size=4000000
allocation failed: out of vmalloc space - use vmalloc=<size> to increase size.
IOREMAP: phys=fffffffffecf8000, size=1000
IOREMAP: remapped to 000000000007a000
LBA version TR4.0 (0x5) found at 0xfffffffffecf8000
IOREMAP: phys=fffffffffecf8000, size=2000
IOREMAP: remapped to 0000000004084000
IOREMAP: phys=fffffffe00000000, size=4000000
SCSI subsystem initialized
unwind_init: start = 0x10451cc0, end = 0x10472e30, entries = 8471
Performance monitoring counters enabled for Unknown machine
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
PDC Stable Storage facility v0.22
Soft power switch support not available.
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
IOREMAP: phys=ffffffff80000000, size=1000
IOREMAP: remapped to 0000000004082000
0000:00:04.1: ttyS0 at MMIO 0xffffffff80000000 (irq = 22) is a 16550A
0000:00:04.1: ttyS1 at MMIO 0xffffffff80000008 (irq = 22) is a 16450
0000:00:04.1: ttyS2 at MMIO 0xffffffff80000010 (irq = 22) is a 16550A
0000:00:04.1: ttyS3 at MMIO 0xffffffff80000030 (irq = 22) is a 16550A
Couldn't register serial port 0000:00:04.1: -28
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 1.1.13 (December 15, 2004)
IOREMAP: phys=ffffffff80003000, size=1000
IOREMAP: remapped to 0000000004088000
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21142/DS21143 Tulip rev 65 at 0000000004088000, 00:30:6E:1C:B2:0B, IRQ 18.
IOREMAP: phys=ffffffff8a040000, size=1000
IOREMAP: remapped to 000000000408a000
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
eth1: Digital DS21142/DS21143 Tulip rev 65 at 000000000408a000, 00:30:6E:21:14:B4, IRQ 24.
IOREMAP: phys=ffffffff80080000, size=1000
IOREMAP: remapped to 000000000408c000
IOREMAP: phys=ffffffff80100000, size=1000
IOREMAP: remapped to 000000000408e000
sym0: <895> rev 0x1 at pci 0000:00:01.0 irq 19
sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking
sym0: SCSI BUS has been reset.
sym0: SCSI BUS mode change from SE to SE.
scsi0 : sym-2.2.2
sym0: SCSI BUS has been reset.
   Vendor: HP        Model: DVD-ROM 305       Rev: 1.01
   Type:   CD-ROM                             ANSI SCSI revision: 02
  target0:0:1: Beginning Domain Validation
  target0:0:1: asynchronous
  target0:0:1: FAST-20 SCSI 20.0 MB/s ST (50 ns, offset 16)
  target0:0:1: Domain Validation skipping write tests
  target0:0:1: Ending Domain Validation
   Vendor: HP        Model: C1537A            Rev: L105
   Type:   Sequential-Access                  ANSI SCSI revision: 02
  target0:0:3: Beginning Domain Validation
  target0:0:3: asynchronous
  target0:0:3: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 31)
  target0:0:3: Domain Validation skipping write tests
  target0:0:3: Ending Domain Validation
   Vendor: SEAGATE   Model: ST39103LW         Rev: HP04
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target0:0:8: tagged command queuing enabled, command queue depth 16.
  target0:0:8: Beginning Domain Validation
  target0:0:8: asynchronous
  target0:0:8: wide asynchronous
  target0:0:8: FAST-20 WIDE SCSI 40.0 MB/s ST (50 ns, offset 15)
  target0:0:8: Domain Validation skipping write tests
  target0:0:8: Ending Domain Validation
IOREMAP: phys=ffffffff80004000, size=1000
IOREMAP: remapped to 0000000004090000
IOREMAP: phys=ffffffff80001000, size=1000
IOREMAP: remapped to 0000000004092000
sym1: <875> rev 0x37 at pci 0000:00:02.0 irq 20
sym1: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym1: SCSI BUS has been reset.
scsi1 : sym-2.2.2
IOREMAP: phys=ffffffff80005000, size=1000
IOREMAP: remapped to 0000000004094000
IOREMAP: phys=ffffffff80002000, size=1000
IOREMAP: remapped to 0000000004096000
sym2: <875> rev 0x37 at pci 0000:00:02.1 irq 21
sym2: PA-RISC Firmware, ID 7, Fast-20, SE, parity checking
sym2: SCSI BUS has been reset.
scsi2 : sym-2.2.2
st: Version 20050830, fixed bufsize 32768, s/g segs 256
st 0:0:3:0: Attached scsi tape st0<4>st0: try direct i/o: yes (alignment 512 B)
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back w/ FUA
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
sda: Write Protect is off
SCSI device sda: drive cache: write back w/ FUA
  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 sda11 sda12 >
sd 0:0:8:0: Attached scsi disk sda
sr0: scsi3-mmc drive: 16x/40x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 0:0:1:0: Attached scsi generic sg0 type 5
st 0:0:3:0: Attached scsi generic sg1 type 1
sd 0:0:8:0: Attached scsi generic sg2 type 0
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: bitmap version 4.39
NET: Registered protocol family 2
IP route cache hash table entries: 262144 (order: 9, 2097152 bytes)
TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: Badness in smp_call_function at /usr/src/linux-2.6.16.1-pa10/arch/parisc/kernel/smp.c:348
Backtrace:
  [<0000000010112900>] dump_stack+0x18/0x28
  [<000000001011d9b4>] smp_call_function+0x37c/0x3c0
  [<0000000010111c5c>] flush_data_cache+0x2c/0x48
  [<00000000101109a8>] free_initmem+0x68/0x2f8
  [<000000001010fb20>] init+0x858/0x8c8
  [<000000001010347c>] ret_from_kernel_
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
        ON       OFF           OFF       ON         ON
LED State: System running normally.

processor                 system initialization      1C00

*****************************************
[snip]

(this latest 'Badness in smp_call_function ...' was there but seems to be harmless and the boot continue without showing any more 
IOREMAP info ;-) )

Hth,
	Joel

PS: btw, rm CONFIG_DETECT_SOFTLOCKUP in the config doesn't help on this system ;<(:
still hanging (this time without Softlockup msg) after only:
top - 09:04:58 up 1 day, 16:26,  3 users,  load average: 2.40, 2.26, 2.20
