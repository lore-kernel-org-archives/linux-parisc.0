Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA25155
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 23:42:27 -0700
Message-Id: <200101020647.WAA26293@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA 
In-reply-to: Your message of "Tue, 02 Jan 2001 01:21:22 PST."
             <20010102012122.A10153@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 01 Jan 2001 22:46:58 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> But, if possible, we want to avoid doing DAC as it cuts down the bandwidth
> (and increases latency by a clock).  obviously, if it's a 64-bit device
> and a 64-bit controller, there's no problem, but we should try to stick
> to 32-bit bus addresses where possible.

That's correct. But then we can bypass the I/O MMU. SBA HW has bits
to support that - but I don't fully understand all the limitations of when
this "mode" can be used. Bypassing the I/O MMU would improve DMA performance
and reduce work CPU has to do to "map" each page of DMA.

Though it's generally a good direction, optimizing the PCI bus isn't
always the right answer.  Ie moving from 32- to 64-bit wide data
transfers is a *much* bigger performance win than DAC.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
