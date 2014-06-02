From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Mon, 2 Jun 2014 15:55:57 -0700
Message-ID: <CA+55aFz7P0y1gZx7K2TCAKE7JQ6XseEprqXAQEOdq-j540KRYA@mail.gmail.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
	<20140602162525.GH16155@laptop.programming.kicks-ass.net>
	<20140602163032.GI16155@laptop.programming.kicks-ass.net>
	<538CB56E.5010709@hp.com>
	<20140602200525.GD13930@laptop.programming.kicks-ass.net>
	<CA+55aFwJwVf_MbcwNNWg-KrLdoOaV2xse2jzvBZTJHJgC_Htvg@mail.gmail.com>
	<20140602210227.GE22231@linux.vnet.ibm.com>
	<CA+55aFzX3oDvzqh4AfkJ7-X1Yfo8obFM+jOOmwzeN-GyqOPLJg@mail.gmail.com>
	<20140602220831.GG22231@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <waiman.long@hp.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140602220831.GG22231@linux.vnet.ibm.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 2, 2014 at 3:08 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
>
> rcu: Eliminate read-modify-write ACCESS_ONCE() calls
>
>         preempt_disable();
> -       ACCESS_ONCE(this_cpu_ptr(sp->per_cpu_ref)->c[idx]) += 1;
> +       lp = this_cpu_ptr(&sp->per_cpu_ref->c[idx]);
> +       ACCESS_ONCE(*lp) = *lp + 1;
>         smp_mb(); /* B */  /* Avoid leaking the critical section. */
> -       ACCESS_ONCE(this_cpu_ptr(sp->per_cpu_ref)->seq[idx]) += 1;
> +       lp = this_cpu_ptr(&sp->per_cpu_ref->seq[idx]);
> +       ACCESS_ONCE(*lp) = *lp + 1;
>         preempt_enable();
>         return idx;

What Eric said. This should just use "this_cpu_inc()" instead.
Particularly with the smp_mb() and the preempt_enable(), there's no
way that could/should leak, and the ACCESS_ONCE() seems pointless and
ugly.

And the good news is, gcc _will_ generate good code for that.

              Linus
