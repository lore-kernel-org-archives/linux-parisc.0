Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB2D2488F
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Aug 2003 10:33:25 -0600 (MDT)
Received: from lucy.cup.hp.com (lucy.cup.hp.com [15.0.88.68])
	by palrel12.hp.com (Postfix) with ESMTP id 48A3F1C028DA
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Aug 2003 09:33:25 -0700 (PDT)
Received: from jh733133 (dhcp42uvi498.cup.hp.com [15.244.99.244])
	by lucy.cup.hp.com (8.9.3 (PHNE_24419+JAGae58098)/8.9.3 SMKit7.02) with ESMTP id JAA19180
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Aug 2003 09:33:19 -0700 (PDT)
From: "Jim Hull" <jim.hull@hp.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Date: Thu, 28 Aug 2003 09:34:27 -0700
Message-ID: <012d01c36d82$40d6c960$f463f40f@jh733133>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <3F4D78B00000000A@ocpmta3.freegates.net>
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

I haven't really been following this thread, so I don't know what
problem you're actually trying to solve, but I'd like to point out a few
aspects of the PA-RISC processor architecture.

Comments mixed with the original text, below.

 -- Jim
    HP Itanium/PA-RISC Processor Architect

> -----Original Message-----
> From: parisc-linux-admin@lists.parisc-linux.org 
> [mailto:parisc-linux-admin@lists.parisc-linux.org] On Behalf 
> Of Joel Soete
> Sent: Thursday, August 28, 2003 9:08 AM
> To: Grant Grundler
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
> 
> 
> >
> >no.
> >IIRC instructions for purging the cache are broadcast to other CPUs.

If you use fdc, fic, or pdc, then they are broadcast to other
processors, but fdce and fice are not.

> That is the first thing I would like to check (as the first 
> signal I notice
> is a itlb miss fault and the piminfo of the 2d cpu seems to 
> show a crash
> on a branch instruction [cmpb iirc], I presume that during 
> the init of the
> second cpu this last tries to access a page which was just 
> purged by the
> first.  This is also why I would like to find the psw of this 
> second cpu
> in the mentionned pimfinfo :) )
> 
> >> But to avoid usage of cache would it be possible to access 
> global kernel's
> >> variable with absolute addressing mode? Is it feasible?
> >
> >Since the caches use virtual indices, it would make sense when using
> >physically addresses to bypass the cache. But I don't know if that's
> >really the case or not. I would expect that described in the 
> PA2.0 Arch
> >book.
> 
> I don't yet browse all the book but at a first glance ldda 
> and stda are available
> (respectively load and store doubleword absolute)...

While you can use ldda and stda to access memory using absolute
(physical) addresses instead of virtual, these instructions do *not*
bypass the cache.  And because PA processors use virtually-indexed
caches, the rules for mixing virtual and absolute accesses, and have
them all remain cache-coherent, are complicated.  If you really need to
do this, then you'll have to read and understand all of Appendix F, "TLB
and Cache Control", in the PA-RISC 2.0 Architecture manual (the "Kane"
book).

> >> btw scaning cod
> >>  related to SMP I find in smp.c a very draft of
> >> an 'ipi_init()' but unfortunately 'Ignore for now.  *May* need this
> >> "hook" to register IPI handler'..., interesting isn't it :).
> >
> >I wrote that. ipi_init and comments can be deleted.
> >I haven't see a need for ipi_init(). When I originally
> >implemented the SMP support I thought it might be.
> >
> >The IPI handler is statically "hooked" (aka registered) in
> >	arch/parisc/kernel/irq.c:cpu_irq_actions[]
> >
> >See ipi_interrupt() for IPI implementation.
> >
> Allright (clear)
> >>
> >> Is there any other platform inplementing such stuff (I try 
> to scan 2.4
> src
> >> but not found anywhere else) or some reference on to implement it?
> >
> >it == ?
> >IPI is implemented.
> 
> I continue so.
> 
> BTW here is a small 2.6 back port that may be you could co safely:
> --- processor.c.orig	2003-08-28 18:04:57.000000000 +0200
> +++ processor.c	2003-08-28 18:08:37.000000000 +0200
> @@ -370,9 +370,9 @@
>  };
>  
>  static struct parisc_driver cpu_driver = {
> -	name:		"CPU",
> -	id_table:	processor_tbl,
> -	probe:		processor_probe
> +	.name		= "CPU",
> +	.id_table	= processor_tbl,
> +	.probe		= pprocessor_probe
>  };
>  
>  /**
> 
> 
> Many thanks again for your attention,
>     Joel
> 
> 
> 
> --------------------------------------------------------------
> -----------
> Tiscali ADSL, seulement 35 eur/mois et le modem est 
> inclus...abonnez-vous!
> http://reg.tiscali.be/default.asp?lg=fr 
> 
> 
> 
