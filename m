Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AFE24829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Sep 2002 10:40:44 -0600 (MDT)
Date: Mon,  2 Sep 2002 11:37:00 -0500
Message-Id: <200209021137.AA3784507924@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Kernel Panic
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

Guys, I'm getting a kernel panic after trying to access my tape drive.
Can anyone help me out? I tried to post all relevant info, let me know
if I can provide anything else:


-----------------FIRST TRY----------------
Debian GNU/Linux 3.0 seki ttyS0

seki login: root
Password:
Last login: Sat Nov 14 02:50:47 1992 on ttyS0
Linux seki 2.4.9-32 #1 Fri Nov 30 19:36:30 MST 2001 parisc unknown

seki:~/test# tar -xvpf /dev/st0
st: Version 20010812, bufsize 32768, wrt 30720, max init. bufs 4, s/g segs 16
Attached scsi tape st0 at scsi1, channel 0, id 1, lun 0
st0: Block limits 1 - 16777215 bytes.

ccio-dma.c:362: Assertion (*res_ptr & *mask_ptr) == *mask_ptr failed!
Kernel panic: (*res_ptr & *mask_ptr) == *mask_ptr
In interrupt handler - not syncing

-----------------END FIRST TRY----------------


-----------------SECOND TRY----------------
Debian GNU/Linux 3.0 seki ttyS0

seki login: root
Password:
Last login: Sat Nov 14 02:41:23 1992 on ttyS0
Linux seki 2.4.9-32 #1 Fri Nov 30 19:36:30 MST 2001 parisc unknown

seki:~# lsmod
Module                  Size  Used by
seki:~# insmod st
Using /lib/modules/2.4.9-32/kernst: Version 20010812, bufsize 32768, wrt 30720,
max init. bufs 4, s/g segs 16
el/drivers/scsi/Attached scsi tape st0 at scsi1, channel 0, id 1, lun 0
st.o
seki:~# cat /proc/scsi/scsi
Attached devices:
Host: scsi0 Channel: 00 Id: 05 Lun: 00
  Vendor: SEAGATE  Model: ST34371W         Rev: HP03
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi0 Channel: 00 Id: 06 Lun: 00
  Vendor: SEAGATE  Model: ST32171W         Rev: HP03
  Type:   Direct-Access                    ANSI SCSI revision: 02
Host: scsi1 Channel: 00 Id: 01 Lun: 00
  Vendor: SONY     Model: SDT-7000         Rev: 0150
  Type:   Sequential-Access                ANSI SCSI revision: 02
seki:~# mt -f /dev/st0 status
st0: Block limits 1 - 16777215 bytes.
drive type = Generic SCSI-2 tape
drive status = 318767616
sense key error = 0
residue count = 0
file number = 0
block number = 0
Tape block size 512 bytes. Density code 0x13 (DDS (61000 bpi)).
Soft error count since last status=0
General status bits on (41010000):
 BOT ONLINE IM_REP_EN
