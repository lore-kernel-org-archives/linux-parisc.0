Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp6ve.mailsrvcs.net (smtp6vepub.gte.net [206.46.170.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id C53F84A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 00:17:29 -0700 (MST)
Received: from neuronet.pitt.edu (adsl-151-201-239-223.pittpa.adsl.bellatlantic.net [151.201.239.223])
	by smtp6ve.mailsrvcs.net (8.9.1/8.9.1) with ESMTP id HAA1998710
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 07:17:18 GMT
Sender: raffo@bellatlantic.net
Message-ID: <3A936B86.4B642A4F@neuronet.pitt.edu>
Date: Wed, 21 Feb 2001 02:17:26 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Warnings compiling the CVS kernel
References: <3A9369CF.C7DDC195@neuronet.pitt.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Perhaps this may give you more information on the machine I'm using.

Rafael
--

palo ipl raffo@prod2 Wed Feb 21 01:25:46 EST 2001
0/vmlinux 2557795 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs
nfsroot=192.168.0.2:/tftpboot/parisc console=ttyS0'
Kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1464692 mediaptr 0x1000
Segment 1 load 00266000 size 181464 mediaptr 0x167000
Segment 2 load 00294000 size 218968 mediaptr 0x194000
Segment 3 load 002cc000 size 8192 mediaptr 0x1ca000
Segment 4 load 002fa688 size 74224 mediaptr 0x1cc688
branching to kernel entry point 0x00100000
PDC Console Initialized
The 32-bit Kernel has started...
FP[0] enabled: Rev 1 Model 9
Free memory starts at: 0x1030d000
start_parisc(0x64d24,0x64d24,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs
nfsroot=192.168.0.2:/tftpboot/parisc console=ttyS0'
PALO initrd 0-0
model   00003160 00000481 00000000 00000000 77b82c78 ffffffff 00000004
0000000a 0000000a
vers    00000013
CPUID   vers 0 rev 0
model   9000/715
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Using Alex's odd 715/old exception, onboard graphics won't be
inventoried!
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0,
0x77, 0x0, 0x0
2. Scorpio Sr. Core BA (11) at 0xf082f000, versions 0x19, 0x0, 0x70,
0x0, 0x0
3. Scorpio Sr. Core SCSI (10) at 0xf0825000, versions 0x19, 0x0, 0x71,
0x0, 0x0
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000, versions 0x19, 0x0,
0x72, 0x0, 0x0
5. Scorpio Sr. Core HIL (10) at 0xf0821000, versions 0x19, 0x0, 0x73,
0x0, 0x0
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75,
0x0, 0x0
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75,
0x0, 0x0
8. Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0,
0x74, 0x0, 0x0
9. Scorpio Sr. Audio (10) at 0xf1000000, versions 0x19, 0x0, 0x7b, 0x0,
0x0
10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76,
0x0, 0x0
11. Scorpio Sr.(715/75) (0) at 0xfffbe000, versions 0x316, 0x0, 0x4,
0x0, 0x81
12. Scorpio Sr. (1) at 0xfffbf000, versions 0x27, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz
Linux version 2.4.0 (raffo@prod2) (gcc version 2.97 20010128
(experimental)) #1 Wed Feb 21 02:04:36 EST 2001
free_bootmem(0x30d800, 0x3cf2800)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 8192 pages.
zone(1): 8192 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs
nfsroot=192.168.0.2:/tftpboot/parisc console=ttyS0
Calibrating delay loop... 74.75 BogoMIPS
Memory: 61252k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX

[error messages from previous post]
