Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02717
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Feb 2000 16:03:58 -0700
Date: Fri, 25 Feb 2000 23:03:48 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: willy@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] code 28 trap
Message-ID: <20000225230348.E812@abacus.local>
References: <20000224224934.N9944@thepuffingroup.com> <200002252036.MAA04792@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002252036.MAA04792@milano.cup.hp.com>; from grundler@cup.hp.com on Fri, Feb 25, 2000 at 12:36:27PM -0800
List-ID: <linux-parisc.vger.kernel.org>

> > Uh oh.  We really need a kernel unaligned trap handler.  Some of
> > the network protocols rely on that being handled right (yes, i know.
> > it sucks.)
> 
> It really sucks. If any code in the performance path depends on this,

Another vote for "it sucks".

Which network drivers, protocols aso exactly are you using (and did you
check for the bug Matthew posted an URL for ?) ?  I really don't think
we should write an unaligned handler until we find ourselves using weird
protocols (and hopefully not even then).

	Philipp