seki:~# tar -cvpf /dev/st0 /tftpboot
tar: Removing leading `/' from member names
tftpboot/
tftpboot/tftpboot.img

ccio-dma.c:362: Assertion (*res_ptr & *mask_ptr) == *mask_ptr failed!
Kernel panic: (*res_ptr & *mask_ptr) == *mask_ptr
In interrupt handler - not syncing

-----------------END SECOND TRY----------------

-----------------BOOT INFO----------------
Firmware Version  2.7

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      180 MHz    Active                 Functional         1 MB/1 MB

  Central Bus Speed (in MHz) :        120

  Available memory (bytes)    : 805306368
  Good memory required (bytes):          0 (Not Set by OS)
  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SESCSI.6.0
  Console path:         GRAPHICS(3)
  Keyboard path:        PS2

CPU 0
WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Searching for device(s) with bootable media...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).

Attempting to boot Primary Path...

BOOTABLE DEVICE FOUND:
   Path Number        Device Path              Device Type and Utilities
   -----------        -----------------        -------------------------
   P0                 FWSCSI.6.0               SEAGATE ST32171W        
                                               IPL

Booting... 
Boot IO Dependent Code (IODC) revision 150


HARD Booted.
palo ipl 0.96 root@smallone Sun Nov 11 23:23:30 UTC 2001

Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
3            1315    2046   82 swap
5              17    1314   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3122078 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently  used by firmware (serial).

Command line for kernel: 'root=/dev/sdb5 HOME=/ console=ttyS0 TERM=vt102'
Selected kernel: /boot/vmlinux from partition 5
Opening /boot/vmlinux
Opening /boot/vmlinux-2.4.9-32
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1618208 mediaptr 0x1000
Segment 1 load 0028c000 size 287728 mediaptr 0x18d000
Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000
Segment 3 load 00334000 size 8192 mediaptr 0x231000
Segment 4 load 00338000 size 32768 mediaptr 0x233000
Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov 30 19
:36:30 MST 2001
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model	000059c0 00000481 00000000 00000002 77d14d81 100000f0 00000008 000000b2 
000000b2
vers	00000205
cpuid	000001c9
CPUID	vers 14 rev 9
model	9000/780/C180
Total Memory: 768 Mb
pagetable_init
On node 0 totalpages: 196608
zone(0): 196608 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LED display at f0190001 registered
Kernel command line: root=/dev/sdb5 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 358.80 BogoMIPS
Memory: 770644k available
Dentry-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x1, 0xa
3. Raven U/L2 Core FW-SCSI (4) at 0xf200c000 [8/12], versions 0x3b, 0x0, 0x89
4. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, 0x81,  addi
tional addresses: 0xffc00000 
5. UL 350 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2e, 0x0, 0x74,
  additional addresses: 0xffd03000 
6. Raven U/L2 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3b, 0x4, 0x7b
7. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c
8. Raven U/L2 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3b, 0x0, 0x82
9. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x3b, 0x0, 
0x8a
10. Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x3b, 0x0, 0
x84
11. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3b, 0x0, 0
x84
12. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17, 0x0, 0x8e
13. Raven Backplane Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x17, 0x0, 0x7
3
14. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c
15. Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x17, 0x0,
 0x90,  additional addresses: 0xfc00000b 
16. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16, 0x0, 0x85
17. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
18. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
19. Coral SGC Graphics (10) at 0xf8000000 [10/8], versions 0x4, 0x0, 0x77
20. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
21. Raven U 180 (9000/780/C180) (0) at 0xfffa0000 [32], versions 0x59c, 0x0, 0x4
22. Raven U 180 (1) at 0xfffb1000 [49], versions 0x72, 0x0, 0x9
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
ccio found U2 at 0xfff88000
io_io_low: 0xf2000000
23. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x1, 0xa
24. Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x7, 0x0, 0x96
25. Raven Backplane RS-232 (10) at 0xf2003000 [8/3], versions 0x17, 0x0, 0x8c
26. Raven U/L2 Core FW-SCSI (4) at 0xf200c000 [8/12], versions 0x3b, 0x0, 0x89
27. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, 0x81,  add
itional addresses: 0xffc00000 
28. UL 350 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2e, 0x0, 0x74
,  additional addresses: 0xffd03000 
29. Raven U/L2 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3b, 0x4, 0x7b
30. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0, 0x8c
31. Raven U/L2 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3b, 0x0, 0x82
32. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x3b, 0x0,
 0x8a
33. Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x3b, 0x0, 0
x84
34. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3b, 0x0, 0
x84
35. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17, 0x0, 0x8e
36. Raven Backplane Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x17, 0x0, 0x7
3
37. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17, 0x0, 0x8c
38. Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x17, 0x0,
 0x90,  additional addresses: 0xfc00000b 
39. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16, 0x0, 0x85
40. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
ccio found U2 at 0xfff8a000
io_io_low: 0xf1000000
41. Coral SGC Graphics (10) at 0xf8000000 [10/8], versions 0x4, 0x0, 0x77
42. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
Dino version 2.1 found at 0xf2000000
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

Dino: No PCI devices enabled.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI word mode ROM at f0084000, hpa=fa000000
STI word mode ROM, id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
STI byte mode ROM at f8000000, hpa=f8000000
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071B_LZ
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: 0xfa100000
fb1: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI en
abled
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf2003800 (irq = 138) is a 16550A
ttyS02 at iomem 0xffe02800 (irq = 121) is a 16550A
Lasi PS/2 receive buffer timeout
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
Lasi PS/2 transmit buffer timeout
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
Found HIL at 0xffe01000, IRQ 126
IRQ:  CPU:0 No handler for IRQ 35 !
HIL: timed out, assuming no keyboard present.
Warning : device (10, 0x17, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 00 60 B0 18 9B B9 IRQ 87.
82596.c $Revision: 1.26 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
  Vendor: SEAGATE   Model: ST34371W          Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST32171W          Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi1: (1:0) Synchronous at offset 8, period 100ns
  Vendor: SONY      Model: SDT-7000          Rev: 0150
  Type:   Sequential-Access                  ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
 sdb: sdb1 sdb2 < sdb5 > sdb3
Lasi Harmony Audio rev. 2 at 0xffd04000, using IRQ 82
sticonsole_init: searching for STI ROMs
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 8192 buckets, 64Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
INIT: version 2.84 booting
Activating swap.
Adding Swap: 749788k swap-space (priority -1)
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sdb5: clean, 3167/166496 files, 32915/332312 blocks
System time was Fri Nov 13 19:56:56 UTC 1992.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Fri Nov 13 19:57:04 UTC 1992.
Calculating module dependencies... done.
Loading modules: 
Note: /etc/modules.conf is more recent than /lib/modules/2.4.9-32/modules.dep
modprobe: Can't locate module *
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda1: clean, 21754/524288 files, 116146/1048265 blocks
Setting kernel variables.
Mounting local filesystems...
/dev/sda1 on /usr type ext2 (rw)
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: Transceiver problem.
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16
ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16

ip_local_deliver: bad loopback skb: PRE_ROUTING LOCAL_IN 
skb: pf=2 (unowned) dev=lo len=328
PROTO=17 0.0.0.0:68 255.255.255.255:67 L=328 S=0x10 I=0 F=0x0000 T=16


Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Fri Nov 13 13:57:56 CST 1992


Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting DHCP server: dhcp.
Starting internet superserver: inetd.
/usr/share/sendmail/sendmail not found/executable, aborting.
Starting OpenBSD Secure Shell server: sshd.
Starting periodic command scheduler: cron.

-----------------END BOOT INFO----------------
