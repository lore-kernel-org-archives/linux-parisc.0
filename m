Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3688A482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 18:57:40 -0600 (MDT)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D51C72B91@ntexchange.cat.csiro.au>
From: Matt.VanDeWerken@csiro.au
To: willy@debian.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] New scsi driver for 53c700 and 53c710 committe
	 d
Date: Tue, 9 Oct 2001 10:55:18 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> 
> On Tue, Oct 09, 2001 at 09:06:33AM +1000, 
> Matt.VanDeWerken@csiro.au wrote:
> > So will this new driver work on the 735-series? Please tell 
> me it's so...
> 
> I presume you're talking about the fast-wide-differential scsi port?
> That's a ncr720, not 700 or 710 chip.  The basic driver for 
> that is fine,
> but it doesn't recognise the chip as being something it should drive.
> 

I assume this is still the case? I enquired a while back about getting some
documentation on this to write the driver, but I think I asked at a bad time
(I think woody/potato was about to be released). Anyway, what's the chance
of getting some documentation so I could have a crack at the driver? I'm
happy to sign an NDA or whatever I need to sign, but I'd really like this
driver, and I'd also really like to have some experience with writing
drivers. What better way than to combine the two wishes?

Cheers,
Matthew van de Werken
Electronics Engineer
CSIRO Exploration & Mining - Gravity Group
1 Technology Court - Pullenvale - Qld - 4069 - AUSTRALIA
ph:  +61-7-3327 4685     fax:  +61-7-3327 4455
email:  m.vandewerken@cat.csiro.au
