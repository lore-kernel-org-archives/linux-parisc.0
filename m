Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA19288
	for <parisc-linux@puffin.external.hp.com>; Fri, 12 May 2000 15:37:54 -0600
Message-ID: <20000512153747.A19135@puffin.external.hp.com>
Date: Fri, 12 May 2000 15:37:47 -0600
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Tree Issues
References: <20000509103707.A13782@puffin.external.hp.com> <200005110043.RAA24953@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200005110043.RAA24953@milano.cup.hp.com>; from Grant Grundler on Wed, May 10, 2000 at 05:43:46PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 10, 2000 at 05:43:46PM -0700, Grant Grundler wrote:
> > I am going to try to set up a sourceforge.net project to keep my
> > modifications publicly-visible now;  while I'm not perfectly happy
> > with announcing anything before people can actually look at my code,
> > I couldn't think of any better way to do it.
> 
> I was somewhat (not totally) surprised by this. I had to think about
> several things before replying:
> o why are you unhappy with TPG's CVS tree?
> o why don't you want to talk publicly about it?
> o what is the effective impact?

> Hard Stuff:
> o Not sure about the net impact. TPG and HP folks will continue working
>   using TPG's tree.

> I'm pretty sure the debian release will be based on TPG's tree.

I doubt there is any reason to have two userspace trees as well - even
if it should happen for some reason they certainly shouldn't introduce
binary incompatibilities.

> o I don't understand why you are so unhappy with TPG's CVS tree.
>   Certainly there are design and implementation problems in that tree.
>   But such compromises are necessary for cooperation. Until we have

I believe the problems in TPG's tree are not sufficiently explained by
that.  In fact, while the resulting code's design and implementation are
bad, I don't think that the real issue is with the contributors' coding
skills.

> > I do not think this fork has to be a permanent one, though I can't
> > help thinking it is likely to be;
> 
> I suspect it will be too - working with others can be harder than
> working alone. But on a "project" of this scope, I don't see one
> person being successful.

Other Linux ports have been done (basically) by one person - maybe you
can't see _me_ being successful, and I'm not sure whether I disagree
yet.

OTOH, I don't really want to find out.  There are other persons around
that I hope might join me, and I have access to the changes in the TPG
tree.

	Philipp Rumpf
