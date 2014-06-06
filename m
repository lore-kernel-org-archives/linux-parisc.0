From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 2/2] locking/rwsem: Disable optimistic spinning for PA-RISC
Date: Fri, 6 Jun 2014 10:22:21 -0700
Message-ID: <CA+55aFxNLRufHyLHetnst7Lq0Ya1xoAagZf=DbEDTf1ZSfKFCQ@mail.gmail.com>
References: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
	<1402070140-15090-3-git-send-email-davidlohr@hp.com>
	<1402070987.2207.75.camel@dabdike.int.hansenpartnership.com>
	<20140606171145.GU13930@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Ingo Molnar <mingo@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Jason Low <jason.low2@hp.com>,
	Waiman Long <waiman.long@hp.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	John David Anglin <dave.anglin@bell.net>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	David Miller <davem@davemloft.net>,
	James Hogan <james.hogan@imgtec.com>,
	Chris Metcalf <cmetcalf@tilera.com>,
	Vineet Gupta <vgupta@synopsys.com>
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140606171145.GU13930@laptop.programming.kicks-ass.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 6, 2014 at 10:11 AM, Peter Zijlstra <peterz@infradead.org> wrote:
>
> +config ARCH_NO_ATOMIC_RMW
> +       def_bool y
> +       depends on PARISC || SPARC32 || METAG_ATOMICITY_LOCK1 || (TILE && !TILEGX) || (ARC && !ARC_HAS_LLSC)

Ugh. We've had these kinds of things before, and they are broken and
nasty to maintain.

Just make it

    config ARCH_SUPPORTS_ATOMIC_RMW
        bool

which defaults to no. And then make MUTEX_SPIN_ON_OWNER depend on that.

And then we can add "select ARCH_SUPPORTS_ATOMIC_RMW" to the few
architectures we (a) care about and (b) know work. So start with x86,
arm, powerpc and sparc64, and then the rest can just add their own
oneliners if they care.

Remember, most people really won't ever care about this, simply
because it only matters if you have enough CPU's for the whole
spinning thing to make a noticeable difference.  So missing some odd
architecture _really_ doesn't matter.

And we really really *really* shouldn't have these kinds of "random
really odd architecture details" in the generic code, not even if it's
something as specific as kernel/Kconfig.locks.

               Linus

              Linus
