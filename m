Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz [195.113.31.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 998F6482E
	for <parisc-linux@parisc-linux.org>; Mon, 10 Mar 2003 11:56:49 -0700 (MST)
Date: Mon, 10 Mar 2003 19:56:47 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Matthew Wilcox <willy@debian.org>
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
Message-ID: <20030310185647.GA11310@atrey.karlin.mff.cuni.cz>
References: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk>
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi!

> Could you cc myself or parisc-linux@parisc-linux.org in future
> please?

Yes, I'll try to cc you.


> first, you've called it `compact_sys_ioctl' -- it should be `compat_sys_ioctl'.
> it's compatible, not really small ;-)

Ouch, stupid typo. Sorry

> second, you've not changed the definition in arch/parisc/kernel/syscall.S:
> 
> -	ENTRY_DIFF(ioctl)
> +	ENTRY_COMP(ioctl)

So I should take arch/parisc/kernel/syscall.S and change
ENTRY_DIFF(ioctl) into ENTRY_COMP(ioctl)? Great, thanx.

[BTW have you actually tested it or are these just first obvious
mistakes?]

								Pavel
-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.
