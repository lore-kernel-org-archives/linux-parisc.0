Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AD30482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Jul 2001 12:35:09 -0600 (MDT)
Received: from mcnbru01 (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d54b53f70b2@epirel991.europay.com> for <parisc-linux@lists.parisc-linux.org>;
 Thu, 12 Jul 2001 20:34:46 +0200
To: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OF731D3D33.82489EEF-ONC1256A87.00647126@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 12 Jul 2001 20:31:56 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] palinux 0.9.2 && kernel 2.4.6-pa12 (no ps/2 kbd answer)
List-ID: <linux-parisc.vger.kernel.org>

Dear Richard,

I read mailing list regarding the problem of ps/2 keyboard locked under K
2.4.6.

I met the same problem as well with a 712 as well as B180L.

And the workaround we know to un-plug, replug the keyboard does not work in
this case.

I would like o submit this short message log:

### K 2.4.0-32

Jul  8 22:17:22 palinux2 syslogd 1.4.1#2: restart.
Jul  8 22:17:23 palinux2 kernel: klogd 1.4.1#2, log source =3D /proc/kmsg
started.
Jul  8 22:17:23 palinux2 kernel: Inspecting /boot/System.map
Jul  8 22:17:26 palinux2 kernel: Cannot find map file.
Jul  8 22:17:26 palinux2 kernel: No module symbols loaded.
Jul  8 22:17:26 palinux2 kernel: Linux version 2.4.0-32 (root@slab) (gcc
version 3.0 (Debian)) #1 Thu Jun 28 11:49:00 BST 2001
Jul  8 22:17:26 palinux2 kernel: FP[0] enabled: Rev 1 Model 13
Jul  8 22:17:26 palinux2 kernel: The 32-bit Kernel has started...
Jul  8 22:17:26 palinux2 kernel: Determining PDC firmware type: Older
Legacy Box
Jul  8 22:17:26 palinux2 kernel: model^I00006010 00000481 00000000 00000000
77dd299c 00000000 00000004 00000072 00000072
Jul  8 22:17:26 palinux2 kernel: vers^I0000000c
Jul  8 22:17:26 palinux2 kernel: CPUID^Ivers 0 rev 0
Jul  8 22:17:26 palinux2 kernel: model^I9000/712
Jul  8 22:17:26 palinux2 kernel: Total Memory: 64 Mb
Jul  8 22:17:26 palinux2 kernel: On node 0 totalpages: 16384
Jul  8 22:17:26 palinux2 kernel: zone(0): 16384 pages.
Jul  8 22:17:26 palinux2 kernel: zone(1): 0 pages.
Jul  8 22:17:26 palinux2 kernel: zone(2): 0 pages.
Jul  8 22:17:26 palinux2 kernel: Searching for devices...
Jul  8 22:17:26 palinux2 kernel: Found devices:
Jul  8 22:17:26 palinux2 kernel: 1. Gecko 80 GSC Core Graphics (10) at
0xf8000000, versions 0x1c, 0x0, 0x85, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 2. Gecko 80 Core BA (11) at 0xf0100000,
versions 0x1c, 0x0, 0x81, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 3. Gecko 80 Core SCSI (10) at 0xf0106000,
versions 0x1c, 0x0, 0x82, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 4. Gecko 80 Core LAN (802.3) (10) at
0xf0107000, versions 0x1c, 0x0, 0x8a, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 5. Gecko 80 Core RS-232 (10) at
0xf0105000, versions 0x1c, 0x0, 0x8c, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 6. Gecko 80 Core Centronics (10) at
0xf0102000, versions 0x1c, 0x0, 0x74, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 7. Gecko 80 Audio (10) at 0xf0104000,
versions 0x1c, 0x0, 0x7b, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 8. Gecko 80 Core PC Floppy (10) at
0xf010a000, versions 0x1c, 0x0, 0x83, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 9. Gecko 80 Core PS/2 Port (10) at
0xf0108000, versions 0x1c, 0x0, 0x84, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 10. Gecko 80 Core PS/2 Port (10) at
0xf0108100, versions 0x1c, 0x0, 0x84, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: 11. Gecko 80 (712/80) (0) at 0xfffbe000,
versions 0x601, 0x0, 0x4, 0x0, 0x81
Jul  8 22:17:26 palinux2 kernel: 12. Gecko 80 (1) at 0xfffbf000, versions
0x38, 0x0, 0x9, 0x0, 0x0
Jul  8 22:17:26 palinux2 kernel: That's a total of 12 devices.
Jul  8 22:17:26 palinux2 kernel: CPU(s): 1 x PA7100LC (PCX-L) at 80.000000
MHz
Jul  8 22:17:26 palinux2 kernel: Kernel command line: root=3D/dev/sda3 HOME=
=3D/
console=3Dtty0 sti=3D0 sti_font=3DVGA8x16 TERM=3Dlinux
Jul  8 22:17:26 palinux2 kernel: Console: colour dummy device 160x64
Jul  8 22:17:26 palinux2 kernel: Calibrating delay loop... 79.66 BogoMIPS
Jul  8 22:17:26 palinux2 kernel: Memory: 61920k available
Jul  8 22:17:26 palinux2 kernel: Dentry-cache hash table entries: 8192
(order: 4, 65536 bytes)
Jul  8 22:17:26 palinux2 kernel: Buffer-cache hash table entries: 1024
(order: 0, 4096 bytes)
Jul  8 22:17:26 palinux2 kernel: Page-cache hash table entries: 16384
(order: 4, 65536 bytes)
Jul  8 22:17:26 palinux2 kernel: Inode-cache hash table entries: 4096
(order: 3, 32768 bytes)
Jul  8 22:17:26 palinux2 kernel: POSIX conformance testing by UNIFIX
Jul  8 22:17:26 palinux2 kernel: Lasi version 0 at 0xf0100000 found.
Jul  8 22:17:26 palinux2 kernel: PS/2 keyboard controller at 0xf0108000
(irq 69) found, device attached.
Jul  8 22:17:26 palinux2 kernel: PS/2 psaux controller at 0xf0108100 (irq
69) found, device attached.
Jul  8 22:17:26 palinux2 kernel:
Jul  8 22:17:26 palinux2 kernel: sticonsole_init: searching for STI ROMs
Jul  8 22:17:26 palinux2 kernel: STI word mode ROM at f0080000,
hpa=3Df8000000
Jul  8 22:17:26 palinux2 kernel: STI word mode ROM, id 2b4ded6d-40a00499,
conforms to spec rev. 8.04
Jul  8 22:17:26 palinux2 kernel: STI device: HPA208LC1280
Jul  8 22:17:26 palinux2 kernel: Console: switching to colour STI console
160x64
Jul  8 22:17:26 palinux2 kernel: Found i82596 at 0xf0107000, IRQ 87
Jul  8 22:17:26 palinux2 kernel: early initialization of device eth0 is
deferred
Jul  8 22:17:26 palinux2 kernel: Linux NET4.0 for Linux 2.4
Jul  8 22:17:26 palinux2 kernel: Based upon Swansea University Computer
Society NET3.039
Jul  8 22:17:26 palinux2 kernel: Starting kswapd v1.8
Jul  8 22:17:26 palinux2 kernel: Console: switching to colour frame buffer
device 160x64
Jul  8 22:17:26 palinux2 kernel: fb0: stifb 1280x1024-8 frame buffer
device, id: 2b4ded6d, iobase: 0xf8100000
Jul  8 22:17:26 palinux2 kernel: pty: 256 Unix98 ptys configured
Jul  8 22:17:26 palinux2 kernel: lp: driver loaded but no devices found
Jul  8 22:17:26 palinux2 kernel: RAMDISK driver initialized: 16 RAM disks
of 6144K size 1024 blocksize
Jul  8 22:17:26 palinux2 kernel: loop: enabling 8 loop devices
Jul  8 22:17:26 palinux2 kernel: eth0: 82596 at 0xf0107000, 08 00 09 C9 59
7A IRQ 87.
Jul  8 22:17:26 palinux2 kernel: 82596.c $Revision: 1.18 $
Jul  8 22:17:26 palinux2 kernel: Serial driver version 5.02 (2000-08-09)
with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Jul  8 22:17:26 palinux2 kernel: ttyS00 at iomem 0xf0105800 (irq =3D 90) is=
 a
