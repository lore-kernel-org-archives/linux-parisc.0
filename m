Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp4.xs4all.nl (smtp4.xs4all.nl [194.109.6.50])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F15F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Sep 2001 01:25:57 -0600 (MDT)
Received: from webmail4.xs4all.nl (webmail4.xs4all.nl [194.109.127.38])
	by smtp4.xs4all.nl (8.9.3/8.9.3) with ESMTP id JAA03339
	for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Sep 2001 09:25:55 +0200 (CEST)
From: thunder7@xs4all.nl
Message-ID: <29500.212.153.94.193.999847836.squirrel@webmail.xs4all.nl>
Date: Fri, 7 Sep 2001 09:30:36 +0200 (CEST)
To: <parisc-linux@lists.parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] 2.4.9-pa16: Trace/breakpoint trap on 'make mrproper' still occurs, but doesn't hang the machine
List-ID: <linux-parisc.vger.kernel.org>

Running the 2.4.9-pa16 kernel, I still get the 'Trace/breakpoint' trap
every time I run 'make mrproper' in my linux source directory.

One very significant difference w.r.t. 2.4.9-pa13 is that it doesn't
crash the machine anymore. Running it under gdb works fine. Running
it under strace produces an endless list of

sg_sigreturn(0) = 0

(about 547 lines or so)

and then a SIGILL (Illegal Instruction) trap.

I'm not at my machine at the moment, so the strace output is from 
memory.

It looks like this patch:
>Date: Thu, 6 Sep 2001 03:48:16 -0600 (MDT)
>From: John Marvin jsm@udlkern.fc.hp.com
>Subject: [parisc-linux-cvs] Patch for SMP support, etc.>
>A rather large patch that includes my current SMP support changes, plus
>a variety of other fixes/changes.

did something. But it's so large I'm not sure what exactly :-)

Jurriaan
