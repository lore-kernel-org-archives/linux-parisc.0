Return-Path: <soete.joel@tiscali.be>
Received: from spoolo1.tiscali.be (spoolo1.tiscali.be [62.235.13.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DC4848E4
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 02:34:45 -0700 (MST)
Message-ID: <40542786.8050302@tiscali.be>
Date: Sun, 14 Mar 2004 09:36:06 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] 2.6.4-pa2 panic on c110 :(
References: <405397F3.1050406@tiscali.be>
	<20040314010400.GB26705@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20040314010400.GB26705@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Matthew Wilcox wrote:
> On Sat, Mar 13, 2004 at 11:23:31PM +0000, Joel Soete wrote:
> 
>>I just compile successfully (with defconfig) and seems to boot fine the 
>>last 2.6.4-pa2 kernel on my C110.
>>But as I was starting a rm -rf glibc it panics with console message:
>>arq->state 2
>>Badness in as_requeue_request at drivers/block/as-iosched.c:1479
>>Kernel addresses on the stack:
>>[<10125de8>] printk+0x188/0x1c8
>>[<10105938>] dump_stack+0x18/0x24
>>[<10229688>] as_requeue_request+0x64/0x10c
>>[<102205b0>] elv_requeue_request+0x2c/0x38
>>[<102232bc>] blk_insert_request+0xfc/0x104
>>[<1024cd30>] scsi_queue_insert+0x68/0x9c
>>[<102491ec>] scsi_softirq+0xfc/0x11c
>>[<10170560>] sys_select+0x1d0/0x3b8
>>[<101299c8>] do_softirq+0xf4/0xf8
>>[<1010c1e4>] syscall_do_softirq+0x8/0x10
>>[<1010b088>] intr_check_sig+0x0/0xc 
> 
> 
> That's not good.  First, is this reproducable?
> Second, can you back down to 2.6.4-pa1 and see if that fixes your problem?
Unfortunately no :(; the same crash:
  arq->state 2
Badness in as_requeue_request at drivers/block/as-iosched.c:1479
Kernel addresses on the stack:
  [<10125de8>] printk+0x188/0x1c8
  [<10105938>] dump_stack+0x18/0x24
  [<102296c8>] as_requeue_request+0x64/0x10c
  [<102205f0>] elv_requeue_request+0x2c/0x38
  [<102232fc>] blk_insert_request+0xfc/0x104
  [<1024cd70>] scsi_queue_insert+0x68/0x9c
  [<1019e3a0>] __ext3_journal_stop+0x2c/0x64
  [<1024922c>] scsi_softirq+0xfc/0x11c
  [<101299c8>] do_softirq+0xf4/0xf8
  [<1010c1e4>] syscall_do_softirq+0x8/0x10
  [<1010b088>] intr_check_sig+0x0/0xc

> 
> Your C110 uses the lasi710 and zalon drivers, right?  sym2's not involved
> at all, is it?
> 
Yes as far I can read in boot dmesg:
[snip]
Linux version 2.6.4-pa1 (root@hpalin) (gcc version 3.3.3 (Debian 20040306)) #2 Sun Mar 14 09:534FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 000058e0 00000481 00000000 00000002 77e47570 100000f1 00000004 0000008a 0000008a
vers  0000000d
CPUID vers 11 rev 13 (0x0000016d)
model 9000/777/C110
Total Memory: 128 Mb
On node 0 totalpages: 32768
   DMA zone: 32768 pages, LIFO batch:8
   Normal zone: 0 pages, LIFO batch:1
   HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.6.4-1PID hash table entries: 16 (order 
4: 128 bytes)
Console: colour dummy device 160x64
Memory: 125948k available
Calibrating delay loop... 119.60 BogoMIPS
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0x7, 0x580, 0x0000b }
2. SkyHawk 100/120 FW-SCSI at 0xf3f8c000 [8/12] { 4, 0x0, 0x01f, 0x00089 }
3. Raven T' Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x032, 0x00081 },  additional addresses: 0x 4. Raven T' Core Centronics at 
0xffd02000 [8/16/0] { 10, 0x0, 0x032, 0x00074 },  additional add 5. Raven T' Audio at 0xffd04000 [8/16/1] { 10, 0x0, 0x032, 0x0007b }
6. Raven T' Lasi Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x032, 0x0008c }
7. Raven T' Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x032, 0x00082 }
8. Raven T' Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x032, 0x0008a }
9. Raven T' Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x032, 0x00084 }
10. Raven T' Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x032, 0x00084 }
11. Raven T' Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x032, 0x00083 }
12. Raven T' Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x01e, 0x0008e },  additional addresses: 0x 13. Raven T' Wax HIL at 0xffe01000 
[8/20/1] { 10, 0x0, 0x01e, 0x00073 }
14. Raven T' Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x01e, 0x0008c }
15. Raven T' Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x01e, 0x00090 },  additional addres 16. U2-IOA BC GSC+ Port at 
0xf3fbf000 [8/63] { 7, 0x1, 0x501, 0x0000c },  additional addresses: 17. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 
0x580, 0x0000b }
18. Raven T' GSC Core Graphics at 0xf4000000 [10/16] { 10, 0x0, 0x032, 0x00085 },  additional a 19. U2-IOA BC GSC+ Port at 
0xf3fff000 [10/63] { 7, 0x1, 0x501, 0x0000c }
20. Raven 120 T' at 0xfffa0000 [32] { 0, 0x0, 0x58e, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM: cannot register misc device.
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC0E1 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver hub
STI GSC/PCI core graphics driver Version 0.9a
     id 2b4ded6d-40a00499, conforms to spec rev. 8.04
     graphics card name: HPA208LC1024
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0xf4100000
ikconfig 0.7 with /proc/config*
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 128x48
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xffd07000, IRQ 87
eth%d: 82596 at 0xffd07000, 00 60 B0 07 1E EA IRQ 87.
82596.c $Revision: 1.29 $
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
zalon_probe: Zalon vers field is 0x1, IRQ 34
ncr53c720-0: rev 0xf irq 34
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3e
Using anticipatory io scheduler
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
st: Version 20040213, fixed bufsize 32768, s/g segs 256
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sda: drive cache: write back
  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 >
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
SCSI device sdb: drive cache: write back
  sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 >
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
Console: switching to colour frame buffer device 128x48
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
    8regs     :    85.200 MB/sec
    8regs_prefetch:    84.800 MB/sec
    32regs    :    94.000 MB/sec
    32regs_prefetch:    98.800 MB/sec
raid5: using function: 32regs_prefetch (98.800 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET: Registered protocol family 1
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb8 ...
md:  adding sdb8 ...
md: sdb7 has different UUID to sdb8

Thanks for your attention,
	Joel
