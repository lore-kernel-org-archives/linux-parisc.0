Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA10849
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 21:03:30 -0600
To: Andrew Park <apark@cdf.toronto.edu>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] still cannot boot. 
In-Reply-To: Your message of "Tue, 29 Aug 2000 21:31:34 EDT."
             <Pine.SOL.4.21.0008292127480.24744-100000@misty.cdf>
References: <Pine.SOL.4.21.0008292127480.24744-100000@misty.cdf> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 29 Aug 2000 21:05:14 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000830030514.75C5637D06@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Andrew Park writes...

> I must be missing something...
> I got a bootable HP-UX installation CD today, so I popped it in my CDROM
> and on the BOOT_ADMIN> prompt I typed, boot lan isl.  It still gets
> stuck, then I changed the path, so that cdrom is primary and the LAN is
> secondary, then typed  boot pri isl, and it comes right back to the
> BOOT_ADMIN> prompt.  Am I missing something obvious?

Are you sure that the CDROM is bootable? What type of CDROM drive are you 
using? I'm not positive that just any drive will work. Can you see the cdrom 
when you do a "sea scsi"? If not then either the CDROM isn't bootable or the 
drive isn't working.

Why don't you try to use the uxbootlf that I posted? I know you're having 
problems with bootp/tftp but you'll need to get them working if you want to 
use newer kernels.

In my experience bootp/tftp are a pain for everyone and just require 
persistance to get working. Send me errors if you can't get it working.

-- 
Matt Taggart
taggart@fc.hp.com
