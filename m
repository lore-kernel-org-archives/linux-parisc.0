Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2392487A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Oct 2003 09:20:48 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 1A5Rja-0004Kl-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 03 Oct 2003 17:20:46 +0200
Date: Fri, 3 Oct 2003 17:20:46 +0200
Message-ID: <3F5CB6FB0000CBFC@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] 2.6.0-test6-pa6 on b2k finaly crash
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

Hi all,

First of all 2.6.0-test6-pa6 still run find on the b180 :) and led front
panel are flickering once more :)

I am also happy that with 2.6.0-test6-pa6 b2k crash because it is a long
time that I try to obtain a relevant info (even toc do not help until now).
And here is the full boot messages:

Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=3/vmlinux-2.6.0-test6-pre6'
Selected kernel: /vmlinux-2.6.0-test6-pre6 from partition 3
ERROR: open /vmlinux-2.6.0-test6-pre6 from partition 3 failed
 palo_kernel=3/vmlinux-2.6.0-test6-pa6
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Memory: 255656k available
Calibrating delay loop... 799.53 BogoMIPS
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Kazoo W+ (0) at 0xfffa0000 [32], versions 0x5d0, 0x0, 0x4
5. Memory (1) at 0xfed10200 [49], versions 0x9d, 0x0, 0x9
CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR4.0 (0x5) found at 0xfed30000
PCI: Ignoring BAR0-3 of IDE controller 0000:00:0e.0
lba version TR4.0 (0x5) found at 0xfed32000
SCSI subsystem initialized
drivers/usb/core/usb.c: registered new driver hub
ikconfig 0.7 with /proc/config*
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0400804.
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled

Stack Dump:
 10068758:  10068758 00000204 0000000f 00000000 
 10068748:  10389f44 00000000 10389f44 000000d0 
 10068738:  1fff9ba0 000000d0 00000001 1013f724 
 10068728:  00000001 000000d0 3b9aca00 10389810 
 10068718:  10458810 10389f44 00000201 100683c0 
 10068708:  0000000d 00000000 00000000 000000d0 
 100686f8:  1fff9ba0 000000d0 00000001 101067fc 
 100686e8:  00000001 00000000 1038a810 10068548 
 100686d8:  1ffe3f00 10389f44 00000201 00000001 
 100686c8:  1038a280 1006f7b0 00000010 000000d0 
 100686b8:  1fff9b2c 000000d0 00000001 1013f880 
 100686a8:  00000001 00000000 0000000b 1fff9b2c 
 10068698:  1fe08060 1046d0c4 00000000 10068288 
 10068688:  00000013 00000060 1fff9b2c 000000d0 
 10068678:  1fff9b2c 000000d0 00000001 10142d2c 
 10068668:  00000001 000000d0 3b9aca00 10389810 
 10068658:  10458810 f0400004 f00008c4 00000000 
 10068648:  1ffea300 1ffe3f00 1fff8400 000000d0 
 10068638:  1fff9b2c 000000d0 00000001 1013fb48 
 10068628:  00000001 000000d0 3b9aca00 10389810 
 10068618:  10389f44 1fe08060 1fff9b2c 000000d0 
 10068608:  1fe08000 000000d0 00000001 1006f7b0 
 100685f8:  10459010 1047662c 00000027 1010b088 
 100685e8:  10390ac8 00000000 0000001b 1fffdc60 
 100685d8:  1fff9b38 1fff9b2c 1ffe3f00 068e7780 
 100685c8:  3f7d9b03 1fe0bbd4 00400048 000000d0 
 100685b8:  1fff9b2c 000000d0 00000001 1018c78c 
 100685a8:  00000001 00000000 1038a810 10068408 
 10068598:  1fff4a80 00000000 1a06836c 10240000 
 10068588:  b3202000 0000000f fffffff4 1006f7b0 
 10068578:  10459010 00000000 1006cb70 101e9310 
 10068568:  101e930c 00000000 00000000 00000000 
 10068558:  00000000 00000000 00000000 00000000 
 10068548:  00000000 00000000 00000000 55555555 
 10068538:  55555555 55555555 55555555 55555555 
 10068528:  55555555 55555555 55555555 55555555 
 10068518:  55555555 55555555 55555555 55555555 
 10068508:  55555555 55555555 55555555 55555555 
 100684f8:  55555555 55555555 55555555 55555555 
 100684e8:  55555555 55555555 55555555 55555555 
 100684d8:  55555555 55555555 55555555 55555555 
 100684c8:  55555555 55555555 55555555 55555555 
 100684b8:  55555555 55555555 55555555 55555555 
 100684a8:  55555555 55555555 55555555 55555555 
 10068498:  55555555 55555555 55555555 55555555 
 10068488:  55555555 55555555 55555555 55555555 
 10068478:  55555555 55555555 55555555 55555555 
 10068468:  55555555 00000000 00000000 00000000 
 10068458:  0000001f 00000000 0000001f 00000000 
 10068448:  0000001f 24850e06 04100800 10210928 
 10068438:  100683c0 068e7780 00000000 10372010 
 10068428:  00000000 00000000 00000000 00000000 
 10068418:  00000cb0 41000000 00000000 00009600 
 10068408:  f0000174 f000017c f00008c4 f0400004 
 100683f8:  10458810 10389810 3b9aca00 10458884 
 100683e8:  37e45480 00000000 00000027 10388810 
 100683d8:  00000013 10068288 00000000 1046d0c4 
 100683c8:  10215854 ffffffff 0004ff0f 000000d0 
 100683b8:  104768c8 000000d0 00000001 1018d3cc 
 100683a8:  00000001 000000d0 10355e84 1046d0c4 
 10068398:  103952b8 10068288 00000013 10388810 
 10068388:  00000027 00000000 37e45480 000000d0 
 10068378:  10476610 000000d0 00000001 10215904 
 10068368:  00000001 00400048 10068248 1fe0bc14 

