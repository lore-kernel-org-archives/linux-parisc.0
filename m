Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A25F4871
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Jul 2003 12:04:16 -0600 (MDT)
Date: Sat, 26 Jul 2003 14:02:29 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030726180229.GH31744@systemhalted>
References: <20030725070449.GB13017@systemhalted> <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk>
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

> > @@ -1882,6 +1884,15 @@ kernel_bad_space:
> >  dbit_fault:
> >  	b               intr_save
> >  	ldi             20,%r8
> > +
> > +itlb_user_fault:
> > +	/* User tlb missed for other than his own space. Optimization. */
> > +#ifdef __LP64__
> > +	cmpb,=		%r0,t0,itlb_miss_common20 /* backward */
> > +#else
> > +	cmpb,=		%r0,t0,itlb_miss_common11 /* backward */
> > +#endif
> > +	nop
> 
> can't do that.  we have three sets of routines -- itlb_miss_common_11,
> itlb_miss_common_20 and itlb_miss_common_20w.  we select between _20w
> or not at compile time (if it's 64-bit, it's PA 2.0 Wide), but select
> between _20 and _11 at boot time (fault_vector_20 vs fault_vector_11).
> 
> shame on you, you didn't even try assembling it ;-)

I'll take a look at that and rewrite the patch. It was 3AM when I
finished it and didn't bother to compile it as I passed out on the
bed ;)

c.
