Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA03717
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 10:39:04 -0600
Received: from vodka.thepuffingroup.com by mrelay.bellglobal.com
 (PMDF V5.1-12 #26722) with ESMTP id <0FJW00F3BU99PV@mrelay.bellglobal.com> for
 parisc-linux@thepuffingroup.com; Wed, 20 Oct 1999 12:39:13 -0400 (EDT)
Date: Wed, 20 Oct 1999 12:45:46 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] What's in a 715?
In-reply-to: <19991020171021.D25252@mencheca.ch.genedata.com>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
Message-id: <Pine.LNX.4.10.9910201237440.15070-100000@vodka.thepuffingroup.com>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 20 Oct 1999, Matthew Wilcox wrote:
> On Wed, Oct 20, 1999 at 12:35:01AM -0700, Ulrich Strelow wrote:
> > Bill Katz from HP answered:
> > The 715/33 does NOT have either LASI or DINO. It uses
> > an older I/O chip known as ASP. ASP connects the
> > processor bus to several external chips, including the
> > NCR 53c710, Intel LAN and WD 16C552 (? I'm doing this
> > from memory) 2-serial/parallel chip. It uses the
> > PA7100 CPU which does not have GSC. 

So the conclusion here is that we really can't do 715 support without
hardware documentation on ASP.

> If you open the 715/33 up, it has chips called OLIN and SHINKO on the
> board, as well as some unnamed chips.  Do either or both of these chips
> implement ASP?  I gave Alex the details on these chips a couple of months
> ago and last I heard they were on the list of documents we want from HP,
> marked `desirable, but no urgency'.

IIRC, OLIN and SHINKO are just the chip manufacturers.

I'll remind HP that these docs are on the list.

- Alex
