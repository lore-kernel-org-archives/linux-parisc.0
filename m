Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA29977
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 May 2000 07:24:23 -0600
Date: Fri, 19 May 2000 09:24:13 -0400 (EDT)
From: Chris Snow <csnow@julian.uwo.ca>
To: Richard Hirst <rhirst@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/50 hang - more info
In-Reply-To: <20000519002637.C1209@linuxcare.com>
Message-ID: <Pine.SOL.4.21.0005190922540.22496-100000@panther.uwo.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   I have just committed changes to drivers/net/lasi_82596.c and
> drivers/gsc/lan.c.  Fairly big changes to lasi_82596.c, partly
> just tidyup, partly improvements to cache handling.  It is still
> not perfect but is a _lot_ better than it was.  The change to
> lan.c was to use a different probe function on older h/w (like
> my 715/75), where we need to swap the MPU_PORT, as per the message
> from prumpf.  If the driver seems completely dead for you, try
> enabling/disabling that word swap, and please let me know that
> you needed to.
> 
> All success or failure reports welcome :-)


Success!  The driver works fine.  I made no modifications for word swap
(on a 715/50).

No let's see what else I can break :)


          Chris
