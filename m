Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AB92482A
	for <parisc-linux@parisc-linux.org>; Sat,  5 May 2001 16:45:21 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14wAnQ-0002sH-00; Sat, 05 May 2001 23:45:04 +0100
Date: Sat, 5 May 2001 23:45:04 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3 make check status
Message-ID: <20010505234504.V32445@parcelfarce.linux.theplanet.co.uk>
References: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010505033457.Q32445@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sat, May 05, 2001 at 03:34:57AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 05, 2001 at 03:34:57AM +0100, Matthew Wilcox wrote:
>  * io/test-utime fails.  Looks like a stat problem.

That's rather interesting.  It fails for me over NFS, but not on ramfs.
I'm going to log this as a kernel bug to remind me to report it upstream
if it can be reproduced on a later kernel revision.  This is something
people could do on a non-pa machine.
