Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel2.hp.com (palrel2.hp.com [156.153.255.234])
	by dsl2.external.hp.com (Postfix) with ESMTP id 61BAD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 14:30:37 -0600 (MDT)
Message-ID: <3B1D416A.225615EB@hp.com>
Date: Tue, 05 Jun 2001 16:30:34 -0400
From: Chuck Slivkoff <charles_slivkoff@hp.com>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Forcing PA-Linux to swap / do_page_fault()
References: <3B180D83.F5479D0B@hp.com> <3B1D1D56.14424ACA@hp.com> <20010605200728.S7349@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> On Tue, Jun 05, 2001 at 01:56:38PM -0400, Chuck Slivkoff wrote:
> > I've noticed a problem that I believe is might be related to the kernel
> > not being able to use swap space.  I've never seen swap utilization > 0
> > and suspect that something might be seriously wrong. Here's an example
> > of the kernel error:
> 
> Hmm... none of my systems are using swap either; I had noticed this
> before, but never really thought much of it.  This has to be a 
> moderately recent breakage because I know jsm has tested swapping.

I noticed similar behavior w/ the kernel from the 0.6 ISO, but it's been
behaving much better since upgrading to the 0.9 bits.
