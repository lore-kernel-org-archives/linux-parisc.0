Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from vopserver.pflashcom (mail.pflash.com [207.19.136.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 05BD64846
	for <parisc-linux@parisc-linux.org>; Wed, 10 Oct 2001 08:13:05 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@pflash.com>
To: Alan Modra <amodra@bigpond.net.au>
Subject: Re: [parisc-linux] EISA support
Date: Wed, 10 Oct 2001 09:11:20 -0500
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
References: <20011010072441.B24923@parcelfarce.linux.theplanet.co.uk> <01101003320900.00964@Wolf-01> <20011010203110.S1100@bubble.sa.bigpond.net.au>
In-Reply-To: <20011010203110.S1100@bubble.sa.bigpond.net.au>
MIME-Version: 1.0
Message-Id: <01101009112000.00829@Wolf-01>
List-ID: <linux-parisc.vger.kernel.org>

On Wednesday 10 October 2001 06:01 am, Alan Modra wrote:
> >
> > Would it be reasonable to mask port numbers to 10 bits for ISA in the
> > inb/outb routines?
>
> No.  Some old ISA boards do decode the top bits, and actually use them.

Alan,

Correct - 
16-bit ISA cards NEARLY ALWAYS decode the top bits; but 8-bit
cards don't (can't, the wires aren't on that part of the socket).

My comment was based on the i386 branch, which does have such a
config option for the (very) rare installation that needs to support such
a board.

I was only wondering if this would be a REASONABLE place in the 
code to put it.

Mike
