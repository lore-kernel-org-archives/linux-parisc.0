From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sun, 16 May 2010 12:25:34 -0400
Message-ID: <20100516162534.GG6764@bombadil.infradead.org>
References: <4BE86174.1080008@gmx.de> <20100514192015.GB14840@lackof.org> <AANLkTil6dX7fq-1R0pyjp5XHLyuQyGwcuB1Q9FG8gqGS@mail.gmail.com> <20100515172749.GE6764@bombadil.infradead.org> <20100515225952.GD7587@lackof.org> <20100515230359.GF6764@bombadil.infradead.org> <20100516161207.GA21902@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	Carlos O'Donell <carlos@systemhalted.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100516161207.GA21902@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 16, 2010 at 10:12:07AM -0600, Grant Grundler wrote:
> If I generate a list of debian packages that look at EWOULDBLOCK or EAGAIN,
> couldn't we just regenerate those packages once the kernel change is in
> place and the kernel header files pushed to debian experimental?
> There can't be that many packages.
> 

Sure, but what about people running the old stable version of Debian or
something? We lose the ability to have (probably) useful userspace
running when kernels get bisected across the flag version.

> And of those that do, I believe most time the old binaries will generally
> work since EWOULDBLOCK code paths are unlikely to get exercised. Or is
> there evidence to the contrary?
> 

That's what we need to find out. :) Because it will "just work" on most
other operating systems I've been able to quickly grep for, people might
have been negligent.

I think Helge should definitely submit his very fine patches to
glibc/kernel wherever. As John points out, I looked up POSIX tonight and
as it stands they don't violate it technically (since the value is the
same) but they symbollically do. :)

regards, Kyle
