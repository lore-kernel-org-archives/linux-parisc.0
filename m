Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA04134
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Mar 2000 23:47:17 -0700
Message-Id: <200003050549.VAA03562@milano.cup.hp.com>
To: willy@thepuffingroup.com
Cc: huck@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver 
In-reply-to: Your message of "Sat, 04 Mar 2000 14:49:38 PST."
             <20000304144938.A9944@thepuffingroup.com>
Date: Sat, 04 Mar 2000 21:49:49 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

willy@thepuffingroup.com wrote:
> That isn't necessarily a problem.  The interface requires the allocation
> of pages which are coherent.  On recent architectures, it's possible to
> allocate pages which are actually IO coherent.  On earlier architectures,
> the same interface would return uncached pages.  The question is
> whether there are any implementations which can do neither of the two
> possibilities.

That's basically correct. Let's start talking about implementations.

HP systems have three I/O MMU's which are I/O coherent: U2/Uturn,
Astro/Ike, and Epic/SAGA.  AFAIK, all systems using one on them have
the processor(s) connected to a "Runway" bus.  This limits what
processor model those systems can have: PA-7200, -8000, -8200, or -8500.

(Caveats:
 - T-class has something similar to U2 which is NOT I/O coherent
 - V-class (EPIC/SAGA) is probably supportable with some limitations
)

In personal conversations, two knowledgable folks have suggested
the following:
o PA-7100LC systems support uncacheable memory and subcacheline access.
  So these boxes should be supportable.

o PA-7300LC systems *might* support uncacheable memory and subcacheline...
  (Could anyone definitively answer this for any PA-7300LC box?)

o PA-7000 systems are pretty much SOL.
  (But they could be perfectly useful if folks add cache flushing to
   the few device drivers needed for graphics and stuff off of LASI.)

In summary, the number of "unsupportable" systems isn't as big
as I first thought.

thanks,
grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
