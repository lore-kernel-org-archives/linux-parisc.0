From: Davidlohr Bueso <davidlohr@hp.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Fri, 06 Jun 2014 08:42:19 -0700
Message-ID: <1402069339.14433.0.camel@buesod1.americas.hpqcorp.net>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	 <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
	 <20140602162525.GH16155@laptop.programming.kicks-ass.net>
	 <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
	 <20140606150607.GT13930@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
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
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>, mingo@kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140606150607.GT13930@laptop.programming.kicks-ass.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2014-06-06 at 17:06 +0200, Peter Zijlstra wrote:
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

I almost hit the send button :)

> 
> Reported-by: Mikulas Patocka <mpatocka@redhat.com>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> ---

Reviewed-by: Davidlohr Bueso <davidlohr@hp.com>
