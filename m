Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (tnt01p1-128.logicsouth.com [208.150.160.128])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA4E14830
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 13:51:52 -0600 (MDT)
Message-Id: <200110131951.f9DJpZT01701@localhost.localdomain>
To: parisc-linux@lists.parisc-linux.org
Cc: joel.soete@freebel.net, willy@debian.org
Subject: Re: [parisc-linux] Kernel panic with -pa48 
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_-7423799680"
Date: Sat, 13 Oct 2001 15:51:34 -0400
From: James Bottomley <James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>

This is a multipart MIME message.

--==_Exmh_-7423799680
Content-Type: text/plain; charset=us-ascii

> Just co -pa49 and boot again but strange behaviour (as with pa45). Here
> the SCSI kernel messages:

I suspect this is probably a cabling/termination problem.  The new driver does 
fast scsi via synchronous negotiation which is much less tolerant of harware 
setup than the old asynchronous SCSI.  You can test this theory out by turning 
off async negotiation in the driver: by recompiling, I'm afraid, I haven't 
made it a config option.

If you apply the attached patch it will suppress the synchronous negotiation.  
If the driver boots your machine with no issues then it's a safe bet you have 
a cabling or termination problem.

Your next problem will be the C3325A drive:  I have one of these and it seems 
to drop tagged commands under heavy load (which annoys the SCSI error handler 
no end).  I was going to ask for it to be added to the SCSI mid-layer black 
list as being unable to handle tags, but I haven't got around to it yet.

James 



--==_Exmh_-7423799680
Content-Type: text/plain ; name="53c700-no-fast.diff"; charset=us-ascii
Content-Description: 53c700-no-fast.diff
Content-Disposition: attachment; filename="53c700-no-fast.diff"

Index: drivers/scsi/53c700.c
===================================================================
RCS file: /home/jejb/CVSROOT/linux/2.4/drivers/scsi/53c700.c,v
retrieving revision 1.1.1.3.6.4
diff -u -r1.1.1.3.6.4 53c700.c
--- drivers/scsi/53c700.c	2001/09/30 15:04:17	1.1.1.3.6.4
+++ drivers/scsi/53c700.c	2001/10/13 19:46:33
@@ -720,6 +720,7 @@
 		NCR_700_writeb(BTB_TIMER_DISABLE, host, CTEST0_REG);
 		NCR_700_writeb(FULL_ARBITRATION | ENABLE_PARITY | PARITY
 			       | AUTO_ATN, host, SCNTL0_REG);
+		hostdata->fast = 0;
 	} else {
 		NCR_700_writeb(BURST_LENGTH_8 | hostdata->dmode_extra,
 			       host, DMODE_700_REG);

--==_Exmh_-7423799680--
