Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA22993
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 03:17:24 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id CDABFB007; Tue, 14 Nov 2000 10:17:04 +0000 (GMT)
Date: Tue, 14 Nov 2000 10:17:04 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <deller@gmx.de>
Cc: bame@riverrock.org, parisc-linux@puffin.external.hp.com
Subject: Re: sym53c8xx-driver (was: Re: [parisc-linux] kernel merge)
Message-ID: <20001114101704.Y32715@linuxcare.com>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <00111323542900.00319@P100> <20001113232752.V32715@linuxcare.com> <00111401135802.00319@P100>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <00111401135802.00319@P100>; from deller@gmx.de on Tue, Nov 14, 2000 at 01:13:58AM +0100
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,

On Tue, Nov 14, 2000 at 01:13:58AM +0100, Helge Deller wrote:
> On Tuesday 14 November 2000 00:27, Richard Hirst wrote:
> > Hi Helge,
> >   The problem I fixed related to the ncr53c8xx driver (which shares
> > code with sym53c8xx), and was to make 53c720 support work again.
> > sym53c8xx worked for me on my A180.  Please can you try booting
> > with
> > 
> > 	sym53c8xx=verb:7,debug:0xffff
> > 
> > and send me the output?
> > 
> > Thanks,
> >  Richard
> 
> 
> Hi Richard,
> 
> the output and the relevant part of .config is attached.
> 
> Greetings,
> 
> 	Helge

Thanks.  I agree it doesn't look like the driver is even seeing the
chip; I wonder if PCI support is broken...

> dino_bridge_init: IO_ADDR_EN hasn't been configured.
> kernel BUG at dino.c:646!

Does it usually say that on bootup?

Richard
