Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA10931
	for <parisc-linux@puffin.external.hp.com>; Thu, 7 Dec 2000 14:28:30 -0700
Received: from user-79-200.jakinternet.co.uk (HELO rhirst.linuxcare.com) (194.88.79.200)
  by mailserv2.iuinc.com with SMTP; 7 Dec 2000 21:31:05 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id C1FC7B005; Thu,  7 Dec 2000 21:26:10 +0000 (GMT)
Date: Thu, 7 Dec 2000 21:26:10 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Daniel Engstrom <danne@telia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SCSI on ASP systems
Message-ID: <20001207212610.F7166@linuxcare.com>
References: <20001206234726.C7166@linuxcare.com> <Pine.LNX.4.21.0012072158170.8673-100000@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012072158170.8673-100000@zaphod.halden.lillfab.se>; from danne@telia.com on Thu, Dec 07, 2000 at 10:12:05PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 07, 2000 at 10:12:05PM +0100, Daniel Engstrom wrote:
> On Wed, 6 Dec 2000, Richard Hirst wrote:
> > Can you try adding
> > 
> > 	sim700=noneg:0xff,nodisc:0xff
> > 
> > to your boot comamnd line and let me know what happens.
> 
> Nothig, it behaves like id did before.
> 
> I tested to read the entire disk which it did without the error. I did get
> ~350 phase mismates on the 3G disk (id tuned phase mismatch logging on
> after noticing that the last event before the unexpected disconnect was a
> phase mis match, but they seem to happen all the time so I think they are
> unrelated, normal, even?

Phase mis-matches are normal, but I wouldn't typically expect them on
a read or write if disconnect is disabled.

> If write to the disk with dd I can wite about 1050 sectors befor the error
> happens (1050 failed twise and suceeded onece, every thine I tried below
> succeded and every thing I tried avove failed).
> 
> > If that fails after very little disk activity, you could try 
> > 
> > 	sim700=noneg:0xff,nodisc:0xff,debug:0x2ff
> > 
> > and send me the (large) debug output.
> Is this still intresting?

Yes please, if you can capture it easily.  I'll be interested to
see if there are phase mismatches that are handled ok before the
one that goes wrong, and what the driver does afterwards.

Richard
