Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id E79034865
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 11:00:03 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id E28217BC46
	for <parisc-linux@parisc-linux.org>; Mon, 25 Mar 2002 10:00:02 -0800 (PST)
Date: Mon, 25 Mar 2002 10:00:02 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Kernel 2.4.17-32-smp problem
In-Reply-To: <Pine.LNX.4.33L2.0203250941180.13376-100000@eiger.apptechsys.com>
Message-ID: <Pine.LNX.4.33L2.0203250948230.13376-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 25 Mar 2002, Jeremy Drake wrote:

> Unfortunately, the log files are very unhelpful.
> It just stops, and starts back up when I reboot.
>

It just occured to me that the different startup logs could be helpful.
So here they are.  Sorry for the length, but I don't know what could be
useful.  Looks like the new one has more drivers, and recognizes my video
card that I don't use (yet).

The One That Works:
Mar 25 09:24:13 krakatoa syslogd 1.4.1#10: restart.
Mar 25 09:24:13 krakatoa kernel: klogd 1.4.1#10, log source = /proc/kmsg started.
Mar 25 09:24:13 krakatoa kernel: Inspecting /boot/System.map-2.4.17-32-smp
Mar 25 09:24:14 krakatoa kernel: Loaded 27313 symbols from /boot/System.map-2.4.17-32-smp.
Mar 25 09:24:14 krakatoa kernel: Symbols match kernel version 2.4.17.
Mar 25 09:24:14 krakatoa kernel: No module symbols loaded.
Mar 25 09:24:14 krakatoa kernel: Linux version 2.4.17-32-smp (root@paer) (gcc version 3.0.3) #1 SMP Thu Feb 14 02:12:37 MST 2002
Mar 25 09:24:14 krakatoa kernel: FP[0] enabled: Rev 1 Model 16
Mar 25 09:24:14 krakatoa kernel: The 32-bit Kernel has started...
Mar 25 09:24:14 krakatoa kernel: Determining PDC firmware type: System Map.
Mar 25 09:24:14 krakatoa kernel: model 00005bd0 00000491 00000000 00000002 776c6453 100000f0 00000008 000000b2 000000b2
Mar 25 09:24:14 krakatoa kernel: vers  00000201
Mar 25 09:24:14 krakatoa kernel: CPUID vers 17 rev 5 (0x00000225)
Mar 25 09:24:14 krakatoa kernel: model 9000/785/J5000
Mar 25 09:24:14 krakatoa kernel: Total Memory: 512 Mb
Mar 25 09:24:14 krakatoa kernel: pagetable_init
Mar 25 09:24:14 krakatoa kernel: On node 0 totalpages: 131072
Mar 25 09:24:14 krakatoa kernel: zone(0): 131072 pages.
Mar 25 09:24:14 krakatoa kernel: zone(1): 0 pages.
Mar 25 09:24:14 krakatoa kernel: zone(2): 0 pages.
Mar 25 09:24:14 krakatoa kernel: LCD display at f05d0008,f05d0000 registered
Mar 25 09:24:14 krakatoa kernel: Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
Mar 25 09:24:14 krakatoa kernel: Console: colour dummy device 160x64
Mar 25 09:24:14 krakatoa kernel: Calibrating delay loop... 878.18 BogoMIPS
Mar 25 09:24:14 krakatoa kernel: Memory: 508244k available
Mar 25 09:24:14 krakatoa kernel: Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Mar 25 09:24:14 krakatoa kernel: Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mar 25 09:24:14 krakatoa kernel: Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mar 25 09:24:14 krakatoa kernel: Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mar 25 09:24:14 krakatoa kernel: Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Mar 25 09:24:14 krakatoa kernel: Searching for devices...
Mar 25 09:24:14 krakatoa kernel: Found devices:
Mar 25 09:24:14 krakatoa kernel: 1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
Mar 25 09:24:14 krakatoa kernel: 2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
Mar 25 09:24:14 krakatoa kernel: 3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
Mar 25 09:24:14 krakatoa kernel: 4. Elroy PCI Bridge (13) at 0xfed34000 [10/2], versions 0x782, 0x0, 0xa
Mar 25 09:24:14 krakatoa kernel: 5. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa
Mar 25 09:24:14 krakatoa kernel: 6. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa
Mar 25 09:24:14 krakatoa kernel: 7. Forte W 2-way (0) at 0xfffa0000 [32], versions 0x5bd, 0x0, 0x4
Mar 25 09:24:14 krakatoa kernel: 8. Forte W 2-way (0) at 0xfffa2000 [34], versions 0x5bd, 0x0, 0x4
Mar 25 09:24:14 krakatoa kernel: 9. Memory (1) at 0xfed10200 [49], versions 0x88, 0x0, 0x9
Mar 25 09:24:14 krakatoa kernel: CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
Mar 25 09:24:14 krakatoa kernel: SBA found Astro 2.1 at 0xfed00000
Mar 25 09:24:14 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed30000
Mar 25 09:24:14 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed32000
Mar 25 09:24:14 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed34000
Mar 25 09:24:14 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed38000
Mar 25 09:24:14 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed3c000
Mar 25 09:24:14 krakatoa kernel: POSIX conformance testing by UNIFIX
Mar 25 09:24:14 krakatoa kernel: FP[1] enabled: Rev 1 Model 16
Mar 25 09:24:14 krakatoa kernel: SMP: Total 2 of 2 processors activated (1756.36 BogoMIPS noticed).
Mar 25 09:24:14 krakatoa kernel: Waiting on wait_init_idle (map = 0x2)
Mar 25 09:24:14 krakatoa kernel: All processors have done init_idle
Mar 25 09:24:14 krakatoa kernel: Linux NET4.0 for Linux 2.4
Mar 25 09:24:14 krakatoa kernel: Based upon Swansea University Computer Society NET3.039
Mar 25 09:24:14 krakatoa kernel: Initializing RT netlink socket
Mar 25 09:24:14 krakatoa kernel: Enabled soft power switch (polling mode, io=0xf0400804).
Mar 25 09:24:14 krakatoa kernel: SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64)
Mar 25 09:24:14 krakatoa kernel: SuperIO: Serial port 1 at 0x3f8
Mar 25 09:24:14 krakatoa kernel: SuperIO: Serial port 2 at 0x2f8
Mar 25 09:24:14 krakatoa kernel: SuperIO: Parallel port at 0x378
Mar 25 09:24:14 krakatoa kernel: SuperIO: Floppy controller at 0x3f0
Mar 25 09:24:14 krakatoa kernel: parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Mar 25 09:24:14 krakatoa kernel: Starting kswapd
Mar 25 09:24:14 krakatoa kernel: pty: 256 Unix98 ptys configured
Mar 25 09:24:14 krakatoa kernel: Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Mar 25 09:24:14 krakatoa kernel: ttyS00 at port 0x03f8 (irq = 99) is a 16550A
Mar 25 09:24:14 krakatoa kernel: ttyS01 at port 0x02f8 (irq = 100) is a 16550A
Mar 25 09:24:14 krakatoa kernel: lp0: using parport0 (interrupt-driven).
Mar 25 09:24:14 krakatoa kernel: Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Mar 25 09:24:14 krakatoa kernel: block: 128 slots per queue, batch=32
Mar 25 09:24:14 krakatoa kernel: RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
Mar 25 09:24:14 krakatoa kernel: Uniform Multi-Platform E-IDE driver Revision: 6.31
Mar 25 09:24:14 krakatoa kernel: ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Mar 25 09:24:14 krakatoa kernel: NS87415: IDE controller on PCI bus 00 dev 70
Mar 25 09:24:14 krakatoa kernel: NS87415: chipset revision 3
Mar 25 09:24:14 krakatoa kernel: NS87415: not 100%% native mode: will probe irqs later
Mar 25 09:24:14 krakatoa kernel:     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
Mar 25 09:24:14 krakatoa kernel:     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
Mar 25 09:24:14 krakatoa kernel: hda: SONY CD-ROM CDU4821, ATAPI CD/DVD-ROM drive
Mar 25 09:24:14 krakatoa kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
Mar 25 09:24:14 krakatoa kernel: hda: ATAPI 48X CD-ROM drive, 128kB Cache
Mar 25 09:24:14 krakatoa kernel: Uniform CD-ROM driver Revision: 3.12
Mar 25 09:24:14 krakatoa kernel: loop: loaded (max 8 devices)
Mar 25 09:24:14 krakatoa kernel: Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
Mar 25 09:24:14 krakatoa kernel: tulip0: no phy info, aborting mtable build
Mar 25 09:24:14 krakatoa kernel: tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Mar 25 09:24:14 krakatoa kernel: eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:35:0D:63, IRQ 66.
Mar 25 09:24:14 krakatoa kernel: SCSI subsystem driver Revision: 1.00
Mar 25 09:24:14 krakatoa kernel: sym53c8xx: at PCI bus 0, device 15, function 0
Mar 25 09:24:14 krakatoa kernel: sym53c8xx: 53c896 detected
Mar 25 09:24:14 krakatoa kernel: sym53c8xx: at PCI bus 0, device 15, function 1
Mar 25 09:24:14 krakatoa kernel: sym53c8xx: 53c896 detected
Mar 25 09:24:14 krakatoa kernel: sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 65
Mar 25 09:24:14 krakatoa kernel: sym53c896-0: ID 7, Fast-20, Parity Checking
Mar 25 09:24:14 krakatoa kernel: sym53c896-0: handling phase mismatch from SCRIPTS.
Mar 25 09:24:14 krakatoa kernel: sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 65
Mar 25 09:24:14 krakatoa kernel: sym53c896-1: ID 7, Fast-40, Parity Checking
Mar 25 09:24:14 krakatoa kernel: sym53c896-1: handling phase mismatch from SCRIPTS.
Mar 25 09:24:14 krakatoa kernel: scsi0 : sym53c8xx-1.7.3c-20010512
Mar 25 09:24:14 krakatoa kernel: scsi1 : sym53c8xx-1.7.3c-20010512
Mar 25 09:24:14 krakatoa kernel:   Vendor: SEAGATE   Model: ST336752LC        Rev: 0002
Mar 25 09:24:14 krakatoa kernel:   Type:   Direct-Access                      ANSI SCSI revision: 03
Mar 25 09:24:14 krakatoa kernel: Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
Mar 25 09:24:14 krakatoa kernel: sym53c896-1-<6,*>: FAST-40 WIDE SCSI 80.0 MB/s (25.0 ns, offset 31)
Mar 25 09:24:14 krakatoa kernel: SCSI device sda: 71687369 512-byte hdwr sectors (36704 MB)
Mar 25 09:24:14 krakatoa kernel: Partition check:
Mar 25 09:24:14 krakatoa kernel:  sda: sda1 sda2 sda3 < sda5 > sda4
Mar 25 09:24:14 krakatoa kernel: sticonsole_init: searching for STI ROMs
Mar 25 09:24:14 krakatoa kernel: BUG: Skipping previously registered driver: sti (native)
Mar 25 09:24:14 krakatoa kernel: md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
Mar 25 09:24:14 krakatoa kernel: md: Autodetecting RAID arrays.
Mar 25 09:24:14 krakatoa kernel: md: autorun ...
Mar 25 09:24:14 krakatoa kernel: md: ... autorun DONE.
Mar 25 09:24:14 krakatoa kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Mar 25 09:24:14 krakatoa kernel: IP Protocols: ICMP, UDP, TCP
Mar 25 09:24:14 krakatoa kernel: IP: routing cache hash table of 512 buckets, 24Kbytes
Mar 25 09:24:14 krakatoa kernel: TCP: Hash tables configured (established 4096 bind 8192)
Mar 25 09:24:14 krakatoa kernel: NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Mar 25 09:24:14 krakatoa kernel: VFS: Mounted root (ext2 filesystem) readonly.
Mar 25 09:24:14 krakatoa kernel: NOT FREEING INITMEM (383k)
Mar 25 09:24:14 krakatoa kernel: Adding Swap: 497972k swap-space (priority -1)
Mar 25 09:24:14 krakatoa kernel: eth0: Setting full-duplex based on MII#1 link partner capability of 01e1.

