Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id QAA20534
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 Jan 2001 16:21:25 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA11507;
	Wed, 31 Jan 2001 10:25:21 +1100
Date: Wed, 31 Jan 2001 10:25:21 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Weird compile problems
In-Reply-To: <20010130154256.D6704@achilles.net>
Message-ID: <Pine.LNX.4.21.0101310956430.19209-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 30 Jan 2001, Paul J.Y. Lahaie wrote:

[about pehc CVS devel branch gcc]
> And fixincl (the progrma that does the subst) is taking 0% CPU (from top)
> 10727 pjlahaie   9   0   712  712   520 S      20  0.0  0.5   0:00 fixincl

Yeah, fixincl dies for me too.  I'd been putting it down to some sort of
kernel problem, and just disabled fixinc (gcc/Makefile:STMP_FIXINC).
Other than that, I get a successful bootstrap, and both kernel & glibc
compile natively - except that `make' died randomly in the glibc build,
and I currently have a ld.so.1 that segfaults.

Hmm, looking at what I just wrote, you can hardly call it a "successful
bootstrap".  I'm investigating the ld.so.1 problem - at least that one is
reproducable.

Alan
-- 
Linuxcare.  Support for the Revolution.
