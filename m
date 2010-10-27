From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: PA caches (was: C8000 cpu upgrade problem)
Date: Tue, 26 Oct 2010 23:50:41 -0500
Message-ID: <1288155041.19649.354.camel@mulgrave.site>
References: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101027012932.3CB6E4FB4@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-10-26 at 21:29 -0400, John David Anglin wrote:
> > - shared memory --- there is SHMLBA boundary that causes that all
> mappings 
> > are aligned to this boundary --- it is **WRONG** in the current
> kernel!!! 
> > It is only 4MB and should be 16MB!!!
> 
> James has said that the max for all PA-RISC implementations is
> 4 MB.  The value is returned by the PDC_CACHE call.  Maybe a BUG_ON is
> called for.  The alias boundary can be determined by the alias field
> in the D_conf return value.

Why is it I get blamed for everything cache related on parisc?  The
statement in the manuals that the equivalency modulus is 16MB was left
for future expansion.  However, given PA8900 is the last in the series,
there is no future expansion.  John Marvin (I think it was) from the HP
processor group confirmed that the largest equivalency modulus for any
produced parisc processor is 4MB, so that's what we use in the kernel.

James


