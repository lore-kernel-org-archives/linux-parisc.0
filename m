Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA12229
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Nov 1999 14:20:33 -0700
Date: Mon, 8 Nov 1999 22:23:01 +0100
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] iodc console patch
Message-ID: <19991108222301.S25252@mencheca.ch.genedata.com>
References: <19991027234659.A2788@alpha.franken.de> <19991108210924.R25252@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991108210924.R25252@mencheca.ch.genedata.com>; from Matthew Wilcox on Mon, Nov 08, 1999 at 09:09:24PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Nov 08, 1999 at 09:09:24PM +0100, Matthew Wilcox wrote:
> I've just checked in something similar.  You should also disable
> CONFIG_VT_CONSOLE, or you'll see all lines printed twice.  I think it
> will now work out of the box for the 715/33 if you have the right .config.

*ahem*.  Of course, if you do, it will be unable to open an initial
console and panic.  Oops.  Don't do this for the moment :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
