Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27083
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 12:19:45 -0700
Message-Id: <200101171925.LAA13069@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 Bus Errors 
In-reply-to: Your message of "Wed, 17 Jan 2001 13:18:44 PST."
             <Pine.LNX.4.21.0101171314300.3619-100000@maestro.symsys.com>
Date: Wed, 17 Jan 2001 11:25:17 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> What does a bus error really mean?

I've seen it mean an unaligned data reference trap (in user space).
But I'm not sure that's the case here.

> Is it a problem with the kernel support for my hardware?

very unlikely.

grant
