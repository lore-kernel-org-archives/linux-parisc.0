Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA03267
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Aug 2000 22:05:48 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by atlrel2.hp.com (Postfix) with SMTP id 3EF5D5FD
	for <parisc-linux@puffin.external.hp.com>; Tue,  8 Aug 2000 14:37:23 -0400 (EDT)
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 8 Aug 2000 18:30:19 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13ME8r-0005ir-00
	for <parisc-linux@thepuffingroup.com>; Tue, 08 Aug 2000 14:30:21 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 08 Aug 2000 14:30:20 -0400
Message-ID: <87zomnobb7.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Making the stack executable
List-ID: <linux-parisc.vger.kernel.org>

Hi,

It turns out that my mysterious lockups in the rt_sigreturn path were
due to the fact that our stack pages are not executable.

They are being mapped with PAGE_COPY protection in exec.c, like every
other architecture does, but unlike every other architecture, our
PAGE_COPY did not include execute permissions.

Sorry folks but we do need trampolines.

What is more disturbing is that without _PAGE_EXEC set in PAGE_COPY,
attempting to execute code on the stack just hangs the machine solid!
(without printing out any error messages or register dumps)

The following program should demonstrate this problem:

	.LEVEL 1.1
	.text
	.align 4
	.globl main
main:
	.PROC
	.CALLINFO FRAME=64
	stw	%rp,-20(%sp)
	copy	%sp,%r19
	ldo	64(%sp),%sp
	ldil	L%0xebe0c002,%r20	/* bv,n %r0(%r31) */
	ldo	R%0xebe0c002(%r20),%r20
	stw	%r20,0(%r19)
	fdc	%r0(%r19)
	sync
	fic	%r0(%r19)
	sync
	ble	0(%sr7,%r19)
	nop
	ldo	-64(%sp),%sp
	bv,n	%r0(%rp)
	.ENTRY
	.EXIT
	.PROCEND

Is this some kind of issue with our ITLB miss handlers?

I'll check in the change to <asm/pgtable.h> shortly, but I'd like
someone to also look into the problem above (without the change).

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
