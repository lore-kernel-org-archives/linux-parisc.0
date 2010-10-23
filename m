From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 11:57:38 -0500
Message-ID: <1287853058.3003.18.camel@mulgrave.site>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>
	 <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>
	 <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz>
	 <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
	 <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2010-10-23 at 16:46 +0200, Mikulas Patocka wrote:
> 
> On Sat, 23 Oct 2010, Carlos O'Donell wrote:
> 
> > On Sat, Oct 23, 2010 at 5:21 AM, Mikulas Patocka
> > <mikulas@artax.karlin.mff.cuni.cz> wrote:
> > > On Fri, 22 Oct 2010, Carlos O'Donell wrote:
> > >> AFAIK you can't add a second CPU without an HP technician enabling the
> > >> firmware for a second CPU.
> > >>
> > >> The same goes for enabling additional PCI slots.
> > >>
> > >> Cheers,
> > >> Carlos.
> > >
> > > And is there some hack that enables it?
> > >
> > > It looks quite dishonest to me when the machine is advertised as capable
> > > of two dual-core CPUs, 32GB RAM, 4 PCI-X slots ... and you get this
> > > advertised capability only if you buy expensive support contract :-(
> > 
> > I know of no hack.
> > 
> > It is not dishonest, the original purchase contract for the machine
> > probably said "1 active CPU slot" and "1 active PCI-X slot."
> > 
> > Cheers,
> > Carlos.
> 
> It looks like false advertising to me. It is immoral (and in many 
> countries illegal) to advertise the product having some capabilities and 
> then selling the product not having the capabilities. Purchase contract is 
> irelevant, what is relevant are the public statements about the product 
> and the real status of the product.

It's fairly standard for the enterprise space:  Both HP and IBM actually
sell boxes fully loaded but disable unpaid for capabilities in the
firmware (i.e. sell you a 2-cpu box that really contains 4 cpus so they
then sell a firmware upgrade as two extra cpus); enterprise users
actually like the convenience of not having to haul away and replace the
box.

> HP claims that c8000 workstation is extendible to two processors. Such 
> claims are implicit (feature lists, listing up to two dual core 1.1GHz 
> processors) and explicit (citing 
> http://www.hp.com/workstations/white_papers/docs/hp_workstation_c8000_po.pdf 
> "Robust expansion capabilities, including two processor sockets and four 
> disk bays, let you grow and configure the system as needed").

My garage is extensible too ... but I'd still have to pay a builder to
build the extension.

> HP sells a computer that it claims to be c8000 and that the user cannot 
> expand to two processors, contrary to the claims in the whitepaper.

The whitepaper only claims they are extensible (which they are) it
doesn't claim the user can do the extension (because they can't).

> These claims really deceive users, both me and the person who sold me the 
> CPU were deceived by them.
> 
> Anyone living in the US and wanting to file a complain to FTC about these 
> computers falsely advertised as expandable? :)

The FTC would take the view that it's standard industry practise and
that you didn't do due diligence ... 

However, why don't you try what we usually do?  That's ask HP nicely
(via someone in their linux department) for the firmware upgrade; it's
mostly worked in the past ... assuming you haven't antagonised them too
much by calling them liars and cheats, that is ...

James


