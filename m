Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA22244
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 20:38:30 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 03:42:27 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14LzBo-00056f-00; Fri, 26 Jan 2001 03:04:40 +0000
Date: Fri, 26 Jan 2001 03:04:40 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux-2.4.0
Message-ID: <20010126030440.A18813@parcelfarce.linux.theplanet.co.uk>
References: <20010126004831.A8137@parcelfarce.linux.theplanet.co.uk> <200101260157.RAA22922@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101260157.RAA22922@milano.cup.hp.com>; from grundler@cup.hp.com on Thu, Jan 25, 2001 at 05:57:14PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Jan 25, 2001 at 05:57:14PM -0800, Grant Grundler wrote:
> Unless someone objects, My plan is to continue working on CONFIG_SMP
> until it boots on my A500. Then merge the 2.4.0 PCI stuff onto our
> tree. The problem is names of pci "generic" functions changed -test11
> or -test12 and what they do has been slightly changed. Certain things
> definitely break A500 support. I need to revisit both the generic and
> elroy code so it all works again.

i don't mind waiting.

> Which means the linus tree still won't build a parisc-kernel.
> He'll have missing symbol errors in the PCI subsystem for sure.
> But I guess we'll keep getting closer as time goes on.

right.  i don't anticipate getting all the changes we need into linus'
tree any time soon, possibly not until 2.5 opens.  i think 2.4.0 only
works on x86 & alpha.  i know it doesn't work on ia64 -- some journalists
tried to make a big deal out of this.  i see linus put ppc, sparc &
sparc64 patches into 2.4.1-pre, so I'm guessing 2.4.0 doesn't work on
those arches either.

just for giggles, i merged 2.4.1-pre10 into our tree.  no conflicts.

-- 
Revolutions do not require corporate support.
