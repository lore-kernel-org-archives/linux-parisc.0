Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7405F482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Jul 2003 05:46:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19g11b-0006fn-GB; Fri, 25 Jul 2003 12:46:15 +0100
Date: Fri, 25 Jul 2003 12:46:15 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] itlb miss handler optimizations!
Message-ID: <20030725114615.GI1485@parcelfarce.linux.theplanet.co.uk>
References: <20030725070449.GB13017@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725070449.GB13017@systemhalted>
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

On Fri, Jul 25, 2003 at 03:04:50AM -0400, Carlos O'Donell wrote:
> @@ -1882,6 +1884,15 @@ kernel_bad_space:
>  dbit_fault:
>  	b               intr_save
>  	ldi             20,%r8
> +
> +itlb_user_fault:
> +	/* User tlb missed for other than his own space. Optimization. */
> +#ifdef __LP64__
> +	cmpb,=		%r0,t0,itlb_miss_common20 /* backward */
> +#else
> +	cmpb,=		%r0,t0,itlb_miss_common11 /* backward */
> +#endif
> +	nop

can't do that.  we have three sets of routines -- itlb_miss_common_11,
itlb_miss_common_20 and itlb_miss_common_20w.  we select between _20w
or not at compile time (if it's 64-bit, it's PA 2.0 Wide), but select
between _20 and _11 at boot time (fault_vector_20 vs fault_vector_11).

shame on you, you didn't even try assembling it ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
