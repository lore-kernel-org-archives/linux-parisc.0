From: Mikulas Patocka <mpatocka@redhat.com>
Subject: Re: [PATCH] fix a race condition in cancelable mcs spinlocks
Date: Wed, 4 Jun 2014 08:53:48 -0400 (EDT)
Message-ID: <alpine.LRH.2.02.1406040838090.4046@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com> <20140601192026.GE16155@laptop.programming.kicks-ass.net> <BLU0-SMTP387BD0AE22A4EAD432D65F97210@phx.gbl> <20140601213003.GG16155@laptop.programming.kicks-ass.net>
 <1401739000.12939.34.camel@dabdike.int.hansenpartnership.com> <20140603075616.GJ11096@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	jejb@parisc-linux.org, deller@gmx.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chegu_vinod@hp.com,
	paulmck@linux.vnet.ibm.com, Waiman.Long@hp.com, tglx@linutronix.de,
	riel@redhat.com, akpm@linux-foundation.org, davidlohr@hp.com,
	hpa@zytor.com, andi@firstfloor.org, aswin@hp.com,
	scott.norton@hp.com, Jason Low <jason.low2@hp.com>
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140603075616.GJ11096@twins.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



On Tue, 3 Jun 2014, Peter Zijlstra wrote:

> On Mon, Jun 02, 2014 at 12:56:40PM -0700, James Bottomley wrote:
> > Architecturally, there is a way we could emulate the atomic exchange
> > instructions.  We could have a special section of memory that always
> > triggers a page trap.  In the Q state dtlb trap handlers we could
> > recognise the "atomic" section of memory and wrap the attempted
> > modification in a semaphore.  This would add a bit of overhead, but not
> > a huge amount if we do it in the trap handlers like the TMPALIAS
> > flushes.  This involves a lot of work for us because we have to decode
> > the instructions in software, recognise the operations and manually
> > apply the hashed semaphores around them.  If we did it like this, all
> > we'd need by way of mainline support is that variables treated as
> > atomically exchangeable should be in a separate section (because it's a
> > page fault handler effectively, we need them all separated from "normal"
> > code).  This would probably require some type of variable marker and if
> > we ever saw a xchg or cmpxchg on a variable without the marker, we could
> > break the build.
> 
> Cute, but I don't think that's entirely feasible given how these things
> can be embedded in other structures (some dynamically allocated etc..).

We could deliberately misalign all the atomic variables - then, we would 
take the alignment trap (that is already written) and take the atomic 
spinlock in it.

I've got another idea - we could stop the other CPUs while xchg or cmpxchg 
is being executed. But there is a problem if the other CPU has interrupts 
disabled. Could we mask interrupts on PA-RISC in such a way that they are 
all disabled except one IPI that stops the CPU temporarily? Maybe do not 
mask interrupts with PSW I-bit and mask them with EIEM instead (leaving 
the one interrupt for cmpxchg IPI enabled)?

Mikulas
