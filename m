Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id C22FE4848
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Oct 2001 02:42:50 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA14939
	for <parisc-linux@lists.parisc-linux.org>; Wed, 3 Oct 2001 04:42:35 -0400
Message-Id: <200110030842.EAA14939@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mount segfaults and stuff 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 03 Oct 2001 04:42:35 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> *sigh*. Lots of little stuff like floppy driver and hpux binary support.
> 
> The TODO list is stale intentionally.
> We should be using http://bugs.parisc-linux.org.
> 
> grant

Hi!

The problem is that this bug list is also rather outdated. There are
two more or less recent bugs, others are more than 2 months old. Most
kernel bugs are filed against 2.4.0 kernel. I guess, a lot of things
changed since then. For example, mount bug, that I've mentioned before
just disappeared, once I recompiled it from source with latest CVS gcc.
Also, bug #135 (kernel panic on 712 doing two simultaneous compiles) - 
yesterday I've built the kernel with "make -j 2" without any problems
on a 712/80. Is it enough to close this bug? IMHO, the right strategy
in this situation would be to try and reproduce the bugs with latest
toolchain and drop the bugs, which do not have a recipe to reproduce them.

Anyway, what should I do with mount? Do I have to contact the package
maintainer? I can build the debs myself, but those will be unofficial.

Also, last night I had some weird problems with linux/net/core/netfilter.c
Sometimes its compilation fails, but I could not pinpoint the problem
so far. I'll play with it, but it would be nice to know, if anyone
else has/had any (negative) experiences with this file.

Best regards,

Jurij.
