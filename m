Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA09695
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Nov 2000 15:53:42 -0700
Content-Type: text/plain;
  charset="us-ascii"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>, bame@riverrock.org
Subject: sym53c8xx-driver   (was: Re: [parisc-linux] kernel merge)
Date: Mon, 13 Nov 2000 23:54:29 +0100
Cc: parisc-linux@puffin.external.hp.com
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet> <20001113121349.Q32715@linuxcare.com>
In-Reply-To: <20001113121349.Q32715@linuxcare.com>
MIME-Version: 1.0
Message-Id: <00111323542900.00319@P100>
List-ID: <linux-parisc.vger.kernel.org>

On Monday 13 November 2000 13:13, Richard Hirst wrote:
> On Fri, Nov 10, 2000 at 02:28:33PM -0700, bame@riverrock.org wrote:
> > drivers/scsi sym53c8xx_comm.h #ifdef doesn't work on parisc -- eliminates
> >                 unmap_pci_mem() causing link error (TODO - rhirst)
> 
> Fixed.  This relates to NVRAM that some PCI scsi cards have to hold
> config settings over reboot.  CONFIG_SCSI_NCR53C8XX_NVRAM_DETECT
> is normally defined in sym53c8xx_defs.h to turn that code on.  When
> I implemented Zalon (FWD) support I guessed that the 53c720 h/w
> wouldn't have NVRAM implemented the same way, and turned off
> NVRAM detect.
> 
> I've also replaced a chunk of Zalon specific code that got lost in
> the merge, so Zalon/FWD/53c720 support works again.
> 
> There is a problem remaining when using the driver as a module;
> it looks like something is trying to printk() from a string in
> the module after the module has been removed.  Havn't tracked
> that down yet.
> 
> Richard


Hi Richard,

I'm sorry to say that the sym53c8xx still doesn't work on my B160L (32 
bit-Kernel). It looks like the controller isn't detected at all, while it 
worked perfectly with 2.4.0-test6.
Would you mind to take a look at the code again ?

Thanks,
	Helge.
