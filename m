Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA11008
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Mar 2000 15:09:36 -0700
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m12RiIS-0027WnC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sun, 5 Mar 2000 22:10:40 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Date: Sun, 5 Mar 2000 22:05:54 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000305220554.A2194@alpha.franken.de>
References: <006601bf8487$e057e010$a94abc0f@hungary.hp.com> <200003031910.LAA19111@lucy.cup.hp.com> <20000305194652.A9157@abacus.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000305194652.A9157@abacus.local>; from Philipp Rumpf on Sun, Mar 05, 2000 at 07:46:52PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Mar 05, 2000 at 07:46:52PM +0100, Philipp Rumpf wrote:
> uncacheable main memory is the only sane way to deal with cache-incoherent
> DMA - macros to flush the cache are both slower and harder to add to drivers
> written with the assumption that dma is cache-coherent.

I can't say how things are for PARISC, but in the MIPS world it's usually
better to use cached memory/flush caches than doing uncached accesses.
And adding cache flushes to a driver isn't that big task, if you know
the hardware (been there, done that).

Thomas.

-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
