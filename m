From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Mon, 2 Jun 2014 13:53:48 -0700
Message-ID: <CA+55aFwCy4-x02U6A-KbkPEpe_4pagsZ__ipBhe5HZOQt2vNmw@mail.gmail.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
	<20140602162525.GH16155@laptop.programming.kicks-ass.net>
	<CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
	<alpine.LRH.2.02.1406021622200.5874@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Peter Zijlstra <peterz@infradead.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Paul McKenney <paulmck@linux.vnet.ibm.com>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Waiman Long <Waiman.Long@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1406021622200.5874@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jun 2, 2014 at 1:46 PM, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> And what else do you want to do?
>
> Peter Zijlstra said "I've been using xchg() and cmpxchg() without such
> consideration for quite a while." - so it basically implies that the
> kernel is full of such races, mcs_spinlock is just the most visible one
> that crashes the kernel first.

.. so your whole argument is bogus, because it doesn't actually fix
anything else.

Now, something that *would* fix something else is (for example) to
just make "ACCESS_ONCE()" a rvalue so that you cannot use it for
assignments, and then trying to sort out what happens then. It's
possible that the "atomic_pointer_t" would be a part of the solution
to that "what happens then", but THERE IS NO WAY IN HELL we're adding
it for just one architecture and one use that doesn't warrant even
_existing_ on that architecture.

See what I'm saying?

You're not fixing the problem, you're fixing one unimportant detail
that isn't worth fixing that way.

               Linus
