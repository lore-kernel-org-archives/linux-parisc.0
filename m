Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA09607
	for <parisc-linux@puffin.external.hp.com>; Sat, 19 Aug 2000 22:19:46 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 20 Aug 2000 04:19:32 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA27973;
	Sun, 20 Aug 2000 14:19:05 +1000
Date: Sun, 20 Aug 2000 14:19:05 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
cc: parisc-linux@thepuffingroup.com, parisc@lists.linuxcare.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <20000819224336.G32273@vodka.thepuffingroup.com>
Message-ID: <Pine.LNX.4.21.0008201351070.26467-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 19 Aug 2000, Matthew Wilcox wrote:

> btw, is there any option to cvs diff which produces files which can be
> applied by any known version of patch?  in my experience, patch can't
> find files specified by Index: lines _unless_ both the +++ and the ---
> files can't be found -- which is rarely the case with common names such
> as Makefile or ChangeLog.

I haven't found one, and it's a real pain.  I tend to edit patches
covering multiple directories before passing them to patch.

"sed -e '/^[+-][+-]/d' < cvs_diff_file | patch -p0 --posix" ought to work.

Alan
-- 
Linuxcare.  Support for the Revolution.
