Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA06188
	for <parisc-linux@puffin.external.hp.com>; Tue, 22 Feb 2000 10:29:08 -0700
Received: from www.netzwerk.klinik.uni-mainz.de (root@www-Klinik.Uni-Mainz.DE [134.93.144.72])
	by mailgate2.zdv.Uni-Mainz.DE (8.9.3/8.9.3) with ESMTP id RAA01243
	for <parisc-linux@thepuffingroup.com>; Tue, 22 Feb 2000 17:29:50 +0100 (MET)
Received: (from kubla@localhost)
	by www.netzwerk.klinik.uni-mainz.de (8.9.3/8.9.3/Debian/GNU) id RAA20417
	for parisc-linux@thepuffingroup.com; Tue, 22 Feb 2000 17:29:50 +0100
Date: Tue, 22 Feb 2000 17:29:49 +0100
From: Dominik Kubla <dominik.kubla@uni-mainz.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000222172949.A20225@uni-mainz.de>
References: <38B21539.A3D46D7@cln.etc.bc.ca> <20000222075737.A16202@uni-mainz.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=y0ulUmNC+osPPQO6
In-Reply-To: <20000222075737.A16202@uni-mainz.de>; from Dominik Kubla on Tue, Feb 22, 2000 at 07:57:37AM +0100
Subject: [parisc-linux] 725/50 boot log...
List-ID: <linux-parisc.vger.kernel.org>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii

On Tue, Feb 22, 2000 at 07:57:37AM +0100, Dominik Kubla wrote:
...
> They also seem to have WAX support.  We tried to netboot a 725/50 with
> the latest images from puffin.external yesterday, which went well until
> loading the ramdisk triggered a bug in block_dev.c (that's what it
> reported), bootlog to follow later today.

As promised here is the boot log of our attempt with that 725/50.

Yours,
  Dominik Kubla
-- 
Looking for information about professional american football in Europe? 
Then visit the independant "NFL@Europe Fan Site" at:
            http://www-klinik.uni-mainz.de/staff/kubla/NFLE/

--y0ulUmNC+osPPQO6
Content-Type: text/plain
Content-Disposition: attachment; filename="hp725-boot.txt"
Content-Transfer-Encoding: quoted-printable




              (c) Copyright Hewlett-Packard Company, 1991, 1992, 1993
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 9=
2=20

ROM: 9000/725/50

PDC ROM rev. 1.2
IODC ROM rev. 1.0
64 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Booting from:     scsi.6.0     QUANTUM LPS525S

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Search terminated.



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: a
BOOT_ADMIN> boot lan

Trying lan.000000-000000.0.0
Boot path initialized.
Attempting to load IPL.


Hard booted.

---------------------------------------------------------------------------=
---

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Thu Feb 17 17:10:54 EST 2000 by mang@rye

Official memory starts at 00006400
Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 01000080
exec_dfile: 00145000
exec_dsize: 000B9000
exec_dmem : C01F5000
exec_tfile: 00050000
exec_tsize: 000F4008
exec_tmem : C0100000
exec_bsize: 00060FE0
exec_entry: C0100000
Code at 0x00100000, size=3D0x000F4008
Data at 0x001F5000, size=3D0x000B9000
BSS  at 0x002AE000.
exec_entry: C0100000

Transferring control to kernel. (At entry point 0x00100000)
The Kernel has started...
Free memory starts at: 0xc030f000
PALO command line: '/stand/vmlinux HOME=3D/ TERM=3DLINUX console=3Dtty'
FP CCR was 0x0, will be set to 0xc0
model   00003180 00000481 00000000 00000000 77a46a07 ffffffff 00000004 0000=
000a 0000000a
vers    0000000b
CPUID vers 0 rev 0
Model: Spectra (725/50) with 64 MB RAM (Using 64 MB).
CPU(s): 1 x PA7100LC at 50.000000 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0=
x0, 0x0
2. Spectra 50 Core BA (11) at 0xf082f000, versions 0x21, 0x0, 0x70, 0x0, 0x0
3. Spectra 50 Core SCSI (10) at 0xf0825000, versions 0x21, 0x0, 0x71, 0x0, =
0x0
4. Spectra 50 Core LAN (802.3) (10) at 0xf0826000, versions 0x21, 0x0, 0x72=
, 0x0, 0x0
5. Spectra 50 Core HIL (10) at 0xf0821000, versions 0x21, 0x0, 0x73, 0x0, 0=
x0
6. Spectra 50 Core RS-232 (10) at 0xf0823000, versions 0x21, 0x0, 0x75, 0x0=
, 0x0
7. Spectra 50 Core RS-232 (10) at 0xf0822000, versions 0x21, 0x0, 0x75, 0x0=
, 0x0
8. Spectra 50 Core Centronics (10) at 0xf0824000, versions 0x21, 0x0, 0x74,=
 0x0, 0x0
9. Spectra 50 Audio (10) at 0xf1000000, versions 0x21, 0x0, 0x7b, 0x0, 0x0
10. Spectra 50 EISA BA (11) at 0xfc000000, versions 0x21, 0x0, 0x76, 0x0, 0=
x0
11. Spectra (725/50) (0) at 0xfffbe000, versions 0x318, 0x0, 0x4, 0x0, 0x81
12. Spectra 50 (1) at 0xfffbf000, versions 0x29, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
Linux version 2.3.42 (mang@rye) (gcc version egcs-2.91.66 19990314 (egcs-1.=
1.2 release)) #11 Thu Feb 17 18:30:32 EST 2000
init_bootmem 783 16384
init_bootmem complete
free_bootmem 0030f800 03cf0800
d_conf 51402000
initrd: c01fc000-c0292000
pagetable_init
miscoloured (c013c540)
miscoloured (c013c55c)
On node 0 totalpages: 00004000
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 43.32 BogoMIPS
Memory: 60224k available
kmem_test() - start
kmem_free: Bad front redzone (objp=3Dc3ffe004, name=3Dtest-cachep)
kmem_free: Bad rear redzone (objp=3Dc3ffe004, name=3Dtest-cachep)
kmem_test() - finished
c3ff0000 c3ff8000 c3fee000 c3ffc000
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01b51b8, 0x0, asp, c3fe7060)
Lasi IRQ 259 EIM 0xfffe0003
iosapic_init()
calling get_irt_size
get_irt_size: -1
pdc_pci_irt_size: -1
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI=
 enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 600 blocks [1 disk] into ram disk... |=08/=08-=08\=08|=08/=
=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08=
|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08done.
kernel BUG at block_dev.c:411!
kernel BUG at block_dev.c:411!

--y0ulUmNC+osPPQO6--
