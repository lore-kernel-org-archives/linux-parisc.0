From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 2/2] locking/rwsem: Disable optimistic spinning for
 PA-RISC
Date: Fri, 06 Jun 2014 09:09:47 -0700
Message-ID: <1402070987.2207.75.camel@dabdike.int.hansenpartnership.com>
References: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
	 <1402070140-15090-3-git-send-email-davidlohr@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: peterz@infradead.org, mingo@kernel.org, mpatocka@redhat.com,
	torvalds@linux-foundation.org, jason.low2@hp.com,
	waiman.long@hp.com, jejb@parisc-linux.org,
	paulmck@linux.vnet.ibm.com, dave.anglin@bell.net, aswin@hp.com,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
To: Davidlohr Bueso <davidlohr@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1402070140-15090-3-git-send-email-davidlohr@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2014-06-06 at 08:55 -0700, Davidlohr Bueso wrote:
> PA-RISC's cmpxchg is not save against normal stores and the code used
> for optimistic spinning is known broken because of this.

What about all the other identified architectures?  The problem is that
unless you can do an atomic Read Modify Write on your architecture, you
have to implement our exchange primitives with locking, and that makes
you unsafe against stores  We happen to be the architecture that
detected this, but I thought we agreed sparc32, metag, tile32, arc and
possibly hexagon have this problem.

Rather than naming all the failing architectures, we probably want an 

ARCH_NO_ATOMIC_RMW

symbol which they select to indicate they can't do atomic exchange and
then you make

depends on SMP && RWSEM_XCHGADD_ALGORITHM &!ARCH_NO_ATOMIC_RMW

So they can all self select (especially if more come crawling out of the
woodwork).

James


