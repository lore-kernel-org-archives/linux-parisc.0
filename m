Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA30111
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 09:58:15 -0600
To: Andrew Park <apark@cdf.toronto.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot. 
In-Reply-To: Your message of "Wed, 30 Aug 2000 11:43:59 EDT."
             <Pine.SOL.4.21.0008301140400.25953-100000@misty.cdf>
References: <Pine.SOL.4.21.0008301140400.25953-100000@misty.cdf> 
Date: Wed, 30 Aug 2000 09:58:21 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13UAFp-0008MT-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= I mentioned that I tried
= 
= 	boot pri isl
= 
= After making CD-ROM as primary boot.  It would not take me anywhere.
= I just tried all combination of things when everything failed.
= Thanks

Not enough information to help -- no specific error messages, no
specific commands you typed with numbers (LAN IDs or SCSI addresses)
in them.  Please send the output of:

    sea scsi
    path

And the error when you do 'boot pri isl' and it fails.

	-P
