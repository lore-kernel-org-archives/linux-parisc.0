Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B536F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Apr 2001 11:52:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rkUp-00070x-00; Mon, 23 Apr 2001 18:51:35 +0100
Date: Mon, 23 Apr 2001 18:51:35 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Message-ID: <20010423185135.B18464@parcelfarce.linux.theplanet.co.uk>
References: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au> <20010423170258.G985@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010423170258.G985@linuxcare.com>; from rhirst@linuxcare.com on Mon, Apr 23, 2001 at 05:02:58PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 23, 2001 at 05:02:58PM +0100, Richard Hirst wrote:
> > > Forgot to mention, it's a custom kernel - there is a chance I 
> > > left out the necessary drivers. What is the driver for the FW 
> > > SCSI controller on the 735 please?
> 
> I don't know, the relevant line from your boot messages is
> 
> 7. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0, 0x0
> 
> anyone like to comment on what that device is?

The relevant document is still missing from the linuxcare website,
despite a bug filed against it for over a month now.  Fortunately,
I kept a copy of the old website active, so you can view it at
http://puffin.external.hp.com/parisc/hp9000_models.html

The relevant quote is:

 The PCXS and PCXT models include the NCR 53C700 device at various
SCSI-Clock rates for the built-in Single-Ended (SE) SCSI controller.
These older models use the NCR 53C720 (40 MHz) SCSI controller (where
supported) with the Outfield (O) chip for the built-in SCSI controller
for the Fast-Wide-Differential (FWD) SCSI bus.  The PCXS and PCXT models
do not provide support for an internal PC Floppy drive.

> You probably ought to include CONFIG_SCSI_LASI, CONFIG_SCSI_ZALON, and
> CONFIG_SCSI_SYM53C8XX, and see if it makes a diference, but I'm not
> expecting it to.

So it seems like we need to find you an Outfield device & docs :-)

-- 
Revolutions do not require corporate support.
