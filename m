Return-Path: <carlos@baldric.uwo.ca>
Received: from fep02-mail.bloor.is.net.cable.rogers.com
	(fep02-mail.bloor.is.net.cable.rogers.com [66.185.86.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3325C4838
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 15:46:05 -0600 (MDT)
Date: Sat, 10 Apr 2004 17:46:03 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
Message-ID: <20040410214603.GC7123@baldric.uwo.ca>
References: <1081513015.1759.5.camel@mulgrave>
	<20040410184946.GB7123@baldric.uwo.ca>
	<1081624296.1841.4.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081624296.1841.4.camel@mulgrave>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> To be honest, I don't see the value of hashed page tables.  A two level
> structure is about as optimal as you can get.  Particularly as the pgdir
> will be cache hot (from the tlb refill misses).
>
> In a hashed page table layout, you just have to have a page collision 
> and you've already lost to the two level page table (because of the
> cache hotness of pgdir).

While pgdir might be hot in cache, but the rest of the structures will
sprawl to fill the entire cache.

In contrast a hashed page table layout would be extremely dense, and fit
better in the cache. If you were to have a collision the likelyhood
that what you want is in the cache can actually be higher.

> In particular, on PA because of our congruence requirements for shared
> mappings, it would be difficult to find an efficient hashing mechanism
> that didn't generate deep collision chains (and remember, we're all
> ILP32 at the moment, so just one collision and we lose to the 2 level).

Huck & Hayes says "high va bits XOR low va bits."

http://www.baldric.uwo.ca/~carlos/Architectural-support-for-translation-table-management-in-large-address-space-machines.pdf

I've been doing some literature searches on the issue, mainly IEEE and
ACM over the last 10-20 years. Most of the research was done in the mid
90's and interestingly enough a lot of it has to do with PA's.

Read the paper at the above link and tell me what you think of the
16-byte PTE presented, and how the allocations happen on a single entry
by entry basis. Another author suggests that the HAT and the PDIR could
be merged (you'll have to read the paper to find out what I mean). I'm
not sure what to do about the aliasing restrictions...

c.
