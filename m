Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA24668
	for <parisc-linux@puffin.external.hp.com>; Sun, 29 Aug 1999 12:14:12 -0600
Date: Sun, 29 Aug 1999 20:15:50 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: emolitor@molitor.org
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] keyboard driver
Message-ID: <19990829201550.K493@mencheca.ch.genedata.com>
References: <19990829031812.J493@mencheca.ch.genedata.com> <Pine.LNX.4.10.9908282220000.2123-100000@linux.molitor.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9908282220000.2123-100000@linux.molitor.org>; from emolitor@molitor.org on Sat, Aug 28, 1999 at 10:30:32PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Aug 28, 1999 at 10:30:32PM -0500, emolitor@molitor.org wrote:
> 
> Hello all, I recently was given a 715/50 to play around with. Its
> got an old version of HP/UX running on it and I am getting ready to dump
> that and look into programming a bit on parisc-linux. Any direction on
> what can be persued?
> 
> Of course my current goal is to get the kernel to cross-compile and then
> boot from a zip drive... (Looking for that It works message...)

For a start, don't ditch the HP/UX it has running on it unless you have
another HP/UX box around to compile kernels with.  Right now, we need to
use the HP linker.

The kernel as it stands right now probably won't boot on your 715/50.
I'm waiting for Philipp to sort out a couple of problems and then I'm
going to try to track down why it doesn't boot on my 715/33; the kernel
I checked out a week ago wouldn't boot until I put in debugging printks.
grr.

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson
