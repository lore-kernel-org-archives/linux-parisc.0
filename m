Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA14306
	for <parisc-linux@puffin.external.hp.com>; Wed, 8 Dec 1999 22:03:15 -0700
Date: Thu, 9 Dec 1999 05:06:34 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] /usr/conf/machine header files
Message-Id: <19991209050634.D21512@mathe.stud.uni-erlangen.de>
References: <19991206002708.A16979@mathe.stud.uni-erlangen.de> <199912082333.PAA03087@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912082333.PAA03087@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> > PA2.0 port:  64-bit virtual addresses are 42 bits per quadrant only and
> > start at the smallest address in the quadrant - so unlike alpha where the
> > addresses are "sign-extended".
> Actually, HP-UX does sign extend I/O addresses. I'm not sure

That's physical addresses though, so we really don't care, do we ?

> if this is a feature of HP-UX or something in the HW makes it
> easier to do it this way...anyone know?
> 

> Secondly, don't make assumptions about how many bits are used in
> a virtual or physical addresses unless it's processor specific code.
> (eg TLB handler or trap handler or hpmc handler). I know the number
> of physical bits supported by the processor is going to increase
> from 40-bits (runway).

physical addresses you are right about;  we really should use an unsigned
long for those and never expect them to be less than 64 bits in length.

virtual addresses, unfortunately, aren't as simple:  The 32 LSBs of the
space identifier get ORed into the 32 MSBs of the virtual address, so we
are limited to 2+(62-virtual_address_bits_used) effective bits for space
identifiers (on PA2.0 CPUs with 32 bit space registers).  As we want to
use at least one space identifier per process, actually using only 42
bits of the virtual address gives us 22 bits of space identifiers - or
1 M processes even if we use 4 space identifiers per process.

	Philipp Rumpf
