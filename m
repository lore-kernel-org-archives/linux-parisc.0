Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id A56D0482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  3 Aug 2001 04:23:40 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <OFCFD0268B.6552637A-ONC1256A9D.0025254D@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Fri, 3 Aug 2001 12:26:16 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] XFree86 on B180
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

To test Xfree86, I install following packages:

xserver-xfree86_4.0.3-4_hppa.deb
xserver-common_4.0.3-4_hppa.deb
xterm_4.0.3-4_hppa.deb
xlibmesa3_4.0.3-4_hppa.deb
xlib6g_4.0.3-4_all.deb
xfree86-common_4.0.3-4_all.deb
xfonts-scalable_4.0.3-4_all.deb
xfonts-base_4.0.3-4_all.deb
xfonts-75dpi_4.0.3-4_all.deb
xfonts-100dpi_4.0.3-4_all.deb
xlibs_4.0.3-4_hppa.deb
libxaw7_4.0.3-4_hppa.deb
libfreetype6_2.0.2.20010514-1_hppa.deb
xdm_4.0.3-4_hppa.deb
xbase-clients_4.0.3-4_hppa.deb
libxaw6_4.0.3-4_hppa.deb
xutils_4.0.3-4_hppa.deb

On the B180 I use the same XF86config as on 712/80, the one from  Thomas
Bogendoerfer available at:
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-June/012928.html

(I also changed "repeat_type=ms3" to  "repeat_type=" in /etc/gpm.conf to
make mouse working correctly)

With kernels 2.4.0-32 and 2.4.6 xdm failed because:
"(EE) No devices detected.

Fatal server error:
no screen found.
..."

With the last kernel 2.4.7-pa1, it failed: on the console a lot of "kernel
BUG at init.c:731!"

Thanks in advance for all advises,
     Joel

PS: I also try to boot with palinux-0.9.2 CD on a B2000 but the kernel
panic at the boot time (sorry no more info)




**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************
