Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA30394
	for <parisc-linux@puffin.external.hp.com>; Mon, 23 Oct 2000 18:06:27 -0600
Received: from buttafuoco.org (p2.buttafuoco.net [192.1.3.2])
	by p2.buttafuoco.net (8.9.3/8.9.3) with ESMTP id UAA30207
	for <parisc-linux@thepuffingroup.com>; Mon, 23 Oct 2000 20:07:53 -0400
Sender: jim@p2.buttafuoco.net
Message-ID: <39F4D2D9.3646D1@buttafuoco.org>
Date: Mon, 23 Oct 2000 20:07:53 -0400
From: Jim Buttafuoco <jim@buttafuoco.org>
Reply-To: jim@buttafuoco.org
MIME-Version: 1.0
To: PARISC-LINUX Mailing List <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=UTF-8
Subject: [parisc-linux] Boot problems with CD image
List-ID: <linux-parisc.vger.kernel.org>

Hi,

    I downloaded the CD image from the FTP site in order to boot my 710
system.  It failed, attached is the output from the serial port.

Any ideas????

Thanks
Jim



.

Booting from:     scsi.0.0     PLEXTOR CD-ROM PX-12TS

Hard booted.
palo ipl bame@noam Fri Aug  4 18:36:35 MDT 2000
0/vmlinux 2349352 bytes @ 0x6e8800
0/palo-cmdline '0/vmlinux TERM=linux HOME=/ root=/dev/scd0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1511580 mediaptr 0x1000
Segment 1 load 00272000 size 132368 mediaptr 0x173000
Segment 2 load 00294000 size 86880 mediaptr 0x194000
Segment 3 load 002ac000 size 8192 mediaptr 0x1aa000
branching to kernel entry point 0x00100000
pdc_cons registered !
The Kernel has started...
Free memory starts at: 0xc02dc000
PALO command line: 'TERM=linux HOME=/ root=/dev/scd0'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00003000 00000481 00000000 00000000 77ed7152 00000000 00000004
0000000d 00000000
vers    00000003
CPUID vers 0 rev 0
CPU(s): 1 x PA7000 at 50.000000 MHz
Searching for devices in PDC firmware...  an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0,
0x77, 0x0, 0x0
2. Bushmaster Core BA (11) at 0xf082f000, versions 0x6, 0x0, 0x70, 0x0,
0x0
3. Bushmaster Core SCSI (10) at 0xf0825000, versions 0x6, 0x0, 0x71,
0x0, 0x0
4. Bushmaster Core LAN (802.3) (10) at 0xf0826000, versions 0x6, 0x0,
0x72, 0x0, 0x0
5. Bushmaster Core HIL (10) at 0xf0821000, versions 0x6, 0x0, 0x73, 0x0,
0x0
6. Bushmaster Core RS-232 (10) at 0xf0823000, versions 0x6, 0x0, 0x75,
0x0, 0x0
7. Bushmaster Core RS-232 (10) at 0xf0822000, versions 0x6, 0x0, 0x75,
0x0, 0x0
8. Bushmaster Core Centronics (10) at 0xf0824000, versions 0x6, 0x0,
0x74, 0x0, 0x0
9. Bushmaster Audio (10) at 0xf1000000, versions 0x6, 0x0, 0x7a, 0x0,
0x0
10. Bushmaster (710) (0) at 0xfffbe000, versions 0x300, 0x0, 0x4, 0x0,
0x81
11. Bushmaster (1) at 0xfffbf000, versions 0x16, 0x0, 0x9, 0x0, 0x0
That's a total of 11 devices.
Linux version 2.3.99-pre8 (bame@noam) (gcc version 2.96 20000707
(experimental)) #24 Fri Aug 4 18:27:58 MDT 2000
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
trap_init
error reading tod clock
Calibrating delay loop... 46.08 BogoMIPS
Memory: 29224k available
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
kmem_create: Poisoning requested, but con given - bdev_cache
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
kmem_create: Poisoning requested, but con given - inode_cache
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
request_irq(259, c01ec76c, 0x0, asp, c1fe4080)
^^^^^
          |--------This is where it stops...
