Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA01298
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 May 2000 12:14:28 -0600
Message-ID: <20000527181423.19639.qmail@web509.mail.yahoo.com>
Date: Sat, 27 May 2000 11:14:23 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-846930886-959451263=:19400"
Subject: [parisc-linux] 715/33 booting from SCSI disk nearly ok
List-ID: <linux-parisc.vger.kernel.org>

--0-846930886-959451263=:19400
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

first the good news: following Paul's excellent palo
documentation I succeeded to boot my 715/33 from its
internal HP C3324A SCSI disk. I booted the kernel from
the special F0 partition and used the ext2 fs on
partition 2 as the root filesystem.

But booting the kernel /vmlinux directly from the ext2
filesystem fails. Here is the bootlog:

Trying scsi.5.0
Boot path initialized.
Attempting to load IPL.

Hard booted.
palo ipl ulli@Ullis_PC Fri May 26 21:42:53 MEST 2000
0/vmlinux 2381159 bytes @ 0x44000
0/palo-cmdline '2/vmlinux HOME=/ TERM=LINUX
console=tty root=/dev/sda2'
/dev/ida1  f0         32      22496
/dev/ida2  83      22528    2027520
/dev/ida5  f0         32      22496
Kernel: partition 2 file /vmlinux
ext2 block size 1024
ext2_mount(partition 2) returns 0
ext2_open(/vmlinux) = -1
open /vmlinux failed

I have attached the successful bootlog using the
recovery kernel in case it helps diagnosing this
problem.

Ulrich

__________________________________________________
Do You Yahoo!?
Kick off your party with Yahoo! Invites.
http://invites.yahoo.com/
--0-846930886-959451263=:19400
Content-Type: text/plain; name="bootlog_f0.txt"
Content-Description: bootlog_f0.txt
Content-Disposition: inline; filename="bootlog_f0.txt"

              (c) Copyright Hewlett-Packard Company, 1991, 1992
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92

PDC ROM rev. 1.4
IODC ROM rev. 1.2
48 MB of memory have been configured.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.6.0                 HP      C2490AM
P1                    scsi.5.0                 HP      C3324A



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b p1 isl

Trying scsi.5.0
Boot path initialized.
Attempting to load IPL.


Soft booted.
palo ipl ulli@Ullis_PC Fri May 26 21:42:53 MEST 2000
0/vmlinux 2381159 bytes @ 0x44000
0/palo-cmdline '2/vmlinux HOME=/ TERM=LINUX console=tty root=/dev/sda2'
/dev/ida1  f0         32      22496
/dev/ida2  83      22528    2027520
/dev/ida5  f0         32      22496
0/vmlinux HOME=/ TERM=LINUX console=tty root=/dev/sda2
Kernel: partition 0 file /vmlinux
ELF32 executable
                prepare_loadable 0050368c 2

Entry 0010197c first 00100000 n 4
Segment 0 load 00100000 size 1357564 mediaptr 0x1000
Segment 1 load 0024c000 size 108584 mediaptr 0x14d000
Segment 2 load 00268000 size 58776 mediaptr 0x168000
Segment 3 load 00278000 size 8192 mediaptr 0x177000
branching to kernel entry point 0x0010197c
The Kernel has started...
Free memory starts at: 0xc02e4000
PALO command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sda2'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00003110 00000481 00000000 00000000 78294d38 ffffffff 00000004 0000000a
0000000a
vers    00000013
CPUID vers 0 rev 0
CPU(s): 1 x PA7100 at 33.333500 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0x0, 0
x0
2. Scorpio Jr. Core BA (11) at 0xf082f000, versions 0xb, 0x0, 0x70, 0x0, 0x0
3. Scorpio Jr. Core SCSI (10) at 0xf0825000, versions 0xb, 0x0, 0x71, 0x0, 0x0
4. Scorpio Jr. Core LAN (802.3) (10) at 0xf0826000, versions 0xb, 0x0, 0x72, 0x0
, 0x0
5. Scorpio Jr. Core HIL (10) at 0xf0821000, versions 0xb, 0x0, 0x73, 0x0, 0x0
6. Scorpio Jr. Core RS-232 (10) at 0xf0823000, versions 0xb, 0x0, 0x75, 0x0, 0x0

