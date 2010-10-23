From: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Subject: Re: False advertising (was: C8000 cpu upgrade problem)
Date: Sat, 23 Oct 2010 20:20:45 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.1010231954040.26539@artax.karlin.mff.cuni.cz>
References: <alpine.DEB.1.10.1010221555220.3134@artax.karlin.mff.cuni.cz>  <AANLkTi=YJJgP-tDhh2g6D8d8BkKa-ENoJankd-ZMV+i2@mail.gmail.com>  <alpine.DEB.1.10.1010231118350.23687@artax.karlin.mff.cuni.cz>  <AANLkTikD5cvJdAxUg7zj0ySM9z6fThE-9H9txVpNC9Ez@mail.gmail.com>
  <alpine.DEB.1.10.1010231620190.12135@artax.karlin.mff.cuni.cz> <1287853058.3003.18.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1287853058.3003.18.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > It looks like false advertising to me. It is immoral (and in many 
> > countries illegal) to advertise the product having some capabilities and 
> > then selling the product not having the capabilities. Purchase contract is 
> > irelevant, what is relevant are the public statements about the product 
> > and the real status of the product.
> 
> It's fairly standard for the enterprise space:  Both HP and IBM actually
> sell boxes fully loaded but disable unpaid for capabilities in the
> firmware (i.e. sell you a 2-cpu box that really contains 4 cpus so they
> then sell a firmware upgrade as two extra cpus); enterprise users
> actually like the convenience of not having to haul away and replace the
> box.

This is a different case. You can't accuse a contractor if you order two 
CPUs and get four :)

> > HP claims that c8000 workstation is extendible to two processors. Such 
> > claims are implicit (feature lists, listing up to two dual core 1.1GHz 
> > processors) and explicit (citing 
> > http://www.hp.com/workstations/white_papers/docs/hp_workstation_c8000_po.pdf 
> > "Robust expansion capabilities, including two processor sockets and four 
> > disk bays, let you grow and configure the system as needed").
> 
> My garage is extensible too ... but I'd still have to pay a builder to
> build the extension.

... or you can build the garage extension yourself. Obviously, you lose 
guaranty if you do, but you can still do it.

If I take the analogy with a garage ... the garage builder puts a sensor 
in your garage that measures how big the garage is (and it is deliberately 
welded hard so that it's hard to remove). When you extend the garage, the 
sensor notices the nonstandard size and locks the garage door so that you 
can't use the garage.

> > HP sells a computer that it claims to be c8000 and that the user cannot 
> > expand to two processors, contrary to the claims in the whitepaper.
> 
> The whitepaper only claims they are extensible (which they are) it
> doesn't claim the user can do the extension (because they can't).

It says "lets YOU grow and configure the system as needed". There is that 
pronoun "YOU".

> > These claims really deceive users, both me and the person who sold me the 
> > CPU were deceived by them.
> > 
> > Anyone living in the US and wanting to file a complain to FTC about these 
> > computers falsely advertised as expandable? :)
> 
> The FTC would take the view that it's standard industry practise and
> that you didn't do due diligence ... 

I'm interested ... does HP anywhere in its materials mention the firmware 
locks? They are not even in the technical guide in the section that 
mentions adding a CPU.

So if I should perform due diligence where should I find out about the 
locks?

I don't even know which locks are in my machine --- I added 1GB memory and 
a 32-bit PCI serial card and it worked ... how can I find what else can or 
can't I add?

For example: Can I replace the 0.9GHz CPU with a faster 1.1GHz? 
(obviously, it is needed to know it before purchasing the CPU)

> However, why don't you try what we usually do?  That's ask HP nicely 
> (via someone in their linux department) for the firmware upgrade; it's 
> mostly worked in the past ... assuming you haven't antagonised them too 
> much by calling them liars and cheats, that is ...
> 
> James

That's why I asked here ... without accussing anyone of lying first ... 
assuming that there are Linux hackers on this list, they have thorough 
knowledge of the hardware and they'll say something like "run this command 
in PDC" or "flip byte at that address in nvram to that value and unlock 
it".

But it seems that people on this list don't know about those HP locks too 
:-(

Mikulas
