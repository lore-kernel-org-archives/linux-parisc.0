Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA07574
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Mar 2000 08:30:57 -0700
From: willy@thepuffingroup.com
Date: Sun, 5 Mar 2000 09:29:01 -0500
To: Grant Grundler <grundler@cup.hp.com>
Cc: huck@cup.hp.com, parisc-linux@thepuffingroup.com
Message-ID: <20000305092901.E9944@thepuffingroup.com>
References: <20000304144938.A9944@thepuffingroup.com> <200003050549.VAA03562@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003050549.VAA03562@milano.cup.hp.com>; from Grant Grundler on Sat, Mar 04, 2000 at 09:49:49PM -0800
Subject: [parisc-linux] uncacheable memory
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Mar 04, 2000 at 09:49:49PM -0800, Grant Grundler wrote:
> HP systems have three I/O MMU's which are I/O coherent: U2/Uturn,
> Astro/Ike, and Epic/SAGA.  AFAIK, all systems using one on them have
> the processor(s) connected to a "Runway" bus.  This limits what
> processor model those systems can have: PA-7200, -8000, -8200, or -8500.
> 
> (Caveats:
>  - T-class has something similar to U2 which is NOT I/O coherent

According to the hwdb, the T600 has two `Java BC Summit Port (IOA)'.
And you're the only one in possession of a T-class :-).  All the devices
in the T600 seem to be special devices so the drivers would have to
be freshly written anyway.  I don't see a PCI adapter in the T-class,
can one be fitted?  I assume Summit is the name of a bus, like Runway
only different?

> In personal conversations, two knowledgable folks have suggested
> the following:
> o PA-7100LC systems support uncacheable memory and subcacheline access.
>   So these boxes should be supportable.

that's good, that's a fair chunk of those machines which people have (712,
725/100, 715/later, E-class, early D-class).

> o PA-7300LC systems *might* support uncacheable memory and subcacheline...
>   (Could anyone definitively answer this for any PA-7300LC box?)

According to the 7300LC ERS, section 1.1.2 (Integrated Caches and TLB)
`Uncached memory pages are supported via the TLB U-bit.'  Then section
1.2.2, (Differences from the PA7100LC) `Uncacheable pages are still
supported.  Note: PA7100LC did not require the U bit to be set on TLB
entries for I/O pages, but the PA7300LC does (this was always an
architural requirement).'

I think that's enough for us to go on.

> o PA-7000 systems are pretty much SOL.
>   (But they could be perfectly useful if folks add cache flushing to
>    the few device drivers needed for graphics and stuff off of LASI.)

how about PA7100/7150 systems?  (715/early, 735, 755, later Nova servers)
They will also need explicit cache flushing added, I guess.