16550A
Jul  8 22:17:26 palinux2 kernel: Generic RTC Driver v1.02 05/27/1999 Sam
Creasey (sammy@oh.verio.com)
Jul  8 22:17:26 palinux2 kernel: parport_init_chip: initialize
bidirectional-mode.
Jul  8 22:17:26 palinux2 kernel: parport0: PC-style at 0xf0102800, irq 88
[PCSPP,TRISTATE]
Jul  8 22:17:26 palinux2 kernel: lp0: using parport0 (interrupt-driven).
Jul  8 22:17:26 palinux2 kernel: SCSI subsystem driver Revision: 1.00
Jul  8 22:17:26 palinux2 kernel: sim700: Configuring 53c710 (SCSI-ID 7) at
f0106100, IRQ 86, options 0
Jul  8 22:17:26 palinux2 kernel: scsi0: Revision 0x2
Jul  8 22:17:26 palinux2 kernel: scsi0: test 1 completed ok.
Jul  8 22:17:26 palinux2 kernel: scsi0 : LASI/Simple 53c7xx
Jul  8 22:17:26 palinux2 kernel:   Vendor: SEAGATE   Model: ST34572N
Rev: HP03
Jul  8 22:17:26 palinux2 kernel:   Type:   Direct-Access
ANSI SCSI revision: 02
Jul  8 22:17:26 palinux2 kernel:   Vendor: HP        Model: C3325A
Rev: HP08
Jul  8 22:17:26 palinux2 kernel:   Type:   Direct-Access
ANSI SCSI revision: 02
Jul  8 22:17:26 palinux2 kernel: Detected scsi disk sda at scsi0, channel
0, id 3, lun 0
Jul  8 22:17:26 palinux2 kernel: Detected scsi disk sdb at scsi0, channel
0, id 6, lun 0
Jul  8 22:17:26 palinux2 kernel: SCSI device sda: 8388314 512-byte hdwr
sectors (4295 MB)
Jul  8 22:17:26 palinux2 kernel: Partition check:
Jul  8 22:17:26 palinux2 kernel:  sda: sda1 sda2 sda3
Jul  8 22:17:26 palinux2 kernel: SCSI device sdb: 4194685 512-byte hdwr
sectors (2148 MB)
Jul  8 22:17:26 palinux2 kernel:  sdb: unknown partition table
Jul  8 22:17:26 palinux2 kernel: Lasi Harmony Audio rev. 18 at 0xf0104000,
using IRQ 82
Jul  8 22:17:26 palinux2 kernel: md driver 0.90.0 MAX_MD_DEVS=3D256,
MD_SB_DISKS=3D27
Jul  8 22:17:26 palinux2 kernel: md.c: sizeof(mdp_super_t) =3D 4096
Jul  8 22:17:26 palinux2 kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Jul  8 22:17:26 palinux2 kernel: IP Protocols: ICMP, UDP, TCP
Jul  8 22:17:26 palinux2 kernel: IP: routing cache hash table of 512
buckets, 4Kbytes
Jul  8 22:17:26 palinux2 kernel: TCP: Hash tables configured (established
4096 bind 8192)
Jul  8 22:17:26 palinux2 kernel: eth0: link ok.
Jul  8 22:17:26 palinux2 kernel: NET4: Unix domain sockets 1.0/SMP for
Linux NET4.0.
Jul  8 22:17:26 palinux2 kernel: VFS: Mounted root (ext2 filesystem)
readonly.
Jul  8 22:17:26 palinux2 kernel: Adding Swap: 123684k swap-space (priority
-1)
Jul  8 22:17:26 palinux2 kernel: eth0: link ok.
Jul  8 22:17:28 palinux2 lpd[162]: restarted
Jul 12 15:31:22 palinux2 kernel: Kernel logging (proc) stopped.
Jul 12 15:31:22 palinux2 kernel: Kernel log daemon terminating.
Jul 12 15:31:22 palinux2 exiting on signal 15

