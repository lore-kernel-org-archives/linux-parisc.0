Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA10174
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 16:28:09 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3BB62B007; Mon, 13 Nov 2000 23:27:52 +0000 (GMT)
Date: Mon, 13 Nov 2000 23:27:52 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Helge Deller <deller@gmx.de>
Cc: bame@riverrock.org, parisc-linux@puffin.external.hp.com
Subject: Re: sym53c8xx-driver   (was: Re: [parisc-linux] kernel merge)
Message-ID: <20001113232752.V32715@linuxcare.com>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet> <20001113121349.Q32715@linuxcare.com> <00111323542900.00319@P100>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <00111323542900.00319@P100>; from deller@gmx.de on Mon, Nov 13, 2000 at 11:54:29PM +0100
List-ID: <linux-parisc.vger.kernel.org>

Hi Helge,
  The problem I fixed related to the ncr53c8xx driver (which shares
code with sym53c8xx), and was to make 53c720 support work again.
sym53c8xx worked for me on my A180.  Please can you try booting
with

	sym53c8xx=verb:7,debug:0xffff

and send me the output?

Thanks,
 Richard


On Mon, Nov 13, 2000 at 11:54:29PM +0100, Helge Deller wrote:
> On Monday 13 November 2000 13:13, Richard Hirst wrote:
> > On Fri, Nov 10, 2000 at 02:28:33PM -0700, bame@riverrock.org wrote:
> > > drivers/scsi sym53c8xx_comm.h #ifdef doesn't work on parisc -- eliminates
> > >                 unmap_pci_mem() causing link error (TODO - rhirst)
> > 
> > Fixed.  This relates to NVRAM that some PCI scsi cards have to hold
> > config settings over reboot.  CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
> > is normally defined in sym53c8xx_defs.h to turn that code on.  When
> > I implemented Zalon (FWD) support I guessed that the 53c720 h/w
> > wouldn't have NVRAM implemented the same way, and turned off
> > NVRAM detect.
> > 
> > I've also replaced a chunk of Zalon specific code that got lost in
> > the merge, so Zalon/FWD/53c720 support works again.
> > 
> > There is a problem remaining when using the driver as a module;
> > it looks like something is trying to printk() from a string in
> > the module after the module has been removed.  Havn't tracked
> > that down yet.
> > 
> > Richard
> 
> 
> Hi Richard,
> 
> I'm sorry to say that the sym53c8xx still doesn't work on my B160L (32 
> bit-Kernel). It looks like the controller isn't detected at all, while it 
> worked perfectly with 2.4.0-test6.
> Would you mind to take a look at the code again ?
> 
> Thanks,
> 	Helge.
> 
