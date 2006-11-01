From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] [RFC] vdso for parisc-linux
Date: Wed, 1 Nov 2006 10:19:42 -0500
Message-ID: <119aab440611010719v3a7d0358jcd7be64afb769b8a@mail.gmail.com>
References: <4544A34A.6080700@tausq.org>
	<119aab440610300825l4cfd056fi21738f63f3d99d72@mail.gmail.com>
	<4546E861.9050909@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Randolph Chung" <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4546E861.9050909@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 10/31/06, Randolph Chung <randolph@tausq.org> wrote:
> > atomic ops are *not* prime candidates for vDSO's, I was wrong about
> > this. There are special requirements for the atomic operations which
> > require access to kernel locks, no scheduling, and no signals.  All of
> > these are impossible to do if gdb can write to code, thus we put the
> > atomic ops on the gateway page (which has the aforementioned special
> > properties).
>
> i can't quite see how lws disables scheduling... maybe you can enlighten
> me :)

LWS doesn't disable scheduling. See arch/parisc/kernel/syscall.S

arch/parisc/kernel/syscall.S
547 /* NOTES:
548 This all works becuse intr_do_signal
549 and schedule both check the return iasq
550 and see that we are on the kernel page
551 so this process is never scheduled off
552 or is ever sent any signal of any sort,
553 thus it is wholly atomic from usrspaces
554 perspective
555 */

Checks like this:
arch/parisc/kernel/entry.S
1023 intr_do_resched:
1024 /* Only call schedule on return to userspace. If we're returning
1025 * to kernel space, we may schedule if CONFIG_PREEMPT, otherwise
1026 * we jump back to intr_restore.
1027 */
1028 LDREG PT_IASQ0(%r16), %r20
1029 CMPIB= 0, %r20, intr_do_preempt
1030 nop

Mean that if we take an interrupt while on the gateway page, the
PT_IASQ0 should be zero and prevent intr_do_preempt, or
intr_do_signal, or any other protected intr_* action.

Scheduling isn't a bit problem, but signals cause deadlocks.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
