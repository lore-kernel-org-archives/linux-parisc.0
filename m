Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA29641
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 09:44:51 -0600
Date: Wed, 30 Aug 2000 11:43:59 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Cc: taggart@carmen.fc.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot. 
In-Reply-To: <200008300538.WAA02356@chrome.rose.hp.com>
Message-ID: <Pine.SOL.4.21.0008301140400.25953-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 29 Aug 2000, Kirk Bresniker wrote:

> | 
> | > 
> | > Andrew Park writes...
> | > 
> | > > I must be missing something...
> | > > I got a bootable HP-UX installation CD today, so I popped it in my CDROM
> | > > and on the BOOT_ADMIN> prompt I typed, boot lan isl.  It still gets
> | > > stuck, then I changed the path, so that cdrom is primary and the LAN is
> | > > secondary, then typed  boot pri isl, and it comes right back to the
> | > > BOOT_ADMIN> prompt.  Am I missing something obvious?
> | > 
> 
> Em, if you're trying to boot from your CD-ROM, why are you typing
> a command to attempt a lan boot?  Don't you want to do the following:
> 
> BOOT_ADMIN> boot scsi[some address stuff] isl ?

I mentioned that I tried

	boot pri isl

After making CD-ROM as primary boot.  It would not take me anywhere.
I just tried all combination of things when everything failed.
Thanks


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
