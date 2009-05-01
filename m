From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 18:05:59 -0400 (EDT)
Message-ID: <20090501220600.9E2DB4FC3@hiauly1.hia.nrc.ca>
References: <20090501214632.GD18899@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org, deller@gmx.de,
	linux-parisc@vger.kernel.org, kyle@mcmartin.ca, varenet@debian.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090501214632.GD18899@bombadil.infradead.org> from "Kyle McMartin" at May 1, 2009 05:46:33 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, May 01, 2009 at 05:37:18PM -0400, John David Anglin wrote:
> > On Fri, 01 May 2009, Carlos O'Donell wrote:
> > 
> > > Historical note...
> > > 
> > > We clobber all of memory in userspace, like this:
> > > ~~~
> > > #define __ldcw(a) \
> > > ({                                                                      \
> > >   unsigned int __ret;                                                   \
> > >   __asm__ __volatile__("ldcw 0(%1),%0"                                  \
> > >                        : "=r" (__ret) : "r" (a) : "memory");            \
> > >   __ret;                                                                \
> > > })
> > > ~~~
> > > I wonder if I should change that to match the kernel?
> > 
> > The above is perfectly safe.  I believe the kernel provides a memory
> > barrier when necessary.  There's a discussion somewhere in the mail
> > archives.
> > 
> 
> I, er, don't think we do, not for the spinlock primitives at least, as
> far as I can tell...

Ok, I'm going to see if the "memory" clobber improves life.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
