Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id HAA10575
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Aug 2000 07:46:07 -0600
Received: from ppp-1-219.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.219)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 13:45:52 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CF3A9B005; Fri, 18 Aug 2000 14:45:02 +0100 (BST)
Date: Fri, 18 Aug 2000 14:45:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000818144502.C13870@linuxcare.com>
References: <20000815160510.C7757@vodka.thepuffingroup.com> <20000818124944.A13870@linuxcare.com> <20000818130835.B13870@linuxcare.com> <20000818083733.U7757@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000818083733.U7757@vodka.thepuffingroup.com>; from matthew@wil.cx on Fri, Aug 18, 2000 at 08:37:33AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 18, 2000 at 08:37:33AM -0400, Matthew Wilcox wrote:
> On Fri, Aug 18, 2000 at 01:08:35PM +0100, Richard Hirst wrote:
> > In fact, it gets as far as reading the first block of init,
> > doesn't like it, then goes and tries to read /bin/sh, finds it is
> > a link to busybox, reads in the first block of that, and doesn't
> > like it either:
> > I guess it doesn't recognise the file format for some reason..
> 
> Sounds plausible; this is one of the things which got overhauled between
> 2.3.99pre8 and 2.4.0-test6.  i'll investigate.  is your init SOM or ELF?

ELF.
