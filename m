Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA13779
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 09:38:02 -0600
Date: Mon, 14 Jun 1999 17:37:57 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino PCI and I/O spaces
Message-ID: <19990614173757.L31472@mencheca.ch.genedata.com>
References: <19990614172117.K31472@mencheca.ch.genedata.com> <E10tYYE-00067e-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10tYYE-00067e-00@the-village.bc.nu>; from Alan Cox on Mon, Jun 14, 1999 at 04:21:29PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 14, 1999 at 04:21:29PM +0100, Alan Cox wrote:
> > On Mon, Jun 14, 1999 at 04:15:08PM +0100, Alan Cox wrote:
> > > Also as a btw: PCI I/O port access will suck rocks on HP because we have
> > > to grab a lock since it is a two stage operation. That may mean we want
> > > to write smart copy/csum/io and ins* functions for PCI block I/O.
> > 
> > Do we only have to grab a lock on SMP machines, or can we sleep between
> > the two accesses?
> 
> On a uniprocessor we might take an interrupt between the two cycles. So we
> have to suffer anyway

Then we ought to disable interrupts, surely?  Otherwise we can have:

Grab lock
interrupt taken
driver attempts to perform IO, tries to take lock, machine hangs solid.

Or what sort of locking scheme did you have in mind?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
