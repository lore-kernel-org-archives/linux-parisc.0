Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA02767
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Sep 1999 11:48:59 -0600
From: Stan Sieler <sieler@allegro.com>
Message-Id: <199909011732.KAA28707@bart.allegro.com>
Subject: Re: [parisc-linux] HP3000 928LX Support?
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 1 Sep 1999 10:32:22 -0700 (PDT)
Cc: Hugo.van.der.Kooij@caiw.nl, rmurat@ibm.net,
        parisc-linux@thepuffingroup.com
In-Reply-To: <199909011619.JAA06394@milano.cup.hp.com> from "Grant Grundler" at Sep 1, 99 09:18:46 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Re:

> > > I have the opportunity to acquire a HP3000 928LX server
> > > and would like to know if it is supported.
> > 
> > HP3000 systems are not PA-RISC systems. They use the Motorola 68000 CPU
...
> Firmware is different but many of the platform components
> are the same as K and T class machines.


The HP 3000/928 is a PA-RISC system (48 MHz PA7100LC (PCX-L)),
with HP-PB I/O (2 slots), 64 KB of integrated cache, floating point
co-processor, and a max memory of 512 MB.

It's 100% identical to the HP 9000 E25 (2-slot HP-PB model).

The firmware is 100% identical, AFAIK.

You could probably trade the HP 3000 for an E25 and get money back.

BTW, the "Classic HP 3000" models (those with a two-digit model number)
are 16-bit CISC, not Motorola.  All HP 3000s with a 3 digit model
number (e.g., 928) are PA-RISC.

If Linux is ever supported on an HP 9000 E25 (or any E## model), then
it will also run on an HP 3000 9x8 model.

-- 
Stan Sieler                                          sieler@allegro.com
                                         http://www.allegro.com/sieler/
