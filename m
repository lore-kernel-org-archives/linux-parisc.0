Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA10330
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 14:10:47 -0700
Date: Thu, 7 Dec 2000 22:12:05 +0100 (CET)
From: Daniel Engstrom <danne@telia.com>
To: Richard Hirst <rhirst@linuxcare.com>
cc: Daniel Engstrom <danne@telia.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SCSI on ASP systems
In-Reply-To: <20001206234726.C7166@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0012072158170.8673-100000@zaphod.halden.lillfab.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 6 Dec 2000, Richard Hirst wrote:
> Can you try adding
> 
> 	sim700=noneg:0xff,nodisc:0xff
> 
> to your boot comamnd line and let me know what happens.

Nothig, it behaves like id did before.

I tested to read the entire disk which it did without the error. I did get
~350 phase mismates on the 3G disk (id tuned phase mismatch logging on
after noticing that the last event before the unexpected disconnect was a
phase mis match, but they seem to happen all the time so I think they are
unrelated, normal, even?


If write to the disk with dd I can wite about 1050 sectors befor the error
happens (1050 failed twise and suceeded onece, every thine I tried below
succeded and every thing I tried avove failed).

> If that fails after very little disk activity, you could try 
> 
> 	sim700=noneg:0xff,nodisc:0xff,debug:0x2ff
> 
> and send me the (large) debug output.
Is this still intresting?

/Daniel
-- 
