Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27335
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 12:31:45 -0700
Date: Wed, 17 Jan 2001 13:33:04 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 Bus Errors 
In-Reply-To: <200101171925.LAA13069@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101171328590.3619-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 17 Jan 2001, Grant Grundler wrote:

> Greg Ingram wrote:
> > What does a bus error really mean?
> 
> I've seen it mean an unaligned data reference trap (in user space).
> But I'm not sure that's the case here.

That what it is, alright.  It generates a register dump.  Anything I can
do about it?

- Greg
