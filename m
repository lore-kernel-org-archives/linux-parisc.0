Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 692A3482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 20:37:51 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id MAA19095;
	Wed, 4 Apr 2001 12:37:11 +1000
Date: Wed, 4 Apr 2001 12:37:11 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CVS Repository @ puffin - contents ?
In-Reply-To: <20010403230807.B11435@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0104041228560.13605-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 3 Apr 2001, Matthew Wilcox wrote:

> if you haven't seen commits to some of those repositories on the
> cvs lists for a while they're probably dead.  modutils is obsolete
> (integrated upstream), binutils will be once 2.11 comes out.

That was true a few days ago.  binutils may yet need to be resurrected
because 2.11 will have the -Bsymbolic bug, I'm afraid.  The fix for the
-Bsymbolic bug involves a patch to bfd/elflink.h, which is used by all ELF
targets.  I don't particularly want to be responsible for accidentally
breaking the 2.11 release for all ELF targets...

Alan
-- 
Linuxcare
