Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6D5C482A
	for <parisc-linux@parisc-linux.org>; Mon, 14 May 2001 11:46:06 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14zMPN-0008OT-00; Mon, 14 May 2001 18:45:25 +0100
Date: Mon, 14 May 2001 18:45:25 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] broken toolchain?
Message-ID: <20010514184525.B6094@parcelfarce.linux.theplanet.co.uk>
References: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010513021522.B28266@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Sun, May 13, 2001 at 02:15:22AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, May 13, 2001 at 02:15:22AM +0100, Matthew Wilcox wrote:
> can anyone else confirm/deny problems?

I downgraded to binutils 2.11.90.0.5-1 from 2.11.90.0.7-1 and I've stopped
getting the unaligned references.  Would someone like to volunteer to
find the bug?  And does this mean we should stop the buildd?

-- 
Revolutions do not require corporate support.
