Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 994704A19
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 12:54:23 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14YZ9a-00011R-00
	for parisc-linux@parisc-linux.org; Thu, 01 Mar 2001 19:54:22 +0000
Date: Thu, 1 Mar 2001 19:54:22 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010301195422.B26100@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] (read|write)[bwl]
List-ID: <linux-parisc.vger.kernel.org>

right now we do rsm / foo / mtsm in order to read/write gsc space.
the rsm/mtsm turns off address translation.  this is cripplingly slow
on PA8x00 series processors.

proposal 1:

leave gsc_* macros alone.  people can continue to use these if they want.
they should be aware these are slow though.

stop aliasing (read,write)[bwl] to the gsc_* variants.  they should
just dereference the address passed to them.

write an ioremap() function which provides a logical map to that area
of address space.

proposal 2:

direct-map the entire 0xfxxx'xxxx address space into the kernel's address
space.  ioremap becomes a NOP, gsc_* go away and (read,write)[bwl] become
as trivial as before.

i suspect we want proposal 1 on PA1.1 and proposal 2 on PA2.0.  This leads
to proposal 3 which should allow modules to work for either architecture:

gsc_* stay as calls to _gsc_*, (read,write)[bwl] become the direct memory
dereferences.  ioremap is a function call.  On PA2.0, the gsc space is
permanently mapped, the ioremap function does nothing and _gsc_* don't
mess with the system mask.  On PA1.1, we construct page table entries
for the io area upon calls to ioremap, and _gsc_* still mess with the
system mask.

Suggestions?

-- 
Revolutions do not require corporate support.
