Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50A5C482A
	for <parisc-linux@parisc-linux.org>; Mon, 16 Jul 2001 10:50:02 -0600 (MDT)
Message-Id: <200107161648.KAA20976@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] TODO list 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Fri, 13 Jul 2001 20:10:08 BST." <20010713201008.Q3048@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 16 Jul 2001 10:48:55 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> 
> Here's some things which need to get fixed, courtesy of Alan Cox:
> 
>  * Documentation/parisc/unwritten appears out of date

Here's what I have so far. I'll try to finish revivewing the rest
tonight (or tomorrow) and submit bugs for what doesn't get done by the end
of the week.

grant


sys_idle	./include/asm-parisc/unistd.h:  return sys_idle();
	sys_idle() is obsolete - remove it.

reboot_setup()	arch/parisc/kernel/process.c - delete this function

machine_halt		NOP. needs someone else to review.
machine_power_on	obsolete - delete it

exit_thread		NOP
flush_thread		needs someone else to review

die
die_if_no_fixup		Do we need to export either of these?
			Don't think so. We have "die_if_kernel".

strlen_user	#define strlen_user(str) lstrnlen_user(str, 0x7fffffffL)
			Kind of klugy...is that ok?

do_check_pgt_cache	NOP. needs someone else to review.

set_pte_phys		orphaned? needs someone else to review.

ffz		./include/asm-parisc/bitops.h:extern __inline__ unsigned long ffz(unsigned long word)
		I think "static __inline__" is meant...


check_bugs	NOP. TBD.

I haven't looked at these yet:
csum_partial
csum_partial_copy
csum_partial_copy_generic
csum_partial_nocheck
csum_partial_copy_from_user
csum_tcpudp_nofold
csum_tcpudp_magic
sigaddset
sigdelset
get_cycles
