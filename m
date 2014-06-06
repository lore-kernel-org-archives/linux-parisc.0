From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Fri, 6 Jun 2014 08:15:18 -0700
Message-ID: <20140606151518.GI4581@linux.vnet.ibm.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
 <20140602162525.GH16155@laptop.programming.kicks-ass.net>
 <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
 <20140606150607.GT13930@laptop.programming.kicks-ass.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Waiman Long <Waiman.Long@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>, mingo@kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140606150607.GT13930@laptop.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jun 06, 2014 at 05:06:07PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 02, 2014 at 10:09:35AM -0700, Linus Torvalds wrote:
> > On Mon, Jun 2, 2014 at 9:25 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > And I can't say I'm a particular fan of these ops either, as alternative
> > > I'm almost inclined to just exclude parisc from using opt spinning.
> > 
> > Please do.
> 
> Something like so; if the rwsem stuff lands in .15 we need more for
> that, it doesn't have a convenient CONFIG symbol like this.
> 
> Linus will you take this from email, or should I get it through
> tip/locking/urgent or so?
> 
> ---
> Subject: locking, mutex: Disable optimistic spinning for PA-RISC
> 
> PA-RISC's cmpxchg is not save against normal stores and the code used
> for optimistic spinning is known broken because of this.
> 
> Disable for now.
> 
> Reported-by: Mikulas Patocka <mpatocka@redhat.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>

Reviewed-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

> ---
>  kernel/Kconfig.locks | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
> index 35536d9c0964..9c239e080c2d 100644
> --- a/kernel/Kconfig.locks
> +++ b/kernel/Kconfig.locks
> @@ -222,7 +222,7 @@ endif
> 
>  config MUTEX_SPIN_ON_OWNER
>  	def_bool y
> -	depends on SMP && !DEBUG_MUTEXES
> +	depends on SMP && !DEBUG_MUTEXES && !PARISC
> 
>  config ARCH_USE_QUEUE_RWLOCK
>  	bool
> 

