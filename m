Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA12350
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 23:35:32 -0600
From: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Message-Id: <200008300538.WAA02356@chrome.rose.hp.com>
Subject: Re: [parisc-linux] still cannot boot. 
To: apark@cdf.toronto.edu (Andrew Park)
Date: Tue, 29 Aug 2000 22:38:58 PDT
Cc: taggart@carmen.fc.hp.com, parisc-linux@thepuffingroup.com
In-Reply-To: <Pine.SOL.4.21.0008292333530.24934-100000@misty.cdf>; from "Andrew Park" at Aug 30, 100 1:25 am
List-ID: <linux-parisc.vger.kernel.org>

| 
| > 
| > Andrew Park writes...
| > 
| > > I must be missing something...
| > > I got a bootable HP-UX installation CD today, so I popped it in my CDROM
| > > and on the BOOT_ADMIN> prompt I typed, boot lan isl.  It still gets
| > > stuck, then I changed the path, so that cdrom is primary and the LAN is
| > > secondary, then typed  boot pri isl, and it comes right back to the
| > > BOOT_ADMIN> prompt.  Am I missing something obvious?
| > 

Em, if you're trying to boot from your CD-ROM, why are you typing
a command to attempt a lan boot?  Don't you want to do the following:

BOOT_ADMIN> boot scsi[some address stuff] isl ?

KMB
--
+============================================================+
|       Kirk Bresniker    	(916) 748-2393		     |
|       8000 Foothills Blvd                                  |
|       Roseville, CA 95747-5649                             |
|       kirkb@rose.hp.com                                    |
