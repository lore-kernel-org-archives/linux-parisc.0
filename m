Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0030E4848
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 10:08:28 -0600 (MDT)
Message-Id: <200110031604.KAA16954@puffin.external.hp.com>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mount segfaults and stuff 
In-Reply-To: Message from Jurij Smakov <jurij@lokmail.net>
   of "Wed, 03 Oct 2001 04:42:35 EDT." <200110030842.EAA14939@mail.lokmail.net>
Date: Wed, 03 Oct 2001 10:04:58 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jurij Smakov wrote:
> Hi!
> 
> The problem is that this bug list is also rather outdated.

yeah - many of the bugs filed were placeholders for
issues we found but didn't want to track down at that time.

> There are
> two more or less recent bugs, others are more than 2 months old. Most
> kernel bugs are filed against 2.4.0 kernel. I guess, a lot of things
> changed since then. For example, mount bug, that I've mentioned before
> just disappeared, once I recompiled it from source with latest CVS gcc.

Well, sounds like that's something you could do - try to replicate bugs
and close them if they can't be replicated. I'll take another pass
at the list this week too.

> Also, bug #135 (kernel panic on 712 doing two simultaneous compiles) - 
> yesterday I've built the kernel with "make -j 2" without any problems
> on a 712/80. Is it enough to close this bug?

yes - I think so.  Getting confirmation from the submitter that the
bug is gone is good too.

>  IMHO, the right strategy
> in this situation would be to try and reproduce the bugs with latest
> toolchain and drop the bugs, which do not have a recipe to reproduce them.

Agreed.

> Anyway, what should I do with mount? Do I have to contact the package
> maintainer? I can build the debs myself, but those will be unofficial.

Preferably, if you can, find the bug and send the maintainer a patch.
Otherwise, file a bug on either bugs.debian.org or bugs.parisc-linux.org
depending on if it's reproducible on other arches or not.

> Also, last night I had some weird problems with linux/net/core/netfilter.c
> Sometimes its compilation fails, but I could not pinpoint the problem
> so far. I'll play with it, but it would be nice to know, if anyone
> else has/had any (negative) experiences with this file.

I'm having problems in general building a working kernel.
Neither my natively built 32-bit kernels for c3k nor x-compiled
64-bit kernels for A500 are booting right now...Last msg printed
to serial console is regarding setting PSW to 0 (or 1).
Just now enabled EARLY_DEBUG in pdc_cons.c.

hope this helps,
grant
