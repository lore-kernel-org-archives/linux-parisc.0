Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id EAA14732
	for <hppa-linux@sod.res.cmu.edu>; Thu, 18 Mar 1999 04:30:19 -0500
Received: from the-village.bc.nu (lightning.swansea.uk.linux.org [194.168.151.1]) by snowcrash.cymru.net (8.8.7/8.7.1) with SMTP id JAA27436; Thu, 18 Mar 1999 09:30:11 GMT
Message-Id: <m10NZyO-0007U2C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: [hppa-linux] memory layout
To: hppa-linux@thepuffingroup.com
Date: Thu, 18 Mar 1999 10:24:19 +0000 (GMT)
Cc: hppa-linux@puffingroup.com
In-Reply-To: <Pine.LNX.3.96.990317212138.2685A-100000@quark.ix.netcom.com> from "Kumar" at Mar 17, 99 09:29:46 pm
Content-Type: text
List-ID: <linux-parisc.vger.kernel.org>

> Talking about only pa1.1 or 32 bit CPUs, I would say the same layout
> can be used as Linux on Intel does. That is kernel mapped at 0xc0000000.
> So 3 Gig for User space and 1 Gig for kernel. Of course, other ppl may
> have different ideas. 

If you want to run PH/UX binaries then you need to probably follow their
layout

> PA has this strange concept of Spaces and they have those 
> space registers %sr0 to %sr7. This reminds me of Intel's segment 
> registers. And whoever wanted to do any serious OS like Unix on 80386
> never liked segments.

Spaces is more segments done right. The reason we dont use segmentation
to split user/kernel on x86 any more is simply performance - it costs us
1 clock per dword copied to/from luser space.

The m68k people use the 'spaces' equivalent on the m68k quite heavily
