Return-Path: <jsm@udlkern.fc.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 851504877
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 17:32:00 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 0E2C51C028FB
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 19:32:00 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.11.1/8.9.3 SMKit7.01) id i3CNVxI03436
	for parisc-linux@lists.parisc-linux.org;
	Mon, 12 Apr 2004 17:31:59 -0600 (MDT)
Date: Mon, 12 Apr 2004 17:31:59 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200404122331.i3CNVxI03436@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> In contrast a hashed page table layout would be extremely dense, and fit
> better in the cache. If you were to have a collision the likelyhood
> that what you want is in the cache can actually be higher.
>
> ...
>
> I've been doing some literature searches on the issue, mainly IEEE and
> ACM over the last 10-20 years. Most of the research was done in the mid
> 90's and interestingly enough a lot of it has to do with PA's.
>
> Read the paper at the above link and tell me what you think of the
> 16-byte PTE presented, and how the allocations happen on a single entry
> by entry basis. Another author suggests that the HAT and the PDIR could
> be merged (you'll have to read the paper to find out what I mean). I'm
> not sure what to do about the aliasing restrictions...

Let's not forget that the machine independent VM code assumes a 2 or 3
level page table, walks those page tables, allocates page tables, etc.
So, let's forget about theory for a minute, and start talking
realistically.  Have you considered how you would abstract an inverted
page table design so that it would fit within the machine independent VM
design for page table support?  I haven't given it more than about 5
minutes of thought, but I don't see a way of doing it (Note that I am
not for this idea at all).

If you can't do it (i.e. hide it completely within the parisc arch code) then
you need to be talking to Linus and convince him first, unless you are
advocating maintaining a large patch against machine independent code.

John Marvin
jsm@fc.hp.com
