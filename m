From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 15:42:13 -0400
Message-ID: <20101023194212.GA23609@hiauly1.hia.nrc.ca>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz> <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com> <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz> <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com> <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site> <alpine.DEB.1.10.1010231954040.26539@artax.karlin.mff.cuni.cz>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010231954040.26539@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 23 Oct 2010, Mikulas Patocka wrote:

> > It's fairly standard for the enterprise space:  Both HP and IBM actually
> > sell boxes fully loaded but disable unpaid for capabilities in the
> > firmware (i.e. sell you a 2-cpu box that really contains 4 cpus so they
> > then sell a firmware upgrade as two extra cpus); enterprise users
> > actually like the convenience of not having to haul away and replace the
> > box.
> 
> This is a different case. You can't accuse a contractor if you order two 
> CPUs and get four :)

I agree.  HP didn't provide the extra cpu module.  Nothing in the technical
documentation indicates that you can't add another processor module without
a firmware update.  In fact, they provide instructions on how to add one.

I don't believe there is any form of capability license involved here.

As far as I can tell, firmware updates for the c8000 are freely available
on HP's site.

> It says "lets YOU grow and configure the system as needed". There is that 
> pronoun "YOU".

Also agree.  The whitepaper and product brief for the c8000 are very clear
on users being able to expand their systems and keep ownership costs low.

It's possible the motherboard of Mikulas' system is broken, or doesn't
work with a second processor module.  So, support for it is disabled.
Selling reduced versions of chips is very common in the semiconductor
industry to increase yield.

I would check the label on the product.

> I don't even know which locks are in my machine --- I added 1GB memory and 
> a 32-bit PCI serial card and it worked ... how can I find what else can or 
> can't I add?
> 
> For example: Can I replace the 0.9GHz CPU with a faster 1.1GHz? 
> (obviously, it is needed to know it before purchasing the CPU)

It's a good question, but probably there isn't a clear answer.  It
may work, but the system probably wasn't tested with the faster processor.
The faster processor will likely use more power and create an additional
thermal load.

Still, there is the expectation in the current workstation market that
the processors in a system can be upgraded provided they are compatible.

> But it seems that people on this list don't know about those HP locks too 
> :-(

Most don't have any affiliation with HP.  I have been on this list a
long time, and don't believe this issue has been discussed before,
although the kernel maintainers may be aware of it.

In general, this kind of hardware information is proprietory.  The
PC architecture only opened up because of a lot of competition and
reverse engineering.  Even there, you may need a NDA to access some
documentation.  It costs $3000/year to access PCI-SIG documents, etc.

James, what kind of firmware update is needed?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
