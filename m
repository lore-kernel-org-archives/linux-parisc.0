From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for implementing IRQ affinity
Date: Tue, 31 Aug 2004 12:06:35 -0600
Message-ID: <20040831180635.GF20353@colo.lackof.org>
References: <1093923097.3870.18.camel@mulgrave>
	<20040831171421.GC20353@colo.lackof.org>
	<20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040831174357.GQ16196@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 31, 2004 at 06:43:57PM +0100, Matthew Wilcox wrote:
...
> > I'd rather see one global array (at least 256 entries) with the CPU
> > (and similar devices) getting a fixed number of consecutive entries.
> > We should probably reserve the first 16 entries for EISA/ISA support
> > like we did before.
> 
> I'm not sure that's a good idea.

In linux-ia64-test-2.6.8.1/arch/ia64/kernel/iosapic.c:
        unsigned int    gsi_base;       /* first GSI assigned to this IOSAPIC */

Looks like that's what ia64 is doing and I don't see a problem with it.

One of the drawbacks of IRQ regions is they are 32 or 64 entries wide
regardless of many are actually used.

>  It would give the impression that all
> Lasi interrupts could be independently retargetted, which isn't true.

James mentioned this is a problem in his proprosal as well.
If we don't provide /proc/irq/<IRQ#>/smp_affinity, I don't see how
someone could be confused about it. Each IRQ entry will have
it's own function pointer to indicate if it supports redirection
or not.

I don't see how this related to single global array vs multiple arrays.

> Note that Dino is a little more advanced and has two IRR registers,
> so we could theoretically do some cool stuff with that ... but it's not
> important enough, IMO.

I agree.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
