Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2857F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Apr 2001 01:09:38 -0600 (MDT)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AD1602A.C88F8A14@alcatel.at>
Date: Mon, 09 Apr 2001 09:09:30 +0200
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: jeffa@owlpoo.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Many experiments on 720, but `init' fails !!
References: <20010408220239.FGPU290.mta02-svc.ntlworld.com@mustain.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

This could be a simial problem, but in your case, another problem
is also likely.
You have a 9000/730, which really has *one* CPU. (There a three
chips, AFAIK, one is the CPU, one is a FPU coprocessor, and the
third often has to do with the cache). 
The only difference is the CPU core speed (66HMz 730, 50Mhz 720),
and perhaps the machines are equipped a little different.

"Our" CPUs are very old. So there must be a line added in 
the arch/parisc/kernel/trap.c file. In the handle_interruption()
you must add the line
	`case 18:'
where
	`case 15:'
	`case 26:'
is in the code, because these old CPUs use an older method of
"reporting" page faults, etc...

But as you have the output of the "break" routine, this seems
not to be the interrupt code.

In my case it is pid=9. I have not find out yet, which "kernel
thread" pid will get.

With friendly regards
	Christoph P.


Jeff Arthur wrote:
> 
> It seems like I have very similar problems with a HP apollo series 700 (9000/730)
> 
> I have tried many builds, with home built cross compilers, downloaded cross compilers, images from CDs, downloaded lifs, roots on CDs, ramdisks and nfsroots. booting using rbootd over the lan, and off the .iso cd. I always seem to end up with a variation of the
> 
> break 0,0: pid=1 command='init'
> 
> problem.
> 
> Am keen to help (If I can, though just a lowly Sys Admin, not a kernel hack sadly)
> 
> P.S. i note that the boot only saw 1 cpu, even though the box is reported to be a 3 way, I presume this is as SMP is not compliled in by default?
> 
> here is capture from my console port
> 
> (c) Copyright. Hewlett-Packard Company. 1991.
> All rights reserved.
> 
> PDC ROM rev. 2.1
> IODC ROM rev. 2.1
> 32 MB of memory configured and tested.
> 
> Searching for Potential Boot Devices.
> To terminate search, press and hold the ESCAPE key.
> 
> Device Selection Device Path Device Type
> ----------------------------------------------------------------------------
> 
> P0 scsi.6.0 QUANTUM PD425S
> P1 scsi.5.0 QUANTUM PD425S
> P2 scsi.4.0 TOSHIBA CD-ROM XM-3701TA
> P3 scsi.2.0 HP 2213A
> P4 lan.00001c-030853.0.0 burner
> 
> b) Boot from specified device
> s) Search for bootable devices
> a) Enter Boot Administration mode
> x) Exit and continue boot sequence
> ?) Help
> 
> Select from menu: b
> 
> Enter boot selection, (h)elp, or e(x)it: p4
> Trying lan.00001c-030853.0.0
> Boot path initialized.
> Attempting to load IPL.
> 
> Hard booted.
> palo ipl root@hetfield Sun Apr 8 19:24:31 UTC 2001
> 0/vmlinux 2561817 bytes @ 0x6800
> 0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/ram initrd=0/ramdisk console=ttyS0'
> 0/ramdisk 870400 bytes @ 0x277f19
> Kernel: partition 0 file /vmlinux
> Ramdisk: partition 0 file /ramdisk
> ELF32 executable
> Entry 00100000 first 00100000 n 5
> Segment 0 load 00100000 size 1469208 mediaptr 0x1000
> Segment 1 load 00268000 size 181976 mediaptr 0x168000
> Segment 2 load 00298000 size 222280 mediaptr 0x195000
> Segment 3 load 002d0000 size 8192 mediaptr 0x1cc000
> Segment 4 load 002fef68 size 74720 mediaptr 0x1cef68
> Loading ramdisk 870400 bytes @ 01f1a000...
> branching to kernel entry point 0x00100000
> PDC Console Initialized
> Linux version 2.4.0 (root@hetfield) (gcc version 2.97 20010203 (experimental)) #1 Sun Apr 8 19:16:06 UTC 2001
> FP[0] enabled: Rev 3 Model 0
> The 32-bit Kernel has started...
> Determining PDC firmware type: Older Legacy Box
> setup_cmdline(0x64d58,0x64d58,0x1f1a000,0x1fee800)
> PALO command line: 'HOME=/ TERM=linux root=/dev/ram console=ttyS0'
> PALO initrd 1f1a000-1fee800
> model 00002020 00000481 00000000 00000000 3a238470 000011f4 00000004 0000000d 00000000
> vers 00000003
> CPUID vers 0 rev 0
> model 9000/730
> Total Memory: 32 Mb
> initrd: 11f1a000-11fee800
> pagetable_init
> On node 0 totalpages: 8192
> zone(0): 8192 pages.
> zone(1): 0 pages.
> zone(2): 0 pages.
> Searching for devices...
> Found devices:
> 1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77, 0x0, 0x0
> 2. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
> 3. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0
> 4. Cobra Core LAN (802.3) (10) at 0xf0826000, versions 0x4, 0x0, 0x72, 0x0, 0x0
> 5. Cobra Core HIL (10) at 0xf0821000, versions 0x4, 0x0, 0x73, 0x0, 0x0
> 6. Cobra Core RS-232 (10) at 0xf0823000, versions 0x4, 0x0, 0x75, 0x0, 0x0
> 7. Cobra Core RS-232 (10) at 0xf0822000, versions 0x4, 0x0, 0x75, 0x0, 0x0
> 8. Cobra Core Centronics (10) at 0xf0824000, versions 0x4, 0x0, 0x74, 0x0, 0x0
> 9. Cobra EISA BA (11) at 0xfc000000, versions 0x4, 0x0, 0x76, 0x0, 0x0
> 10. King Cobra (730) (0) at 0xfffbe000, versions 0x202, 0x0, 0x4, 0x0, 0x81
> 11. Cobra (1) at 0xfffbf000, versions 0x13, 0x0, 0x9, 0x0, 0x0
> That's a total of 11 devices.
> CPU(s): 1 x PA7000 (PCX-S) at 66.000000 MHz
> Kernel command line: HOME=/ TERM=linux root=/dev/ram console=ttyS0
> Calibrating delay loop... 65.74 BogoMIPS
> Memory: 29156k available
> Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
> Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
> Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
> Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
> POSIX conformance testing by UNIFIX
> ASP version 1 at 0xf0800000 found.
> LED (ASP-style) display at f0800020 registered
> Found HIL at 0xf0821000, IRQ 94
> HIL: keyboard found at id 0
> Found i82596 at 0xf0826000, IRQ 87
> early initialization of device eth0 is deferred
> Linux NET4.0 for Linux 2.4
> Based upon Swansea University Computer Society NET3.039
> Starting kswapd v1.8
> pty: 256 Unix98 ptys configured
> lp: driver loaded but no devices found
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> 82596.c: MAC of HP700 LAN blindely read from the prom!
> eth0: Couldn't get consistent shared memory
> eth0: 82596 at 0xf0826000, 08 00 09 19 1B 34 IRQ 87.
> 82596.c $Revision: 1.17 $
> RAMDISK: ext2 filesystem found at block 0
> RAMDISK: Loading 850 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/done.
> Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
> ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
> ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
> Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
> parport_init_chip: enhanced parport-modes not supported.
> parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
> lp0: using parport0 (interrupt-driven).
> SCSI subsystem driver Revision: 1.00
> sim700: Couldn't get consistent shared memory
> sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
> scsi0: Revision 0x0
> Post test1, istat 05, sstat0 00, dstat 84
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: WARNING: target data areas are not dma coherent!
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
> Vendor: HP Model: 2213A Rev: C023
> Type: Direct-Access ANSI SCSI revision: 01 CCS
> Vendor: TOSHIBA Model: CD-ROM XM-3701TA Rev: 0236
> Type: CD-ROM ANSI SCSI revision: 02
> Vendor: QUANTUM Model: PD425S Rev: 535A
> Type: Direct-Access ANSI SCSI revision: 02
> Vendor: QUANTUM Model: PD425S Rev: 535A
> Type: Direct-Access ANSI SCSI revision: 02
> Detected scsi disk sda at scsi0, channel 0, id 2, lun 0
> Detected scsi disk sdb at scsi0, channel 0, id 5, lun 0
> Detected scsi disk sdc at scsi0, channel 0, id 6, lun 0
> SCSI device sda: 1296512 512-byte hdwr sectors (664 MB)
> Partition check:
> sda: unknown partition table
> SCSI device sdb: 833150 512-byte hdwr sectors (427 MB)
> sdb: unknown partition table
> SCSI device sdc: 833150 512-byte hdwr sectors (427 MB)
> sdc: unknown partition table
> Detected scsi CD-ROM sr0 at scsi0, channel 0, id 4, lun 0
> Uniform CD-ROM driver Revision: 3.12
> linear personality registered
> raid0 personality registered
> raid1 personality registered
> raid5 personality registered
> raid5: measuring checksumming speed
> 8regs : 41.910 MB/sec
> 8regs_prefetch: 53.721 MB/sec
> 32regs : 42.672 MB/sec
> 32regs_prefetch: 54.483 MB/sec
> raid5: using function: 32regs_prefetch (54.483 MB/sec)
> md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
> md.c: sizeof(mdp_super_t) = 4096
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP
> IP: routing cache hash table of 512 buckets, 4Kbytes
> TCP: Hash tables configured (established 2048 bind 2048)
> eth0: link ok.
> Sending BOOTP requests.... OK
> IP-Config: Got BOOTP answer from 0.0.0.0, my address is 192.168.1.201
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> VFS: Mounted root (ext2 filesystem).
> break 0,0: pid=1 command='init'
> 
> YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001111
> r0-3 00000000 1028260c 102d0000 00000000
> r4-7 102d0580 1028260c 102d0000 00000000
> r8-11 102d0580 00000000 00000000 1014ab60
> r12-15 00000000 00000000 00000000 00000000
> r16-19 11ff8000 1028260c 102d0000 00000000
> r20-23 102d0580 00000000 00000000 00000000
> r24-27 faf00038 faf0004c 00000001 10139494
> r28-31 00000000 00000000 faf00080 00002f13
> sr0-3 1ff2d60 11eef0c0 00000000 0000ffff
> sr4-7 0000001 00000001 00000001 00000001
> 
> IASQ: 0000001 00000001 IAOQ: 00002f13 00002f17
> IIR: 000000 ISR: 00000001 IOR: 00000000
> 
> ORIG_R28: 40800000
> 
> break 0,0: pid=1 command='init'
> 
> YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> 
> PSW: 00000000000001000000000000001111
> 
> etc.....
> Thought for the Day: Fax is stranger than fiction.
> 
> _______________________________________________ parisc-linux mailing list parisc-linux@lists.parisc-linux.org http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
