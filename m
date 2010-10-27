From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Wed, 27 Oct 2010 10:06:28 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010270957110.31946@artax.karlin.mff.cuni.cz>
References: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca> <1288155041.19649.354.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1288155041.19649.354.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 26 Oct 2010, James Bottomley wrote:

> On Tue, 2010-10-26 at 21:29 -0400, John David Anglin wrote:
> > > - shared memory --- there is SHMLBA boundary that causes that all
> > mappings 
> > > are aligned to this boundary --- it is **WRONG** in the current
> > kernel!!! 
> > > It is only 4MB and should be 16MB!!!
> > 
> > James has said that the max for all PA-RISC implementations is
> > 4 MB.  The value is returned by the PDC_CACHE call.  Maybe a BUG_ON is
> > called for.  The alias boundary can be determined by the alias field
> > in the D_conf return value.
> 
> Why is it I get blamed for everything cache related on parisc?  The

You don't get blamed, we're just trying to find bugs :)

> statement in the manuals that the equivalency modulus is 16MB was left
> for future expansion.  However, given PA8900 is the last in the series,
> there is no future expansion.  John Marvin (I think it was) from the HP
> processor group confirmed that the largest equivalency modulus for any
> produced parisc processor is 4MB, so that's what we use in the kernel.
> 
> James

The largest L2 cache size is 64MB --- so if the cache is 4-way 
associative, the equivalency distance is 16MB (as the manual says).

If the equivalency distance were 4MB, the L2 cache would have to be 16-way 
(or the cache would have to be physically indexed and you wouldn't have to 
care about its consistency at all).

Mikulas
