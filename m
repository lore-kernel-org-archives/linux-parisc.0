Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA24455
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 15:07:40 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id QAA23836
	for <parisc-linux@thepuffingroup.com>; Mon, 15 Jan 2001 16:11:19 -0600
Date: Mon, 15 Jan 2001 16:11:19 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <1010115132833.ZM29048@cancun.rose.hp.com>
Message-ID: <Pine.LNX.4.21.0101151559150.23803-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 Boots! (Mostly)
List-ID: <linux-parisc.vger.kernel.org>


I tracked down the crash on my C100 to somewhere inside register_console()
called from serial_console_init().  I tried a kernel without serial
console support but that stopped generating output too early, so I tried
just removing the register_console call() and now I get past mounting the
root filesystem before losing console output.  A log follows.  The machine
accepts telnet connections but telnet session won't start.  I get:

	telnetd: getpty: permission denied

I'm hoping that's just something to do with how I installed the root
filesystem.  Maybe it hasn't been remounted as writable?  I'm so close to
a shell! 

- Greg

HARD Booted.
palo ipl root@ingram Mon Jan 15 12:24:52 CST 2001
0/vmlinux 1992709 bytes @ 0x6800
0/palo-cmdline 'vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.64'
Kernel: partition 0 file vmlinux
ELF32 executable

Entry 00100130 first 00100000 n 5
Segment 0 load 00100000 size 1342972 mediaptr 0x1000
Segment 1 load 00248000 size 171784 mediaptr 0x149000
Segment 2 load 00274000 size 87204 mediaptr 0x173000
Segment 3 load 0028c000 size 8192 mediaptr 0x189000
Segment 4 load 002b7084 size 496 mediaptr 0x18b084
branching to kernel entry point 0x00100130
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02b8000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.64'
PALO initrd 0-0
model   00005920 00000481 00000000 00000002 782482ee 100000f0 00000004 0000008a 0000008a
vers    0000000d
cpuid   0000016d
CPUID   vers 11 rev 13
model   9000/777/C100
led_init: CPU_HVERSION 592
led_init: chassis info: model 2, lcd_width=0, cmd_delay=40, ret0=8, ret1=8
LED display at f0190000 registered
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Coral SGC Graphics (10) at 0xf6000000, versions 0x4, 0x0, 0x77, 0x0, 0x0
2. SkyHawk 100/120 FW-SCSI (4) at 0xf5f8c000, versions 0x1f, 0x0, 0x89, 0x0, 0x80
3. U2-IOA BC GSC+ Port (7) at 0xf5fbf000, versions 0x501, 0x1, 0xc, 0x0, 0x0
4. Raven T' Core BA (11) at 0xffd00000, versions 0x32, 0x0, 0x81, 0x0, 0x0
5. Raven T' Lasi Core RS-232 (10) at 0xffd05000, versions 0x32, 0x0, 0x8c, 0x0, 0x0
6. Raven T' Core SCSI (10) at 0xffd06000, versions 0x32, 0x0, 0x82, 0x0, 0x0
7. Raven T' Core LAN (802.3) (10) at 0xffd07000, versions 0x32, 0x0, 0x8a, 0x0, 0x0
8. Raven T' Core Centronics (10) at 0xffd02000, versions 0x32, 0x0, 0x74, 0x0, 0x0
9. Raven T' Core PC Floppy (10) at 0xffd0a000, versions 0x32, 0x0, 0x83, 0x0, 0x0
10. Raven T' Audio (10) at 0xffd04000, versions 0x32, 0x0, 0x7b, 0x0, 0x0
11. Raven T' Core PC Keyboard (10) at 0xffd08000, versions 0x32, 0x0, 0x84, 0x0, 0x0
12. Raven T' Core PC Keyboard (10) at 0xffd08100, versions 0x32, 0x0, 0x84, 0x0, 0x0
13. Raven T' Wax BA (11) at 0xffe00000, versions 0x1e, 0x0, 0x8e, 0x0, 0x0
14. Raven T' Wax EISA BA (11) at 0xfc000000, versions 0x1e, 0x0, 0x90, 0x0, 0x0
15. Raven T' Wax RS-232 (10) at 0xffe02000, versions 0x1e, 0x0, 0x8c, 0x0, 0x80
16. Raven T' Wax HIL (10) at 0xffe01000, versions 0x1e, 0x0, 0x73, 0x0, 0x0
That's a total of 16 devices.
No CPUs reported by firmware - probing...
Found CPU at fffa0000
CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
Linux version 2.4.0-test10 (root@ingram) (gcc version 2.96 20000925 (experimental)) #25 Mon Jan 15 15:52:44 CST 2001
free_bootmem(0x2b9000, 0x7d47000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.64
trap_init
Calibrating delay loop... 99.74 BogoMIPS
Memory: 125968k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
Found i82596 at 0xffd07000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
ccio found U2 GSC+ BC at 0xf5fbf000
superio: Probe
Could not find Superio IDE !
Could not find Superio USB!
Bah!
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xffd07000, 08 00 09 E8 83 2B IRQ 87.
82596.c $Revision: 1.14 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST11200N SUN1.05  Rev: 8358
  Type:   Direct-Access                      ANSI SCSI revision: 02
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: restart (scsi reset).
scsi1 : ncr53c8xx - version 3.3b
  Vendor: SEAGATE   Model: ST32430W          Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
ncr53c720-0-<6,0>: tagged command queue depth set to 8
Detected scsi disk sda at scsi0, channel 0, id 0, lun 0
Detected scsi disk sdb at scsi1, channel 0, id 6, lun 0
SCSI device sda: 2059140 512-byte hdwr sectors (1054 MB)
Partition check:
 sda: sda1
ncr53c720-0-<6,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<6,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<6,0>: wide: wide=1 chg=0.
ncr53c720-0-<6,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<6,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<6,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
 sdb: unknown partition table
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
eth0: link ok.
Sending BOOTP requests..... OK
IP-Config: Got BOOTP answer from 192.168.1.64, my address is 192.168.1.76
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kmem_create: Forcing size word alignment - nfs_fh
Looking up port of RPC 100003/2 on 192.168.1.64
Looking up port of RPC 100005/2 on 192.168.1.64
VFS: Mounted root (nfs filesystem) readonly.
Warning: unable to open an initial console.
