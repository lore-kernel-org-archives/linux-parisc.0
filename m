Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id D43174864
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 09:08:53 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1002553729.3bc1c18187924@webmail.tiscalinet.be>
Date: Mon, 08 Oct 2001 17:08:49 +0200 (CEST)
From: joel.soete@freebel.net
Cc: debian-hppa@lists.debian.org, lvm-bugs@sistina.com
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I just co the last cvs of kernel 2.4.9-pa42 and everything seems to work find as 
well as on model 712 as on model B180.

Then I try to have a look into LVM (last 1.0.1-rc4)on the B180:
no error at compile time neither for kernel neither for tools (just warning: 
pv_read_all_pv_of_vg.c:129: warning: deprecated use of label at end of compound 
statement)

Then I try first to do a 'pvcreate /dev/sdb' which failed:
vpcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

Also I excute 'vgscan':
Segmentation fault.

Here is my last kernel log:
Oct  8 17:01:44 palinux kernel: klogd 1.4.1#2, log source = /proc/kmsg started.
Oct  8 17:01:44 palinux kernel: Inspecting /boot/System.map-2.4.9-pa42
Oct  8 17:01:46 palinux kernel: Loaded 24521 symbols from 
/boot/System.map-2.4.9-pa42.
Oct  8 17:01:46 palinux kernel: Symbols match kernel version 2.4.9.
Oct  8 17:01:46 palinux kernel: No module symbols loaded - kernel modules not 
enabled. 
Oct  8 17:01:46 palinux kernel: Linux version 2.4.9-pa42 (root@palinux) (gcc 
version 3.0 (Debian)) #2 Mon Oct 8 15:47:51 CEST 2001
Oct  8 17:01:46 palinux kernel: FP[0] enabled: Rev 1 Model 15
Oct  8 17:01:46 palinux kernel: The 32-bit Kernel has started...
Oct  8 17:01:46 palinux kernel: Determining PDC firmware type: System Map.
Oct  8 17:01:46 palinux kernel: model^I00005040 00000481 00000000 02020202 
77ea2456 100000f0 00000004 000000ba 000000ba
Oct  8 17:01:46 palinux kernel: vers^I00000018
Oct  8 17:01:46 palinux kernel: cpuid^I000001f8
Oct  8 17:01:46 palinux kernel: CPUID^Ivers 15 rev 24
Oct  8 17:01:46 palinux kernel: model^I9000/778/B180L
Oct  8 17:01:46 palinux kernel: Total Memory: 128 Mb
Oct  8 17:01:46 palinux kernel: pagetable_init
Oct  8 17:01:46 palinux kernel: On node 0 totalpages: 32768
Oct  8 17:01:46 palinux kernel: zone(0): 32768 pages.
Oct  8 17:01:46 palinux kernel: zone(1): 0 pages.
Oct  8 17:01:46 palinux kernel: zone(2): 0 pages.
Oct  8 17:01:46 palinux kernel: Kernel command line: root=/dev/sda3 HOME=/ 
console=tty0 sti=0 sti_font=VGA8x16 TERM=linux
Oct  8 17:01:46 palinux kernel: Console: colour dummy device 160x64
Oct  8 17:01:46 palinux kernel: Calibrating delay loop... 119.60 BogoMIPS
Oct  8 17:01:46 palinux kernel: Memory: 126052k available
Oct  8 17:01:46 palinux kernel: Dentry-cache hash table entries: 16384 (order: 
5, 131072 bytes)
Oct  8 17:01:46 palinux kernel: Inode-cache hash table entries: 8192 (order: 4, 
65536 bytes)
Oct  8 17:01:46 palinux kernel: Mount-cache hash table entries: 2048 (order: 2, 
16384 bytes)
Oct  8 17:01:46 palinux kernel: Buffer-cache hash table entries: 4096 (order: 2, 
16384 bytes)
Oct  8 17:01:46 palinux kernel: Page-cache hash table entries: 32768 (order: 5, 
131072 bytes)
Oct  8 17:01:46 palinux kernel: POSIX conformance testing by UNIFIX
Oct  8 17:01:46 palinux kernel: Searching for devices...
Oct  8 17:01:46 palinux kernel: Found devices:
Oct  8 17:01:46 palinux kernel: 1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, 
versions 0x504, 0x0, 0x0
Oct  8 17:01:46 palinux kernel: 2. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, 
versions 0x22, 0x0, 0x8c
Oct  8 17:01:46 palinux kernel: 3. Merlin L2+ 180 (9000/778/B180L) (0) at 
0xfffbe000, versions 0x504, 0x0, 0x4
Oct  8 17:01:46 palinux kernel: 4. Merlin+ L2 180 (1) at 0xfffbf000, versions 
0x5a, 0x0, 0x9
Oct  8 17:01:46 palinux kernel: 5. Merlin+ 180 Core BA (11) at 0xffd00000, 
versions 0x3f, 0x0, 0x81,  additional addresses: 0xffc00000 
Oct  8 17:01:46 palinux kernel: 6. Merlin+ 180 Core RS-232 (10) at 0xffd05000, 
versions 0x3f, 0x0, 0x8c
Oct  8 17:01:46 palinux kernel: 7. Merlin+ 180 Core SCSI (10) at 0xffd06000, 
versions 0x3f, 0x0, 0x82
Oct  8 17:01:46 palinux kernel: 8. Merlin+ 180 Core Centronics (10) at 
0xffd02000, versions 0x3f, 0x0, 0x74,  additional addresses: 0xffd03000 
Oct  8 17:01:46 palinux kernel: 9. Merlin+ 180 Core Audio (10) at 0xffd04000, 
versions 0x3f, 0x4, 0x7b
Oct  8 17:01:46 palinux kernel: 10. Merlin+ 180 Core PS/2 Port (10) at 
0xffd08000, versions 0x3f, 0x0, 0x84
Oct  8 17:01:46 palinux kernel: 11. Merlin+ 180 Core PS/2 Port (10) at 
0xffd08100, versions 0x3f, 0x0, 0x84
Oct  8 17:01:46 palinux kernel: 12. Gecko GSC Core Graphics (10) at 0xf8000000, 
versions 0x16, 0x0, 0x85
Oct  8 17:01:46 palinux kernel: 13. Dino PCI Bridge (13) at 0xfff80000, versions 
0x680, 0x3, 0xa
Oct  8 17:01:46 palinux kernel: 14. Merlin+ 132 Dino PS/2 Port (10) at 
0xfff81000, versions 0x22, 0x0, 0x96
Oct  8 17:01:46 palinux kernel: That's a total of 14 devices.
Oct  8 17:01:46 palinux kernel: CPU(s): 1 x PA7300LC (PCX-L2) at 180.000000 MHz
Oct  8 17:01:46 palinux kernel: Dino version 3.1 found at 0xfff80000
Oct  8 17:01:46 palinux kernel: Lasi version 0 at 0xffd00000 found.
Oct  8 17:01:46 palinux kernel: LED display at ffd0c000 registered
Oct  8 17:01:46 palinux kernel: Linux NET4.0 for Linux 2.4
Oct  8 17:01:46 palinux kernel: Based upon Swansea University Computer Society 
NET3.039
Oct  8 17:01:46 palinux kernel: Starting kswapd v1.8
Oct  8 17:01:46 palinux kernel: parport_init_chip: initialize 
bidirectional-mode.
Oct  8 17:01:46 palinux kernel: parport0: PC-style at 0xffd02800, irq 152 
[PCSPP,TRISTATE]
Oct  8 17:01:46 palinux kernel: STI word mode ROM at f0011000, hpa=f8000000
Oct  8 17:01:46 palinux kernel: STI word mode ROM, id 2d08c0a7-9a02587, conforms 
to spec rev. 8.07
Oct  8 17:01:46 palinux kernel: STI device: INTERNAL_EG_1280
Oct  8 17:01:46 palinux kernel: pty: 256 Unix98 ptys configured
Oct  8 17:01:46 palinux kernel: Serial driver version 5.05c (2001-07-08) with 
MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Oct  8 17:01:46 palinux kernel: ttyS00 at iomem 0xffd05800 (irq = 154) is a 
16550A
Oct  8 17:01:46 palinux kernel: ttyS01 at iomem 0xfff83800 (irq = 74) is a 
16550A
Oct  8 17:01:46 palinux kernel: PS/2 keyboard port at 0xffd08000 (irq 133) 
found, device attached.
Oct  8 17:01:46 palinux kernel: PS/2 psaux port at 0xffd08100 (irq 133) found, 
device attached.
Oct  8 17:01:46 palinux kernel: lp0: using parport0 (interrupt-driven).
Oct  8 17:01:46 palinux kernel: Generic RTC Driver v1.02 05/27/1999 Sam Creasey 
(sammy@oh.verio.com)
Oct  8 17:01:46 palinux kernel: block: 128 slots per queue, batch=16
Oct  8 17:01:46 palinux kernel: RAMDISK driver initialized: 16 RAM disks of 
4096K size 1024 blocksize
Oct  8 17:01:46 palinux kernel: loop: loaded (max 8 devices)
Oct  8 17:01:46 palinux kernel: Linux Tulip driver version 0.9.15-pre6 (July 2, 
2001)
Oct  8 17:01:46 palinux kernel: tulip0: no phy info, aborting mtable build
Oct  8 17:01:46 palinux kernel: tulip0:  MII transceiver #1 config 1000 status 
782d advertising 01e1.
Oct  8 17:01:46 palinux kernel: eth0: Digital DS21143 Tulip rev 65 at 0xff00, 
00:10:83:65:09:4B, IRQ 64.
Oct  8 17:01:46 palinux kernel: SCSI subsystem driver Revision: 1.00
Oct  8 17:01:46 palinux kernel: sym53c8xx: at PCI bus 0, device 19, function 0
Oct  8 17:01:46 palinux kernel: sym53c8xx: 53c875 detected 
Oct  8 17:01:46 palinux kernel: sym53c875-0: rev 0x4 on pci bus 0 device 19 
function 0 irq 67
Oct  8 17:01:46 palinux kernel: sym53c875-0: ID 7, Fast-20, Parity Checking
Oct  8 17:01:46 palinux kernel: scsi0 : sym53c8xx-1.7.3c-20010512
Oct  8 17:01:46 palinux kernel:   Vendor: SEAGATE   Model: ST39140WS         
Rev: HP03
Oct  8 17:01:46 palinux kernel:   Type:   Direct-Access                      
ANSI SCSI revision: 02
Oct  8 17:01:46 palinux kernel: sim700: Configuring 53c710 (SCSI-ID 7) at 
ffd06100, IRQ 150, options 0
Oct  8 17:01:46 palinux kernel: scsi1: Revision 0x2
Oct  8 17:01:46 palinux kernel: scsi1: test 1 completed ok.
Oct  8 17:01:46 palinux kernel: scsi1 : LASI/Simple 53c7xx
Oct  8 17:01:46 palinux kernel:   Vendor: SEAGATE   Model: ST32151N          
Rev: HP02
Oct  8 17:01:46 palinux kernel:   Type:   Direct-Access                      
ANSI SCSI revision: 02
Oct  8 17:01:46 palinux kernel: Attached scsi disk sda at scsi0, channel 0, id 
6, lun 0
Oct  8 17:01:46 palinux kernel: Attached scsi disk sdb at scsi1, channel 0, id 
0, lun 0
Oct  8 17:01:46 palinux kernel: sym53c875-0-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s 
(50.0 ns, offset 15)
Oct  8 17:01:46 palinux kernel: SCSI device sda: 17773524 512-byte hdwr sectors 
(9100 MB)
Oct  8 17:01:46 palinux kernel: Partition check:
Oct  8 17:01:46 palinux kernel:  sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 >
Oct  8 17:01:46 palinux kernel: SCSI device sdb: 4194685 512-byte hdwr sectors 
(2148 MB)
Oct  8 17:01:46 palinux kernel:  sdb: unknown partition table
Oct  8 17:01:46 palinux kernel: Lasi Harmony Audio rev. 0 at 0xffd04000, using 
IRQ 146
Oct  8 17:01:46 palinux kernel: sticonsole_init: searching for STI ROMs
Oct  8 17:01:46 palinux kernel: Console: switching to colour STI console 160x64
Oct  8 17:01:46 palinux kernel: md: linear personality registered
Oct  8 17:01:46 palinux kernel: md: raid0 personality registered
Oct  8 17:01:46 palinux kernel: md: raid1 personality registered
Oct  8 17:01:46 palinux kernel: md: raid5 personality registered
Oct  8 17:01:46 palinux kernel: raid5: measuring checksumming speed
Oct  8 17:01:46 palinux kernel:    8regs     :   160.000 MB/sec
Oct  8 17:01:46 palinux kernel:    8regs_prefetch:   160.000 MB/sec
Oct  8 17:01:46 palinux kernel:    32regs    :   222.800 MB/sec
Oct  8 17:01:46 palinux kernel:    32regs_prefetch:   222.800 MB/sec
Oct  8 17:01:46 palinux kernel: raid5: using function: 32regs_prefetch (222.800 
MB/sec)
Oct  8 17:01:46 palinux kernel: md: md driver 0.90.0 MAX_MD_DEVS=256, 
MD_SB_DISKS=27
Oct  8 17:01:46 palinux kernel: md: Autodetecting RAID arrays.
Oct  8 17:01:46 palinux kernel: md: autorun ...
Oct  8 17:01:46 palinux kernel: md: ... autorun DONE.
Oct  8 17:01:46 palinux kernel: LVM version 1.0.1-rc4(03/10/2001)
Oct  8 17:01:46 palinux kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Oct  8 17:01:46 palinux kernel: IP Protocols: ICMP, UDP, TCP
Oct  8 17:01:46 palinux kernel: IP: routing cache hash table of 512 buckets, 
4Kbytes
Oct  8 17:01:46 palinux kernel: TCP: Hash tables configured (established 8192 
bind 16384)
Oct  8 17:01:46 palinux kernel: NET4: Unix domain sockets 1.0/SMP for Linux 
NET4.0.
Oct  8 17:01:46 palinux kernel: VFS: Mounted root (ext2 filesystem) readonly.
Oct  8 17:01:46 palinux kernel: Adding Swap: 124924k swap-space (priority -1)
Oct  8 17:01:46 palinux kernel: eth0: Setting half-duplex based on MII#1 link 
partner capability of 0021.
Oct  8 17:06:56 palinux kernel: 
Oct  8 17:06:56 palinux kernel: do_page_fault() pid=201 command='vgscan' type=15 
address=0xffffffec
Oct  8 17:06:56 palinux kernel: vm_start = 0xfaf00000, vm_end = 0xfaf02000
Oct  8 17:06:56 palinux kernel: 
Oct  8 17:06:56 palinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Oct  8 17:06:56 palinux kernel: PSW: 00000000000001000000000000001111
Oct  8 17:06:56 palinux kernel: r0-3^I 00000000 401c757c 4003c507 faf006c0
Oct  8 17:06:56 palinux kernel: r4-7^I 4006d0b8 0000003f 0002227c 00000001
Oct  8 17:06:56 palinux kernel: r8-11^I 00000000 00000076 00000064 0000003f
Oct  8 17:06:56 palinux kernel: r12-15^I 00011800 0002227c 00011800 0002227c
Oct  8 17:06:56 palinux kernel: r16-19^I 0002227c 00000000 00014000 401c557c
Oct  8 17:06:56 palinux kernel: r20-23^I 00000000 00000000 00000002 00000001
Oct  8 17:06:56 palinux kernel: r24-27^I 0000001f 401c07d0 00010fff 0002227c
Oct  8 17:06:56 palinux kernel: r28-31^I 00000000 00000000 faf00700 40154d23
Oct  8 17:06:56 palinux kernel: sr0-3^I 00000000 000002b8 00000000 000002b8
Oct  8 17:06:56 palinux kernel: sr4-7^I 000002b8 000002b8 000002b8 000002b8
Oct  8 17:06:56 palinux kernel: 
Oct  8 17:06:56 palinux kernel: IASQ: 000002b8 000002b8 IAOQ: 4015dc8b 4015dc8f
Oct  8 17:06:56 palinux kernel:  IIR: 4a963fd9    ISR: 000002b8  IOR: ffffffec
Oct  8 17:06:56 palinux kernel:  CPU:        0   CR30: 170d8000 CR31: 10358000
Oct  8 17:06:56 palinux kernel:  ORIG_R28: 00000003

Thanks in advance for all advices,
        joel

-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
