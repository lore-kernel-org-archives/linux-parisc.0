Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23AEF4837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 08:47:24 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id KAA04593
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 10:47:07 -0400
Message-Id: <200109261447.KAA04593@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] The 720/50 saga continues... 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Wed, 26 Sep 2001 10:47:07 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> So, ls triggers a real alignment problem which is now, due to the
> fallthrouth to case 26, handled by the paging code...
> 
> As a temporary solution, i just copies the busybox from the installation
> disk (which does not suffer from the same problem) and linked it to ls,
> tar and sleep (being the userspace tools that trapped for me) which
> allowed me to get a mostly working system up and running...
> 
> Now going to fix the real problem, on how to decide in the case 18 handler
> if the trap is caused by a page fault or an alignment fault.
> 
> Cheers,
> Jochen

I am probably very naive :-), but shouldn't it be possible to figure out,
whether or not this is an unaligned access trap by just looking at the 
offending instruction and the address it is referencing? If, for example, 
it's a word load/store instruction and the address is not word-aligned,
then we call handle_unaligned, otherwise - do_page_fault. The only (hopefully)
problem arises if the load/store instruction generates BOTH page fault and
unaligned access traps. I have no idea, what happens then, but probably
one has to call do_page_fault first. If it's a not-so-often happening situation,
we could get away just by reusing some of the existing code.

Best regards,

Jurij.
