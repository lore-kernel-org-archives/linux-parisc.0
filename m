Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA04395
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Sep 2000 23:05:35 -0600
Message-Id: <200009060508.WAA24577@milano.cup.hp.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] entry.S Invalid operands 
In-reply-to: Your message of "Wed, 06 Sep 2000 15:48:54 PDT."
             <Pine.LNX.4.21.0009061542070.22521-100000@front.linuxcare.com.au>
Date: Tue, 05 Sep 2000 22:08:45 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alan Modra wrote:
> On Tue, 5 Sep 2000, Grant Grundler wrote:
> Well, some should have updated as I did another merge a few hours
> ago.  The previous merge was at a bad time, with some configure files
> broken.

More than about 30-50 files?
I didn't count but it was far more than my 24 line screen.

After rebuilding the binutils/gcc for XC, I can now build kernels again.

> The other likely possibility is that objects aren't being rebuilt even
> when source files are newer.  Dependency information in binutils might be
> wrong, or your version of make broken.

The former is possible though I had rebuilt from scratch.

I had to upgrade make to a newer version since gcc or binutils config
stops if make isn't at least version 3.78. I have 3.78.1.
Did that a few days ago...after dhd pointed out the obvious
config error.

thanks!
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
