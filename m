Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ntexchange.cat.csiro.au (ntexchange.cat.csiro.au [140.253.12.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45B79484B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 17:08:49 -0600 (MDT)
Message-ID: <A8566E157F5FD411BCFB00D0B7816D51C72B8E@ntexchange.cat.csiro.au>
From: Matt.VanDeWerken@csiro.au
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] New scsi driver for 53c700 and 53c710 committe
	d
Date: Tue, 9 Oct 2001 09:06:33 +1000 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

So will this new driver work on the 735-series? Please tell me it's so...

Cheers,
Matthew van de Werken
Electronics Engineer
CSIRO Exploration & Mining - Gravity Group
1 Technology Court - Pullenvale - Qld - 4069
ph:  (07) 3327 4685     fax:  (07) 3327 4455
email:  m.vandewerken@cat.csiro.au


> -----Original Message-----
> From: Richard Hirst [mailto:rhirst@linuxcare.com]
> Sent: Tuesday, 9 October 2001 8:10 AM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] New scsi driver for 53c700 and 53c710 
> committed
> 
> 
> Hi,
>   I've just added a new scsi driver for 53c700 and 53c710 
> chips to cvs.
> This driver was written by James Bottomley for MCA machines, and has
> been enhanced to support parisc as well.  It is intended that the
> previous driver, sim700.c, will be removed once we are happy with
> the new one.  The new one is 53c700.* plus lasi700.*.  I have left
> the old driver in the source for the time being, but have 
> commented out
> its config question in drivers/scsi/Config.in. The CONFIG_ flag has
> changed from CONFIG_SCSI_LASI to CONFIG_SCSI_LASI700.
> You should certainly do at least a 'make oldconfig' once you pick up
> these changes.
> 
> The main improvements in this driver are sync transfers 
> (where the scsi
> chip allows it) and tagged commands.  Also disconenct/reselect works
> properly, so there is no longer any need to boot with 
> sim700=nodisc:0xff
> (or similar).
> 
> James and I have tested the driver on 712, 715/50, 715/75, B180, and
> C360.  I have tested C360 with 32 and 64 bit kernels.
> 
> Please test this new drvier with your hardware and report back, if
> I don't hear anything bad, the old driver will be removed.
> 
> Thanks,
>   Richard
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
