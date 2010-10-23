From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sun, 24 Oct 2010 01:45:07 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010240126270.14391@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com> <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site> <alpine.DEB.1.10.1010231954040.26539@artax.karlin.mff.cuni.cz> <20101023194212.GA23609@hiauly1.hia.nrc.ca>
 <20101023195814.GP8332@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101023195814.GP8332@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Sat, 23 Oct 2010, Kyle McMartin wrote:

> On Sat, Oct 23, 2010 at 03:42:13PM -0400, John David Anglin wrote:
> > Most don't have any affiliation with HP.  I have been on this list a
> > long time, and don't believe this issue has been discussed before,
> > although the kernel maintainers may be aware of it.
> 
> I honestly didn't know about it... I mean, I knew that HP did similar
> things on IA-64 where new cpus could be 'purchased' and spun up with no
> downtime.

I suppose that that IA-64 booted with spare CPUs but didn't use them. My 
C8000 doesn't boot with two CPUs at all. It drops into PDC prompt, saying 
the warning about too many CPUs, and the "BO" command refuses to boot, 
asking the user to review the warnings.

> But I didn't realize the C8000 had such limitations (mine is
> an early prototype so there was no possibility for upgrade and I never
> bothered.)
>
> Hopefully on Monday someone from HP who's still around may be able to
> provide the tool since any support contracts are probably expired given
> they haven't been sold since 2006...

It would be nice if they provided the tool and cleared the false 
advertising problem.

I'm quite afraid that a single HP engineer can't release them. More 
likely, someone higher up the corporate command chain declared that the 
tools are "proprietary" and didn't realize that such restriction really 
makes the product deviate from advertised capabilities.

> We should add a note to the faq about this.
> 
> --Kyle

Mikulas
