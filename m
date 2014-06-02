From: Waiman Long <waiman.long@hp.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Mon, 02 Jun 2014 13:25:29 -0400
Message-ID: <538CB389.5080108@hp.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>  <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com> <1401727810.7440.34.camel@j-VirtualBox>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>, jejb@parisc-linux.org,
	deller@gmx.de, John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	paulmck@linux.vnet.ibm.com, chegu_vinod@hp.com, tglx@linutronix.de,
	riel@redhat.com, akpm@linux-foundation.org, davidlohr@hp.com,
	hpa@zytor.com, andi@firstfloor.org, aswin@hp.com,
	scott.norton@hp.com
To: Jason Low <jason.low2@hp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401727810.7440.34.camel@j-VirtualBox>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/02/2014 12:50 PM, Jason Low wrote:
> On Mon, 2014-06-02 at 12:00 -0400, Mikulas Patocka wrote:
>> If you write to some variable with ACCESS_ONCE and use cmpxchg or xchg at
>> the same time, you break it. ACCESS_ONCE doesn't take the hashed spinlock,
>> so, in this case, cmpxchg or xchg isn't really atomic at all.
> So if the problem is using ACCESS_ONCE writes with cmpxchg and xchg at
> the same time, would the below change address this problem?
>
> -----
> diff --git a/kernel/locking/mcs_spinlock.c b/kernel/locking/mcs_spinlock.c
> index 838dc9e..8396721 100644
> --- a/kernel/locking/mcs_spinlock.c
> +++ b/kernel/locking/mcs_spinlock.c
> @@ -71,7 +71,7 @@ bool osq_lock(struct optimistic_spin_queue **lock)
>   	if (likely(prev == NULL))
>   		return true;
>
> -	ACCESS_ONCE(prev->next) = node;
> +	xchg(&prev->next, node);
>
>   	/*
>   	 * Normally @prev is untouchable after the above store; because at that
> @@ -144,7 +144,7 @@ unqueue:
>   	 */
>
>   	ACCESS_ONCE(next->prev) = prev;
> -	ACCESS_ONCE(prev->next) = next;
> +	xchg(&prev->next, next);
>
>   	return false;
>   }
>
>

Doing an xchg is a very expensive operation compared with ACCESS_ONCE. I 
will not suggest doing that to make it right for PA-RISC at the expense 
of performance in other architectures.

-Longman
