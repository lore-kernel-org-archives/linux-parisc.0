Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF1C5482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Apr 2001 15:07:42 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 07E62B007; Mon, 23 Apr 2001 22:08:47 +0100 (BST)
Date: Mon, 23 Apr 2001 22:08:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "van de Werken, Matthew (DEM, PH)" <M.Vandewerken@cat.csiro.au>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: FW: [parisc-linux] How do I use the FW scsi on 735?
Message-ID: <20010423220846.O985@linuxcare.com>
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

Can you try this patch, compile CONFIG_SCSI_ZALON in, and let me know
what happens?

Richard


Index: drivers/scsi/zalon7xx.c
===================================================================
RCS file: /home/cvs/parisc/linux/drivers/scsi/zalon7xx.c,v
retrieving revision 1.6
diff -u -r1.6 zalon7xx.c
--- zalon7xx.c	2001/04/06 05:10:57	1.6
+++ zalon7xx.c	2001/04/23 20:58:30
@@ -58,6 +58,11 @@
 		"GSC SCSI (Zalon)", "53c720",
 		(void *) zalon_scsi_callback}, 
 
+	{HPHW_FIO, 0x007, 0, 0x0007c, 0x0, 0,
+		DRIVER_CHECK_HWTYPE | DRIVER_CHECK_SVERSION,
+		"GSC SCSI (Outfield)", "53c720",
+		(void *) zalon_scsi_callback}, 
+
 	{0,0,0,0,0,0, 0, (char *) NULL,(char *) NULL,(void *) NULL}
 };
 
