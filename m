Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA02652
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Sep 1999 13:24:15 -0600
Received: from celeris (ti08a95-0026.dialup.online.no [130.67.46.26])
	by online.no (8.9.3/8.9.1) with SMTP id VAA02857
	for <parisc-linux@thepuffingroup.com>; Tue, 28 Sep 1999 21:24:35 +0200 (MET DST)
Message-Id: <199909281924.VAA02857@online.no>
Date: Tue, 28 Sep 1999 21:30:46 +0200
To: parisc-linux@thepuffingroup.com
From: Simen Thoresen <simen-tt@online.no>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] compiling (and booting) on a 735
List-ID: <linux-parisc.vger.kernel.org>

I've now downloaded the ramdisk.bin image (0903), and have compiled with
that. The compile worked, and I'm now sitting with a probably nonworking
kernel :-)

How do I boot?

I'v killed the filesystem on my 2nd disk, doing cat vmlinux >
/dev/dsk/c0t2d0 . No great loss, as I'v emtied it of useful data, and was
planning to do that anyway. Unfortunately, when I boot from P1, IPL
responds with 'bad LIF magic'. back to hpux, then....

Do I need a tftp-server and try for a netboot?


make menuconfig:
I've downloaded ncurses (v 4.2 from ftp.gnu.org,
/gnu/ncurses/ncurses-4.2.tar.gz ) and installed it.

I then linked /usr/local/include (where ncurses.h resides) to
/usr/include/ncurses
(so that /usr/include/ncurses/ncurses.h exists), and sssslightly modified
linux/scripts/lxdialog/Makefile, as HPUX's find barfed on 
-maxdepth 1.

sh-2.03$ diff Makefile.old Makefile
33c33
<       @x=`find /lib/ /usr/lib/ /usr/local/lib/ -maxdepth 1 -name
'libncurses.*
'` ;\
---
>       @x=`find /lib/ /usr/lib/ /usr/local/lib/ -name 'libncurses.*'` ;\

Running make menuconfig from the kernel directory now works great, and I
can build nonworking kernels with gusto.

-Simen Thoresen - finally hacking something useful.
--
"We do have a summer. Last year, I remember, it was a Wednesday" 
-Helga-Marie Johnesen, Norwegian citizen, TIME international.

GNUsig v0.9A R3
Support the GNUsig-project! Mail simen-tt@online.no for details.
