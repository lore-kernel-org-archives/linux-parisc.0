Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 085384855
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 17:22:33 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3ANMKa15977; Sat, 10 Apr 2004 19:22:21 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
In-Reply-To: <20040410214603.GC7123@baldric.uwo.ca>
References: <1081513015.1759.5.camel@mulgrave>
	<20040410184946.GB7123@baldric.uwo.ca>
	<1081624296.1841.4.camel@mulgrave>
	<20040410214603.GC7123@baldric.uwo.ca>
Content-Type: text/plain
Date: 10 Apr 2004 19:22:16 -0400
Message-Id: <1081639342.2567.10.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 2004-04-10 at 17:46, Carlos O'Donell wrote:
> While pgdir might be hot in cache, but the rest of the structures will
> sprawl to fill the entire cache.
> 
> In contrast a hashed page table layout would be extremely dense, and fit
> better in the cache. If you were to have a collision the likelyhood
> that what you want is in the cache can actually be higher.

Well, I challenge you to show me such a dense layout.

The reality in Linux is that the kernel is offset mapped (physical
addresses and virtual addresses differ by PAGE_OFFSET).  This means that
any hash head comes directly out of kernel allocated memory.  Further,
since our tlb miss handlers must operate in physical space, it has to be
physically contiguous.  Given glibc's somewhat prodigious appetite, our
average mapped pages per system process is about a thousand (obviously
not all hot).  That makes the hash size (given that you have to have 16
byte entries) about 16k.  Now look at graphics programs; just pulling in
X gnome/kde and we'll jump to 10,000 or 160k.  The latter is just not
possible (the maximum contiguous allocation is 128k, and we can't do one
of those per process and still live to tell the tale).

By contrast, a multi-level page table can be sparsely allocated and has
no physical contiguity requirements.  I'm willing to be proven wrong,
but I just can't see how we can allocate a cache large enough to avoid
common collisions given the Linux physical allocation constraints.  And
if we don't allocate it contiguously, it's performance is going to be
far worse than a two level lookup.

James


> > In particular, on PA because of our congruence requirements for shared
> > mappings, it would be difficult to find an efficient hashing mechanism
> > that didn't generate deep collision chains (and remember, we're all
> > ILP32 at the moment, so just one collision and we lose to the 2 level).
> 
> Huck & Hayes says "high va bits XOR low va bits."
> 
> http://www.baldric.uwo.ca/~carlos/Architectural-support-for-translation-table-management-in-large-address-space-machines.pdf
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
> 
> c.
