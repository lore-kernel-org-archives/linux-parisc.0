Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA17585
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 06:40:56 -0600
Date: Thu, 18 May 2000 08:31:56 -0400 (EDT)
From: Chris Snow <csnow@julian.uwo.ca>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/50 hang - more info
In-Reply-To: <20000518120342.6224.qmail@web515.mail.yahoo.com>
Message-ID: <Pine.LNX.4.21.0005180830031.13618-100000@boy.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> I had the same problem on my 715/33 with lasi_82596.c.
> I emailed Helge Deller who made the last changes to
> this driver and he told me that there seems to be the
> problem that not all interrupts from the i82596 are
> delivered to the interrupt routine. The result of this
> is that all 16 xmit buffers will get filled and then
> the kernel hangs.

That's what I came up with as well.

> He also told me that he will have no time until 23rd
> of May (approx.) to find the reason for this and to
> correct it. So right now there is no way to use
> NFSROOT on a 715/old.

Well, I'm going to keep playing with it over the next few days, although
I'm not sure if I'll have any success...

If I succeed in fixing anything, I'll be sure to let everyone know.


Thanks,


     Chris
