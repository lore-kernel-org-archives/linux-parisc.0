Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18921
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jun 2000 06:31:07 -0600
Message-ID: <20000607123117.6133.qmail@web511.mail.yahoo.com>
Date: Wed, 7 Jun 2000 05:31:17 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Booting a pre8-kernel on a 715/33 fails
List-ID: <linux-parisc.vger.kernel.org>

Hi,

after the pre8-merge, booting a kernel on my 715/33
fails. I have checked out the linux-2.3 tree this
morning and build a kernel. The bootlog stops when the
ASP chip is initialized. Here is the complete log
(booted via rbootd):

Trying lan.0004ac-4425c5.0.0
Boot path initialized.
Attempting to load IPL.

Hard booted.
palo ipl ulli@Ullis_PC Wed Jun  7 06:37:35 MEST 2000
0/vmlinux 2575693 bytes @ 0x7800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX
root=/dev/nfs nfsroot=149.234.204.34
 '
Kernel: partition 0 file /vmlinux
ELF32 executable
                prepare_loadable 00503680 2

Entry 00101c9c first 00100000 n 4
Segment 0 load 00100000 size 1461596 mediaptr 0x1000
Segment 1 load 00266000 size 124028 mediaptr 0x166000
Segment 2 load 00288000 size 69524 mediaptr 0x185000
Segment 3 load 0029c000 size 8192 mediaptr 0x196000
branching to kernel entry point 0x00101c9c
pdc_cons registered !
The Kernel has started...
Free memory starts at: 0xc02ca000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs
nfsroot=149.234.204.34 '
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00003110 00000481 00000000 00000000 78294d38
ffffffff 00000004 0000000a
0000000a
vers    00000013
CPUID vers 0 rev 0
CPU(s): 1 x PA7100 at 33.333500 MHz
Searching for devices in PDC firmware...  an older
box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000,
versions 0x6, 0x0, 0x77, 0x0, 0x0
2. Scorpio Jr. Core BA (11) at 0xf082f000, versions
0xb, 0x0, 0x70, 0x0, 0x0
3. Scorpio Jr. Core SCSI (10) at 0xf0825000, versions
0xb, 0x0, 0x71, 0x0, 0x0
4. Scorpio Jr. Core LAN (802.3) (10) at 0xf0826000,
versions 0xb, 0x0, 0x72, 0x0, 0x0
5. Scorpio Jr. Core HIL (10) at 0xf0821000, versions
0xb, 0x0, 0x73, 0x0, 0x0
6. Scorpio Jr. Core RS-232 (10) at 0xf0823000,
versions 0xb, 0x0, 0x75, 0x0, 0x0
7. Scorpio Jr. Core RS-232 (10) at 0xf0822000,
versions 0xb, 0x0, 0x75, 0x0, 0x0
8. Scorpio Jr. Core Centronics (10) at 0xf0824000,
versions 0xb, 0x0, 0x74, 0x0, 0x0
9. Scorpio Jr. Audio (10) at 0xf1000000, versions 0xb,
0x0, 0x7b, 0x0, 0x0
9. Scorpio Jr. Audio (10) at 0xf1000000, versions 0xb,
0x0, 0x7b, 0x0, 0x0
11. Scorpio Jr. (1) at 0xfffbf000, versions 0x1b, 0x0,
0x9, 0x0, 0x0
That's a total of 11 devices.
Linux version 2.3.99-pre8 (ulli@Ullis_PC) (gcc version
2.9-hppa-991112) #1 Wed Jun 7 06:27:41 MEST 2000
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 12288
zone(0): 6144 pages.
zone(1): 6144 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 30.11 BogoMIPS
Memory: 45380k available
Dentry-cache hash table entries: 8192 (order: 4, 65536
bytes)
c2ff0000 c2ff8000 c2fde000 c2ffc000
Buffer-cache hash table entries: 1024 (order: 0, 4096
bytes)
Page-cache hash table entries: 16384 (order: 4, 65536
bytes)
kmem_create: Poisoning requested, but con given -
bdev_cache
Inode-cache hash table entries: 4096 (order: 3, 32768
bytes)
kmem_create: Poisoning requested, but con given -
inode_cache
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c0209904, 0x0, asp, c2fd9080)

Any ideas what's wrong ?

Ulrich

__________________________________________________
Do You Yahoo!?
Yahoo! Photos -- now, 100 FREE prints!
http://photos.yahoo.com