The One That Breaks:
Mar 25 09:14:09 krakatoa syslogd 1.4.1#10: restart.
Mar 25 09:14:09 krakatoa kernel: klogd 1.4.1#10, log source = /proc/kmsg started.
Mar 25 09:14:09 krakatoa kernel: Inspecting /boot/System.map-2.4.17-32-smp
Mar 25 09:14:09 krakatoa kernel: Loaded 30310 symbols from /boot/System.map-2.4.17-32-smp.
Mar 25 09:14:09 krakatoa kernel: Symbols match kernel version 2.4.17.
Mar 25 09:14:09 krakatoa kernel: No module symbols loaded.
Mar 25 09:14:09 krakatoa kernel: Linux version 2.4.17-32-smp (root@paer) (gcc version 3.0.4) #1 SMP Sat Mar 16 17:55:20 MST 2002
Mar 25 09:14:09 krakatoa kernel: FP[0] enabled: Rev 1 Model 16
Mar 25 09:14:09 krakatoa kernel: The 32-bit Kernel has started...
Mar 25 09:14:09 krakatoa kernel: Determining PDC firmware type: System Map.
Mar 25 09:14:09 krakatoa kernel: model 00005bd0 00000491 00000000 00000002 776c6453 100000f0 00000008 000000b2 000000b2
Mar 25 09:14:09 krakatoa kernel: vers  00000201
Mar 25 09:14:09 krakatoa kernel: CPUID vers 17 rev 5 (0x00000225)
Mar 25 09:14:09 krakatoa kernel: model 9000/785/J5000
Mar 25 09:14:09 krakatoa kernel: Total Memory: 512 Mb
Mar 25 09:14:09 krakatoa kernel: pagetable_init
Mar 25 09:14:09 krakatoa kernel: On node 0 totalpages: 131072
Mar 25 09:14:09 krakatoa kernel: zone(0): 131072 pages.
Mar 25 09:14:09 krakatoa kernel: zone(1): 0 pages.
Mar 25 09:14:09 krakatoa kernel: zone(2): 0 pages.
Mar 25 09:14:09 krakatoa kernel: LCD display at f05d0008,f05d0000 registered
Mar 25 09:14:09 krakatoa kernel: Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
Mar 25 09:14:09 krakatoa kernel: Console: colour dummy device 160x64
Mar 25 09:14:09 krakatoa kernel: Calibrating delay loop... 878.18 BogoMIPS
Mar 25 09:14:09 krakatoa kernel: Memory: 507900k available
Mar 25 09:14:09 krakatoa kernel: Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Mar 25 09:14:09 krakatoa kernel: Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mar 25 09:14:09 krakatoa kernel: Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mar 25 09:14:09 krakatoa kernel: Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mar 25 09:14:09 krakatoa kernel: Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Mar 25 09:14:09 krakatoa kernel: Searching for devices...
Mar 25 09:14:09 krakatoa kernel: Found devices:
Mar 25 09:14:09 krakatoa kernel: 1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
Mar 25 09:14:09 krakatoa kernel: 2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
Mar 25 09:14:09 krakatoa kernel: 3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
Mar 25 09:14:09 krakatoa kernel: 4. Elroy PCI Bridge (13) at 0xfed34000 [10/2], versions 0x782, 0x0, 0xa
Mar 25 09:14:09 krakatoa kernel: 5. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa
Mar 25 09:14:09 krakatoa kernel: 6. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa
Mar 25 09:14:09 krakatoa kernel: 7. Forte W 2-way (0) at 0xfffa0000 [32], versions 0x5bd, 0x0, 0x4
Mar 25 09:14:09 krakatoa kernel: 8. Forte W 2-way (0) at 0xfffa2000 [34], versions 0x5bd, 0x0, 0x4
Mar 25 09:14:09 krakatoa kernel: 9. Memory (1) at 0xfed10200 [49], versions 0x88, 0x0, 0x9
Mar 25 09:14:09 krakatoa kernel: CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
Mar 25 09:14:09 krakatoa kernel: SBA found Astro 2.1 at 0xfed00000
Mar 25 09:14:09 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed30000
Mar 25 09:14:09 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed32000
Mar 25 09:14:09 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed34000
Mar 25 09:14:09 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed38000
Mar 25 09:14:09 krakatoa kernel: lba version TR2.1 (0x2) found at 0xfed3c000
Mar 25 09:14:09 krakatoa kernel: POSIX conformance testing by UNIFIX
Mar 25 09:14:09 krakatoa kernel: FP[1] enabled: Rev 1 Model 16
Mar 25 09:14:09 krakatoa kernel: SMP: Total 2 of 2 processors activated (1756.36 BogoMIPS noticed).
Mar 25 09:14:09 krakatoa kernel: Waiting on wait_init_idle (map = 0x2)
Mar 25 09:14:09 krakatoa kernel: All processors have done init_idle
Mar 25 09:14:09 krakatoa kernel: Linux NET4.0 for Linux 2.4
Mar 25 09:14:09 krakatoa kernel: Based upon Swansea University Computer Society NET3.039
Mar 25 09:14:09 krakatoa kernel: Initializing RT netlink socket
Mar 25 09:14:09 krakatoa kernel: Enabled soft power switch (polling mode, io=0xf0400804).
Mar 25 09:14:09 krakatoa kernel: SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64)
Mar 25 09:14:09 krakatoa kernel: SuperIO: Serial port 1 at 0x3f8
Mar 25 09:14:09 krakatoa kernel: SuperIO: Serial port 2 at 0x2f8
Mar 25 09:14:09 krakatoa kernel: SuperIO: Parallel port at 0x378
Mar 25 09:14:09 krakatoa kernel: SuperIO: Floppy controller at 0x3f0
Mar 25 09:14:09 krakatoa kernel: SuperIO: ACPI at 0x7e0
Mar 25 09:14:09 krakatoa kernel: SuperIO: USB regulator enabled
Mar 25 09:14:09 krakatoa kernel: parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Mar 25 09:14:09 krakatoa kernel: Starting kswapd
Mar 25 09:14:09 krakatoa kernel: Journalled Block Device driver loaded
Mar 25 09:14:09 krakatoa kernel: PCI graphic ROM found at f7000000 (128 kB), fb @ fb000000 (16 MB)
Mar 25 09:14:09 krakatoa kernel: STI word mode ROM at f7000044, hpa=fb000000
Mar 25 09:14:09 krakatoa kernel: STI word mode ROM, id 35acda16-9a02587, conforms to spec rev. 8.0c
Mar 25 09:14:09 krakatoa kernel: STI device: HPA4982A
Mar 25 09:14:09 krakatoa kernel: pty: 256 Unix98 ptys configured
Mar 25 09:14:09 krakatoa kernel: Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Mar 25 09:14:09 krakatoa kernel: ttyS00 at port 0x03f8 (irq = 99) is a 16550A
Mar 25 09:14:09 krakatoa kernel: ttyS01 at port 0x02f8 (irq = 100) is a 16550A
Mar 25 09:14:09 krakatoa kernel: lp0: using parport0 (interrupt-driven).
Mar 25 09:14:09 krakatoa kernel: Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Mar 25 09:14:09 krakatoa kernel: block: 128 slots per queue, batch=32
Mar 25 09:14:09 krakatoa kernel: RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
Mar 25 09:14:09 krakatoa kernel: Uniform Multi-Platform E-IDE driver Revision: 6.31
Mar 25 09:14:09 krakatoa kernel: ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Mar 25 09:14:09 krakatoa kernel: NS87415: IDE controller on PCI bus 00 dev 70
Mar 25 09:14:09 krakatoa kernel: NS87415: chipset revision 3
Mar 25 09:14:09 krakatoa kernel: NS87415: not 100%% native mode: will probe irqs later
Mar 25 09:14:09 krakatoa kernel:     ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
Mar 25 09:14:09 krakatoa kernel:     ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
Mar 25 09:14:09 krakatoa kernel: hda: SONY CD-ROM CDU4821, ATAPI CD/DVD-ROM drive
Mar 25 09:14:09 krakatoa kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
Mar 25 09:14:09 krakatoa kernel: hda: ATAPI 48X CD-ROM drive, 128kB Cache
Mar 25 09:14:09 krakatoa kernel: Uniform CD-ROM driver Revision: 3.12
Mar 25 09:14:09 krakatoa kernel: loop: loaded (max 8 devices)
Mar 25 09:14:09 krakatoa kernel: Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
Mar 25 09:14:09 krakatoa kernel: tulip0: no phy info, aborting mtable build
Mar 25 09:14:09 krakatoa kernel: tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Mar 25 09:14:09 krakatoa kernel: eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:35:0D:63, IRQ 66.
Mar 25 09:14:09 krakatoa kernel: SCSI subsystem driver Revision: 1.00
Mar 25 09:14:09 krakatoa kernel: sym53c8xx: at PCI bus 0, device 15, function 0
Mar 25 09:14:09 krakatoa kernel: sym53c8xx: 53c896 detected
Mar 25 09:14:09 krakatoa kernel: sym53c8xx: at PCI bus 0, device 15, function 1
Mar 25 09:14:09 krakatoa kernel: sym53c8xx: 53c896 detected
Mar 25 09:14:09 krakatoa kernel: sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 65
Mar 25 09:14:09 krakatoa kernel: sym53c896-0: ID 7, Fast-20, Parity Checking
Mar 25 09:14:09 krakatoa kernel: sym53c896-0: handling phase mismatch from SCRIPTS.
Mar 25 09:14:09 krakatoa kernel: sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 65
Mar 25 09:14:09 krakatoa kernel: sym53c896-1: ID 7, Fast-40, Parity Checking
Mar 25 09:14:09 krakatoa kernel: sym53c896-1: handling phase mismatch from SCRIPTS.
Mar 25 09:14:09 krakatoa kernel: scsi0 : sym53c8xx-1.7.3c-20010512
Mar 25 09:14:09 krakatoa kernel: scsi1 : sym53c8xx-1.7.3c-20010512
Mar 25 09:14:09 krakatoa kernel:   Vendor: SEAGATE   Model: ST336752LC        Rev: 0002
Mar 25 09:14:09 krakatoa kernel:   Type:   Direct-Access                      ANSI SCSI revision: 03
Mar 25 09:14:09 krakatoa kernel: Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
Mar 25 09:14:09 krakatoa kernel: sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
Mar 25 09:14:09 krakatoa kernel: SCSI device sda: 71687369 512-byte hdwr sectors (36704 MB)
Mar 25 09:14:09 krakatoa kernel: Partition check:
Mar 25 09:14:09 krakatoa kernel:  sda: sda1 sda2 sda3 < sda5 > sda4
Mar 25 09:14:09 krakatoa kernel: sticonsole_init: searching for STI ROMs
Mar 25 09:14:09 krakatoa kernel: Console: switching to colour STI console 160x64
Mar 25 09:14:09 krakatoa kernel: md: linear personality registered as nr 1
Mar 25 09:14:09 krakatoa kernel: md: raid0 personality registered as nr 2
Mar 25 09:14:09 krakatoa kernel: md: raid1 personality registered as nr 3
Mar 25 09:14:09 krakatoa kernel: md: raid5 personality registered as nr 4
Mar 25 09:14:09 krakatoa kernel: raid5: measuring checksumming speed
Mar 25 09:14:09 krakatoa kernel:    8regs     :  1060.000 MB/sec
Mar 25 09:14:09 krakatoa kernel:    8regs_prefetch:  1060.000 MB/sec
Mar 25 09:14:09 krakatoa kernel:    32regs    :   752.800 MB/sec
Mar 25 09:14:09 krakatoa kernel:    32regs_prefetch:   753.200 MB/sec
Mar 25 09:14:09 krakatoa kernel: raid5: using function: 8regs_prefetch (1060.000 MB/sec)
Mar 25 09:14:09 krakatoa kernel: md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
Mar 25 09:14:09 krakatoa kernel: md: Autodetecting RAID arrays.
Mar 25 09:14:09 krakatoa kernel: md: autorun ...
Mar 25 09:14:09 krakatoa kernel: md: ... autorun DONE.
Mar 25 09:14:09 krakatoa kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Mar 25 09:14:09 krakatoa kernel: IP Protocols: ICMP, UDP, TCP, IGMP
Mar 25 09:14:09 krakatoa kernel: IP: routing cache hash table of 512 buckets, 24Kbytes
Mar 25 09:14:09 krakatoa kernel: TCP: Hash tables configured (established 4096 bind 8192)
Mar 25 09:14:09 krakatoa kernel: NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Mar 25 09:14:09 krakatoa kernel: VFS: Mounted root (ext2 filesystem) readonly.
Mar 25 09:14:09 krakatoa kernel: NOT FREEING INITMEM (388k)
Mar 25 09:14:09 krakatoa kernel: Adding Swap: 497972k swap-space (priority -1)
Mar 25 09:14:09 krakatoa kernel: eth0: Setting full-duplex based on MII#1 link partner capability of 01e1.
