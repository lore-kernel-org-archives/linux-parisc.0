Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA04557
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 11:22:43 -0600
Received: from postal.sr.hp.com (root@postal.sr.hp.com [15.4.46.173])
	by cosrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA26339
	for <parisc-linux@thepuffingroup.com>; Wed, 20 Oct 1999 11:23:29 -0600 (MDT)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id KAA11377 for <parisc-linux@thepuffingroup.com>; Wed, 20 Oct 1999 10:23:14 -0700 (PDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id KAA19751 for parisc-linux@thepuffingroup.com; Wed, 20 Oct 1999 10:23:17 -0700 (PDT)
Message-Id: <199910201723.KAA19751@meow.sr.hp.com>
Subject: Re: [parisc-linux] What's in a 715?
To: parisc-linux@thepuffingroup.com
Date: Wed, 20 Oct 1999 10:23:17 -0700 (PDT)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|On Wed, 20 Oct 1999, Matthew Wilcox wrote:
|> On Wed, Oct 20, 1999 at 12:35:01AM -0700, Ulrich Strelow wrote:
|> > Bill Katz from HP answered:
|> > The 715/33 does NOT have either LASI or DINO. It uses
|> > an older I/O chip known as ASP. ASP connects the
|> > processor bus to several external chips, including the
|> > NCR 53c710, Intel LAN and WD 16C552 (? I'm doing this
|> > from memory) 2-serial/parallel chip. It uses the
|> > PA7100 CPU which does not have GSC. 

A little more detail.  In the original snakes (720, 730, 750) the
ASP chip was used to glue everything together, and hooked the NCR
53c700, Intel LAN, WD 552 (serial + parallel) together, and provided
some missing features (DMA for parallel, PA interrupt controller, etc).

This was leveraged into the next generation of snakes (735, 715/33 /50 /75,
750).  I think these also contain "CD quality" audio.  The earlier snakes
had only a beeper.

LASI is the compaction of all of this (including the Intel LAN and 
NCR 53C710) into one ASIC, originally for cost reduction in the 712.

|
|So the conclusion here is that we really can't do 715 support without
|hardware documentation on ASP.

I suspect it will help.

|
|> If you open the 715/33 up, it has chips called OLIN and SHINKO on the
|> board, as well as some unnamed chips.  Do either or both of these chips
|> implement ASP?  I gave Alex the details on these chips a couple of months
|> ago and last I heard they were on the list of documents we want from HP,
|> marked `desirable, but no urgency'.
|
|IIRC, OLIN and SHINKO are just the chip manufacturers.
|
|I'll remind HP that these docs are on the list.

I've got the ERS for the 715s in question, and will try to get it cleaned
up and to John SOntag for reveiw by the lawyers and release.  I'm 
currently laying out a board, so I'm kinda swamped.  I've done the hard part
which is chasing down source code for the thing.  (Took days of digging
through PDM...) Any other HPite that 
wants a stab at it this week should contact me.  It's in Interleaf.

The earliest I could get this done is late next week.

	-Bill
