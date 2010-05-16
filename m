From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sun, 16 May 2010 10:12:07 -0600
Message-ID: <20100516161207.GA21902@lackof.org>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org> <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com> <20100515172749.GE6764@bombadil.infradead.org> <20100515225952.GD7587@lackof.org> <20100515230359.GF6764@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100515230359.GF6764@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 15, 2010 at 07:03:59PM -0400, Kyle McMartin wrote:
...
> > > *: CMPI,N(=), LDI, maybe a third since I don't remember how sign
> > > extension works off the top of my head.
> > 
> > Mispredicted branches cost something like 20-25 cycles. I forgot now but I
> > do know they aren't cheap.
> 
> That's not a branch, Grant.

DOh! sorry...you are right. /o\
I was totally missing the instruction nullification.

> > I'd rather not add more hacks for this they are unlikely to ever
> > be removed again. I'd rather have status quo than add some hack
> > to the syscall return path.
> 
> The alternative is to rebuild all of userspace, again.

All?
If I generate a list of debian packages that look at EWOULDBLOCK or EAGAIN,
couldn't we just regenerate those packages once the kernel change is in
place and the kernel header files pushed to debian experimental?
There can't be that many packages.

And of those that do, I believe most time the old binaries will generally
work since EWOULDBLOCK code paths are unlikely to get exercised. Or is
there evidence to the contrary?

thanks
grant
