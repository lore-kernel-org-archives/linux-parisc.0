Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id C558E482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Sep 2001 05:08:01 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id HAA12337
	for <parisc-linux@lists.parisc-linux.org>; Tue, 25 Sep 2001 07:07:57 -0400
Message-Id: <200109251107.HAA12337@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian bootfloppies with -pa22 fails on 720/50
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 25 Sep 2001 07:07:57 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

>Hello,
>
>I've since tried the other case 18 fall-through option, and it worked up
>to the point where I am now installing from the 0.9.2 CD-ROM.
>
>Do you still want me to decode this crash?
>
>Regards,
>
>Albert

Hi! 

I don't think You have to decode it. It's clear, what happened. 
Interruption 18 on your machine has equivalent functionality to
interruptions 26, 27 and 28 on newer ones. I thought, that the
interruption you were getting was unaligned access (28), so the idea
was to call handle_unaligned. Clearly, you were getting 26, which
is handled by do_page_fault, so that calling handle_unaligned 
didn't do You any good. It entered the handle_unaligned, but when 
it tried to access the memory byte-by-byte, it trapped with 18 
again and this time it was from inside the kernel, so it ended 
up dead. If someone would give me an idea on how to decide, which 
handler to call for interruption 18, I could try and produce a 
workable workaround.

Best regards,

Jurij Smakov. 

P.S. I can't connect to www.parisc-linux.org and my previous posts did
not appear in the archives (some routing problems, I guess). Also, I
haven't got anything from the list during last 18 hours. I'm posting
from this address instead of my usual one instead. Please cc relevant 
posts to jurijus@theophys.kth.se
