Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA09821
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 May 2000 19:23:17 -0600
Date: Wed, 17 May 2000 20:26:35 -0500
From: Bob Pflederer <krp@rsn.hp.com>
To: Chris Snow <csnow@julian.uwo.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/50 hang - more info
Message-ID: <20000517202635.E855@atl6narkp02a.atl.hp.com>
References: <Pine.LNX.4.21.0005171823320.1861-100000@boy.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005171823320.1861-100000@boy.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

When I was trying out a C180, I ran into problems in about the same point
in boot.  In my case it turned out to be a problem in the lasi_82596
driver.  It was executing the interrupt handler before the driver was finished
being initialized.  You might try editing lasi_82596.c to make i596_debug
10:

#define I82596_DEBUG 10

#ifdef I82596_DEBUG
int i596_debug = I82596_DEBUG;
#else
int i596_debug = 1;
#endif

This will get you lots more debug messages from the driver so you can see
if it's doing something funny.  I have a hacked version of lasi_82596.c
that may have worked around this problem and some others that I was finding,
but I'm not really sure what state it's in (it may not even compile) as I 
haven't had time to play with it in over a month.  I'll email it to you so 
you can see if it takes you any further.

> pty: 256 Unix98 ptys configured
> RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
> 82596.c: MAC of HP700 LAN blindely read from the prom!
> eth0: 82596 at 0xf0826000, 08 00 09 62 82 1E IRQ 535.
> lasi_82596.c:v1.2 02/13/2000
> eth0: lp at 0xc1fd4000 (1720 bytes), lp->scb at 0xc1fd4014
> request_irq(535, c01baea8, 0x0, i82596, c1fecc00)
> busdev_enable_irq(c1fe9080, 23) ASP: IMR 0x100
> busdev_disable_irq(c1fe9080, 23) ASP: IMR 0x0
> 
