Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA12577
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:59:59 -0600
Date: Mon, 28 Jun 1999 21:00:05 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>, law@cygnus.com,
        grundler@cup.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Anyone got a few moments?
Message-ID: <19990628210005.K30362@mencheca.ch.genedata.com>
References: <19990628201016.J30362@mencheca.ch.genedata.com> <E10ygHD-0005V7-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10ygHD-0005V7-00@the-village.bc.nu>; from Alan Cox on Mon, Jun 28, 1999 at 07:37:05PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 28, 1999 at 07:37:05PM +0100, Alan Cox wrote:
> > > Yes.  Major pain since the only useful atomic operations are load & clear
> > > word/double as you noted.
> > 
> > and that's it.  That's only 31 uses where xchg couldn't be replaced
> > with get_and_zero.  I suspect most of these are using this mechanism to
> > walk a list without using a spinlock.  The slab uses are debug code only
> > (so they aren't performance critical by any means).  I bet most of these
> > uses could be removed without _too_ many problems.  I wonder what Linus'
> > opinion is on this.
> 
> The sparc only has swap byte with 0xFF. They also have to use a small spinlock
> for doing 32/64bit xchg ops. Thats ok. Xchg is only hopefully fast - since
> on most machines xchg is a bus locker or pushes to ram the difference will
> be minimal. 

Okay.  Do you think we stand a chance of pushing a new call past linux
-- get_and_zero(*ptr), as this will make most of the calls efficient
on PA-RISC?  Or would a better idea be to check if the argument to be
swapped is zero; if it is use the special instructions; if not fall back
to a spinlock?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
