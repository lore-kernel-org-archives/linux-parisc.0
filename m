Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA11826
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Nov 1999 13:06:49 -0700
Date: Mon, 8 Nov 1999 21:09:24 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] iodc console patch
Message-ID: <19991108210924.R25252@mencheca.ch.genedata.com>
References: <19991027234659.A2788@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991027234659.A2788@alpha.franken.de>; from Thomas Bogendoerfer on Wed, Oct 27, 1999 at 11:46:59PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 27, 1999 at 11:46:59PM +0200, Thomas Bogendoerfer wrote:
> To get a sash prompt on my 715/33 I need the patch below. Even if this
> patch isn't release quality something like that is needed to get the
> iodc console going.
> 
> Because I still have some problems with the first few printed lines, I
> haven't checked it into cvs. Hope it helps others as well. Ohh and changing
> "console=ttyS0" to "console=tty" in boot_code/ipl_c.c is required, too.

I've just checked in something similar.  You should also disable
CONFIG_VT_CONSOLE, or you'll see all lines printed twice.  I think it
will now work out of the box for the 715/33 if you have the right .config.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
