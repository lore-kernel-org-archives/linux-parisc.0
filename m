Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from koza.acecape.com (ns1.acecape.com [160.79.54.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5D9A482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 May 2001 11:23:41 -0600 (MDT)
From: Michael Shalayeff <mickey@mail.lucifier.net>
Message-Id: <200105021723.f42HNOt11713@mail.lucifier.net>
In-Reply-To: <200104030240.UAA10418@puffin.external.hp.com> from Grant Grundler
 at "Apr 2, 2001 08:40:24 pm"
To: Grant Grundler <grundler@puffin.external.hp.com>
Date: Wed, 2 May 2001 13:23:24 -0400 (EDT)
Cc: mickey <mickey@lucifier.net>, parisc-linux@lists.parisc-linux.org
Reply-To: mickey@lucifier.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Diag insn
List-ID: <linux-parisc.vger.kernel.org>

Making, drinking tea and reading an opus magnum from Grant Grundler:
> 
> [ mickey - I cc'd the list so the right people can correct
>   my ignorane below ]
> 
> mickey wrote:
> > did not find it in the maillists or the doc.
> > although you say you are not much of a cpu guy, maybe you
> > can bounce it to smb who is?
> > the question is, how to definately distinguish pa7300lc
> > from let's say 7100lc (which is similar to it), besides
> > cache size, if possible.
> 
> I can take a whack at this: PDC MODEL and PDC CPU calls.
> The PDC for the various boxes will know exactly which type of CPU
> (down to chip rev level) and this info is availble throught PDC
> calls. parisc-linux dumps this info at boot time.
> E.g. linux/arch/parisc/kernel/setup.c:collect_boot_cpu_data()

uhm. cpuid does not exist on pa1 machines.
pdc_model_cpuid returns the machine id which rather
corresponds to an 'A180' kind of identification.
then, according to this, the only way to identify
7300lc is to match on machine=743, machine=<smth>, etc.
which is rather bulky.

> My offhand knowledge ends on where exactly to find the data for
> each CPU type. I think the PARISC 2.0 Arch has a table in an appendix
> which describes the various models and which value they will have.
> You can also browse the HW data base and extract the same info.
> (See http://216.208.98.4/view.php3?type=machine&name=A180C)
> 
> Oh - and parisc-linux determines the type based on a table.
> See arch/parisc/kernel/hardware.c:parisc_get_cpu_type()

yes, i was think more along the lines of gathering features for cpu
and then make an educated guess on cpu type.
it seems 7300lc does not have particular and distinct one feature
to differentiate it from 7100lc, besides cache size, which is,
of coure, a way to identify it, but a weak on i'd say.

> > the reason is that 7300lc uses a different diag-sequences
> > to operate block tlb and such.
> 
> AFAIK, those things are not portable across parisc implementations.

i'm aware of that (:

> But if you want to play with such code, finding the CPU type is trivial
> in comparison.
> 
> BTW, PDC calls are provided to manage the block tlb (call will fail if
> the CPU doesn't have block TLB). Some "Hversion specific" PDC calls
> are provided to perform diag insns (eg set default wide mode on PA2.0 CPUs).
> Don't how many PDC calls use diag insn or which of those calls are
> published (documentation).
> 
> If you could be more specific about what you want to do, I'm sure folks
> on this list would advise/help determine the "best" way to do it.
> grant

well, yes, the main goal is to have a difference on 7100lc vs 7300lc to
use proper diag insn sequences to init tlb and other stuff,
w/o bothering w/ pdc calls, which are sometimes not very reliable.

cu

-- 
    paranoic mickey       (my employers have changed but, the name has remained)
