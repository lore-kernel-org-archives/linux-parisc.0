Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA13388
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 09:21:23 -0600
Date: Mon, 14 Jun 1999 17:21:17 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Dino PCI and I/O spaces
Message-ID: <19990614172117.K31472@mencheca.ch.genedata.com>
References: <E10tYS4-00066l-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E10tYS4-00066l-00@the-village.bc.nu>; from Alan Cox on Mon, Jun 14, 1999 at 04:15:08PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jun 14, 1999 at 04:15:08PM +0100, Alan Cox wrote:
> Also as a btw: PCI I/O port access will suck rocks on HP because we have
> to grab a lock since it is a two stage operation. That may mean we want
> to write smart copy/csum/io and ins* functions for PCI block I/O.

Do we only have to grab a lock on SMP machines, or can we sleep between
the two accesses?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
