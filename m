Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 043EE484C
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 10 Apr 2004 13:11:39 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3AJBaa05630; Sat, 10 Apr 2004 15:11:36 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
In-Reply-To: <20040410184946.GB7123@baldric.uwo.ca>
References: <1081513015.1759.5.camel@mulgrave>
	<20040410184946.GB7123@baldric.uwo.ca>
Content-Type: text/plain
Date: 10 Apr 2004 15:11:36 -0400
Message-Id: <1081624296.1841.4.camel@mulgrave>
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

On Sat, 2004-04-10 at 14:49, Carlos O'Donell wrote:
> If we used an inverted page table with hashing it would be a single
> level page table, with good cache locality (less spread compared to a
> hierarchical table).

To be honest, I don't see the value of hashed page tables.  A two level
structure is about as optimal as you can get.  Particularly as the pgdir
will be cache hot (from the tlb refill misses).

In a hashed page table layout, you just have to have a page collision 
and you've already lost to the two level page table (because of the
cache hotness of pgdir).

In particular, on PA because of our congruence requirements for shared
mappings, it would be difficult to find an efficient hashing mechanism
that didn't generate deep collision chains (and remember, we're all
ILP32 at the moment, so just one collision and we lose to the 2 level).

James
