Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 629314A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Mar 2001 04:24:10 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA28602;
	Fri, 16 Mar 2001 22:24:05 +1100
Date: Fri, 16 Mar 2001 22:24:05 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20010316105056.U31505@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0103162219500.4658-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: tracing through sig handlers
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 16 Mar 2001, Richard Hirst wrote:

> I havn't worked out why this is only apparently necessary when a process
> is being traced.

I'm not even going to attempt to figure out why. :-)  Perhaps one of te
kernel gurus can shed some light.

> It makes things better with gdb also, but not perfect.  The problem
> now is that when you try to step out of the signal handler the program
> under test just runs on without stopping.

gdb is still confused about signal handler frames, and I haven't managed
to fix that today.  Too many other fires to fight.

Alan
-- 
Linuxcare
