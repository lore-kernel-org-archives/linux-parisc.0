Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F6594A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 04:31:34 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA19037
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 22:31:32 +1100
Date: Fri, 23 Feb 2001 22:31:32 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0102232156560.9345-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] gcc & profiling
List-ID: <linux-parisc.vger.kernel.org>

This is a little embarrassing.  I've just discovered our mainline gcc has
all the nice profiling code in config/pa/pa.c, PROFILE_HOOK defined in
config/pa/pa.h, but no support for PROFILE_HOOK in function.c.  Oops.  No
profiler calls in generated code.

pehc merge from sourceware was before PROFILE_HOOK was added, but I was
working from a later merge when developing the code. :-(

All this would be bad enough, but after plugging in the missing bits, I
thought I'd better test a glibc compile with profiling enabled.  That
showed a bug when inline functions are involved.  Oops again.
Currently testing a fix...

Alan
