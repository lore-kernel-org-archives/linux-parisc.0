Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 148F1482A
	for <parisc-linux@parisc-linux.org>; Tue, 27 Mar 2001 22:24:35 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id PAA00430;
	Wed, 28 Mar 2001 15:24:23 +1000
Date: Wed, 28 Mar 2001 15:24:23 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Type sizes
In-Reply-To: <20010328060000.F7738@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0103281520130.21990-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 28 Mar 2001, Matthew Wilcox wrote:

> on a 32-bit kernel, sizeof(long) == sizeof(int), so why can't we just use
> the first set of typedefs?

It avoids lots and lots of gcc warning messages compiling the kernel.  gcc
makes the fine distinction that long != int, even if they are the same
physical size.  size_t on pa32 is unsigned int but on pa64 is
unsigned long, and gcc knows about this for its builtin string functions.

Alan
-- 
Linuxcare
