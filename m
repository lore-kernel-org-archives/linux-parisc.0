Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA12717
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 10:38:10 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 25 Jan 2001 17:42:06 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LqPK-0003Yc-00; Thu, 25 Jan 2001 17:42:02 +0000
Date: Thu, 25 Jan 2001 17:42:02 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 improvements, problems
Message-ID: <20010125174202.F25242@parcelfarce.linux.theplanet.co.uk>
References: <20010125101918.M3571@linuxcare.com> <Pine.LNX.4.21.0101250938150.27931-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101250938150.27931-100000@maestro.symsys.com>; from ingram@symsys.com on Thu, Jan 25, 2001 at 11:33:07AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 11:33:07AM -0600, Greg Ingram wrote:
> But when the SCSI disk is root, more page faults. Here's some kernel
> messages:
>  
> 	do_page_fault() pid=285 command='more' type=15 address=0xbaffffff

Known bug in `more'.  the stack starts at 0xbb000000 and more is trying
to look at the byte below the stack poinbter.  this has been fixed
upstream, now.

-- 
Revolutions do not require corporate support.
