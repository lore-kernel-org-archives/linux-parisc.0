Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA12404
	for <parisc-linux@puffin.external.hp.com>; Wed, 7 Jul 1999 23:30:25 -0600
Date: Wed, 7 Jul 1999 23:30:47 -0600 (MDT)
From: Mike Hibler <mike@fast.cs.utah.edu>
Message-Id: <199907080530.XAA13289@fast.cs.utah.edu>
To: Helge.Deller@ruhr-uni-bochum.de, adevries@thepuffingroup.com
Subject: Re: [parisc-linux] vmlinux in C360
Cc: parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>

> Date: Wed, 07 Jul 1999 22:15:51 -0400
> From: Alex deVries <adevries@thepuffingroup.com>
> To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
> Subject: Re: [parisc-linux] vmlinux in C360
> 
> Helge Deller wrote:
> > 
> > Hi !
> > 
> > Only a little idea, but you could try to set the Boot-Offset for the loaded
> > Image in the
> > arch/parisc/Makefile from 0x10000 to 0x12000 or higher....
> > It could be, that we overwrite the PDC & IO-Structures from the BIOS...
> > I think I read something about that in the other parisc-ports.....
> > 
> 
> Is there any reason not to bump that up to 0x12000 ? 
> 

I thought that 0x10000 was the magic value, the PDC using memory below that.
However, we do indeed load the Mach kernel at 0x12000 and we load our BSD
kernel at 0x11000.  I no longer remember the reason, but I'm sure it was a
good one! :-)
