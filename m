Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA07442
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Mar 2000 11:13:47 -0700
From: davisg@Celestica.com
To: Philippe Benard <phi@hpfrcu03.france.hp.com>
cc: davisg@Celestica.com, Corne Beerse <beerse@ats.nld.alcatel.nl>,
        parisc-linux@thepuffingroup.com
Message-ID: <852568B1.005E6F18.00@tormta3.tor.cel.com>
Date: Wed, 29 Mar 2000 12:11:37 -0500
Subject: Re: [parisc-linux] Couple of questions
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>





Greetings,

Phi wrote:
> >
> > There is no TOC button available on the Model 712. A special debug card is
> > used by HP hardware and OS developers for TOC among other things on this
> > platform.
>
> Not sure about it, but I think that pushing the white button 3 time, i.e from
> ON state going OFF/ON/OFF (may be more don't remember) does trig a TOC, and
> this is High prio, i.e for dump capable OS, this mean post mortem dump
> analysis due to a hang possible (i.e what I like :-)
>

Ooops, I stand corrected, the power switch (used in this manner while running
HP-UX) can indeed be
used to trigger a TOC. However, I still assert that the power switch itself
cannot be directly used to
generate a TOC. Refer to the "lasi_ers.ps" on or about page 78. There is a
diagram which describes
the power switch control circuit. As described in this diagram and elsewhere in
this document, the power
switch generates a power fail interrupt to the CPU only. The hardware itself
cannot directly trigger a TOC
on the Model 712. But, apparently, you can cause a TOC on the Model 712 (while
running HP-UX) by
toggling the power switch a few times. I've tried, it works, I'll be damned, I
didn't know that.

Thanks for the insight!    :  )



Regards,
Geoge G. Davis
Software Engineer,  Celestica Chelmsford Design Center
20 Alpha Road
Chelmsford, MA 01824
