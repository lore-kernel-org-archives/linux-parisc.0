Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA12071
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 02:34:30 -0700
From: Marko.T.Niskanen@nokia.com
Received: from esvir02nok.nokia.com (esvir02nok.nokia.com [131.228.20.74])
	by mgw-x2.nokia.com (8.10.2/8.10.2/Nokia) with ESMTP id eBC9bBO14099
	for <parisc-linux@thepuffingroup.com>; Tue, 12 Dec 2000 11:37:11 +0200 (EET)
Received: from esebh02nok.ntc.nokia.com (unverified) by esvir02nok.nokia.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <T83e4144a48506f8f0f51@esvir02nok.nokia.com> for <parisc-linux@thepuffingroup.com>;
 Tue, 12 Dec 2000 11:37:10 +0200
Message-ID: <13F0486DB51CD311A0AE0008C7C561380453D433@eseis11nok>
To: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] 712/60 booting problem
Date: Tue, 12 Dec 2000 11:36:05 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

hi

Here is the boot.log

Booting
palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
0/vmlinux 2140145 bytes @ 0x8090800
0/palo-cmdline '3/boot/vmlinux TERM=linux HOME=/ root=/dev/sda3'
/dev/ida1  82         59     262727
/dev/ida2  f0     262786      33099
/dev/ida3  83     295885     727175
Kernel: partition 3 file /boot/vmlinux
ext2 block size 1024
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux) = 3
ELF32 executable

Entry 00100150 first 00100000 n 4
Segment 0 load 00100000 size 1460344 mediaptr 0x1000
Segment 1 load 00266000 size 179048 mediaptr 0x166000
Segment 2 load 00294000 size 109876 mediaptr 0x192000
Segment 3 load 002b0000 size 8192 mediaptr 0x1ad000
branching to kernel entry point 0x00100150
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02da000
(0x504d6c,0x504d6c,0x0,0x0)
PALO command line: 'TERM=linux HOME=/ root=/dev/sda3'
PALO initrd 0-0
model   00006000 00000481 00000000 00000000 77c6fa78 00000000 00000004
00000072
00000072
vers    0000000c
CPUID vers 0 rev 0
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85,
0x0, 0x
0
2. Gecko Core BA (11) at 0xf0100000, versions 0x16, 0x0, 0x81, 0x0, 0x0
3. Gecko Core SCSI (10) at 0xf0106000, versions 0x16, 0x0, 0x82, 0x0, 0x0
4. Gecko Core Lan (802.3) (10) at 0xf0107000, versions 0x16, 0x0, 0x8a, 0x0,
0x0

5. Gecko Core RS-232 (10) at 0xf0105000, versions 0x16, 0x0, 0x8c, 0x0, 0x0
6. Gecko Core Centronics (10) at 0xf0102000, versions 0x16, 0x0, 0x74, 0x0,
0x0
7. Gecko Audio (10) at 0xf0104000, versions 0x16, 0x0, 0x7b, 0x0, 0x0
8. Gecko Core PC Floppy (10) at 0xf010a000, versions 0x16, 0x0, 0x83, 0x0,
0x0
9. Gecko Core PC Keyboard (10) at 0xf0108000, versions 0x16, 0x0, 0x84, 0x0,
0x0

10. Gecko Core PC Keyboard (10) at 0xf0108100, versions 0x16, 0x0, 0x84,
0x0, 0x
0
11. Gecko (712/60) (0) at 0xfffbe000, versions 0x600, 0x0, 0x4, 0x0, 0x81
12. Gecko (1) at 0xfffbf000, versions 0x26, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 60.000000 MHz
Linux version 2.4.0-test6 (pjlahaie@elenuial.thepuffingroup.com) (gcc
version 2.
96 20000925 (experimental)) #32 Mon Nov 6 10:20:58 EST 2000
free_bootmem(0x2da800, 0x3d25800)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
Kernel command line: TERM=linux HOME=/ root=/dev/sda3
trap_init
Calibrating delay loop... 59.80 BogoMIPS
Memory: 61388k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xf0108000...
Support for Lasi PS/2-psaux not yet available !
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
Lasi PS/2 wait 1579
Lasi PS/2 wait 1580
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c7xx
scsi : 1 host.
  Vendor: TOSHIBA   Model: CD-ROM XM-5701TA  Rev: 1557
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 5, lun 0
  Vendor: QUANTUM   Model: LPS525S           Rev: 3110
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi : detected 1 SCSI cdrom 1 SCSI disk total.
Uniform CD-ROM driver Revision: 3.11
SCSI device sda: hdwr sector= 512 bytes. Sectors= 1023484 [499 MB] [0.5 GB]
Partition check:
 sda: sda1 sda2 sda3
eth0: 82596 at 0xf0107000, 08 00 09 87 66 19 IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI
ena
bled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Switching from PDC console
kmem_create: Forcing size word alignment - nfs_fh
VFS: Mounted root (ext2 filesystem) readonly.
BUG IN DYNAMIC LKernel panic: Attempted to kill init!
INKER ld.so: dynamic-link.h: 62: top level: Assertion `! "bad dynamic tag"'
fail
ed!

br

marko

> -----Original Message-----
> From: EXT Alex deVries [mailto:adevries@linuxcare.com]
> Sent: 12 December, 2000 6:46
> To: Marko.T.Niskanen@nokia.com; 	
> Subject: Re: [parisc-linux] 712/60 booting problem
> 
> 
> Alex deVries wrote:
> > 
> > Marko.T.Niskanen@nokia.com wrote:
> > >
> > > hello
> > >
> > > after installing from palinux-0.5.iso.gz on cd and during 
> booting I can get
> > > this kind error
> > 
> > Okay.  You've got to give us some sort of clue as to what kind of
> > machine that is, because I can't guess.
> 
> What a silly question, since you mentioned it in your subject it was a
> 712/80.
> 
> Where do you get the problem?  Do you have a bootlog for us?
> 
> - Alex
> 
> 
> -- 
> Alex deVries, Principal Solutions Architect, The Puffins at Linuxcare
> 613.562.2759 tel
> alex@linuxcare.com, http://www.linuxcare.com/
> Linuxcare, Support for the revolution.
> 
