Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA25544
	for <parisc-linux@puffin.external.hp.com>; Sun, 29 Aug 1999 19:34:23 -0600
Date: Sun, 29 Aug 1999 19:35:53 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199908300135.TAA01696@fast.cs.utah.edu>
To: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] keyboard driver
List-ID: <linux-parisc.vger.kernel.org>

> Date: Sun, 29 Aug 1999 03:18:12 +0200
> From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
> To: parisc-linux@thepuffingroup.com
> Subject: [parisc-linux] keyboard driver
> 
> Is anyone working on the keyboard driver for the 715/33 (and presumably
> some other models)?  It appears to be an HIL keyboard, and there's
> already an HIL driver in arch/m68k/hp300/hil.c.  Is this likely to work?
> Is there any documentation available for this?
> 

The BSD HIL driver should pretty much "just work."

There are some differences in the register layout, but the 700 info should
all be available in the Mach code or the LASI ERS.  I will send out info
about the HIL ERS (part #, etc.) when I am at work tomorrow.  Presumably,
someone at HP can then dig up a copy.
