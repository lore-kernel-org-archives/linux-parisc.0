Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7D1C4A19
	for <parisc-linux@parisc-linux.org>; Thu,  1 Mar 2001 16:37:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14YcdH-0005ER-00
	for parisc-linux@parisc-linux.org; Thu, 01 Mar 2001 23:37:15 +0000
Date: Thu, 1 Mar 2001 23:37:15 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010301233715.D26100@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] 64-bit issues
List-ID: <linux-parisc.vger.kernel.org>

I've been working on moving the bits from parisc64 across to parisc.
There's actually very little that needs to be moved.

In the process, I discovered several problems with parisc64 being out
of date.  One of them affects everyone who builds parisc64.  It wasn't
being compiled with the -mdisable-fpregs option, so it was using FP
code in the kernel, which is generally considered not a good idea.
But adding this requires gcc to call into $$mulI which wasn't part of our
64-bit libgcc.  Paul Bame's done this work, so now everyone compiling
64-bit will need a new compiler.  Matt Taggart's building one now and
you'll need to install it to build a 64-bit kernel.

-- 
Revolutions do not require corporate support.
