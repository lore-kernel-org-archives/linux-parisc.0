Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 631CB4DAE
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 22 Apr 2004 16:50:33 -0600 (MDT)
Message-Id: <200404222250.i3MMoUOq017459@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Panic on boot in 64 bit 2.6.6-rc1-pa0
To: James.Bottomley@steeleye.com (James Bottomley)
Date: Thu, 22 Apr 2004 18:50:29 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <1082673135.1714.118.camel@mulgrave> from "James Bottomley" at
	Apr 22, 2004 06:32:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> I've traced this to an apparent linker fault.  It seems to be being
> caused by having the scheduling function in its own section.
> 
> The offending code is in entry.S; this is what the code actually says:
> 
> syscall_do_resched:
>         bl      schedule,%r2
> #ifdef __LP64__
>         ldo     -16(%r30),%r29          /* Reference param save area */
> #else
>         nop
> #endif
>         b       syscall_check_bh  /* if resched, we start over again */
>         nop
> 
> And this is what it assembles to in the final vmlinux:
> 
> 000000001010d05c <syscall_do_resched>:
>     1010d05c:   e8 54 12 ac     b,l 101369b8 <dbl_to_sgl_fcnvxf+0xd0>,rp
>     1010d060:   37 dd 3f e1     ldo -10(sp),ret1
>     1010d064:   e8 1f 1b ed     b,l 1010ce60 <syscall_check_bh>,r0
>     1010d068:   08 00 02 40     nop
> 
> Apparently ld has simply loaded an out of range value for the branch.  I
> can't see that this is a global fault, otherwise calling init functions
> wouldn't work either, but it does.
> 
> I've hacked a temporary work around in vmlinux.lds.S (simply make all of
> the required functions close enough to entry.S that they don't need
> stubs), but I'd really like some input from the toolchain people about
> what the real problem actually is.

If schedule is too far away, the linker will add a long branch stub.
This apparently doesn't work in the kernel.  On the otherhand, `b,l'
should go about 8 MB without needing a stub.

Disassemble 101369b8 and see if it's a linker stub.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
