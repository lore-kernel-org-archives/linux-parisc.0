Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47522482F
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Apr 2004 07:23:27 -0600 (MDT)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i3BDDwa23219; Sun, 11 Apr 2004 09:13:58 -0400
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
From: James Bottomley <James.Bottomley@steeleye.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
In-Reply-To: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
References: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
Content-Type: text/plain
Date: 11 Apr 2004 08:13:57 -0500
Message-Id: <1081689238.2037.2.camel@mulgrave>
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

On Fri, 2004-04-09 at 09:38, John Marvin wrote:
> You don't need this restriction.  No PA machine actually implements more
> than a 40 bit physical address space (even the latest Pluto based
> machines, which support 44 bits for IA64 are put into a 40 bit addressing
> mode for PARISC).  So, for a 4K page table size (12 bits), you only need
> 28 bits (40-12) to be able to address any possible 4K aligned physical
> address.  This leaves you 4 bits for directory flags.  Since we only
> currently use 1, you still have 3 to spare.
> 
> Note that you won't even need to incur an extra instruction in the
> tlb miss handler to do the shift, because the deposit to clear the valid
> bit can be converted to a zdep to both clear the bit(s) and shift. I
> think you have to use a different target register in that case though.

Well, never say never in computing.  However, I'll use this scheme. 
Then all we need is a way to ensure that page tables are allocated in
the first 1TB.  If the worst comes to the worst, we could always
introduce ZONE_HIGHMEM to ensure this were always true.

James
