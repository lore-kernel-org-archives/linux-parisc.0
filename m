Received: from www22.gmx.net (www22.gmx.net [213.165.64.72])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA27719
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 06:10:14 -0700
Date: Tue, 14 Nov 2000 14:11:42 +0100 (MET)
To: Richard Hirst <rhirst@linuxcare.com>
Cc: bame@riverrock.org, parisc-linux@puffin.external.hp.com
Cc: bame@riverrock.org, parisc-linux@puffin.external.hp.com
Subject: Re: sym53c8xx-driver (was: Re: [parisc-linux] kernel merge)
From: Helge Deller <deller@gmx.de>
References: <20001114101704.Y32715@linuxcare.com>
Message-ID: <28837.974207502@www22.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-parisc.vger.kernel.org>

> Hi Helge,
> 
> On Tue, Nov 14, 2000 at 01:13:58AM +0100, Helge Deller wrote:
> > On Tuesday 14 November 2000 00:27, Richard Hirst wrote:
> > > Hi Helge,
> > >   The problem I fixed related to the ncr53c8xx driver (which shares
> > > code with sym53c8xx), and was to make 53c720 support work again.
> > > sym53c8xx worked for me on my A180.  Please can you try booting
> > > with
> > > 
> > > 	sym53c8xx=verb:7,debug:0xffff
> > > 
> > > and send me the output?
> > > 
> > > Thanks,
> > >  Richard
> > 
> > 
> > Hi Richard,
> > 
> > the output and the relevant part of .config is attached.
> > 
> > Greetings,
> > 
> > 	Helge
> 
> Thanks.  I agree it doesn't look like the driver is even seeing the
> chip; I wonder if PCI support is broken...
> 
> > dino_bridge_init: IO_ADDR_EN hasn't been configured.
> > kernel BUG at dino.c:646!
> 
> Does it usually say that on bootup?

Yep. 
Has always been there, but nevertheless the scsi-driver worked before.
FYI: The non-pci sim700-driver also didn't showed up before pb fixed it in
CVS with a few one-line-patches.

NB: Could maybe someone (ggg?) explain me the kernel-bug mentioned above ?

> 
> Richard
> 

Greetings,

	Helge

-- 
Sent through GMX FreeMail - http://www.gmx.net
