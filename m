Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADAAD4925
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 07:27:44 -0600 (MDT)
Date: Wed, 26 Sep 2001 15:27:22 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] The 720/50 saga continues...
In-Reply-To: <20010926142738.B20697@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0109261524001.14785-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

> Next rather annoying problem: ls reports "Invalid instruction" whenever
> you try to run it. cat works, mount works... I haven't had much time to
> test anything else.

So, ls triggers a real alignment problem which is now, due to the
fallthrouth to case 26, handled by the paging code...

As a temporary solution, i just copies the busybox from the installation
disk (which does not suffer from the same problem) and linked it to ls,
tar and sleep (being the userspace tools that trapped for me) which
allowed me to get a mostly working system up and running...

Now going to fix the real problem, on how to decide in the case 18 handler
if the trap is caused by a page fault or an alignment fault.

Cheers,
Jochen
