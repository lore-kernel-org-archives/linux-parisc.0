Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA24737
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Aug 2000 19:00:34 -0600
Date: Tue, 15 Aug 2000 13:00:50 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <200008151900.NAA08567@fast.cs.utah.edu>
To: matthew@wil.cx, steve@silug.org
Subject: Re: [parisc-linux] HP 9000/735 systems....
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> From: Steven Pritchard <steve@silug.org>
> Subject: Re: [parisc-linux] HP 9000/735 systems....
> To: Matthew Wilcox <matthew@wil.cx>
> Date: Tue, 15 Aug 2000 13:43:36 -0500 (CDT)
> 
> Matthew Wilcox said:
> > we have no intention of providing an X server (anyone want to start
> > working on that...?)
> 
> What are the odds that the stock X11 Xhp would just work (or could be
> made to just work)?
> 

Odds should be quite good.  The HP-UX compatibility code that is in the
Mach port was sufficient to run the HP Xserver of that era (circa HP-UX 9.x).
Working on HP-UX compatibility mode would seem like a much better use of
time than trying to write an Xserver for N different HP video cards.

OTOH, if HP is as committed to Linux as they appear to be, then maybe their
X11 group will just port their server to PA Linux and make it available!
