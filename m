Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1348E482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 12:54:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15jQ1D-0004CZ-00; Tue, 18 Sep 2001 19:54:51 +0100
Date: Tue, 18 Sep 2001 19:54:51 +0100
From: Matthew Wilcox <willy@debian.org>
To: marka@sea.checkpoint.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing a native built kernel with 2.4.0 (.92 dist).
Message-ID: <20010918195451.A15107@parcelfarce.linux.theplanet.co.uk>
References: <20010918163015.Q19441@linuxcare.com> <Pine.WNT.4.33.0109181004310.3268-100000@nemo.dev.metainfo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.WNT.4.33.0109181004310.3268-100000@nemo.dev.metainfo.com>; from marka@sea.checkpoint.com on Tue, Sep 18, 2001 at 10:10:43AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 18, 2001 at 10:10:43AM -0700, marka@sea.checkpoint.com wrote:
> Ok, it turns out it is booting (the machine's so quiet it's hard to tell), and
> not 'freezing' per-say at 'branching to kernel entry point 0x00100000'.  It's
> simply not sending anything to ttyS0 any more after this point.  This seems to
> be the 'swapped serial ports' issue mentioned earlier on this list.

That could be.  Can you boot the old kernel and report
what the serial ports are as Richard did in his message
http://lists.parisc-linux.org/pipermail/parisc-linux/2001-September/013670.html

Or if your machine boots as far as having a network, you could check in
dmesg to see what the inventory reported and paste it from there.

-- 
Revolutions do not require corporate support.
