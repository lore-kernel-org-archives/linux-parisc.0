Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 288994A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 21:00:31 -0700 (MST)
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id UAA20418
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 20:56:22 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA06166;
	Thu, 1 Feb 2001 14:59:45 +1100
Date: Thu, 1 Feb 2001 14:59:45 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Weird compile problems
In-Reply-To: <Pine.LNX.4.21.0101311805130.19209-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0102011431180.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 31 Jan 2001, Alan Modra wrote:

> On Wed, 31 Jan 2001, Alan Modra wrote:
> 
> [about pehc devel branch gcc]
> > r19 is being trashed.  It's a compiler bug.  One I added too. :-(
> 
> Now fixed.

It anyone has tried to compile glibc with the devel branch compiler,
you've probably discovered by now that ld.so is still crashing, but for a
different reason.  The global register allocation pass does the following
naughty thing:

[from elf/dl-load.c]
(insn 612 608 1626 (set (reg:SI 1 %r1)
        (plus:SI (reg:SI 19 %r19)
            (high:SI (symbol_ref/v/f:SI ("*.LC27"))))) 80 {*pa.md:2326}
(nil)
    (nil))

(insn 1626 612 621 (set (reg:SI 23 %r23 [242])
        (reg:SI 1 %r1)) 69 {*pa.md:2099} (nil)
    (nil))

[snip around 1480 lines, including calls]

(insn 1638 1527 988 (set (reg:SI 21 %r21)
        (mem/u:SI (lo_sum:SI (reg:SI 23 %r23 [242])
                (unspec:SI[ 
                        (symbol_ref/v/f:SI ("*.LC27"))
                    ]  0)) 0)) 82 {*pa.md:2352} (nil)
    (nil))

With the problem being that r23 is not a callee saved register, so it's
well and truly trashed by the time insn 1638 tries to use it.

-- 
Linuxcare.  Support for the Revolution.
