Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA20094
	for <parisc-linux@puffin.external.hp.com>; Fri, 16 Jul 1999 09:53:03 -0600
Date: Fri, 16 Jul 1999 09:53:27 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199907161553.JAA10093@fast.cs.utah.edu>
To: Matthew.Wilcox@genedata.com, Ulrich.Strelow@schering.de
Subject: Re: [parisc-linux] 715/33 experience and one question
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Fri, 16 Jul 1999 14:14:13 +0200
> From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
> To: Ulrich.Strelow@schering.de
> Subject: Re: [parisc-linux] 715/33 experience and one question
> 
> On Fri, Jul 16, 1999 at 01:54:18PM +0200, Ulrich.Strelow@schering.de wrote:
> [successful boot report snipped]
> > And then my question:
> > I think the 715/33 does  not  have a Dino or a Lasi chip (am I right?), but
> >  does it have a gecko (and what is this?)?
> 
> Right, the 715 has neither DINO nor LASI.  The chips inside are labelled
> OLIN and SHINKO.  http://www.thepuffingroup.com/parisc/hp9000_models.html
> has no details on these chips.  Alex tells me he's trying to get
> documentation on these chips, but I'll have to be patient.  The major
> stumbling block with these machines is likely to be the SCSI controller
> -- it's an NCR53C700 which is apparently a very nasty device; much more
> nasty than the 710 which is built into LASI.
> 
> In my copious spare time, I'm stumbling through the Utah Mach sources,
> trying to glean details about OLIN and SHINKO but I've had no success
> so far.
> 

We never had a 715/33 so I don't know anything about them.  But someone
else said they had the ASP which is the "original snakes" IO subsystem
(705/710/720/730/750).  The ASP is quite similar to the LASI, and there
is plenty of code in the Mach sources.

Hit your HP sources up for:

	Corba/Coral I/O Subsystem External Reference Specification

Don't have a part or drawing number unfortunately.  We have version 1.43
from November 1990.  Looks like it came out of Cupertino.

As for the SCSI controller, the 700 isn't that different from the 710.
Had a few bugs though as I recall and our driver/script did not work
around all of them.
