Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DC4A482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Apr 2001 20:46:54 -0600 (MDT)
Message-Id: <200104030240.UAA10418@puffin.external.hp.com>
To: mickey <mickey@lucifier.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Mon, 02 Apr 2001 14:07:59 EDT."
             <200104021808.f32I80M14250@lucifier.net>
Date: Mon, 02 Apr 2001 20:40:24 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: Diag insn
List-ID: <linux-parisc.vger.kernel.org>

[ mickey - I cc'd the list so the right people can correct
  my ignorane below ]

mickey wrote:
> did not find it in the maillists or the doc.
> although you say you are not much of a cpu guy, maybe you
> can bounce it to smb who is?
> the question is, how to definately distinguish pa7300lc
> from let's say 7100lc (which is similar to it), besides
> cache size, if possible.

I can take a whack at this: PDC MODEL and PDC CPU calls.
The PDC for the various boxes will know exactly which type of CPU
(down to chip rev level) and this info is availble throught PDC
calls. parisc-linux dumps this info at boot time.
E.g. linux/arch/parisc/kernel/setup.c:collect_boot_cpu_data()

My offhand knowledge ends on where exactly to find the data for
each CPU type. I think the PARISC 2.0 Arch has a table in an appendix
which describes the various models and which value they will have.
You can also browse the HW data base and extract the same info.
(See http://216.208.98.4/view.php3?type=machine&name=A180C)

Oh - and parisc-linux determines the type based on a table.
See arch/parisc/kernel/hardware.c:parisc_get_cpu_type()

> the reason is that 7300lc uses a different diag-sequences
> to operate block tlb and such.

AFAIK, those things are not portable across parisc implementations.
But if you want to play with such code, finding the CPU type is trivial
in comparison.

BTW, PDC calls are provided to manage the block tlb (call will fail if
the CPU doesn't have block TLB). Some "Hversion specific" PDC calls
are provided to perform diag insns (eg set default wide mode on PA2.0 CPUs).
Don't how many PDC calls use diag insn or which of those calls are
published (documentation).

If you could be more specific about what you want to do, I'm sure folks
on this list would advise/help determine the "best" way to do it.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
