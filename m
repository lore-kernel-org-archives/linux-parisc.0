Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E12244A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Feb 2001 18:52:22 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14UJ1L-0006nY-00; Sun, 18 Feb 2001 01:52:15 +0000
Date: Sun, 18 Feb 2001 01:52:15 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Scott Eggert <seggert@tds.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] E25 lock-up during boot.
Message-ID: <20010218015215.E899@parcelfarce.linux.theplanet.co.uk>
References: <20010217134443.B0E4081DD@dsl2.external.hp.com> <3A8F20D1.20B10E28@tds.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3A8F20D1.20B10E28@tds.net>; from seggert@tds.net on Sat, Feb 17, 2001 at 07:09:37PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Feb 17, 2001 at 07:09:37PM -0600, Scott Eggert wrote:
> I am attempting to ge PA installed on a HP9000 E25.  I am able to boot
> from the 0.5 CD image, however it locks-up during the boot.  Any ideas?

Which part of `E class is not supported' is hard to understand?  :-)

> Searching for devices in PDC firmware... processor hpa 0xfffbe000
> a newer box...
> Found devices:
> 1. Orville UX Core BA (11) at 0xf0100000, versions 0x12, 0x0, 0x81, 0x0, 0x0
> 2. Orville Core Lan (802.3) (10) at 0xf0107000, versions 0x12, 0x0, 0x8a, 0x0, 0
> x0
> That's a total of 2 devices.
> No CPUs reported by firmware - probing...
> Found CPU at fffbe000
> POSIX conformance testing by UNIFIX
> Lasi version 0 at 0xf0100000 found.

Having said that, I bet this is the same problem as FAQ 9:

I'm booting parisc linux on an early Series 700 workstation, and the 
machine hangs after printing:

ASP version 1 at ..... found

What's going on?

This was a bug in the parallel port driver, which was fixed in CVS on 
2000-11-29. You can workaround the problem by using a newer kernel or
by reconfiguring your kernel and removing support for the parallel port
(CONFIG_PARPORT_GSC).


But... there's no Lasi in an E-class.  Something's wrong with our detection
routines, perhaps.  I admit to being curious about the `Core Lan' that's
reported -- maybe it'll work.

-- 
Revolutions do not require corporate support.
