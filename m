Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F466482D
	for <parisc-linux@parisc-linux.org>; Tue, 15 Jul 2003 07:58:42 -0600 (MDT)
Date: Tue, 15 Jul 2003 15:58:36 +0200
Message-ID: <3F0C2302000015C8@ocpmta2.freegates.net>
In-Reply-To: <20030714124812.GF23808@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.6.0-test1: Kernel pci bug ?
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>I've merged 2.6.0-test1 into our CVS.  I think the additional hyphen in

>2.6.0-test1-pa0 may break some scripts.
>
>This would be a great time to start reporting problems and fixing bugs

Hi Willy,

Here is my kernel dump booting today cvs update of 2.6.0-test1-p0 on a b180L:

Command line for kernel: 'root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0-test1-pa0'
Selected kernel: /vmlinux-2.6.0-test1-pa0 from partition 2
ELF32 executable
Entry 00100260 first 00100000 n 3
Segment 0 load 00100000 size 2514996 mediaptr 0x1000
Segment 1 load 00368000 size 381172 mediaptr 0x268000
Segment 2 load 003c8000 size 532608 mediaptr 0x2c6000
Branching to kernel entry point 0x00100260.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-test1-pa0 (root@fw02.office.palinux) (gcc version 3.3
(Debian)) #1 Tue Jul 15 14:55:40 CEST 2003
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005040 00000481 00000000 02020202 77d03653 100000f0 00000004 000000ba
000000ba
vers  00000018
CPUID vers 15 rev 24 (0x000001f8)
capabilities 0x2
model 9000/778/B180L
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
  DMA zone: 32768 pages, LIFO batch:8
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0-test1-pa0
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 119.60 BogoMIPS
Memory: 126024k available
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
-> /dev
-> /dev/console
-> /root
POSIX conformance testing by UNIFIX
Initializing RT netlink socket
EISA bus registered
Searching for devices...
Found devices:
1. Merlin+ 132 Dino PS/2 Port (10) at 0xfff81000 [1], versions 0x22, 0x0,
0x96
2. Phantom PseudoBC GSC+ Port (7) at 0xffc00000 [8], versions 0x504, 0x0,
0x0
3. Dino PCI Bridge (13) at 0xfff80000 [8/0], versions 0x680, 0x3, 0xa,  additional
addresses: 0xf0800000 
4. Merlin+ 132 Dino RS-232 (10) at 0xfff83000 [8/0/63], versions 0x22, 0x0,
0x8c
5. Merlin+ 180 Core BA (11) at 0xffd00000 [8/16], versions 0x3f, 0x0, 0x81,
 additional addresses: 0xffd0c000 0xffc00000 
6. Merlin+ 180 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x3f,
0x0, 0x74,  additional addresses: 0xffd01000 0xffd03000 
7. Merlin+ 180 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3f, 0x4,
0x7b
8. Merlin+ 180 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3f, 0x0,
0x8c
9. Merlin+ 180 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3f, 0x0,
0x82
10. Merlin+ 180 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x3f,
0x0, 0x84
11. Merlin+ 180 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3f,
0x0, 0x84
12. Gecko GSC Core Graphics (10) at 0xf8000000 [8/24], versions 0x16, 0x0,
0x85,  additional addresses: 0xf0011000 
13. Merlin L2+ 180 (9000/778/B180L) (0) at 0xfffbe000 [62], versions 0x504,
0x0, 0x4
14. Memory (1) at 0xfffbf000 [63], versions 0x5a, 0x0, 0x9
CPU(s): 1 x PA7300LC (PCX-L2) at 180.000000 MHz
Lasi version 0 at 0xffd00000 found.
Dino version 3.1 found at 0xfff80000
kernel BUG at arch/parisc/kernel/pci.c:338!
Kernel addresses on the stack:
 [<101245ec>] printk+0x17c/0x1bc
 [<10105938>] dump_stack+0x18/0x24
 [<101122fc>] pcibios_register_hba+0x74/0x7c
 [<103d696c>] dino_common_init+0x2c/0x1e4
 [<103d68f8>] dino_bridge_init+0x74/0xbc
 [<103d6c54>] dino_driver_callback+0x130/0x258
 [<1018a244>] sysfs_create_dir+0xcc/0x118
 [<1010dce0>] parisc_driver_probe+0x2c/0x60
 [<10216698>] bus_match+0x48/0x80
 [<102167bc>] driver_attach+0x68/0x70
 [<10216a18>] bus_add_driver+0x9c/0xac
 [<10216a20>] bus_add_driver+0xa4/0xac
 [<10216d90>] driver_register+0x48/0x54
 [<10216d90>] driver_register+0x48/0x54
 [<103d6d94>] dino_init+0x18/0x28
 [<103cd1a4>] parisc_init+0xcc/0xdc
 [<103c945c>] do_initcalls+0x58/0xdc
 [<101003f8>] init+0x2c/0x144
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

