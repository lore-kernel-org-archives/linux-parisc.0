Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA20497
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 10:37:54 -0700
From: "Steve Moret" <smoret@uci.edu>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] HP 9000/735-125
Date: Thu, 30 Nov 2000 09:39:17 -0800
Message-ID: <FKEGLIIBOIACJOCCAFIMIEFFCCAA.smoret@uci.edu>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20001130161115.N22285@linuxcare.com>
List-ID: <linux-parisc.vger.kernel.org>

I will go under the assumption that it could be the disks and their possible
age and try and find suitable replacements.

Once I do get disks working is there a "Recepe" on how to get it to boot
from your local drive.

I would figure just copy over the NFS root, but then where do I put the
lifimage so that boot manager can find it.

Until then I'll just keep booting from the network.

--
Steve Moret
smoret@uci.edu

> -----Original Message-----
> From: Richard Hirst [mailto:rhirst@linuxcare.com]
> Sent: Thursday, November 30, 2000 8:11 AM
> To: Steve Moret
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] HP 9000/735-125
>
> I got my 715/75 to boot.  The scsi driver still has problems with my
> CDROM drive, but the disk seems ok.  I ran mke2fs of a 1Gig partition
> a few times and then copied 200MB of files from the network to it.
