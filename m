From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Wed, 27 Oct 2010 10:35:21 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010271023540.31946@artax.karlin.mff.cuni.cz>
References: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca> <1288155041.19649.354.camel@mulgrave.site> <alpine.DEB.1.10.1010270957110.31946@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010270957110.31946@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Wed, 27 Oct 2010, Mikulas Patocka wrote:

> 
> 
> On Tue, 26 Oct 2010, James Bottomley wrote:
> 
> > On Tue, 2010-10-26 at 21:29 -0400, John David Anglin wrote:
> > > > - shared memory --- there is SHMLBA boundary that causes that all
> > > mappings 
> > > > are aligned to this boundary --- it is **WRONG** in the current
> > > kernel!!! 
> > > > It is only 4MB and should be 16MB!!!
> > > 
> > > James has said that the max for all PA-RISC implementations is
> > > 4 MB.  The value is returned by the PDC_CACHE call.  Maybe a BUG_ON is
> > > called for.  The alias boundary can be determined by the alias field
> > > in the D_conf return value.
> > 
> > Why is it I get blamed for everything cache related on parisc?  The
> 
> You don't get blamed, we're just trying to find bugs :)
> 
> > statement in the manuals that the equivalency modulus is 16MB was left
> > for future expansion.  However, given PA8900 is the last in the series,
> > there is no future expansion.  John Marvin (I think it was) from the HP
> > processor group confirmed that the largest equivalency modulus for any
> > produced parisc processor is 4MB, so that's what we use in the kernel.
> > 
> > James
> 
> The largest L2 cache size is 64MB --- so if the cache is 4-way 
> associative, the equivalency distance is 16MB (as the manual says).
> 
> If the equivalency distance were 4MB, the L2 cache would have to be 16-way 
> (or the cache would have to be physically indexed and you wouldn't have to 
> care about its consistency at all).
> 
> Mikulas

BTW. note that that internal documentation may be wrong. There's a 
whitepaper about PA8700 on HP site that describes the dcache as 
375kBx4ways and icache as 188kBx4ways. It is hard to implement this way 
(the CPU'd have to do some mathematics to calculate the cache index), I 
much more believe that the cache is really 3-way or 6-way (where the CPU 
could just take some bits of the address as the index).

That 64MB cache may be 16-way with 4MB modulus, but it looks less 
plausible than a 4-way cache with 16MB modulus.

Anyway, if you think that the modulus is 4MB, try it --- take PA8900 with 
64MB cache, map shared memory to two processes to addresses congruent with 
4MB (but not 8MB), let one process write to odd bytes and the other to 
even bytes and let the processes check that they read the bytes that they 
wrote. If the caches don't synchronize, you'll get a corruption after some 
time of running this.

Mikulas
