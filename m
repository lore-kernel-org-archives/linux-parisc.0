Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta05-svc.ntlworld.com (mta05-svc.ntlworld.com [62.253.162.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB5C5482D
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Jun 2001 15:41:37 -0600 (MDT)
Received: from homer.intra.qzxyz.com ([213.104.66.104])
          by mta05-svc.ntlworld.com
          (InterMail vM.4.01.02.27 201-229-119-110) with ESMTP
          id <20010616214135.IYYN284.mta05-svc.ntlworld.com@homer.intra.qzxyz.com>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 16 Jun 2001 22:41:35 +0100
Received: from edna.intra.qzxyz.com ([192.168.42.126] helo=talk21.com)
	by homer.intra.qzxyz.com with esmtp (Exim 3.12 #1 (Debian))
	id 15BNp2-0002MT-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Jun 2001 22:41:36 +0100
Sender: ashcroft@dsl2.external.hp.com
Message-ID: <3B2BD290.E36026D8@talk21.com>
Date: Sat, 16 Jun 2001 22:41:36 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Extra serial port on B160L
List-ID: <linux-parisc.vger.kernel.org>

Just run up a freshly pulled from cvs kernel (2.4.0-pa25) on my B160L
and an extra serial port appears.
I take it this is due to the Dino serial port patch which is good but:

It appears as ttyS0 which means the console suddenly changed to ttyS1
(making me think things were broken).
Should it not appear after the Wax serial ports so as to cause least
surprise.

Where is this magical new serial port? I looked on the back of the box
and there are still only two serial connectors like there was last week
;-)

Cheers,
Scott

Relevant bits of old and new boot messages:

Linux version 2.4.0-pa10 (root@slab) (gcc version 3.0 20010315
(prerelease)) #1 Wed May 30 20:19:52 BST 2001
...
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0, 0x0, 0x0
2. Merlin L2 160 (9000/778/B160L) (0) at 0xfffbe000, versions 0x502,
0x0, 0x4, 0x0, 0x81
3. Merlin 160/ThunderHawk Memory (1) at 0xfffbf000, versions 0x67, 0x0,
0x9, 0x0, 0x0
4. Merlin 160 Core BA (11) at 0xffd00000, versions 0x3d, 0x0, 0x81, 0x0,
0x0,  additional addresses: 0xffd0c000 0xffc00000
5. Merlin 160 Core RS-232 (10) at 0xffd05000, versions 0x3d, 0x0, 0x8c,
0x0, 0x0
6. Merlin 160 Core SCSI (10) at 0xffd06000, versions 0x3d, 0x0, 0x82,
0x0, 0x0
7. Merlin 160 Core Lan (802.3) (10) at 0xffd07000, versions 0x3d, 0x0,
0x8a, 0x0, 0x0
8. Merlin 160 Core Centronics (10) at 0xffd02000, versions 0x3d, 0x0,
0x74, 0x0, 0x0,  additional addresses: 0xffd01000 0xffd03000
9. Merlin 160 Core Audio (10) at 0xffd04000, versions 0x3d, 0x4, 0x7b,
0x0, 0x0
10. Merlin 160 Core PC Keyboard (10) at 0xffd08000, versions 0x3d, 0x0,
0x84, 0x0, 0x0
11. Merlin 160 Core PC Keyboard (10) at 0xffd08100, versions 0x3d, 0x0,
0x84, 0x0, 0x0
12. Merlin 160 Wax BA (11) at 0xffe00000, versions 0x41, 0x0, 0x8e, 0x0,
0x0
13. Merlin 160 Wax EISA BA (11) at 0xfc000000, versions 0x41, 0x0, 0x90,
0x0, 0x0,  additional addresses: 0xf0184000
14. Merlin 160 Wax HIL (10) at 0xffe01000, versions 0x41, 0x0, 0x73,
0x0, 0x0
15. Merlin 160 Wax RS-232 (10) at 0xffe02000, versions 0x41, 0x0, 0x8c,
0x0, 0x0
16. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0,
0x85, 0x0, 0x0,  additional addresses: 0xf0011000
17. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x1, 0xa, 0x0,
0x0
18. Merlin+ 132 Dino PS2 Keyboard (10) at 0xfff81000, versions 0x22,
0x0, 0x96, 0x0, 0x0
19. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0,
0x8c, 0x0, 0x0
...
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq = 121) is a 16550A
busdevice_alloc_irq(0x102d0634): No known LASI/ASP/WAX owns device at
0xfff83000 !

Linux version 2.4.0-pa25 (root@nelson) (gcc version 3.0 20010426 (Debian
prerelease)) #2 Sat Jun 16 21:06:07 BST 2001
...
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0, 0x0, 0x0
2. Merlin L2 160 (9000/778/B160L) (0) at 0xfffbe000, versions 0x502,
0x0, 0x4, 0x0, 0x81
3. Merlin 160/ThunderHawk Memory (1) at 0xfffbf000, versions 0x67, 0x0,
0x9, 0x0, 0x0
4. Merlin 160 Core BA (11) at 0xffd00000, versions 0x3d, 0x0, 0x81, 0x0,
0x0,  additional addresses: 0xffd0c000 0xffc00000 
5. Merlin 160 Core RS-232 (10) at 0xffd05000, versions 0x3d, 0x0, 0x8c,
0x0, 0x0
6. Merlin 160 Core SCSI (10) at 0xffd06000, versions 0x3d, 0x0, 0x82,
0x0, 0x0
7. Merlin 160 Core Lan (802.3) (10) at 0xffd07000, versions 0x3d, 0x0,
0x8a, 0x0, 0x0
8. Merlin 160 Core Centronics (10) at 0xffd02000, versions 0x3d, 0x0,
0x74, 0x0, 0x0,  additional addresses: 0xffd01000 0xffd03000 
9. Merlin 160 Core Audio (10) at 0xffd04000, versions 0x3d, 0x4, 0x7b,
0x0, 0x0
10. Merlin 160 Core PC Keyboard (10) at 0xffd08000, versions 0x3d, 0x0,
0x84, 0x0, 0x0
11. Merlin 160 Core PC Keyboard (10) at 0xffd08100, versions 0x3d, 0x0,
0x84, 0x0, 0x0
12. Merlin 160 Wax BA (11) at 0xffe00000, versions 0x41, 0x0, 0x8e, 0x0,
0x0
13. Merlin 160 Wax EISA BA (11) at 0xfc000000, versions 0x41, 0x0, 0x90,
0x0, 0x0,  additional addresses: 0xf0184000 
14. Merlin 160 Wax HIL (10) at 0xffe01000, versions 0x41, 0x0, 0x73,
0x0, 0x0
15. Merlin 160 Wax RS-232 (10) at 0xffe02000, versions 0x41, 0x0, 0x8c,
0x0, 0x0
16. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0,
0x85, 0x0, 0x0,  additional addresses: 0xf0011000 
17. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x1, 0xa, 0x0,
0x0
18. Merlin+ 132 Dino PS2 Keyboard (10) at 0xfff81000, versions 0x22,
0x0, 0x96, 0x0, 0x0
19. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0,
0x8c, 0x0, 0x0
...
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xfff83800 (irq = 138) is a 16550A
ttyS01 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS02 at iomem 0xffe02800 (irq = 121) is a 16550A
