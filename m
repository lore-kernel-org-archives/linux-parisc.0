Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA24038
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 May 2000 17:26:39 -0600
Received: from dyn104-ras32.screaming.net (HELO rhirst.linuxcare.com) (postfix@212.49.255.104)
  by mailserv2.iuinc.com with SMTP; 18 May 2000 23:26:47 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D2B51B007; Fri, 19 May 2000 00:26:37 +0100 (BST)
Date: Fri, 19 May 2000 00:26:37 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Chris Snow <csnow@julian.uwo.ca>
Cc: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/50 hang - more info
Message-ID: <20000519002637.C1209@linuxcare.com>
References: <20000518120342.6224.qmail@web515.mail.yahoo.com> <Pine.LNX.4.21.0005180830031.13618-100000@boy.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0005180830031.13618-100000@boy.localdomain>; from csnow@julian.uwo.ca on Thu, May 18, 2000 at 08:31:56AM -0400
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have just committed changes to drivers/net/lasi_82596.c and
drivers/gsc/lan.c.  Fairly big changes to lasi_82596.c, partly
just tidyup, partly improvements to cache handling.  It is still
not perfect but is a _lot_ better than it was.  The change to
lan.c was to use a different probe function on older h/w (like
my 715/75), where we need to swap the MPU_PORT, as per the message
from prumpf.  If the driver seems completely dead for you, try
enabling/disabling that word swap, and please let me know that
you needed to.

All success or failure reports welcome :-)

Richard


On Thu, May 18, 2000 at 08:31:56AM -0400, Chris Snow wrote:
> > I had the same problem on my 715/33 with lasi_82596.c.
> > I emailed Helge Deller who made the last changes to
> > this driver and he told me that there seems to be the
> > problem that not all interrupts from the i82596 are
> > delivered to the interrupt routine. The result of this
> > is that all 16 xmit buffers will get filled and then
> > the kernel hangs.
> 
> That's what I came up with as well.
> 
> > He also told me that he will have no time until 23rd
> > of May (approx.) to find the reason for this and to
> > correct it. So right now there is no way to use
> > NFSROOT on a 715/old.
> 
> Well, I'm going to keep playing with it over the next few days, although
> I'm not sure if I'll have any success...
> 
> If I succeed in fixing anything, I'll be sure to let everyone know.
> 
> 
> Thanks,
> 
> 
>      Chris
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 
