Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA19094
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Nov 1999 16:22:58 -0700
Date: Thu, 18 Nov 1999 00:25:54 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: frowand@cup.hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] depi?
Message-Id: <19991118002554.F10209@mathe.stud.uni-erlangen.de>
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com> <19991116170819.B750@mathe.stud.uni-erlangen.de> <3831CFF0.F4B3CE3E@hp.com> <19991117071226.G750@mathe.stud.uni-erlangen.de> <3832FA61.F977451E@hp.com> <19991117230531.D10209@mathe.stud.uni-erlangen.de> <3833340E.59C7BDB4@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3833340E.59C7BDB4@hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> The problem is that no matter how obvious it is to us software folks that it
> would be braindead, illogical, or nearly impossible for the hardware to
> behave in strange ways, the hardware folks are incredibly devious at making
> the hardware more effective, within the constraints of the architecture
> (and, on occasion, outside the constraints).  This results in behaviour that
> may seem unreasonable to a software person.

If the hardware gives us cache problems, it is not in compliance with the
architecture specification (OR my proof is wrong, but you "didn't bother to
read it").

If it doesn't, we're just fine. (OR ...).

> *****  I attempt to code within the ARCHITECTURE, not to implement what
> specific hardware implementations let me get away with.  That way I don't
> get burnt by the creative hardware engineers, who might be pushing the
> envelope.  *****

Shrug.  Both versions are in compliance with the architecture. (OR ...)

Note especially that on PA2.0 in wide mode, there is an explicit exception as
well, so mapping the memory at 0x0000 0000 0000 0000, 0x4000 0000 0000 0000,
0x8000 0000 0000 0000 or 0xc000 0000 0000 0000 is all okay.

	Philipp Rumpf
