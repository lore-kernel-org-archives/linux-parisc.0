Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA06326
	for <parisc-linux@puffin.external.hp.com>; Tue, 13 Jul 1999 02:48:16 -0600
Received: from nemeton.com.au (dy02.edison.dialix.com.au [203.12.2.33])
	by edison.dialix.com.au (8.9.1/8.9.1/DIALixFlat) with ESMTP id SAA11556
	for <parisc-linux@thepuffingroup.com>; Tue, 13 Jul 1999 18:48:33 +1000 (EST)
	(envelope-from giles@nemeton.com.au)
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] serial console 
In-reply-to: <19990712231019.A2039@alpha.franken.de> 
Date: Tue, 13 Jul 1999 18:50:30 +1000
Message-ID: <19099.931855830@nemeton.com.au>
From: Giles Lean <giles@nemeton.com.au>
List-ID: <linux-parisc.vger.kernel.org>


On Mon, 12 Jul 1999 23:10:19 +0200  Thomas Bogendoerfer wrote:

> > Also, is there an equivalent to Sun's L1-A or the Indy's
> > send-break-over-serial that will get me back to the PROM in the event
> > that Linux jumps to east nowhere?  Or do I have to power cycle?
> 
> So far everbody denied the existance of that essentiell (at least for
> kernel hackers) feature.

Historically on HP servers (series 800 machines) ^B gets you to "PROM"
mode.  It has varied on different machines whether this is enabled and
disabled by a key, or a switch on the back, or is not able to be
disabled at all.

Some newer machines (some D series, all A series, all R series) don't
have this functionality out unless an "access port" card is added to
the system.  These systems do still have a TOC (Transfer of Control)
button so that dumps can be taken.

I'll dig out the part number for the access port card if anyone cares;
I don't have it to hand right now.

Regards,

Giles
