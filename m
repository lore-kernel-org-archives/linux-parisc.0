Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA24563
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Jul 1999 16:56:00 -0600
Date: Fri, 2 Jul 1999 00:56:13 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Davin Petersen <davinp@celltech.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting the kernel
Message-ID: <19990702005613.B30362@mencheca.ch.genedata.com>
References: <BF0601275C6FD211B04900A0C9E9205241D111@mailsrvr.hq.celltech.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <BF0601275C6FD211B04900A0C9E9205241D111@mailsrvr.hq.celltech.com>; from Davin Petersen on Thu, Jul 01, 1999 at 03:41:40PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jul 01, 1999 at 03:41:40PM -0700, Davin Petersen wrote:
> After downloading the goodies available from the FTP site I gather that
> rbootd is the way to spit the linux kernel to a HP box.  Am I wrong?  Is
> there no way of using the ISL?  I tried using the ISL (on my H60), got
> an error message and was dumped back to the ISL prompt.

rbootd is the way for older machines like my 715.  Later models like
the A180 tftp their kernel, I think you need bootparamd set up as well.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
