Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (adsl-64-109-89-110.chicago.il.ameritech.net [64.109.89.110])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43E8C482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Oct 2001 08:29:29 -0600 (MDT)
Message-Id: <200110141428.f9EESss01949@localhost.localdomain>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel panic with -pa48 
In-Reply-To: Message from Grant Grundler <grundler@puffin.external.hp.com>
   of "Sat, 13 Oct 2001 16:12:09 MDT." <200110132212.QAA19397@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 14 Oct 2001 09:28:54 -0500
From: James Bottomley <James.Bottomley@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>

grundler@puffin.external.hp.com said:
> In general, drives smaller than 1GB are not reprogammable and thus
> can't be upgraded. I don't know if C3325A is upgradeable. If it is,
> the firmware for it *might* be on the same ftp site as platform
> firmware - see the www.parisc-linux.org FAQ for the URL. And not sure
> if there is a utility for linux to download SCSI device firmware. 

I believe the fw is upgradeable (if you can find it, it's not on the ftp 
site).  Although, for a SCSI device driver writer, having misbehaving drives 
around to test with can be useful...it's a lot easier than trying to do 
sofware error injection.

Perhaps you could answer some configuration questions I have (which is why I 
was thinking the reported errors were termination or cabling related).  
Richard Hirst got LinuxCare to send me a 712/60 and a 715/50.  Both of these 
appear to have a SCSI bus running through the motherbord to a 50pin ribbon 
cable on one end and an external D50 SCSI-2 connector on the case.  There 
appears to be no termination at all on the motherboard, is that correct?

The 715/50 has slots for 3 SCSI drives along a ribbon cable which is 
terminated at one end.  However, I don't believe the other end would be 
terminated unless I put a D50 SE terminator on the external connector.   Was 
this the way they were usually delivered?

The 712/60 is even stranger: It has one SCSI drive housing and a short ribbon 
cable with no termination.  It looks like the correct configuration for this 
one would be to activate the drive's termination and also put a D50 terminator 
on the external connector?  Unfortunately, the Micropolis drive it came with 
expired in a cloud of smoke when I turned it on.  However, I was able to 
determine that the Micropolis was unterminated, so the internal bus was 
completely unterminated.

What I'm hoping is that they didn't ship this way, they just evolved into 
these anomalous configurations over time as bits fell off and drives were 
replaced.  The problem is that the new lasi700 driver is going to drive the 
SCSI bus (at least for the 53c710 based lasi subsystems) at about twice times 
the speed of the old one and with high REQ/ACK offsets, so what were marginal 
configurations may suddenly become non-functional ones.

At the very least, I suppose I need to add sync and tag disable options to the 
driver.

James