Kernel addresses on the stack:
 [<10142d2c>] cache_init_objs+0xb8/0xc0
 [<10106220>] parisc_terminate+0x60/0xb8
 [<1013f724>] buffered_rmqueue+0xd8/0x164
 [<101067fc>] handle_interruption+0x584/0x5bc
 [<1013f880>] __alloc_pages+0xd0/0x374
 [<10142d2c>] cache_init_objs+0xb8/0xc0
 [<1013fb48>] __get_free_pages+0x24/0x78
 [<1010b088>] intr_check_sig+0x0/0xc
 [<1018c78c>] sysfs_new_inode+0x20/0xb0
 [<101e9310>] $$divU+0x10/0x210
 [<1018d3cc>] sysfs_create_dir+0x3c/0x80
 [<10215904>] serial8250_set_termios+0xa4/0x314
 [<101e56a8>] create_dir+0x4c/0x64
 [<103e5a7c>] uart_set_options+0xec/0x14c
 [<1021ba68>] driver_attach+0x70/0xa4
 [<103e5cd8>] serial8250_console_setup+0xa8/0xbc
 [<1021bcf8>] bus_add_driver+0xa0/0xa8
 [<10126388>] register_console+0x1b0/0x214
 [<1021c05c>] driver_register+0x48/0x54
 [<103e5d0c>] serial8250_console_init+0x20/0x30
 [<103e65fc>] serial8250_pci_init+0x38/0x68
 [<103d5438>] do_initcalls+0x58/0xdc
 [<10100440>] init+0x28/0xd4
 [<1010ac5c>] ret_from_kernel_thread+0x1c/0x24


Unexpected interruption: Code=13 regs=100683c0 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 ffffffff 10215854 1046d0c4
r04-07  00000000 10068288 00000013 10388810
r08-11  00000027 00000000 37e45480 10458884
r12-15  3b9aca00 10389810 10458810 f0400004
r16-19  f00008c4 f000017c f0000174 00009600
r20-23  00000000 41000000 00000cb0 00000000
r24-27  00000000 00000000 00000000 10372010
r28-31  00000000 068e7780 100683c0 10210928
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101e930c 101e9310
 IIR: b3202000    ISR: 10240000  IOR: 1a06836c
 CPU:        0   CR30: 10068000 CR31: 103cb000
 ORIG_R28: 10459010
 IAOQ[0]: $$divU+0xc/0x210
 IAOQ[1]: $$divU+0x10/0x210
 RP(r2): serial8250_get_divisor+0x44/0x50

hth,
    joel

PS: kernel was build with 'make defconfig' configuration and gcc:
palinux:~# gcc --version
gcc (GCC) 3.3.2 20030908 (Debian prerelease)
Copyright (C) 2003 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
