From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Problem with atomicity of TIF for parisc ?
Date: Fri, 9 Mar 2007 19:06:50 -0500 (EST)
Message-ID: <200703100006.l2A06o7Y012173__41336.9075315588$1416624324$gmane$org@hiauly1.hia.nrc.ca>
References: <200703092007.32746.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200703092007.32746.deller@gmx.de> from "Helge Deller" at Mar 9, 2007 08:07:32 pm
List-ID: <linux-parisc.vger.kernel.org>

> Now I'm wondering if our thread-problems may be due the fact that we do not disable interrupts while testing the TIF_XX values in arch/parisc/kernel/entry.S, e.g.:

Do you have a testcase?  I'm still seeing the occasional thread test
fail in the GCC testsuite fail.  These are usually timeouts.  I'm not
seeing hung processes leading to a kernel crash anymore ;)

I also see output from a test truncated occasionally when a test generates
a lot of output.

> intr_return:
>         /* NOTE: Need to enable interrupts incase we schedule. */
>         ssm     PSW_SM_I, %r0
> <....>
> intr_check_resched:
>         /* check for reschedule */
>         mfctl   %cr30,%r1
>         LDREG   TI_FLAGS(%r1),%r19      /* sched.h: TIF_NEED_RESCHED */
>         bb,<,n  %r19,31-TIF_NEED_RESCHED,intr_do_resched /* forward */
> 
> Is the coding correct, or do we need to disable interrupts when checking TIF_NEED_RESCHED ?

The bb test clearly isn't atomic...

Is disabling interrupts sufficient on a SMP system?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
