Return-Path: <soete.joel@tiscali.be>
Received: from spoolo3.tiscali.be (spoolo3.tiscali.be [62.235.13.169])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE377486C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 21 Mar 2004 06:17:07 -0700 (MST)
Message-ID: <405D95D0.9030600@tiscali.be>
Date: Sun, 21 Mar 2004 13:17:04 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: PA-RISC Linux Port <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] 2.6.5-rc2-pa2 boot panic on c110 :(
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I just co last cvs kernel 2.6.5-rc2-pa2 and rebuild it last b180 config file on my c110 but still boot panic with following dmesg:
Linux version 2.6.5-rc2-pa2 (root@hpalin) (gcc version 3.3.3 (Debian 20040306)) #1 Sun Mar 21 13:27:53 CET 2004
FP[0] enabled: Rev 1 Model 11
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
Built 1 zonelists
Kernel command line: root=/dev/md2 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/vmlinux-2.6.5-rc2-pa2
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Memory: 126200k available
Calibrating delay loop... 119.60 BogoMIPS
Security Scaffold v1.0.0 initialized
Capability LSM initialized
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
3. Raven T' Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x032, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000
4. Raven T' Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x032, 0x00074 },  additional addresses: 0xffd01000 0xffd03000
5. Raven T' Audio at 0xffd04000 [8/16/1] { 10, 0x0, 0x032, 0x0007b }
6. Raven T' Lasi Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x032, 0x0008c }
7. Raven T' Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0, 0x032, 0x00082 }
8. Raven T' Core LAN (802.3) at 0xffd07000 [8/16/6] { 10, 0x0, 0x032, 0x0008a }
9. Raven T' Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x032, 0x00084 }
10. Raven T' Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x032, 0x00084 }
11. Raven T' Core PC Floppy at 0xffd0a000 [8/16/10] { 10, 0x0, 0x032, 0x00083 }
12. Raven T' Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x01e, 0x0008e },  additional addresses: 0xffe03000 0xffe06000
13. Raven T' Wax HIL at 0xffe01000 [8/20/1] { 10, 0x0, 0x01e, 0x00073 }
14. Raven T' Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x01e, 0x0008c }
15. Raven T' Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x01e, 0x00090 },  additional addresses: 0xffc88400 0xf4000000
16. U2-IOA BC GSC+ Port at 0xf3fbf000 [8/63] { 7, 0x1, 0x501, 0x0000c },  additional addresses: 0xf3f80000
17. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0x7, 0x580, 0x0000b }
18. Raven T' GSC Core Graphics at 0xf4000000 [10/16] { 10, 0x0, 0x032, 0x00085 },  additional addresses: 0xf0069000
19. U2-IOA BC GSC+ Port at 0xf3fff000 [10/63] { 7, 0x1, 0x501, 0x0000c }
20. Raven 120 T' at 0xfffa0000 [32] { 0, 0x0, 0x58e, 0x00004 }
21. Memory at 0xfffb1000 [49] { 1, 0x0, 0x049, 0x00009 }
CPU(s): 1 x PA7200 (PCX-T') at 120.000000 MHz
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM: cannot register misc device.
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC0E1 detected.
EISA: Detected 0 cards.
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a
     id 2b4ded6d-40a00499, conforms to spec rev. 8.04
     graphics card name: HPA208LC1024
fb0: stifb 1024x768-8 frame buffer device, HPA208LC1024, id: 2b4ded6d, mmio: 0xf4100000
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
loop: loaded (max 8 devices)
PPP generic driver version 2.4.2

Stack Dump:
  10594718:  10594718 1035c010 00000000 39158180
  10594708:  1042dc80 1035b1c8 1035d7c4 10368270
  105946f8:  00000004 00002e92 00002e94 1014133c
  105946e8:  100fe640 17fdf080 fffffff4 100fe64c
  105946d8:  1035d7c4 1035d7c4 000000b5 00000000
  105946c8:  10594380 0000001a 00000000 10368270
  105946b8:  00000004 00002e89 00002e92 1010401c
  105946a8:  1035c010 00000000 39158180 1042dc80
  10594698:  1035b1c8 1035d7c4 000000b5 00000001
  10594688:  1035db0c 17fe9a50 000000d0 17ff8b2c
  10594678:  00000000 17ff8b2c 000000d0 00000001
  10594668:  00000001 000000d0 1042dc80 1035b1c8
  10594658:  3b9aca00 ffd06100 17f390c0 1036e578
  10594648:  17fdd600 17fe9a50 00000010 17ff8ab8
  10594638:  00000080 17ff8ab8 000000d0 101414c8
  10594628:  00000001 000000d0 100d7084 17ff8ab8
  10594618:  100d7040 100e4000 100d7f38 100d7f38
  10594608:  00000001 000000d0 000000d0 17ff8ab8
  105945f8:  00000040 17ff8ab8 000000d0 1014492c
  105945e8:  00000001 000000d0 1042dc80 1035b1c8
  105945d8:  3b9aca00 1035d010 1042d810 00000001
  105945c8:  1035db0c 17fe9a50 00000010 10031640
  105945b8:  105f2400 10444404 1036f010 10109088
  105945a8:  10445010 00000000 1035e810 10594408
  10594598:  17ff2b20 00000000 000000f3 0098963a
  10594588:  39158180 1042dc80 fffffff4 17ff8ab8
  10594578:  00000000 17ff8ab8 000000d0 10174e34
  10594568:  00000001 00000000 17ff2b20 10594408
  10594558:  00000000 00000000 00000000 00000000
  10594548:  0e601096 0000000e 100e46c0 10368270
  10594538:  00000004 17fedd00 10594388 103bdd20
  10594528:  103bdd1c 00000000 00000000 00000000
  10594518:  00000000 00000000 00000000 00000000
  10594508:  00000000 00000000 00000000 00000000
  105944f8:  41000000 00000000 40800000 00000000
  105944e8:  40000000 00000000 40000000 7fffffff
  105944d8:  41800000 00000000 40200000 00000000
  105944c8:  40200000 00000000 40300000 00000000
  105944b8:  41000000 00000000 40800000 7fffffff
  105944a8:  7fffffff 00000000 41000000 7fffffff
  10594498:  7fffffff 00000800 00000400 00000200
  10594488:  00000100 00000080 00000040 00000000
  10594478:  00000000 00000010 00000010 00000000
  10594468:  41800000 25b7ea20 45e69c6a 00000000
  10594458:  00000000 e0000000 43ebebeb ffffffff
  10594448:  7f7fffff 00000020 00000010 00000000
  10594438:  00000000 00000000 00000000 00000000
  10594428:  00000000 00000000 00000000 00000000
  10594418:  0000001f 00000000 0000001f 00000000
  10594408:  0000001f 00000000 000b0800 1010cb30
  105943f8:  10594380 3a699d00 17f390c0 10346010
  105943e8:  17fdd688 00000000 ffffffff 00000000
  105943d8:  17f3910c 00000000 00000000 00000000
  105943c8:  f00000a4 f00000ac f00010f4 1042d810
  105943b8:  1035d010 3b9aca00 1035b1c8 1042dc80
  105943a8:  ffffffff 00000000 000000f3 17fdd688
  10594398:  17fdd600 1036e578 17f390c0 ffd06100
  10594388:  103bdbe8 1042b010 0004ff0f 10368270
  10594378:  00000004 00002f25 00002f42 103bdbcc
  10594368:  10364178 00000400 1042e810 1036dab4
  10594358:  103641c4 1035c010 00000000 1036e5a0
  10594348:  1036e5a0 10348544 1036e5a0 10368270
  10594338:  00000004 00002f73 00002f94 101907c4
  10594328:  1036dab8 1036dab8 00000014 1036dab4

Kernel addresses on the stack:
  [<101242ac>] call_console_drivers+0xd4/0x17c
  [<10103d68>] parisc_terminate+0x60/0xb4
  [<1014133c>] buffered_rmqueue+0xfc/0x1bc
  [<1010401c>] handle_interruption+0x260/0x560
  [<101414c8>] __alloc_pages+0xcc/0x378
  [<1014492c>] cache_init_objs+0xb0/0xb8
  [<10109088>] intr_check_sig+0x0/0xc
  [<10174e34>] d_alloc+0x34/0x1f0
  [<103bdd20>] lasi700_probe+0x190/0x1cc
  [<103bdbcc>] lasi700_probe+0x3c/0x1cc
  [<101907c4>] sysfs_create_dir+0x3c/0x80
  [<1010cb30>] parisc_driver_probe+0x2c/0x60
  [<102197c8>] bus_match+0x4c/0x84
  [<10219934>] driver_attach+0x80/0xa8
  [<101e8498>] kobject_register+0x28/0x64
  [<10219c10>] bus_add_driver+0xac/0xbc
  [<101e83cc>] kobject_add+0x54/0xf8
  [<10219fc0>] driver_register+0x44/0x50
  [<103bdb6c>] NCR_700_init+0x18/0x3c
  [<103a9384>] do_initcalls+0x58/0xfc
  [<101001d0>] init+0x28/0xd0
  [<10108c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=10594380 (Addr=00000000)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1042b010 103bdbe8 ffd06100
r04-07  17f390c0 1036e578 17fdd600 17fdd688
r08-11  000000f3 00000000 ffffffff 1042dc80
r12-15  1035b1c8 3b9aca00 1035d010 1042d810
r16-19  f00010f4 f00000ac f00000a4 00000000
r20-23  00000000 00000000 17f3910c 00000000
r24-27  ffffffff 00000000 17fdd688 10346010
r28-31  17f390c0 3a699d00 10594380 1010cb30
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 103bdd1c 103bdd20
  IIR: 0e601096    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 10594000 CR31: 103a0000
  ORIG_R28: 00000004
  IAOQ[0]: lasi700_probe+0x18c/0x1cc
  IAOQ[1]: lasi700_probe+0x190/0x1cc
  RP(r2): lasi700_probe+0x58/0x1cc

hth,
	Joel
