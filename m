From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: 31 Aug 2004 15:44:14 -0400
Message-ID: <1093981554.5296.14.camel@mulgrave>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<1093974552.3643.22.camel@mulgrave>
	<20040831183415.GG20353@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831183415.GG20353@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-08-31 at 14:34, Grant Grundler wrote:
> Ok. Why?

Because the only interrupts we can control the affinity of are the true
32/64 CPU interrupts. Everything else is effectively hanging off one of
these. If we try to pretend that we can change the affinity of the
subordinate interrupts, we'll end up confusing irqbalanced

> I'd really like one method to convert GSI to local interrupt numbers.
> Doing away with local translations and directly indexing into a global
> array seems the most obvious to me.

I know, but our interrupt structure isn't a flat array, it's a tree with
the root being a given CPU interrupt.  Obviously, since we have to give
some cookie to the devices to identify the interrupt, we end up having a
numeric array.

> But we still want dino/PCI to work. So we have to replace the
> existing abstraction with another one...

Yes, the abstraction for dino/PCI is that we allocate extra interrupts
to the region, but they're unequivocally tied to the give CPU interrupt
line the dino happens to be using.

> A single global array can implement a hierarchy as well.
> Entries just contain indexes into other parts of the array.

Yes, but we need to expose only the cpu interrupts to irqbalanced.  The
problem is that for the purposes of affinity, we can't treat the
fictitious subordinate interrupts as being ordinary independent
interrupts.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
