Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA08588
	for <parisc-linux@puffin.external.hp.com>; Sat, 18 Sep 1999 00:49:37 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <37E34387.713858FE@uswest.net>
Date: Sat, 18 Sep 1999 01:47:19 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Parisc Linux <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] exec_kernel help
List-ID: <linux-parisc.vger.kernel.org>

Hello hackers,

I've been struggling with this for the last couple of days, and I'm
stuck.  I can build a bootable image, but I can not get it to transfer
control to the kernel.  (I'm working on a C200+ which is a PA-8200
(PA-RISC 2.0) as Grant pointed out earlier).  I know the first targeted
build is for the PA 1.1, but I am willing and would like to get the
kernel working on the 2.0 also.

Here is the output on the console (I'm typing this in by hand)
---------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Fri Sep 17 01:05:03 MDT 1999 by rbrad@vega

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
No ramdisks available.
SOM-Kernel:
aux_header_location: 00000080
som                  : 00200080
exec_dfile      : 0009E000
exec_dsize     : 0007C000
exec_dmem  : C007D000
exec_tfile       : 00031000
exec_tsize      : 0006C008
exec_tmem   :  C0010000
Code at 0x00010000, size=0x0006c008
Data at 0x0007D000, size=0x0007C000
BSS  at 0x00F9000

Transfering control to kernel. (At entry point 0x00010000)
-----------------------------------------------------

It hangs there and I have to reboot to continue.
I am booting using rbootd/tftpd if that makes any difference.

Any help/pointers would be appreciated :)

Thanks,
-Ryan
