Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA20944
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Jan 2001 16:28:19 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 10 Jan 2001 23:31:51 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14GUib-0004p6-00; Wed, 10 Jan 2001 23:31:49 +0000
Date: Wed, 10 Jan 2001 23:31:49 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Cc: parisc-linux-cvs@puffin.external.hp.com
Subject: Re: linux bame
Message-ID: <20010110233149.A18122@parcelfarce.linux.theplanet.co.uk>
References: <200101102108.OAA19847@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101102108.OAA19847@puffin.external.hp.com>; from bame@puffin.external.hp.com on Wed, Jan 10, 2001 at 02:08:27PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 10, 2001 at 02:08:27PM -0700, Paul Bame wrote:
> Log message:
> First-pass attempt at /proc/config, mostly from grant.  Seems to work
> fine with 'cat', but 'tail' and 'wc' aren't reliable with my userspace.

umm.  this has often been discussed for addition to the standard linux
kernel, but linus has not yet taken patches to do so.  i suggest searching
linux-kernel archives to see the arguments, i got bored and didn't read
them so i can't summarise.  i don't think this is something we should
be adding.

tail and wc invariably don't work on /proc files.  neither does less.
this is pretty inherent to the design of /proc and not a reflection on
your code.

> NOTE THIS IS ONLY VISIBLE on the proc_config branch.

it might be better to let this branch wither...

-- 
Revolutions do not require corporate support.
