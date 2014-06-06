From: Chris Metcalf <cmetcalf@tilera.com>
Subject: Re: [PATCH 2/2] locking/rwsem: Disable optimistic spinning for PA-RISC
Date: Fri, 6 Jun 2014 13:19:59 -0400
Message-ID: <5391F83F.60005@tilera.com>
References: <1402070140-15090-1-git-send-email-davidlohr@hp.com> <1402070140-15090-3-git-send-email-davidlohr@hp.com> <1402070987.2207.75.camel@dabdike.int.hansenpartnership.com> <20140606171145.GU13930@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Cc: Davidlohr Bueso <davidlohr@hp.com>, <mingo@kernel.org>,
	<mpatocka@redhat.com>, <torvalds@linux-foundation.org>,
	<jason.low2@hp.com>, <waiman.long@hp.com>, <jejb@parisc-linux.org>,
	<paulmck@linux.vnet.ibm.com>, <dave.anglin@bell.net>,
	<aswin@hp.com>, <linux-kernel@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, <davem@davemloft.net>,
	<james.hogan@imgtec.com>, <vgupta@synopsys.com>
To: Peter Zijlstra <peterz@infradead.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140606171145.GU13930@laptop.programming.kicks-ass.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 6/6/2014 1:11 PM, Peter Zijlstra wrote:
> The thing is, all these archs are broken beyond this particular problem,
> Mikulas Patocka found a number of other spots.
>
> In any case, sure I can exclude more. Although ideally someone goes do
> that __atomic sparse thing to flush out all this.
>
> ---
> Subject: locking, mutex: Disable optimistic spinning on !RMW archs
>
> For some archs a regular store does not play nice with cmpxchg(), the
> optimistic spinning code (and various other places not caught by this)
> break this assumption and make things go boom.
>
> Until something better is found, disable optimistic spinning for these
> archs.
>
> [..]
>   
> +config ARCH_NO_ATOMIC_RMW
> +	def_bool y
> +	depends on PARISC || SPARC32 || METAG_ATOMICITY_LOCK1 || (TILE && !TILEGX) || (ARC && !ARC_HAS_LLSC)

For tile:

Acked-by: Chris Metcalf <cmetcalf@tilera.com>

But you should use "TILEPRO" (added in kernel 3.5) instead of "(TILE && !TILEGX)".

-- 
Chris Metcalf, Tilera Corp.
http://www.tilera.com
