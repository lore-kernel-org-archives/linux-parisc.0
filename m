Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhenium (rhenium.btinternet.com [194.73.73.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05C50482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 21 Apr 2001 05:58:53 -0600 (MDT)
Received: from [213.122.161.143] (helo=tardis)
	by rhenium with esmtp (Exim 3.03 #83)
	id 14qw2L-0004iw-00
	for parisc-linux@lists.parisc-linux.org; Sat, 21 Apr 2001 12:58:50 +0100
Date: Sat, 21 Apr 2001 12:54:38 +0100 (BST)
From: Dave Gilbert <gilbertd@treblig.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.10.10104211247000.702-100000@tardis.home.dave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SCSI problems on 73[05]
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  As I mentioned in a previous mail, my first machine successfully is now
net booting Linux/HP-PA.

  I am however having some problems with SCSI on it; I'm trying to do

dd if=/dev/zero of=/dev/sda

to clear the discs but am getting:

scsi0: Unable to abort command for target 5
scsi0: Unable to send Bus Device Reset for target 5
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 00075038 (script[0x140e]), dsps = 00075cde, target = 0
scsi0: Failing command for ID5
SCSI disk error : host 0 channel 0 id 5 lun 0 return code = 2
 I/O error: dev 08:00, sector 128
 I/O error: dev 08:00, sector 130

Here is the dmesg from boot; I guess the warnings about IRQ probes are
probably a bit dodgy!
(Oh, there is a 10/100 ether card in the EISA slot - how do I figure out
what it is?)

Linux version 2.4.0 (grundler@gsyprf10) (gcc version 3.0 20010315 (prerelease)) #3 Tue Apr 17 23:07:07 PDT 2001
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
setup_cmdline(0x64d5c,0x64d5c,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs                                       '
PALO initrd 0-0
model	00002020 00000481 00000000 00000000 39d738f4 000011f4 00000004 0000000a 0000000a
vers	0000000b
CPUID	vers 0 rev 0
model	9000/730
Total Memory: 96 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 24576
zone(0): 24576 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. Outfield Core BA (11) at 0xf082f000, versions 0x9, 0x0, 0x70, 0x0, 0x0
2. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71, 0x0, 0x0
3. Outfield Core LAN (802.3) (10) at 0xf0826000, versions 0x9, 0x0, 0x72, 0x0, 0x0
4. Outfield Core HIL (10) at 0xf0821000, versions 0x9, 0x0, 0x73, 0x0, 0x0
5. Outfield Core RS-232 (10) at 0xf0823000, versions 0x9, 0x0, 0x75, 0x0, 0x0
6. Outfield Core RS-232 (10) at 0xf0822000, versions 0x9, 0x0, 0x75, 0x0, 0x0
7. Outfield Core Centronics (10) at 0xf0824000, versions 0x9, 0x0, 0x74, 0x0, 0x0
8. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0, 0x0
9. Outfield Audio (10) at 0xf1000000, versions 0x9, 0x0, 0x7f, 0x0, 0x0
10. Cobra EISA BA (11) at 0xfc000000, versions 0x4, 0x0, 0x76, 0x0, 0x0
11. King Cobra (730) (0) at 0xfffbe000, versions 0x202, 0x0, 0x4, 0x0, 0x81
12. Hardball (1) at 0xfffbf000, versions 0x19, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7000 (PCX-S) at 99.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/nfs                                       
Calibrating delay loop... 98.71 BogoMIPS
Memory: 94452k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 20 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
Warning : device (10, 0x9, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715 or similiar
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 25 FB 6F IRQ 87.
82596.c $Revision: 1.17 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: QUANTUM   Model: PD425S            Rev: 535A
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: QUANTUM   Model: PD425S            Rev: 535A
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
SCSI device sda: 833150 512-byte hdwr sectors (427 MB)
Partition check:
 sda: unknown partition table
SCSI device sdb: 833150 512-byte hdwr sectors (427 MB)
 sdb: unknown partition table
linear personality registered
raid0 personality registered
raid1 personality registered
raid5 personality registered
raid5: measuring checksumming speed
   8regs     :    67.056 MB/sec
   8regs_prefetch:    67.056 MB/sec
   32regs    :    75.057 MB/sec
   32regs_prefetch:    75.057 MB/sec
raid5: using function: 32regs_prefetch (75.057 MB/sec)
md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md.c: sizeof(mdp_super_t) = 4096
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.66.66.4, my address is 192.66.66.15
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 192.66.66.4
Looking up port of RPC 100005/2 on 192.66.66.4
VFS: Mounted root (nfs filesystem) readonly.
Warning: unable to open an initial console.

-- 
 ---------------- Have a happy GNU millennium! ----------------------   
/ Dr. David Alan Gilbert    | Running GNU/Linux on Alpha,68K| Happy  \ 
\ gro.gilbert @ treblig.org | MIPS,x86,ARM, SPARC and HP-PA | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
