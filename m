Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA22369
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 19:32:15 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Aug 2000 01:32:08 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id LAA14049;
	Sat, 26 Aug 2000 11:29:21 +1000
Date: Sat, 26 Aug 2000 11:29:21 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: Paul Bame <bame@fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64 bit linker problem?
In-Reply-To: <200008252323.RAA22968@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0008261117340.12171-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 25 Aug 2000, John Marvin wrote:

> 
> > Another 64-bit gotcha: in arch/parisc64/kernel/entry.S:start_parisc_asm
> > the 'b start_parisc' is branching through a stub and failing miserably.
> > Linker problem?
> 
> Just some more information. The "b start_parisc" appears to branch to
> what should be a stub entry. There is nothing there, i.e. it is all
> zero's, so we get a break instruction trap.

Yeah.  That's the sort of thing I was expecting.  It appears to me that
only stubs or plt entries for dynamic symbols (ie. in shared libs) are
filled in.  Until we fix the linker, you may be able to work around the
problem by convincing the linker that a stub is not needed for the
branch.  Where is "start_parisc" relative to the branch?  If you know
you'll always need a long branch, why not use a ble?

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
