From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: BUG_ON() cleanup
Date: Tue, 06 Jan 2009 09:20:33 -0600
Message-ID: <1231255233.7090.5.camel@localhost.localdomain>
References: <4963470D.1030101@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4963470D.1030101@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2009-01-06 at 12:57 +0100, Helge Deller wrote:
> - convert a few "if (xx) BUG();" to BUG_ON(xx)

This is fine

> - remove a few printk()s, as we get a backtrace with BUG_ON() anyway

This is less helpful.  Each of the printks explains why the bug
triggers.  In theory you can work this out from the BUG_ON line number,
but *only* if your source files match those of the reporter, which isn't
the case in an annoyingly large number of bug reports ... speaking as
someone who seems to get to diagnose large numbers of bugs, it makes my
life harder.

James


