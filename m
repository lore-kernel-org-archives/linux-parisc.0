Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA07191
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 May 2000 15:19:32 -0600
Received: from ppp177.a1-2.56k.execulink.com (ppp177.a1-2.56k.execulink.com [209.239.9.243])
	by amsterdam.execulink.net (8.9.3/8.9.3) with ESMTP id RAA11576
	for <parisc-linux@thepuffingroup.com>; Wed, 17 May 2000 17:19:38 -0400 (EDT)
Date: Wed, 17 May 2000 17:19:22 -0400 (EDT)
From: Chris Snow <csnow@julian.uwo.ca>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0005171707460.1861-100000@boy.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] hang during boot - Apollo 715/50
List-ID: <linux-parisc.vger.kernel.org>


I've got an Apollo 715/50 box, 32Meg RAM and a serial console for
output.  I followed the "recipe" from the web site, and built a kernel,
installed rbootd, etc.  Then i "cvs update"'d the kernel code to the
latest version. Then, I boot and it hangs.

I talked to Puffin on IRC this afternoon (me="Ftns"), and he suggested
I post here.



When I boot the machine, I get the following - typing by hand, so I'll
give you the last part:

..... (other stuff) ....
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ \
SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: 82596 at -xf0826000, 08 00 09 62 82 1E IRQ 535
lasi_82596.c:v1.2 02/13/2000
eth0: lp at 0xc1fd4000 (1720 bytes), lp->scp at 0xc1fd4014
request_irq(535, c01baea8, 0x0, i82596, c1fecc00)
busdev_enable_irq(c1fe9080, 23) ASP: IMR 0x100
busdev_disable_irq(c1fe9080, 23) ASP: IMR 0x0



then it hangs.


After inserting some printk's, it seems the kernel goes into
do_initcalls() in init/main.c and never returns...

Does anyone have any suggestions for this?  I'm going to muck around some
more with it, but I'd love to hear that someone else had the same problem
and already has a fix for it :)


Thanks,





     Chris
