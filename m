Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 445954A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 23:22:17 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA26292;
	Thu, 22 Feb 2001 17:21:49 +1100
Date: Thu, 22 Feb 2001 17:21:49 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Helge Deller <deller@gmx.de>,
	PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: schedule_tail
In-Reply-To: <20010221224732.Q31164@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0102221702100.14557-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Feb 2001, Matthew Wilcox wrote:

> It does a lot of important stuff on SMP though.

I'm not denying that :)

>  It does the stack adjust
> before calling because the disassembled 32-bit SMP code looks like this:
> 101186f4 <schedule_tail>:
> 101186f4:       08 03 02 41     copy r3,r1
> 101186f8:       08 1e 02 43     copy sp,r3
> 101186fc:       6b c2 3f d9     stw rp,-14(sr0,sp)
> 
> and we don't want to trash what was below the sp.

But this location is allowed to be modified by the callee, and I think you
already have a stack frame.

I wrote up some stuff on stack frames at
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011715.html

Alan
