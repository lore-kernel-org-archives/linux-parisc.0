Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 363EA4844
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Apr 2004 22:32:13 -0600 (MDT)
Date: Sun, 11 Apr 2004 22:32:12 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Subject: Re: [parisc-linux] Proposal for altering our Page Table layouts
Message-ID: <20040412043212.GA16377@colo.lackof.org>
References: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200404091438.i39Ec4Q23610@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Apr 09, 2004 at 08:38:04AM -0600, John Marvin wrote:
...
> No PA machine actually implements more
> than a 40 bit physical address space (even the latest Pluto based
> machines, which support 44 bits for IA64 are put into a 40 bit addressing
> mode for PARISC).

I was just looking at the pluto "PA_RISC Physical Address Map" and
all RAM is physically located < 1TB (40 bits).
Do we have to worry about the GMMIO (MMIO space above 4GB) in
"F-space" above 1TB?

The per rope 64KB IO Port space is accessed via the GMMIO address ranges.
This is in addition to the "global" IO Port space accessed through the
regular < 4GB MMIO address space. I'm guessing this won't ever need
to be mapped to userspace (or something like that), but just would
like to hear from someone who understands it better whats up.

That's for ZX1+PA8800. I've not looked SX1000 (Superdome).

thanks,
grant
