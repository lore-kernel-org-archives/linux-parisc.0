Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2C587482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Apr 2001 10:01:54 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 928F8B007; Mon, 23 Apr 2001 17:02:58 +0100 (BST)
Date: Mon, 23 Apr 2001 17:02:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Message-ID: <20010423170258.G985@linuxcare.com>
References: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C7294A@ntexchange.cat.csiro.au>; from M.Vandewerken@cat.csiro.au on Mon, Apr 23, 2001 at 09:08:33AM +1000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 23, 2001 at 09:08:33AM +1000, van de Werken, Matthew (DEM, PH) wrote:
> 
> 
> > -----Original Message-----
> > From: van de Werken, Matthew (DEM, PH) 
> > Sent: Monday, 23 April 2001 9:07
> > To: 'parisc-linux@lists.parisc.org'
> > Subject: RE: [parisc-linux] How do I use the FW scsi on 735?
> > 
> > 
> > Forgot to mention, it's a custom kernel - there is a chance I 
> > left out the necessary drivers. What is the driver for the FW 
> > SCSI controller on the 735 please?

I don't know, the relevant line from your boot messages is

7. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0, 0x0

anyone like to comment on what that device is?

You probably ought to include CONFIG_SCSI_LASI, CONFIG_SCSI_ZALON, and
CONFIG_SCSI_SYM53C8XX, and see if it makes a diference, but I'm not
expecting it to.

Richard
