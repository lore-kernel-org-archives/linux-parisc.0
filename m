Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA13023
	for <parisc-linux@puffin.external.hp.com>; Thu, 8 Jul 1999 06:53:27 -0600
Message-ID: <37849F59.D59C7057@ruhr-uni-bochum.de>
Date: Thu, 08 Jul 1999 14:53:45 +0200
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@thepuffingroup.com>
CC: Alex deVries <adevries@thepuffingroup.com>,
        Hannu Martikka <martikka@stybba.ntc.nokia.com>
Subject: Re: [parisc-linux] vmlinux in C360
References: <199907080530.XAA13289@fast.cs.utah.edu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Mike Hibler schrieb:

> > Date: Wed, 07 Jul 1999 22:15:51 -0400
> > From: Alex deVries <adevries@thepuffingroup.com>
> > To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
> > Subject: Re: [parisc-linux] vmlinux in C360
> >
> > Helge Deller wrote:
> > >
> > > Hi !
> > >
> > > Only a little idea, but you could try to set the Boot-Offset for the loaded
> > > Image in the
> > > arch/parisc/Makefile from 0x10000 to 0x12000 or higher....
> > > It could be, that we overwrite the PDC & IO-Structures from the BIOS...
> > > I think I read something about that in the other parisc-ports.....
> > >
> >
> > Is there any reason not to bump that up to 0x12000 ?

No, I don't know... (maybe only theese few unused kilobyte...)
Alex, maybe you want to set it higher ? (We could try lower it later again!).

> I thought that 0x10000 was the magic value, the PDC using memory below that.
> However, we do indeed load the Mach kernel at 0x12000 and we load our BSD
> kernel at 0x11000.  I no longer remember the reason, but I'm sure it was a
> good one! :-)

Hannu: did you tried, if it worked ?

Helge.
