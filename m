Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13876
	for <parisc-linux@puffin.external.hp.com>; Mon, 17 Jan 2000 12:47:00 -0700
Sender: adevries@thepuffingroup.com
Message-ID: <38836411.3A85639D@thepuffingroup.com>
Date: Mon, 17 Jan 2000 13:48:49 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: Matthew Wilcox <willy@thepuffingroup.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PDC calls on the C3000
References: <200001171802.KAA18011@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> > which takes the rightmost 30 bits from the register, zeroes the whole
> > register and then stores them back into it:
> >       0xffff'ffff'c0xx'xxxx
> > becomes
> >       0x0000'0000'00xx'xxxx
> > and now PDC is happy, and so am I.
> 
> This is where the hair on the back of my neck went up.
> The problem is on L-class and N-class machine we have
> I/O and memory addresses which are > 4GB. And PDC will really
> be confused on those platforms.

Right, and so we need access to wide mode registers for those PAT PDC
calls.  So I don't think we can do any of this until we have access to a
64 bit assembler.

In any case, this is not a priority right now.  I think we should only
be concerned with L class starting Feb. 7.  And N class isn't even on my
radar yet.

- Alex

-- 
Alex deVries
Director of Professional Services
The Puffins at Linuxcare
