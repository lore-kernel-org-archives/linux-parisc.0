Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59C91482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 09:58:52 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19mxyn-0001SC-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 11:56:05 -0400
Date: Wed, 13 Aug 2003 11:56:05 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030813155605.GF17512@systemhalted>
References: <20030812160612.GF20514@dsl2.external.hp.com> <3F28D76600003759@ocpmta4.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F28D76600003759@ocpmta4.freegates.net>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Well I finaly find it on sf.net (via osdl.org)
> And submit some bench which seems to be more in relation with vm (?):
> ./reaim -x -t -f worfile.shared -r3

Thanks for that run Joel, I'll take a look at the numbers in a few
minutes. Adding to that here is the lmbench results (urls) for both
the non-optimized and optimized cases of the itlb fault handler.

It seems that some things got faster, or rather more predictably fast
within the confidence levels (e.g. number of tests that I ran).

I ran 10 lmbench run's for each of the two kernels and then munged them
using the stat-summary script provided with lmbench. Do the diff to see
the numbers change :)

Looks like we have better performance in many places.

null call, null i/o, stat, open/close, select, signal install, signal
catch, exec, shell proc, (a variety of the process spawning tests),
create, delete, mmap latency, page fault (way down! and deterministic)
-- All got better with itlb branch prediction optimization

Please give it a double check to make sure I'm not out of it this
morning.

http://www.baldric.uwo.ca/~carlos/itlb-opt.txt
http://www.baldric.uwo.ca/~carlos/no-itlb-opt.txt

c.
