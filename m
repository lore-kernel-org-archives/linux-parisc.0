Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 902A64A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 11:24:26 -0700 (MST)
Sender: christoph.plattner@alcatel.at
Message-ID: <3A7EEFCF.A0E34D31@alcatel.at>
Date: Mon, 05 Feb 2001 19:24:15 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	penfold@customware.com.au, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] _working_ rbootd for redhat
References: <200102041048.VAA00309@customware.com.au> <3A7D69B4.896F63D6@dot.at> <20010205181911.A5520@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Is it not possible to add the entry in the meantime
with the well-known big triple X
	/* XXX hack.... */
for those people doing the first hackings on such old machines ?
Of course, some of these points will be forgotten....

I have not enough skills at the moment. I don't know the PA-RISC
arch here good enough, and I also have to deal with the low level
kernel code around the PA RISC here. 

Cheers
	Christoph


Matthew Wilcox wrote:
> 
> On Sun, Feb 04, 2001 at 03:39:48PM +0100, Christoph Plattner wrote:
> > Hello !
> >
> > For the SCSI I have nothing fixed !
> > It works out of the box.
> >
> > I have not sent any patch. I only tried it and it works.
> > So to all PA-RISC hackers, add the TRAP 18 there in the main stream !!
> 
> Yes, and no.  we need a proper trap 18 handler that checks to see whether
> it's a page fault or a misaligned data reference, and calls the right
> handler.  This should not be too hard to write, but i don't have time
> right now.
> 
> --
> Revolutions do not require corporate support.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

-- 
  +--------V--------+	Christoph.Plattner@alcatel.at
  |  A L C A T E L  |	-----------------------------
  +-----------------+	Phone: +43 1 27722 3706	
         T A S		Fax:   +43 1 27722 3955
