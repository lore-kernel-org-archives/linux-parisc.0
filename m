From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] Document LWS ABI.
Date: Tue, 15 Jul 2008 23:05:51 -0400 (EDT)
Message-ID: <20080716030552.766ED4E77@hiauly1.hia.nrc.ca>
References: <119aab440807151754r376e339eoe5e496f4642de4df@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, kyle@mcmartin.ca, dave.anglin@nrc.ca,
	linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440807151754r376e339eoe5e496f4642de4df@mail.gmail.com> from "Carlos O'Donell" at Jul 15, 2008 08:54:24 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The question is "Are you OK with the existing ABI?" :-)

No.  As I understand it, r2 doesn't need to be clobbered because
glibc doesn't currently clobber it.  So, using it in the LWS code
would cause an ABI break.  That's one register back to userspace.

I want to keep r19 and r27 for userspace so the PIC register doesn't
have to be saved and restored in the asm (linux-atomic.c is compiled
as PIC code).  You can have r29.

That leaves three free registers for the LWS code: r22, r23 and r29.
The LWS ABI has r1, r20-r26 and r28-r31.  Userspace has two call-clobbered
registers free across the asm in PIC code, and three in non-PIC code.
That's enough to efficiently perform the error comparisons.

The asm would be more efficient if the registers used for lws_mem,
lws_old and lws_new were not written to.  This occurs only for the
call in the 32-bit runtime with a 64-bit kernel.  As it stands,
the lws_mem, lws_old and lws_new arguments get reloaded every time
around the EAGAIN loop.  This is the crucial code in the compare
and swap:

        /* The load and store could fail */
1:      ldw     0(%sr3,%r26), %r28
	sub,<>  %r28, %r25, %r0
2:      stw     %r24, 0(%sr3,%r26)

The sub,<> instruction uses a 32-bit compare/subtract condition, so
the clipping of r25 isn't necessary.  Similarly, the stw instruction
ignores the most significant 32-bits of r24.  The value in r26 needs
clipping but you have three free registers, and it looks like r1 is
also free at this point in the code.  You can deposit the least
significant 32-bits of r26 into a field of zeros in another register
in one instruction.

It looks like lws_compare_and_swap64 and lws_compare_and_swap32 become
more or less functionally identical.  The above would become something
like:

#ifdef CONFIG_64BIT
	depd,z	%r26,63,32,%r1
1:      ldw     0(%sr3,%r1), %r28
        sub,<>  %r28, %r25, %r0
2:      stw     %r24, 0(%sr3,%r1)
#else
1:      ldw     0(%sr3,%r26), %r28
        sub,<>  %r28, %r25, %r0
2:      stw     %r24, 0(%sr3,%r26)
#endif

The argument clipping in the current code would be removed.  As a result,
the branch to lws_compare_and_swap can be eliminated in the 64-bit path.

It's my impression that the tightness of the loop for the compare/exchange
operation is important.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
