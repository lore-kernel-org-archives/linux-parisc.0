Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id B8F0B4A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Feb 2001 00:07:34 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA27653;
	Thu, 22 Feb 2001 18:07:26 +1100
Date: Thu, 22 Feb 2001 18:07:26 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Helge Deller <deller@gmx.de>,
	PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: schedule_tail
In-Reply-To: <20010221233129.S31164@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0102221740200.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Feb 2001, Matthew Wilcox wrote:

> On Thu, Feb 22, 2001 at 05:21:49PM +1100, Alan Modra wrote:
> > But this location is allowed to be modified by the callee, and I think you
> > already have a stack frame.
> 
> Umm... I'm not sure we always do.  It shouldn't be hard to arrange though.
> 
> > I wrote up some stuff on stack frames at
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011715.html
> 
> thanks, i was going from the pdfs, but yours is easier to understand.
> i don't quite see why it needs `ap' (%r29) to be assigned a value when
> calling a function which has no arguments.

No, it shouldn't be needed in that case.  It may be necessary in any of
the following cases:
a) the called function takes the address of one of it's args
b) has variable arguments
c) has more than 8 words of args (not always the same as more than 8 args)
d) needs to spill one of its args to the stack.
gcc ought to be able to convert a reference via %r29 to one via %r30, but
that doesn't work at the moment.

> would a `call-c-function' macro make sense?

Yes.
