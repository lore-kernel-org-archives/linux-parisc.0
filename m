Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA18397
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 23:54:38 -0600
Received: from scimitar.dolphinics.no (scimitar.dolphinics.no [193.71.152.129])
	by scifi.dolphinics.no (8.9.3/8.9.3) with ESMTP id HAA20458
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 07:43:09 +0200
Received: from scimen (scimen [193.71.152.165])
	by scimitar.dolphinics.no (8.8.8/8.8.8) with SMTP id GAA01903
	for <parisc-linux@thepuffingroup.com>; Fri, 22 Oct 1999 06:56:37 +0100 (MET)
Message-Id: <199910220556.GAA01903@scimitar.dolphinics.no>
From: "Simen Timian Thoresen" <simentt@dolphinics.no>
To: parisc-linux@thepuffingroup.com
Date: Fri, 22 Oct 1999 08:01:42 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Reply-to: simen-tt@online.no
Subject: [parisc-linux] rbooting an 735?
List-ID: <linux-parisc.vger.kernel.org>

Is anybody rbooting an 735?
I've replaced my exceedingly noisy Micropolis disk, and replaced it 
with a 2.1G seagate thing which, altho so far working nicely, 
refuses to boot. So, to try new 'lin-ux' kernels I have to use rboot.

As far as I can see, the rbootd server is configured correctly, and is 
communicating with the 735. Unfortunately, the 735 seems not to 
request an image name, and the server responds with 'denied' in 
the syslog.

So - Is there anybody out there with a 735 that /does/ request an 
image? 

-Simen
--
Simen Thoresen, Beowulf-cleaner and random artist.

Er det ikke rart?
The gnu RART-project on valinor.dolphinics.no/~simentt/rart
