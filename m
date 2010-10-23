From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 15:29:37 -0500
Message-ID: <1287865777.3003.31.camel@mulgrave.site>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
	 <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
	 <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz>
	 <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
	 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz>
	 <1287853058.3003.18.camel@mulgrave.site>
	 <alpine.DEB.1.10.1010231954040.26539@artax.karlin.mff.cuni.cz>
	 <20101023194212.GA23609@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101023194212.GA23609@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-10-23 at 15:42 -0400, John David Anglin wrote:
> > But it seems that people on this list don't know about those HP locks too 
> > :-(
> 
> Most don't have any affiliation with HP.  I have been on this list a
> long time, and don't believe this issue has been discussed before,
> although the kernel maintainers may be aware of it.
> 
> In general, this kind of hardware information is proprietory.  The
> PC architecture only opened up because of a lot of competition and
> reverse engineering.  Even there, you may need a NDA to access some
> documentation.  It costs $3000/year to access PCI-SIG documents, etc.
> 
> James, what kind of firmware update is needed?

I have no idea ... I'm only deducing this from what had to be done to
ion to make it a 4-way.  We had similar upgrades to some of the A180s as
well.  It is unusual for a workstation class system, but the "too many
CPUs" message seems definitive.  Perhaps the firmware is essentially the
same as a server class and it's inheriting this behaviour.

James


