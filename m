Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA12455
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Jun 1999 12:45:47 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 28 Jun 1999 18:45:48 -0000
Subject: Re: [parisc-linux] Anyone got a few moments?
To: Matthew.Wilcox@genedata.com (Matthew Wilcox)
Date: Mon, 28 Jun 1999 19:37:05 +0100 (BST)
Cc: law@cygnus.com, Matthew.Wilcox@genedata.com, grundler@cup.hp.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19990628201016.J30362@mencheca.ch.genedata.com> from "Matthew Wilcox" at Jun 28, 99 08:10:16 pm
Content-Type: text
Message-Id: <E10ygHD-0005V7-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > Yes.  Major pain since the only useful atomic operations are load & clear
> > word/double as you noted.
> 
> and that's it.  That's only 31 uses where xchg couldn't be replaced
> with get_and_zero.  I suspect most of these are using this mechanism to
> walk a list without using a spinlock.  The slab uses are debug code only
> (so they aren't performance critical by any means).  I bet most of these
> uses could be removed without _too_ many problems.  I wonder what Linus'
> opinion is on this.

The sparc only has swap byte with 0xFF. They also have to use a small spinlock
for doing 32/64bit xchg ops. Thats ok. Xchg is only hopefully fast - since
on most machines xchg is a bus locker or pushes to ram the difference will
be minimal. 

The Alpha/Mips probably have it the nicest with the load locked/conditional
store.