7. Scorpio Jr. Core RS-232 (10) at 0xf0822000, versions 0xb, 0x0, 0x75, 0x0, 0x0

8. Scorpio Jr. Core Centronics (10) at 0xf0824000, versions 0xb, 0x0, 0x74, 0x0,
 0x0
9. Scorpio Jr. Audio (10) at 0xf1000000, versions 0xb, 0x0, 0x7b, 0x0, 0x0
10. Scorpio Jr.(715/33) (0) at 0xfffbe000, versions 0x311, 0x0, 0x4, 0x0, 0x81
11. Scorpio Jr. (1) at 0xfffbf000, versions 0x1b, 0x0, 0x9, 0x0, 0x0
That's a total of 11 devices.
Linux version 2.3.99-pre1 (ulli@Ullis_PC) (gcc version 2.9-hppa-991112) #3 Fri M
ay 26 21:34:53 MEST 2000
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 12288
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 25.60 BogoMIPS
Memory: 45276k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c2ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c2ffe004, name=test-cachep)
kmem_test() - finished
c2ff0000 c2ff8000 c2fee000 c2ffc000
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01f843c, 0x0, asp, c2fe9080)
ASP IRQ 259 EIM 0xfffe0003
busdevice_alloc_irq(0xf0823000) on ASP 0x200 + 26 = 538
Found serial #0 at 0xf0823000, IRQ 538
ttyS00 at iomem 0xf0823800 (irq = 538) is a 16550A
busdevice_alloc_irq(0xf0822000) on ASP 0x200 + 25 = 537
Found serial #1 at 0xf0822000, IRQ 537
ttyS00 at iomem 0xf0822800 (irq = 537) is a 16550A
busdevice_alloc_irq(0xf0826000) on ASP 0x200 + 23 = 535
Found i82596 at 0xf0826000, IRQ 535
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enab
led
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Lasi Scsi (53c700) found at 0xf0825100
busdevice_alloc_irq(0xf0825000) on ASP 0x200 + 22 = 534
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 534
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: test 1 completed ok.
request_irq(534, c01ebe0c, 0x20000000, sim700, c2fcf260)
busdev_enable_irq(c2fe9080, 22) ASP: IMR 0x200
scsi0: sim700_intr_handle() called with no interruptscsi0 : LASI/Simple 53c700
scsi : 1 host.
  Vendor: HP        Model: C3324A            Rev: HP08
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 5, lun 0
  Vendor: HP        Model: C2490AM           Rev: 5193
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
scsi : detected 2 SCSI disks total.
SCSI device sda: hdwr sector= 512 bytes. Sectors= 2051460 [1001 MB] [1.0 GB]
Partition check:
 sda: sda1 sda2
SCSI device sdb: hdwr sector= 512 bytes. Sectors= 4165272 [2033 MB] [2.0 GB]
 sdb: unknown partition table
82596: 6 0 0 at c0261f24
82596: 6 f0826000 217 at c2fecc00
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: 82596 at 0xf0826000, 08 00 09 83 9B 3F IRQ 535.
82596.c $Revision: 1.9 $
request_irq(535, c01bac38, 0x0, i82596, c2fecc00)
busdev_enable_irq(c2fe9080, 23) ASP: IMR 0x300
busdev_disable_irq(c2fe9080, 23) ASP: IMR 0x200
busdev_enable_irq(c2fe9080, 23) ASP: IMR 0x300
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 149.234.204.34, my address is 149.234.204.66
VFS: Mounted root (ext2 filesystem) readonly.
tty_open
searching for 4/64
found 136/[0,256]
found 128/[0,256]
found 3/[0,256]
found 2/[0,256]
found 5/[64,64]
found 4/[64,64]
driver: -1070780592
retval 0
request_irq(538, c01a59a4, 0x4000000, serial, c02d3934)
busdev_enable_irq(c2fe9080, 26) ASP: IMR 0x320
driver.open 0
Stand-alone shell (version 2.1)
> -ls
.
..
dev
lost+found
palo
proc
sbin
vmlinux
>
--0-846930886-959451263=:19400--
