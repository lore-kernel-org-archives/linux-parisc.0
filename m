Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27676
	for <parisc-linux@puffin.external.hp.com>; Wed, 26 Jan 2000 12:26:55 -0700
Date: Wed, 26 Jan 2000 13:27:24 -0500 (EST)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSO.4.21.0001261309080.4910-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Boot info from 715/64
List-ID: <linux-parisc.vger.kernel.org>



Well, I finally got past the "!." and into the kernel proper.
I don't know whether it was a small number of updates from
CVS, or something was wedged in the build system.  I was
trying to track the problem by putting in kernel halts
(with the handy rotating LEDS function), and the kernel
when further with them in, than without them.  So I took them
out and suddenly I get all the way to pagetable_init.

Anyway, In case it is of any use, here's the CPU id from my machine:

FP CCR was 0x0, will be set to 0xc0
model 000060a0 00000481 00000000 00000000 77c0cada 
00000000 00000004 00000072 00000072
vers 0000000c

[...lots of stuff about "unknown" CPU info]

Searching for devices in PDC firmware...   an older box...
Found devices:
1. Mirage Jr GSC Builtin Graphics (10) at 0xf8000000, versions 0x12,
0x0, 0x85, 0x0, 0x0

[...]  more devices, some of which I don't have.

15. Mirage Jr (715/64) (0) at 0xfffbe000 versions 0x60a, 0x0, 0x4, 0x0,
0x81
16. Mirage Jr (1) at 0xfffbf000, vesions 0x4a, 0x0, 0x9, 0x0, 0x0
That's a total of 16 devices.
Linux version 2.3.29 (root@parisc) (gcc version egcs-2.91.60 19981201
(egcs-1.1.1 release)) #22 Wed Jan 26 12:44:21 EST 2000
init_bootmem 679 8192
free_bootmem 002a66bc 0ad59944
d_conf 61402000
initrd: c01cd000-c0231000
command_line: /stand/vmlinux HOME=/ TERM=linux console=tty

pagetable_init


--
Brian S. Julin
