Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30892
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 10:16:58 -0600
Date: Wed, 30 Aug 2000 12:16:18 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot. 
In-Reply-To: <E13UAFp-0008MT-00@noam.fc.hp.com>
Message-ID: <Pine.SOL.4.21.0008301209270.26058-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 30 Aug 2000, Paul Bame wrote:

> Not enough information to help -- no specific error messages, no
> specific commands you typed with numbers (LAN IDs or SCSI addresses)
> in them.  Please send the output of:
> 
>     sea scsi
>     path
> 
> And the error when you do 'boot pri isl' and it fails.

search scsi yields

	scsi.5.0	NEC CD-ROM DRIVE:501
	scsi.3.0	MAXTOR LXT-2135 SUN0207

I change 'path' around a bit (when I did 'boot pri isl', primary
boot path was set at scsi.5.0), but at the moment it's

	Primary boot path:	lan.000000-000000.0.0
	Alternate boot path:	scsi.5.0

There are no error messages produced.  It just comes right back to
BOOT_ADMIN> prompt.
Thanks


Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------
