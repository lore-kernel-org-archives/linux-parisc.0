Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA04100
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Oct 1999 10:56:22 -0600
Date: Wed, 20 Oct 1999 10:57:05 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199910201657.KAA14630@fast.cs.utah.edu>
To: adevries@thepuffingroup.com, parisc-linux@thepuffingroup.com
Subject: Re:  [parisc-linux] a WAX question.
List-ID: <linux-parisc.vger.kernel.org>

> Date: Wed, 20 Oct 1999 01:02:52 -0400 (EDT)
> From: Alex deVries <adevries@thepuffingroup.com>
> To: parisc-linux@thepuffingroup.com
> Subject: [parisc-linux] a WAX question.
> 
> ...
> Something that comes up quite a bit in those entries is WAX.  Is there
> actually a serial port on the WAX chip?  What can people tell me about
> this chip?
> 

WAX provides one rs232 port (compatible with NS16550A), HIL, HP-IB and
an "EISA converter."  I know it appears on the 712s, {715,725}/{80,100}
and J210 at the very least.  Doc that we have:

	External Reference Specification for the Wax I/O ASIC
	(aka, the Wax ASIC ERS)
	Rev 1.2, October 7, 1993
	Dwg. No. A-1FT4-9002-1

There is basic support for it in the Mach sources.
