Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA05862
	for <parisc-linux@puffin.external.hp.com>; Mon, 20 Nov 2000 00:03:18 -0700
Message-Id: <200011200705.XAA18181@milano.cup.hp.com>
To: Sandy Harris <sandy@storm.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Host for 712/60 compiles 
In-reply-to: Your message of "Fri, 17 Nov 2000 22:54:58 PST."
             <3A15FD92.DEB522FE@storm.ca>
Date: Sun, 19 Nov 2000 23:05:26 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Sandy Harris wrote:
> A couple of us have 16 diskless 712/60s which we want to use for distributed
> processing on easily parallelized tasks like factoring and perhaps crypto
> cracking. A few questions arise.
> 
> Is PARISC Linux far enough along to be useful for that? We need no monitor or
> console (except perhaps for initial debugging), no devices except ethernet,
> and expect to run only one process per machine, but we need stability.

It's not rock solid.  On 712's, it should be pretty good though.

> We'll need a host for cross-compiling. We have a 256 meg 715/100 with HP/UX
> which we expect to use as the host for booting, handing out chunks of work,
> storing results, etc. Should we compile there under HP/UX or would we get
> better tools on one of our Intel Linux boxes?

I don't think anyone has tried to cross-compile parisc-linux on an HPUX
host in quite a while.

> Or is PARISC Linux far enough along we should put it on the 715 and get
> native compilation?

AFAIK, all of the debian packages on the ISO image are built natively.
But using a dual P700 linux box would be alot faster. :^)

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