### K 2.4.6-pa12

Jul 12 15:32:41 palinux2 syslogd 1.4.1#2: restart.
Jul 12 15:32:42 palinux2 kernel: klogd 1.4.1#2, log source =3D /proc/kmsg
started.
Jul 12 15:32:42 palinux2 kernel: Inspecting /boot/System.map
Jul 12 15:32:46 palinux2 lpd[155]: restarted
Jul 12 15:32:47 palinux2 kernel: Loaded 24065 symbols from
/boot/System.map.
Jul 12 15:32:47 palinux2 kernel: Symbols match kernel version 2.4.6.
Jul 12 15:32:47 palinux2 kernel: No module symbols loaded - kernel modules
not enabled.
Jul 12 15:32:47 palinux2 kernel: Linux version 2.4.6-pa12 (root@wslin) (gcc
version 3.0 20010427 (prerelease)) #1 Thu Jul 12 13:23:06 GMT 2001
Jul 12 15:32:47 palinux2 kernel: FP[0] enabled: Rev 1 Model 13
Jul 12 15:32:47 palinux2 kernel: The 32-bit Kernel has started...
Jul 12 15:32:47 palinux2 kernel: Determining PDC firmware type: Older
Legacy Box
Jul 12 15:32:47 palinux2 kernel: model^I00006010 00000481 00000000 00000000
77dd299c 00000000 00000004 00000072 00000072
Jul 12 15:32:47 palinux2 kernel: vers^I0000000c
Jul 12 15:32:47 palinux2 kernel: CPUID^Ivers 0 rev 0
Jul 12 15:32:47 palinux2 kernel: model^I9000/712
Jul 12 15:32:47 palinux2 kernel: Total Memory: 64 Mb
Jul 12 15:32:47 palinux2 kernel: On node 0 totalpages: 16384
Jul 12 15:32:47 palinux2 kernel: zone(0): 16384 pages.
Jul 12 15:32:47 palinux2 kernel: zone(1): 0 pages.
Jul 12 15:32:47 palinux2 kernel: zone(2): 0 pages.
Jul 12 15:32:47 palinux2 kernel: Searching for devices...
Jul 12 15:32:47 palinux2 kernel: Found devices:
Jul 12 15:32:47 palinux2 kernel: 1. Gecko 80 GSC Core Graphics (10) at
0xf8000000, versions 0x1c, 0x0, 0x85, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 2. Gecko 80 Core BA (11) at 0xf0100000,
versions 0x1c, 0x0, 0x81, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 3. Gecko 80 Core SCSI (10) at 0xf0106000,
versions 0x1c, 0x0, 0x82, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 4. Gecko 80 Core LAN (802.3) (10) at
0xf0107000, versions 0x1c, 0x0, 0x8a, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 5. Gecko 80 Core RS-232 (10) at
0xf0105000, versions 0x1c, 0x0, 0x8c, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 6. Gecko 80 Core Centronics (10) at
0xf0102000, versions 0x1c, 0x0, 0x74, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 7. Gecko 80 Audio (10) at 0xf0104000,
versions 0x1c, 0x0, 0x7b, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 8. Gecko 80 Core PC Floppy (10) at
0xf010a000, versions 0x1c, 0x0, 0x83, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 9. Gecko 80 Core PS/2 Port (10) at
0xf0108000, versions 0x1c, 0x0, 0x84, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 10. Gecko 80 Core PS/2 Port (10) at
0xf0108100, versions 0x1c, 0x0, 0x84, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: 11. Gecko 80 (712/80) (0) at 0xfffbe000,
versions 0x601, 0x0, 0x4, 0x0, 0x81
Jul 12 15:32:47 palinux2 kernel: 12. Gecko 80 (1) at 0xfffbf000, versions
0x38, 0x0, 0x9, 0x0, 0x0
Jul 12 15:32:47 palinux2 kernel: That's a total of 12 devices.
Jul 12 15:32:47 palinux2 kernel: CPU(s): 1 x PA7100LC (PCX-L) at 80.000000
MHz
Jul 12 15:32:47 palinux2 kernel: Kernel command line: root=3D/dev/sda3 HOME=
=3D/
console=3Dtty0 sti=3D0 sti_font=3DVGA8x16 TERM=3Dlinux
Jul 12 15:32:47 palinux2 kernel: Console: colour dummy device 160x64
Jul 12 15:32:47 palinux2 kernel: Calibrating delay loop... 79.66 BogoMIPS
Jul 12 15:32:47 palinux2 kernel: Memory: 61780k available
Jul 12 15:32:47 palinux2 kernel: Dentry-cache hash table entries: 8192
(order: 4, 65536 bytes)
Jul 12 15:32:47 palinux2 kernel: Inode-cache hash table entries: 4096
(order: 3, 32768 bytes)
Jul 12 15:32:47 palinux2 kernel: Mount-cache hash table entries: 1024
(order: 1, 8192 bytes)
Jul 12 15:32:47 palinux2 kernel: Buffer-cache hash table entries: 1024
(order: 0, 4096 bytes)
Jul 12 15:32:47 palinux2 kernel: Page-cache hash table entries: 16384
(order: 4, 65536 bytes)
Jul 12 15:32:47 palinux2 kernel: POSIX conformance testing by UNIFIX
Jul 12 15:32:47 palinux2 kernel: Lasi version 0 at 0xf0100000 found.
Jul 12 15:32:47 palinux2 kernel: Linux NET4.0 for Linux 2.4
Jul 12 15:32:47 palinux2 kernel: Based upon Swansea University Computer
Society NET3.039
Jul 12 15:32:47 palinux2 kernel: Starting kswapd v1.8
Jul 12 15:32:47 palinux2 kernel: parport_init_chip: initialize
bidirectional-mode.
Jul 12 15:32:47 palinux2 kernel: parport0: PC-style at 0xf0102800, irq 88
[PCSPP,TRISTATE]
Jul 12 15:32:47 palinux2 kernel: STI word mode ROM at f0080000,
hpa=3Df8000000
Jul 12 15:32:47 palinux2 kernel: STI word mode ROM, id 2b4ded6d-40a00499,
conforms to spec rev. 8.04
Jul 12 15:32:47 palinux2 kernel: STI device: HPA208LC1280
Jul 12 15:32:47 palinux2 kernel: Console: switching to colour frame buffer
device 160x64
Jul 12 15:32:47 palinux2 kernel: fb0: stifb 1280x1024-8 frame buffer
device, id: 2b4ded6d, iobase: 0xf8100000
Jul 12 15:32:47 palinux2 kernel: pty: 256 Unix98 ptys configured
Jul 12 15:32:47 palinux2 kernel: lp0: using parport0 (interrupt-driven).
Jul 12 15:32:47 palinux2 kernel: Serial driver version 5.05a (2001-03-20)
with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Jul 12 15:32:47 palinux2 kernel: ttyS00 at iomem 0xf0105800 (irq =3D 90) is=
 a
