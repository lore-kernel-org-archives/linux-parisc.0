Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA09576
	for <parisc-linux@puffin.external.hp.com>; Thu, 22 Jun 2000 14:30:45 -0600
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Get rid of %r8 linker stubs 
In-Reply-To: Your message of "Thu, 22 Jun 2000 00:07:14 +1000."
             <Pine.LNX.4.21.0006212254430.19417-101000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0006212254430.19417-101000@front.linuxcare.com.au> 
Date: Thu, 22 Jun 2000 14:33:09 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E135Dev-0007ho-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= Hello all,
=    The attached patch to puffin.external.hp.com CVS binutils-2.10
= implements a new linker stub scheme for elf32-hppa.  (Well, it's new for
= gnu - I believe the hp linker does something like this).
= 
= The new scheme works like this:  For any linker input section that needs a
= stub to reach called routines, the linker creates a stub section located
= immediately prior to the input section.  A call is simply redirected to
= the stub, which consists of a long branch
=   ldil LR'XXX,%r1
=   be,n RR'XXX(%sr4,%r1)
= to the destination.
= 
= The old scheme had a single stub section, and out-of-range calls changed
= the call instruction from "b,l faraway,%r2" to "be,l stub(%sr4,%r8)".
= This of course dedicates a register to point to the stubs, and has some
= serious problems caused by changing the return pointer from the normal %r2
= to the implicit %r31 used by "be,l".  Additionally, when we finally
= implement elf32-hppa shared libraries, there are going to be a _lot_ more
= stubs.  We may even exceed the maximum 256k of stubs, especially if we try
= to combine .plt and .got with stubs to get a register back.
= 
= Anyway, I'd appreciate some brave souls testing out this patch.  A few
= positive reports and I'll check the lot in to pehc.

Well the good news is I can (with some trouble) link a native
binutils.  The bad news is that the kernel won't link.  To wit -

hppa1.1-linux-ld: fs/fs.o: cannot reach stub 080e89b4_00000000_printk
hppa1.1-linux-ld: fs/fs.o: cannot handle relocation R_PARISC_PCREL17F for printk at 0x3fc98 in .text

This follows a 'make clean'.  I only re-built the new binutils and not
gcc, if that matters.

	-P
