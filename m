Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13676
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jan 2000 12:37:03 -0700
Date: Mon, 17 Jan 2000 13:34:21 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PDC calls on the C3000
Message-ID: <20000117133421.O11300@thepuffingroup.com>
References: <20000117105734.L11300@thepuffingroup.com> <200001171802.KAA18011@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200001171802.KAA18011@milano.cup.hp.com>; from Grant Grundler on Mon, Jan 17, 2000 at 10:02:59AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 17, 2000 at 10:02:59AM -0800, Grant Grundler wrote:
> I'm thinking the inconsistency is possibly a firmware "bug" where either
> the C360 or C3000 isn't behaving "right". Can anyone comment on what
> the expected behavior is?

I would class it as a bug, but I just needed a workaround for the
next month or two :-)  BTW, the same thing happens on mkp's J5000.

> > 	0xffff'ffff'c0xx'xxxx
> > becomes
> > 	0x0000'0000'00xx'xxxx
> > and now PDC is happy, and so am I.
> 
> This is where the hair on the back of my neck went up.
> The problem is on L-class and N-class machine we have
> I/O and memory addresses which are > 4GB. And PDC will really
> be confused on those platforms.

That won't be a problem.  The tophys macro is used to convert kernel
virtual addresses into physical addresses.  The kernel isn't going to
take more than 1GB of ram for its data segment :-)

We're not applying this macro to any other data type, don't worry.
