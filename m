Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.obsidian.de (unknown [213.69.121.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F6404A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 16:18:14 -0700 (MST)
Received: from kiste.innnet.de (obsidian@kiste.nigga-wg.de [192.168.1.2])
	by mail.obsidian.de (8.11.1/8.11.1) with ESMTP id f1F8GnO15530
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Feb 2001 00:16:49 -0800 (PST)
Date: Fri, 16 Feb 2001 00:18:53 +0100 (MET)
From: Kevin Read <obsidian@panokratie.de>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.31.0102160013480.22670-100000@kiste.innnet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Test on 705
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,

first a little praise: It only took me 2 hours to get up and running and
starting to build me own kernel with palinux! I like your informative
homepage and FAQs! Keep it up!

I booted it up on my 705 (Flounder), further below is the output I got.

It seems it can't get consistent with the memory my ether and SCSI
controller use, and its muttering about DMA too. It didn't find any SCSI
devices and I couldn't find any packets from the box on the net.

I'd be glad to wade the code (I'm no kernel guru by a long way though ;)
or try patches and such!

cu,

		Kevin

-------

Hard booted.
palo ipl kread@kiste Don Feb 15 23:46:37 MET 2001
0/vmlinux 2322502 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100118 first 00100000 n 5
Segment 0 load 00100000 size 1311220 mediaptr 0x1000
Segment 1 load 00242000 size 173144 mediaptr 0x142000
Segment 2 load 00270000 size 197940 mediaptr 0x16d000
Segment 3 load 002a4000 size 8192 mediaptr 0x19e000
Segment 4 load 002cfd08 size 64960 mediaptr 0x1a0d08
branching to kernel entry point 0x00100118
PDC Console Initialized
The 32-bit Kernel has started...
FP[0] enabled: Rev 3 Model 0
Free memory starts at: 0x102e0000
start_parisc(0x64d24,0x64d24,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0'
PALO initrd 0-0
model   00003020 00000481 00000000 00000000 77d23d72 ffffffff 00000004 0000000d 00000000
vers    00000003
CPUID   vers 0 rev 0
model   9000/705
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0x0, 0x0
2. Flounder Core BA (11) at 0xf082f000, versions 0x8, 0x0, 0x70, 0x0, 0x0
3. Flounder Core SCSI (10) at 0xf0825000, versions 0x8, 0x0, 0x71, 0x0, 0x0
4. Flounder Core LAN (802.3) (10) at 0xf0826000, versions 0x8, 0x0, 0x72, 0x0, 0x0
5. Flounder Core HIL (10) at 0xf0821000, versions 0x8, 0x0, 0x73, 0x0, 0x0
6. Flounder Core RS-232 (10) at 0xf0823000, versions 0x8, 0x0, 0x75, 0x0, 0x0
7. Flounder Core RS-232 (10) at 0xf0822000, versions 0x8, 0x0, 0x75, 0x0, 0x0
8. Flounder Core Centronics (10) at 0xf0824000, versions 0x8, 0x0, 0x74, 0x0, 0x0
9. Flounder Audio (10) at 0xf1000000, versions 0x8, 0x0, 0x7a, 0x0, 0x0
10. Flounder (705) (0) at 0xfffbe000, versions 0x302, 0x0, 0x4, 0x0, 0x81
11. Flounder (1) at 0xfffbf000, versions 0x18, 0x0, 0x9, 0x0, 0x0
That's a total of 11 devices.
CPU(s): 1 x PA7000 (PCX-S) at 35.000000 MHz
Linux version 2.4.0 (kread@kiste) (gcc version 2.96 20000925 (experimental)) #3 Don Feb 15 23:49:59 MET 2001
free_bootmem(0x2e0600, 0x2d1fa00)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 12288
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=10.10.10.2 console=ttyS0
Calibrating delay loop... 34.71 BogoMIPS
Memory: 45340k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Found HIL at 0xf0821000, IRQ 94
HIL: timed out, assuming no keyboard present.
Warning : device (10, 0x8, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or similiar
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
superio: Probe
Could not find Superio IDE !
Could not find Superio USB!
Bah!
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 27 9A C9 IRQ 87.
82596.c $Revision: 1.15 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
scsi0: Unable to abort command for target 0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 3
scsi0: Unable to send Bus Device Reset for target 3
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 4
scsi0: Unable to send Bus Device Reset for target 4
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 5
scsi0: Unable to send Bus Device Reset for target 5
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 6
scsi0: Unable to send Bus Device Reset for target 6
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Sending BOOTP requests............. timed out!
IP-Config: Auto-configuration of network failed.
Trying to free nonexistent resource <f0826000-f082600b>
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 10.10.10.2
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get nfsd port number from server, using default
Looking up port of RPC 100005/2 on 10.10.10.2
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get mountd port number from server, using default
RPC: sendmsg returned error 229
mount: RPC call returned error 229
Root-NFS: Server returned error -229 while mounting /tftpboot/(none)
VFS: Unable to mount root fs via NFS, trying floppy.
VFS: Cannot open root device "nfs" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00
