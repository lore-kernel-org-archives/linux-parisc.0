Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA30617
	for <parisc-linux@puffin.external.hp.com>; Wed, 30 Aug 2000 10:14:50 -0600
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 30 Aug 2000 16:14:49 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13UAIo-0008TM-00; Wed, 30 Aug 2000 17:01:26 +0100
Date: Wed, 30 Aug 2000 17:01:26 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Andrew Park <apark@cdf.toronto.edu>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot.
Message-ID: <20000830170126.E3463@parcelfarce.linux.theplanet.co.uk>
References: <Pine.SOL.4.21.0008301140400.25953-100000@misty.cdf> <E13UAFp-0008MT-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13UAFp-0008MT-00@noam.fc.hp.com>; from bame@noam.fc.hp.com on Wed, Aug 30, 2000 at 09:58:21AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Aug 30, 2000 at 09:58:21AM -0600, Paul Bame wrote:
> Not enough information to help -- no specific error messages, no
> specific commands you typed with numbers (LAN IDs or SCSI addresses)
> in them.  Please send the output of:
> 
>     sea scsi
>     path
> 
> And the error when you do 'boot pri isl' and it fails.

i'm wondering if the problem is that the scsi cdrom he has won't support
512-byte sector mode, only 2048-byte sectors.  iirc, HPs won't boot off
all CD-ROM rives for this reason.

-- 
Revolutions do not require corporate support.
