From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 18:25:40 -0400
Message-ID: <20090501222540.GE18899@bombadil.infradead.org>
References: <49FA1AA1.3060104@gmx.de> <119aab440905011118lbc3bcectfd5862477c2598a8@mail.gmail.com> <20090501213717.GA19522@hiauly1.hia.nrc.ca> <20090501214632.GD18899@bombadil.infradead.org> <1241215392.3302.43.camel@mulgrave.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Thibaut VARENE <varenet@debian.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241215392.3302.43.camel@mulgrave.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, May 01, 2009 at 10:03:12PM +0000, James Bottomley wrote:
> On Fri, 2009-05-01 at 17:46 -0400, Kyle McMartin wrote:
> > On Fri, May 01, 2009 at 05:37:18PM -0400, John David Anglin wrote:
> > > On Fri, 01 May 2009, Carlos O'Donell wrote:
> > > 
> > > > Historical note...
> > > > 
> > > > We clobber all of memory in userspace, like this:
> > > > ~~~
> > > > #define __ldcw(a) \
> > > > ({                                                                      \
> > > >   unsigned int __ret;                                                   \
> > > >   __asm__ __volatile__("ldcw 0(%1),%0"                                  \
> > > >                        : "=r" (__ret) : "r" (a) : "memory");            \
> > > >   __ret;                                                                \
> > > > })
> > > > ~~~
> > > > I wonder if I should change that to match the kernel?
> > > 
> > > The above is perfectly safe.  I believe the kernel provides a memory
> > > barrier when necessary.  There's a discussion somewhere in the mail
> > > archives.
> > > 
> > 
> > I, er, don't think we do, not for the spinlock primitives at least, as
> > far as I can tell...
> 
> Yes we do ... look in asm/spinlock.h
> 
> it's all the mb(); statements that are scattered through our _raw_spin_
> ops
> 
> The original problem was that the spinlocks were compile barrier leaky
> and caused infrequent but hard to debug issues on smp.  The barriers are
> likely overkill (since we have two in each) but at least they prevent
> problems.
> 

Yeah, I was looking at the lack of a barrier between ldcw and the test
of *a == 0. I guess this would be fixed by Helge's patch.

--Kyle
