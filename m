From: Pavel Machek <pavel@ucw.cz>
Subject: [parisc-linux] Re: ioctl32 cleanup -- rest of architectures
Date: Mon, 10 Mar 2003 19:56:47 +0100
Message-ID: <20030310185647.GA11310__11211.2651033842$1416622270$gmane$org@atrey.karlin.mff.cuni.cz>
References: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20030310172832.GG5278@parcelfarce.linux.theplanet.co.uk>
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