BIO: pool of 256 setup, 14Kb (56 bytes/bio)
biovec pool[0]:   1 bvecs: 244 entries (12 bytes)
biovec pool[1]:   4 bvecs: 244 entries (48 bytes)
biovec pool[2]:  16 bvecs: 244 entries (192 bytes)
biovec pool[3]:  64 bvecs: 244 entries (768 bytes)
biovec pool[4]: 128 bvecs: 122 entries (1536 bytes)
biovec pool[5]: 256 bvecs:  61 entries (3072 bytes)
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver hub
pty: 256 Unix98 ptys configured
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled
Soft power switch enabled, polling @ 0xf0140000.
lp: driver loaded but no devices found
Generic RTC Driver v1.07
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xfff83800 (irq = 106) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
Linux Tulip driver version 1.1.13 (May 11, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xff00, 00:10:83:35:2A:A9, IRQ 96.
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: 53c875 detected 
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
ERROR: SCSI host `sym53c8xx' has no error handling
ERROR: This is not a safe way to run your SCSI host
ERROR: The error handling must be added to this driver
Kernel addresses on the stack:
 [<101245ec>] printk+0x17c/0x1bc
 [<10105938>] dump_stack+0x18/0x24
 [<1023ca74>] scsi_host_alloc+0x268/0x270
 [<101245ec>] printk+0x17c/0x1bc
 [<1023ca90>] scsi_register+0x14/0x74
 [<103e0248>] ncr_attach+0x7c/0x8fc
 [<103e20b8>] ncr_get_nvram+0xa0/0xb4
 [<103e195c>] sym53c8xx_detect+0x29c/0x374
 [<101691d4>] page_symlink+0x160/0x24c
 [<101897f8>] sysfs_create+0x84/0xf0
 [<1018a5e8>] sysfs_symlink+0x6c/0x84
 [<1016f688>] d_alloc+0x34/0x1f8
 [<10176de0>] simple_lookup+0x18/0x30
 [<101709bc>] alloc_inode+0x114/0x11c
 [<101714ac>] new_inode+0x10/0x70
 [<101896e0>] sysfs_new_inode+0x20/0xb4
 [<101897f8>] sysfs_create+0x84/0xf0
 [<1018a020>] sysfs_create_file+0xcc/0xe0
 [<101e80a8>] pci_populate_driver_dir+0x30/0x38
 [<101e81b8>] pci_register_driver+0x8c/0xa8
 [<103e2d64>] init_this_scsi_driver+0x40/0xd0
 [<103c945c>] do_initcalls+0x58/0xdc
 [<101003f8>] init+0x2c/0x144
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24

sym53c875-0: ID 7, Fast-20, Parity Checking
scsi0 : sym53c8xx-1.7.3c-20010512
anticipatory scheduling elevator
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST39140WS         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
st: Version 20030622, fixed bufsize 32768, s/g segs 256
sym53c875-0-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
sym53c875-0-<5,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
sym53c875-0-<5,0>: ODD transfer in DATA IN phase.
sym53c875-0-<5,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<5,0>: ODD transfer in DATA IN phase.
sym53c875-0-<5,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<5,0>: ODD transfer in DATA IN phase.
sym53c875-0-<5,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<5,0>: ODD transfer in DATA IN phase.
sym53c875-0-<5,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<5,0>: ODD transfer in DATA IN phase.
sym53c875-0-<5,0>: COMMAND FAILED (89 0) @00021000.
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 sda9 sda10 >
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
sym53c875-0-<6,0>: ODD transfer in DATA IN phase.
sym53c875-0-<6,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<6,0>: ODD transfer in DATA IN phase.
sym53c875-0-<6,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<6,0>: ODD transfer in DATA IN phase.
sym53c875-0-<6,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<6,0>: ODD transfer in DATA IN phase.
sym53c875-0-<6,0>: COMMAND FAILED (89 0) @00021000.
sym53c875-0-<6,0>: ODD transfer in DATA IN phase.
sym53c875-0-<6,0>: COMMAND FAILED (89 0) @00021000.
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 sdb7 sdb8 sdb9 sdb10 >
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 5, lun 0,  type 0
Attached scsi generic sg1 at scsi0, channel 0, id 6, lun 0,  type 0
STI GSC/PCI core graphics driver Version 0.9a
STI word mode ROM at f0011000, hpa at f8000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
input: PS/2 keyboard port at 0xffd08000 (irq 69) found and attached
input: PS/2 mouse port at 0xffd08100 (irq 69) found and attached
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   144.000 MB/sec
   8regs_prefetch:   144.000 MB/sec
   32regs    :   169.600 MB/sec
   32regs_prefetch:   169.600 MB/sec
raid5: using function: 32regs_prefetch (169.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
oprofile: using timer interrupt.
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb10 ...
md:  adding sdb10 ...
md: sdb9 has different UUID to sdb10
md: sdb8 has different UUID to sdb10
md: sdb7 has different UUID to sdb10
md: sdb6 has different UUID to sdb10
md: sdb5 has different UUID to sdb10
md: sdb3 has different UUID to sdb10
md: sdb2 has different UUID to sdb10
md:  adding sda10 ...
md: sda9 has different UUID to sdb10
md: sda8 has different UUID to sdb10
md: sda7 has different UUID to sdb10
md: sda6 has different UUID to sdb10
md: sda5 has different UUID to sdb10
md: sda3 has different UUID to sdb10
md: sda2 has different UUID to sdb10
md: created md7
md: bind<sda10>
md: bind<sdb10>
md: running: <sdb10><sda10>
md7: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md7 active with 2 out of 2 mirrors
md: considering sdb9 ...
md:  adding sdb9 ...
md: sdb8 has different UUID to sdb9
md: sdb7 has different UUID to sdb9
md: sdb6 has different UUID to sdb9
md: sdb5 has different UUID to sdb9
md: sdb3 has different UUID to sdb9
md: sdb2 has different UUID to sdb9
md:  adding sda9 ...
md: sda8 has different UUID to sdb9
md: sda7 has different UUID to sdb9
md: sda6 has different UUID to sdb9
md: sda5 has different UUID to sdb9
md: sda3 has different UUID to sdb9
md: sda2 has different UUID to sdb9
md: created md6
md: bind<sda9>
md: bind<sdb9>
md: running: <sdb9><sda9>
md6: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md6 active with 2 out of 2 mirrors
md: considering sdb8 ...
md:  adding sdb8 ...
md: sdb7 has different UUID to sdb8
md: sdb6 has different UUID to sdb8
md: sdb5 has different UUID to sdb8
md: sdb3 has different UUID to sdb8
md: sdb2 has different UUID to sdb8
md:  adding sda8 ...
md: sda7 has different UUID to sdb8
md: sda6 has different UUID to sdb8
md: sda5 has different UUID to sdb8
md: sda3 has different UUID to sdb8
md: sda2 has different UUID to sdb8
md: created md5
md: bind<sda8>
md: bind<sdb8>
md: running: <sdb8><sda8>
md5: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md5 active with 2 out of 2 mirrors
md: considering sdb7 ...
md:  adding sdb7 ...
md: sdb6 has different UUID to sdb7
md: sdb5 has different UUID to sdb7
md: sdb3 has different UUID to sdb7
md: sdb2 has different UUID to sdb7
md:  adding sda7 ...
md: sda6 has different UUID to sdb7
md: sda5 has different UUID to sdb7
md: sda3 has different UUID to sdb7
md: sda2 has different UUID to sdb7
md: created md4
md: bind<sda7>
md: bind<sdb7>
md: running: <sdb7><sda7>
md4: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md4 active with 2 out of 2 mirrors
md: considering sdb6 ...
md:  adding sdb6 ...
md: sdb5 has different UUID to sdb6
md: sdb3 has different UUID to sdb6
md: sdb2 has different UUID to sdb6
md:  adding sda6 ...
md: sda5 has different UUID to sdb6
md: sda3 has different UUID to sdb6
md: sda2 has different UUID to sdb6
md: created md3
md: bind<sda6>
md: bind<sdb6>
md: running: <sdb6><sda6>
md3: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md3 active with 2 out of 2 mirrors
md: considering sdb5 ...
md:  adding sdb5 ...
md: sdb3 has different UUID to sdb5
md: sdb2 has different UUID to sdb5
md:  adding sda5 ...
md: sda3 has different UUID to sdb5
md: sda2 has different UUID to sdb5
md: created md2
md: bind<sda5>
md: bind<sdb5>
md: running: <sdb5><sda5>
md2: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md2 active with 2 out of 2 mirrors
md: considering sdb3 ...
md:  adding sdb3 ...
md: sdb2 has different UUID to sdb3
md:  adding sda3 ...
md: sda2 has different UUID to sdb3
md: created md1
md: bind<sda3>
md: bind<sdb3>
md: running: <sdb3><sda3>
md1: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md1 active with 2 out of 2 mirrors
md: considering sdb2 ...
md:  adding sdb2 ...
md:  adding sda2 ...
md: created md0
md: bind<sda2>
md: bind<sdb2>
md: running: <sdb2><sda2>
md0: setting max_sectors to 128, segment boundary to 32767
raid1: raid set md0 active with 2 out of 2 mirrors
md: ... autorun DONE.
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 524k freed

Stack Dump:
 17fb8598:  17fb8598 1037ffa0 17f00200 10086e40 
 17fb8588:  0003800c 00001000 17e31bac 00000000 
 17fb8578:  104758c8 000000d0 000000d0 00000001 
 17fb8568:  104758dc 104758e4 00000001 000000d0 
 17fb8558:  00027174 17fb828c 17fbf670 17fb8200 
 17fb8548:  0000000f 00027750 00000000 00000004 
 17fb8538:  00000006 00000010 00000000 10106304 
 17fb8528:  00000010 10086e40 10430a0c 17fb8488 
 17fb8518:  00000006 17ed1320 104758c8 1041f000 
 17fb8508:  000000d0 00000001 1037fec4 faf00810 
 17fb84f8:  0000005f 00000010 00000010 1013da9c 
 17fb84e8:  00000148 00000010 100300c8 10452904 
 17fb84d8:  00000056 00027750 00000000 0000000d 
 17fb84c8:  0000000e 10430980 1041f05b ffffffff 
 17fb84b8:  00000002 1033d117 ffffffff 17fb8350 
 17fb84a8:  1041f058 00000010 efbe0fa8 103855c8 
 17fb8498:  17fb828c 1037fec4 00000201 00000001 
 17fb8488:  103801e8 00000010 00000000 00000000 
 17fb8478:  17ed0000 10449840 10449840 1013dbd8 
 17fb8468:  17e31bac 17fb8210 17fb8108 00000101 
 17fb8458:  1037d000 10169704 00027174 00000000 
 17fb8448:  314307c0 10449840 00000000 1041f000 
 17fb8438:  00000000 00000000 00000000 1010a088 
 17fb8428:  105f71f8 105f70fc 00000000 16e69fa0 
 17fb8418:  1033d000 17fb828c 17fbf670 0000000a 
 17fb8408:  ffffffff ffffffff 105892a8 00000001 
 17fb83f8:  17fb82d0 10480668 1037fec4 1013a950 
 17fb83e8:  00000001 1041f000 105c5400 00000000 
 17fb83d8:  00000000 00000000 00027750 00000000 
 17fb83c8:  0c601094 0000000c 105c5400 10476730 
 17fb83b8:  00000000 40181838 10436604 101e5698 
 17fb83a8:  101e5694 00000000 00000000 00000000 
 17fb8398:  00000000 00000000 00000000 00000001 
 17fb8388:  00000000 00000001 00000001 17fb8108 
 17fb8378:  00000003 00000002 00000006 101667ec 
 17fb8368:  00000000 1036a010 17ecf820 17e31980 
 17fb8358:  00000000 10449f20 17ff5760 00000000 
 17fb8348:  00000000 00000003 00000002 1044a810 
 17fb8338:  000014f4 000006fc 00000df8 101562d8 
 17fb8328:  f0000c70 f0000194 07ffffe0 00000000 
 17fb8318:  00000000 00000001 1037fef8 0000000f 
 17fb8308:  1045b810 ffffc46a 0000000f 00000001 
 17fb82f8:  17fb8140 000000b4 103c8000 00000000 
 17fb82e8:  00000002 17ed0000 00000002 10452904 
 17fb82d8:  1037f810 00000000 00000002 17ed0000 
 17fb82c8:  00000002 00000002 10379020 f0100000 
 17fb82b8:  000000fd 000e0c48 00013000 101694b8 
 17fb82a8:  1036a010 104536cc 0000000f 00000000 
 17fb8298:  00000000 00000000 00000000 00000000 
 17fb8288:  00000000 00000000 00000000 40061097 
 17fb8278:  17fb8200 00000400 00027752 10368010 
 17fb8268:  00027752 00000000 00000000 0000000c 
 17fb8258:  000000e0 00027753 00001000 10368010 
 17fb8248:  ffffffff 00027974 10368010 1037d000 
 17fb8238:  17fbf670 00000000 00027174 10169704 
 17fb8228:  1037d000 00000001 17fb80c8 10413a20 
 17fb8218:  0000000e 0000000d 00000000 00027750 
 17fb8208:  1013063c 103ba504 0006ff0e 40011c37 
 17fb81f8:  17fb8180 17fbf670 17ed0000 101562d8 
 17fb81e8:  17ecf6a0 104307c0 10368010 10449840 
 17fb81d8:  00027174 ffffffe0 17fbf670 0000003f 
 17fb81c8:  00000040 10413a14 00000000 1037d000 
 17fb81b8:  10368010 10368010 ffffffff 1013063c 
 17fb81a8:  00020002 17ed0000 00020002 00027174 

Kernel addresses on the stack:
 [<10106008>] parisc_terminate+0x54/0xac
 [<10106304>] handle_interruption+0x2a4/0x5b4
 [<1013da9c>] buffered_rmqueue+0xd8/0x164
 [<1013dbd8>] __alloc_pages+0xb0/0x368
 [<1010a088>] intr_check_sig+0x0/0xc
 [<1013a950>] filemap_nopage+0x35c/0x3e8
 [<101e5698>] __canonicalize_funcptr_for_compare+0x3c/0x134
 [<101667ec>] may_open+0x58/0x1c8
 [<101562d8>] dentry_open+0x12c/0x1b8
 [<101694b8>] locate_fd+0x124/0x160
 [<10169704>] sys_dup+0x24/0x30
 [<101562d8>] dentry_open+0x12c/0x1b8
 [<1013063c>] do_sigaction+0xe0/0x290
 [<101062d4>] handle_interruption+0x274/0x5b4
 [<10130b44>] sys_rt_sigaction+0x7c/0xc4
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc


Kernel Fault: Code=15 regs=17fb8200 (Addr=00027750)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001110 Not tainted
r00-03  00000000 103ba504 1013063c 00027750
r04-07  00000000 0000000d 0000000e 10413a20
r08-11  17fb80c8 00000001 1037d000 10169704
r12-15  00027174 00000000 17fbf670 1037d000
r16-19  10368010 00027974 ffffffff 10368010
r20-23  00001000 00027753 000000e0 0000000c
r24-27  00000000 00000000 00027752 10368010
r28-31  00027752 00000400 17fb8200 40061097
sr0-3   00000001 00000001 00000000 00000001
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101e5694 101e5698
 IIR: 0c601094    ISR: 00000000  IOR: 00027750
 CPU:        0   CR30: 17fb8000 CR31: 103bd000
 ORIG_R28: 00000000
 IAOQ[0]: __canonicalize_funcptr_for_compare+0x38/0x134
 IAOQ[1]: __canonicalize_funcptr_for_compare+0x3c/0x134
 RP(r2): do_sigaction+0xe0/0x290

Any idea?

Joel

PS: build with gcc-3.3-2 and binutils-2.13.90.0.18-1 ?

------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 
