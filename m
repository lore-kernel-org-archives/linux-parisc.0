Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13445482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 06:51:02 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (unknown [145.254.203.173])
	by mx04.nexgo.de (Postfix) with ESMTP id 42D5E2F85E
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Sep 2001 14:50:59 +0200 (CEST)
Message-ID: <3B9B6595.9000603@hrzpub.tu-darmstadt.de>
Date: Sun, 09 Sep 2001 14:50:29 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Subject: [parisc-linux] HIL-Keyboard not found after reboot
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I just compilied the new kernel (2.4.9-pa16), and noticed that after 
rebooting my machine via "reboot" my PS/2-Keyboard on the HIL-Adptorbox 
isn't recognized anymore. Switching the machine off and on, makes 
Keyboard visible again. Here are the important lines from bootlog:

SNIP---
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf4000000, versions 0x4, 0x0, 0x77
2. Mirage GSC Builtin Graphics (10) at 0xf8000000, versions 0x13, 0x0, 0x85
3. Mirage Core BA (11) at 0xf0100000, versions 0x29, 0x0, 0x81
4. Mirage Core SCSI (10) at 0xf0106000, versions 0x29, 0x0, 0x82
5. Mirage Core LAN (802.3) (10) at 0xf0107000, versions 0x29, 0x0, 0x8a
6. Mirage Core RS-232 (10) at 0xf0105000, versions 0x29, 0x0, 0x8c
7. Mirage Core Centronics (10) at 0xf0102000, versions 0x29, 0x0, 0x74
8. Mirage Audio (10) at 0xf0104000, versions 0x29, 0x0, 0x7b
9. Mirage Core PC Floppy (10) at 0xf010a000, versions 0x29, 0x0, 0x83
10. Mirage Core PS/2 Port (10) at 0xf0108000, versions 0x29, 0x0, 0x84
11. Mirage Core PS/2 Port (10) at 0xf0108100, versions 0x29, 0x0, 0x84
12. Mirage Wax BA (11) at 0xf0200000, versions 0x13, 0x0, 0x8e
13. Mirage 100 Wax HIL (10) at 0xf0201000, versions 0x13, 0x0, 0x73
14. Mirage Wax RS-232 (10) at 0xf0202000, versions 0x13, 0x0, 0x8c
15. Mirage 100 (0) at 0xfffbe000, versions 0x60b, 0x0, 0x4
16. Mirage 100 (1) at 0xfffbf000, versions 0x4b, 0x0, 0x9
That's a total of 16 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Kernel command line: root=/dev/sda4 HOME=/ TERM=linux console=ttyS0
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126164k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
Wax at 0xf0200000 found.
Wax: HIL Keyboard-NMI registered.
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
VFS: Diskquotas version dquot_6.4.0 initialized
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ 
SERIAL_PCI en
abled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0202800 (irq = 121) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, no device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, no device attached.
Found HIL at 0xf0201000, IRQ 126
HIL: no keyboard present.
Warning : device (10, 0x13, 0x0, 0x73) NOT claimed by HIL
SNAP---

and after a coldboot the last lines are:
SNIP------
Found HIL at 0xf0201000, IRQ 126
HIL: keyboard found at id 0
HIL: keymap loaded.
SNAP-----

Has anyone a solution?
So long,
            Rüdiger
