Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 008234961
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 02:33:13 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] EISA support
Date: Wed, 10 Oct 2001 03:32:09 -0500
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <01101003320900.00964@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 10 October 2001 01:24 am, Matthew Wilcox wrote:
> Anyone want to review a patch that makes EISA work?  
>
>  * I decided that to support old drivers, EISA port numbers should be
>    between 0-0xffff, so I reserved bus number 0 for EISA.  This involved
>    messing with inb/outb in pci.c.
>
Willy,

A comment, for your consideration:

Old ISA boards only do a 10-bit decode and it is a frequent occurance
that old drivers don't "clean up" the unused high 6 bits.

Would it be reasonable to mask port numbers to 10 bits for ISA in the
inb/outb routines?

Mike
