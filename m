Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id CED74482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 10:08:17 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19my7w-0001TO-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Aug 2003 12:05:32 -0400
Date: Wed, 13 Aug 2003 12:05:32 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030813160532.GG17512@systemhalted>
References: <20030812160612.GF20514@dsl2.external.hp.com> <3F28D76600003759@ocpmta4.freegates.net> <20030813155605.GF17512@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030813155605.GF17512@systemhalted>
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

> Thanks for that run Joel, I'll take a look at the numbers in a few
> minutes. Adding to that here is the lmbench results (urls) for both
> the non-optimized and optimized cases of the itlb fault handler.

I forgot that lamont noticed an interlocked zdep in the PA11 common case
and we reorderd the insn sequence. Perhaps this helped the numbers a
bit. I have to run the same lmbench tests on a 64-bit box first to
compare.

c.
