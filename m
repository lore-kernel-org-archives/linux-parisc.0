Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 536574A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 05:00:58 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel1.hp.com (Postfix) with ESMTP id 4BAD0333
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 06:59:32 -0500 (EST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id EAA28303 for parisc-linux@lists.parisc-linux.org; Fri, 2 Feb 2001 04:59:31 -0700 (MST)
Date: Fri, 2 Feb 2001 04:59:31 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200102021159.EAA28303@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problems building glibc
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> It's a known bug with our mainline gcc.  Fixed on the devel branch, but
> that has other problems at the moment.  For the time beingg, compile this
> file at -O1.

OK, that answers the question about what branch the fix is on. Having
run into this bug before, I know there are a bunch of other glibc files
that won't compile, so I would suggest you just build all of glibc
with -O1.

Note, I believe that Matt Taggart will be publishing a new nfs root
with a new glibc later today (and this glibc will fix the alignment
problems found on PCXS,PCXT and PCXT' processors). The glibc he built
contains the rest of the alignment fixes that I am going to commit
in the next few minutes.

John
