Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA00850
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:20 -0700
Date: Sat, 6 Nov 1999 20:22:13 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Matthew Wilcox <Matthew.Wilcox@genedata.com>
Cc: LaMont Jones <lamont@security.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] xchg implementation
Message-Id: <19991106202213.J11609@mathe.stud.uni-erlangen.de>
References: <19991031193739.V516@mencheca.ch.genedata.com> <19991101210305.75FA118708@security.hp.com> <19991102095340.D516@mencheca.ch.genedata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19991102095340.D516@mencheca.ch.genedata.com>
List-ID: <linux-parisc.vger.kernel.org>

> You're thinking of CR26 and 27 (ref: Kane's PA-RISC 2.0 Architecture,
> page 2-17).  CR31 _is_ used, I didn't read carefully enough:

Summary of current temporary register usage:


register	today		soon
CR24		unused		what CR26 is today (I thought CR2[45] were readable
CR25		unused		what CR25 is today  from userspace. stupid prumpf)
CR26		used in head.S	unused
CR27		used in head.S	unused
CR28		temporary usage in interruption handlers [GR1  saved here]
CR29		temporary usage in interruption handlers [arg0 (for the interruption
			handler, NOT GR26) saved here]
CR30	 	current, 0 if in kernel mode (this might not work for syscalls yet)
CR31		temporary usage in interruption handlers [GR29 saved here]

I think using three temporary registers for interruption handlers is okay.

The current/0 register is quite helpful and I'd like to keep it the way it is.

One register to add is a pointer to our PGD so our TLB insertion handler can be

mtctl		 1, TR_INTR_GR1
mtctl		29, TR_INTR_GR29
mtctl		 2, TR_INTR_ARG0	/* we don't have an argument */
mfctl		TR_PGD,  1
mfctl		IOR, 29
extru		29,  9, 10, 2		/* PGD offset */
ldwx,s		 2( 1),  1 		/* load word scaled(?) (so at address GR1 + 4*GR2) */
bb,<,n		 1, PG_PRESENT_BIT, major_page_fault	/* major page fault if pte invalid */
extru		29, 19, 10, 2		/* PTE offset */
ldwx,s		 2( 1),  1		/* load PTE */
/* do the PTE translation here */
/* do idtlba, idtlbp, iitlba, iitlbp, idtlbt, iitlbt, idtlbaf, idtlbpf, iitlbaf, or iitlbpf
 * depending on CPU / fault type. */

I still haven't found any magic tricks to speed up xchg (the way I understand it
hashing the address and indexing an array of spinlocks for the atomic operations
probably is the best thing to do for SMP, for UP I think we have to do an irqsave/
irqrestore).  Should there be any I am too stupid to see I think it's no problem
using a temporary register for it.

That leaves one or two registers for future use (our FP emulator for some of the
CPUs with half an FPU (PA7100LC) might need one to point to the FP registers or
something, don't know whether syscalls could use one too), and the two we can read
out of userspace.  What does HP/UX use them for ?

	Philipp Rumpf
