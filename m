Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74FDA4A15
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 10:58:55 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: Matthew Wilcox <willy@debian.org>,
	Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] EISA support
Date: Wed, 10 Oct 2001 11:57:29 -0500
Cc: parisc-linux@parisc-linux.org
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <20011010154810.D24923@parcelfarce.linux.theplanet.co.uk> <20011010163846.E24923@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011010163846.E24923@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01101011572901.00829@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 10 October 2001 10:38 am, Matthew Wilcox wrote:
>
> Ah, I found an appendix :-)
>
> EISA cards have a slot number which determines the upper nybble of their
> IO port numbers.  Then within that 0xfff of space, they use 0-ff, 400-4ff,
> 800-8ff, c00-cff.  The rest are ISA ports (or aliases of ISA ports).
>
Willy,
Sounds like you have it handled already - that 400-4ff range (plus 000-3ff) 
is the very old, 8-bit, ISA i/o port range (on i386 cards).
I think you just saved my very old PROM burner from the scrap heap.

On a separate subject related to your EISA work...
For 8/16-bit ISA cards that do not report resource requirements (i/o,
mem, dma, irq) and for the EISA cards without a "known" ID - perhaps
let the driver accept command line option(s) and leave the details to
the user.  For the IRQ mappings, perhaps something like: xyz_irq=8:zz,
xyz_dma=4:yy, etc. (without the ":ww" just map somewhere handy.)

Mike
