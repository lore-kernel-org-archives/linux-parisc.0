Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 847444A19
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Feb 2001 23:31:48 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14VpHl-0003ym-00; Wed, 21 Feb 2001 23:31:29 -0700
Date: Wed, 21 Feb 2001 23:31:29 -0700
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Matthew Wilcox <matthew@wil.cx>, Helge Deller <deller@gmx.de>,
	PL <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: schedule_tail
Message-ID: <20010221233129.S31164@parcelfarce.linux.theplanet.co.uk>
References: <20010221224732.Q31164@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0102221702100.14557-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102221702100.14557-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Thu, Feb 22, 2001 at 05:21:49PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Feb 22, 2001 at 05:21:49PM +1100, Alan Modra wrote:
> But this location is allowed to be modified by the callee, and I think you
> already have a stack frame.

Umm... I'm not sure we always do.  It shouldn't be hard to arrange though.

> I wrote up some stuff on stack frames at
> http://lists.parisc-linux.org/pipermail/parisc-linux/2001-February/011715.html

thanks, i was going from the pdfs, but yours is easier to understand.
i don't quite see why it needs `ap' (%r29) to be assigned a value when
calling a function which has no arguments.

would a `call-c-function' macro make sense?

-- 
Revolutions do not require corporate support.