16550A
Jul 12 15:32:47 palinux2 kernel: PS/2 keyboard controller at 0xf0108000
(irq 69) found, device attached.
Jul 12 15:32:47 palinux2 kernel: PS/2 psaux controller at 0xf0108100 (irq
69) found, device attached.
Jul 12 15:32:47 palinux2 kernel: Generic RTC Driver v1.02 05/27/1999 Sam
Creasey (sammy@oh.verio.com)
Jul 12 15:32:47 palinux2 kernel: block: queued sectors max/low
40896kB/13632kB, 128 slots per queue
Jul 12 15:32:47 palinux2 kernel: RAMDISK driver initialized: 16 RAM disks
of 4096K size 1024 blocksize
Jul 12 15:32:47 palinux2 kernel: loop: loaded (max 8 devices)
Jul 12 15:32:47 palinux2 kernel: SCSI subsystem driver Revision: 1.00
Jul 12 15:32:47 palinux2 kernel: sim700: Configuring 53c710 (SCSI-ID 7) at
f0106100, IRQ 86, options 0
Jul 12 15:32:47 palinux2 kernel: scsi0: Revision 0x2
Jul 12 15:32:47 palinux2 kernel: scsi0: test 1 completed ok.
Jul 12 15:32:47 palinux2 kernel: scsi0 : LASI/Simple 53c7xx
Jul 12 15:32:47 palinux2 kernel:   Vendor: SEAGATE   Model: ST34572N
Rev: HP03
Jul 12 15:32:47 palinux2 kernel:   Type:   Direct-Access
ANSI SCSI revision: 02
Jul 12 15:32:47 palinux2 kernel:   Vendor: HP        Model: C3325A
Rev: HP08
Jul 12 15:32:47 palinux2 kernel:   Type:   Direct-Access
ANSI SCSI revision: 02
Jul 12 15:32:47 palinux2 kernel: Detected scsi disk sda at scsi0, channel
0, id 3, lun 0
Jul 12 15:32:47 palinux2 kernel: Detected scsi disk sdb at scsi0, channel
0, id 6, lun 0
Jul 12 15:32:47 palinux2 kernel: SCSI device sda: 8388314 512-byte hdwr
sectors (4295 MB)
Jul 12 15:32:47 palinux2 kernel: Partition check:
Jul 12 15:32:47 palinux2 kernel:  sda: sda1 sda2 sda3
Jul 12 15:32:47 palinux2 kernel: SCSI device sdb: 4194685 512-byte hdwr
sectors (2148 MB)
Jul 12 15:32:47 palinux2 kernel:  sdb: unknown partition table
Jul 12 15:32:47 palinux2 kernel: Lasi Harmony Audio rev. 18 at 0xf0104000,
using IRQ 82
Jul 12 15:32:47 palinux2 kernel: sticonsole_init: searching for STI ROMs
Jul 12 15:32:47 palinux2 kernel: md: linear personality registered
Jul 12 15:32:47 palinux2 kernel: md: raid0 personality registered
Jul 12 15:32:47 palinux2 kernel: md: raid1 personality registered
Jul 12 15:32:47 palinux2 kernel: md: raid5 personality registered
Jul 12 15:32:47 palinux2 kernel: raid5: measuring checksumming speed
Jul 12 15:32:47 palinux2 kernel:    8regs     :    60.400 MB/sec
Jul 12 15:32:47 palinux2 kernel:    8regs_prefetch:    80.000 MB/sec
Jul 12 15:32:47 palinux2 kernel:    32regs    :   117.600 MB/sec
Jul 12 15:32:47 palinux2 kernel:    32regs_prefetch:   119.600 MB/sec
Jul 12 15:32:47 palinux2 kernel: raid5: using function: 32regs_prefetch
(119.600 MB/sec)
Jul 12 15:32:47 palinux2 kernel: md: md driver 0.90.0 MAX_MD_DEVS=3D256,
MD_SB_DISKS=3D27
Jul 12 15:32:47 palinux2 kernel: md: Autodetecting RAID arrays.
Jul 12 15:32:47 palinux2 kernel: md: autorun ...
Jul 12 15:32:47 palinux2 kernel: md: ... autorun DONE.
Jul 12 15:32:47 palinux2 kernel: Found i82596 at 0xf0107000, IRQ 87
Jul 12 15:32:47 palinux2 kernel: eth0: 82596 at 0xf0107000, 08 00 09 C9 59
7A IRQ 87.
Jul 12 15:32:47 palinux2 kernel: 82596.c $Revision: 1.20 $
Jul 12 15:32:47 palinux2 kernel: NET4: Linux TCP/IP 1.0 for NET4.0
Jul 12 15:32:47 palinux2 kernel: IP Protocols: ICMP, UDP, TCP
Jul 12 15:32:47 palinux2 kernel: IP: routing cache hash table of 512
buckets, 4Kbytes
Jul 12 15:32:47 palinux2 kernel: TCP: Hash tables configured (established
4096 bind 8192)
Jul 12 15:32:47 palinux2 kernel: NET4: Unix domain sockets 1.0/SMP for
Linux NET4.0.
Jul 12 15:32:47 palinux2 kernel: VFS: Mounted root (ext2 filesystem)
readonly.
Jul 12 15:32:47 palinux2 kernel: Adding Swap: 123684k swap-space (priority
-1)
Jul 12 15:32:47 palinux2 kernel: eth0: link ok.

What is strange is the "sticonsole_init: searching for STI ROMs"
which appear after STI... with kernel 2.4.6
and which apear before with 2.4.0

Could it be the reason?

Regards,
     Joel



                                                                           =
                                       =20
                    Richard Hirst                                          =
                                       =20
                    <rhirst@linux        To:     Jo=EBl Soete/BRU/MASTERCAR=
D@MASTERCARD                             =20
                    care.com>            cc:                               =
                                       =20
                                         Subject:     Re: [parisc-linux] pa=
linux 0.9.1                            =20
                    09-07-01                                               =
                                       =20
                    07:21 PM                                               =
                                       =20
                                                                           =
                                       =20
                                                                           =
                                       =20



On Mon, Jul 09, 2001 at 05:42:10PM +0200, Jo=EBl Soete wrote:
>
> FYI
>
> I just recompile last cvs kernel (20010709 ie 2.4.6-pa7)
> It boot fine (whithout yet STICON, just as before kernel of palinux-0.9).
> So I believe that STICON on B180 will work soon.

Please try unplugging and then replugging your k/b when it
appears to be locked.  Seems it may be a keyboard reset problem.

Richard





**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
