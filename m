Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA30213
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Nov 2000 12:52:32 -0700
Message-Id: <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
Date: Fri, 03 Nov 2000 11:46:39 -0800
To: Grant Grundler <grundler@cup.hp.com>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command 
Cc: Matt Taggart <taggart@carmen.fc.hp.com>, parisc-linux@thepuffingroup.com
In-Reply-To: <200011031919.LAA00315@milano.cup.hp.com>
References: <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

I have removed the 2nd HDD now the boot is trying but I get the same error:
my fstab reads as :

# /etc/fstab: static file system information.
#
# <file system> <mount> <type>  <options>                       <dump> <pass>
#/dev/sda1      /boot   ext2    defaults,errors=remount-ro      0       0
#/dev/sda2      none    swap    sw                              0       0
/dev/sda3       /       ext2    defaults,errors=remount-ro      0       0
# proc          /proc   proc    defaults                        0       0


The erros is as follows:
Boot IO Dependent Code (IODC) revision 144
.... SUCCEEDED!
HARD Booted.
palo ipl bame@noam Tue Oct 31 14:18:02 MST 2000
0/vmlinux 208896 bytes @ 0x1f78c000
0/palo-cmdline '3/boot/vmlinux TERM=linux Home=/ root=/dev/sda3'
/dev/ida1 82 62 1030688
/dev/ida2 f0 1030750 24738
/dev/ida3 83 1055488 1030750
Kernel:partition 3 file /boot/vmlinux
ext2 block size 1024
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux)=3
Couldn't gork your kernel executabel format failed to load kernel
Failed to load Kernel.

Please suggest.
