Return-Path: <jsm@udlkern.fc.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63BAF4872
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 08:38:05 -0600 (MDT)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel6.hp.com (Postfix) with ESMTP id 12CA51C026AA
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Apr 2004 10:38:05 -0400 (EDT)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.11.1/8.9.3 SMKit7.01) id i39Ec4Q23610
	for parisc-linux@lists.parisc-linux.org;
	Fri, 9 Apr 2004 08:38:04 -0600 (MDT)
Date: Fri, 9 Apr 2004 08:38:04 -0600 (MDT)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
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

> Allocate all page tables in ZONE_DMA.  On PA, this means that the
> physical address of every page table will be under 4GB, so we only
> need *four* bytes for all of the directory entries. (The flags I'm
> looking for are only in the PTE, we have plenty of extra space
> still for directory flags).

You don't need this restriction.  No PA machine actually implements more
than a 40 bit physical address space (even the latest Pluto based
machines, which support 44 bits for IA64 are put into a 40 bit addressing
mode for PARISC).  So, for a 4K page table size (12 bits), you only need
28 bits (40-12) to be able to address any possible 4K aligned physical
address.  This leaves you 4 bits for directory flags.  Since we only
currently use 1, you still have 3 to spare.

Note that you won't even need to incur an extra instruction in the
tlb miss handler to do the shift, because the deposit to clear the valid
bit can be converted to a zdep to both clear the bit(s) and shift. I
think you have to use a different target register in that case though.

John
