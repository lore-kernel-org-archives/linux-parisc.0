Received: from chalet ([199.254.238.240])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id OAA06486
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 14:28:39 -0700
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m13uLiv-001Vp3C@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Nov 2000 14:28:37 -0700 (MST)
Message-Id: <m13uLiv-001Vp3C@chalet>
From: bame@riverrock.org
Reply-To: bame@riverrock.org
Errors-To: bame@riverrock.org
To: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
In-reply-to: Your message of "Thu, 09 Nov 2000 11:47:51 MST."
             <E13twjn-0004fw-00@noam.fc.hp.com>
Date: Fri, 10 Nov 2000 14:28:33 -0700
Sender: bame@bame.riverrock.org
List-ID: <linux-parisc.vger.kernel.org>

= 
= We're getting ready to do a kernel merge (to -test10 I think).  Anybody
= concerns before we get started?
= 

I'm getting ready to commit the changes to merge us up to 2.4.0-test10 as
soon as I'm confident 64-bit kernels are OK (32-bit seems fine).

Here's a brief list of changes made (and yet to be made -- if anyone
has the time/energy) to our parisc code (does not include changes in
common code!).  While there's plenty yet to do, I think we're
no worse off than before the merge.  Some parts of our parisc code
are getting rather moldy compared to the other ports FYI.

Important tags:
	LINUS_240_TEST6			Linus' 2.4.0-test6
	LINUS_240_TEST10		Linus' 2.4.0-test10
	LINUS_240_TEST10_PREMERGE	Our tree before the -test10 merge
	LINUS_240_TEST10_MERGED		Our tree after the -test10 merge

			    ------------

Lots of 'extern __inline__' turned into 'static __inline__' and there
are more to do (TODO).

Beginnings of several smp_mb*() macros -- implemented as no-ops in
the non-SMP case (asm/bitops.h, asm/system.h)

SET_PERSONALITY() macro in asm/elf.h needs updating (TODO).

fcntl.h acquired a 'struct fcntl64' used with 64-bit offsets, implementing
fcntl(fd, F_S/GETLK[W]64, ...).  Several other locking-related #defines added.

asm/mmu_context.h:init_new_context() now returns int (always 0), not void.

Should our asm/bitops.h routines be re-coded in assembly? (TODO)

Added #define RLIMIT_LOCKS to asm/resource.h

Added #define CLOCKS_PER_SEC to asm/param.h (how did we miss this one?)

Our asm/string.h is behind the times.  Fixing it might get rid of a
bunch of compiler warnings! (TODO)

Removed mktime from drivers/char/genrtc.c (it's in a header file now)

x86 made a bunch of changes to asm-i386/floppy.h -- should we? (TODO)

looks like maybe the get/put_user_ret() functions in asm/uaccess.h are
obsolete?  (TODO)

We'll need to add the getdents64() and fcntl64() syscall glue. (TODO!!!)

Our arch/parisc/config.in is in BAD SHAPE (TODO)

arch/parisc/process.c: added new argsto do_fork() and copy_thread().
IA64 seems to use the copy_thread() arg.

arch/parisc/signal.c: minor change to common data structure

drivers/scsi sym53c8xx_comm.h #ifdef doesn't work on parisc -- eliminates
                unmap_pci_mem() causing link error (TODO - rhirst)
