Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA11452
	for <parisc-linux@puffin.external.hp.com>; Wed, 16 Aug 2000 05:04:18 -0600
Message-Id: <200008160507.WAA05808@milano.cup.hp.com>
To: Mike Hibler <mike@fast.cs.utah.edu>
Cc: matthew@wil.cx, steve@silug.org, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HP 9000/735 systems.... 
In-reply-to: Your message of "Tue, 15 Aug 2000 13:00:50 PDT."
             <200008151900.NAA08567@fast.cs.utah.edu>
Date: Tue, 15 Aug 2000 22:07:16 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Mike Hibler wrote:
> Odds should be quite good.  The HP-UX compatibility code that is in the
> Mach port was sufficient to run the HP Xserver of that era (circa HP-UX 9.x).
> Working on HP-UX compatibility mode would seem like a much better use of
> time than trying to write an Xserver for N different HP video cards.

This sounds like a good plan to follow. Who can do this or who can
"borrow" code from the Mach to make this work?

I'm pretty sure this is the quickest/easiest way to get something
working since I've seen it working already.

> OTOH, if HP is as committed to Linux as they appear to be, then maybe their
> X11 group will just port their server to PA Linux and make it available!

I wouldn't count on it. They might. But generally, supporting parisc-linux
is not the same priority as IA64-linux. And despite pretty deep pockets,
HP does not have infinite resources to do everything.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
