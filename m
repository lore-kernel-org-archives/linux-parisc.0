Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA23376
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 17:39:56 -0700
Date: Wed, 1 Mar 2000 20:35:06 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] make Image currently fails here too.
Message-ID: <20000301203505.V812@abacus.local>
References: <20000229202653.2087.qmail@web508.mail.yahoo.com> <Pine.BSO.4.21.0003011338010.23746-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003011338010.23746-100000@mojo.calyx.net>; from bri@mojo.calyx.net on Wed, Mar 01, 2000 at 01:39:16PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> My unsatisfied symbols are different, though:
> 
> ld: Unsatisfied symbols:
>    fcacheline (code)
>    pcacheline (code)

That's the (buggy IMHO) Lasi ethernet driver that uses strange custom
macros to flush the cache rather than the standard ones.  Basically

#define fcacheline(x) dma_cache_wback(&x, 32)
#define pcacheline(x) dma_cache_inv(&x, 32)

_might_ make it compile again.


It alse uses phys_to_virt/virt_to_phys rather than bus_to_virt/virt_to_bus
and generally needs to be fixed for the new DMA API soon.  If you're
happy just using a ramdisk, don't compile it in.

	Philipp Rumpf
