Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA27669
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 16:14:13 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 14 Jul 2000 22:15:49 -0000
To: law@cygnus.com
Cc: Alan Modra <amodra@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: GAS fix for reloc problems (was Re: [parisc-linux] Non-bootable kernel problems)
References: <1991.963592762@upchuck> <87aefkzgpo.fsf@linuxcare.com> <8766q8zbqz.fsf@linuxcare.com>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 14 Jul 2000 18:14:15 -0400
In-Reply-To: David Huggins-Daines's message of "14 Jul 2000 16:40:36 -0400"
Message-ID: <87zonkxsug.fsf_-_@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

David Huggins-Daines <dhd@linuxcare.com> writes:

> David Huggins-Daines <dhd@linuxcare.com> writes:
> 
> > Jeffrey A Law <law@cygnus.com> writes:
> > 
> > > Either we need to avoid merging the section symbols to avoid twiddling
> > > the addend, or we need to avoid reducing relocs to section symbols to
> > > begin with.
> Okay, I'll investigate this approach.

Done.  PA-RISC porters, update your binutils-2.10 and GCC. (again :-)

Here's the patch, which I've committed to puffin CVS (I've
reverted the incorrect GCC changes):

2000-07-14  David Huggins-Daines  <dhd@linuxcare.com>

	* config/tc-hppa.c (hppa_fix_adjustable): Reject reductions of
	sym-sym2 expressions as well as LR% and RR% fields on ELF targets
	as well.

Index: tc-hppa.c
===================================================================
RCS file: /home/cvs/parisc/binutils-2.10/gas/config/tc-hppa.c,v
retrieving revision 1.12
retrieving revision 1.13
diff -u -r1.12 -r1.13
--- tc-hppa.c	2000/07/11 14:02:15	1.12
+++ tc-hppa.c	2000/07/14 21:48:42	1.13
@@ -8369,10 +8369,25 @@
   /* Reject reductions of symbols in 32bit relocs.  */
   if (fixp->fx_r_type == R_HPPA && hppa_fix->fx_r_format == 32)
     return 0;
+#endif
 
   /* Reject reductions of symbols in sym1-sym2 expressions when
      the fixup will occur in a CODE subspace.
 
+     NOTE: We want to reject these for ELF targets as well, because
+     otherwise we will lose in the case of 21L and 14R
+     relocations.  (FIXME: will this break ELF64 targets?)
+
+     This is because, since the symbols are reduced, the linker has no
+     choice but to manipulate the addends when coalescing input .data
+     sections.  Because the 32-bit ABI requires the compiler to
+     pre-round LR% field selectors, this means we end up with
+     different addends for the left and right relocations.  Because of
+     the way LR% and RR% field selectors work, it's possible that the
+     RR% field will turn negative without the LR% field being rounded
+     accordingly, and your Linux kernel crashes mysteriously.
+     - dhd@linuxcare.com, 2000-07-14
+
      XXX FIXME: Long term we probably want to reject all of these;
      for example reducing in the debug section would lose if we ever
      supported using the optimizing hp linker.  */
@@ -8386,12 +8401,14 @@
     }
 
   /* We can't adjust any relocs that use LR% and RR% field selectors.
-     That confuses the HP linker.  */
+     That confuses the HP linker.
+
+     FIXME: do we actually need to do this for ELF32/GNU ld as well?
+     What about ELF64? */
   if (hppa_fix->fx_r_field == e_lrsel
       || hppa_fix->fx_r_field == e_rrsel
       || hppa_fix->fx_r_field == e_nlrsel)
     return 0;
-#endif
 
   /* Reject reductions of symbols in DLT relative relocs,
      relocations with plabels.  */

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
