From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800 and
 PA8900 CPUs
Date: Sat, 5 Sep 2015 23:30:34 +0200
Message-ID: <55EB5EFA.4040407@gmx.de>
References: <20150902162000.GC2444@ls3530.box>
 <1441287043.2235.6.camel@HansenPartnership.com>
 <1441288665.2235.17.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1441288665.2235.17.camel@HansenPartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

On 03.09.2015 15:57, James Bottomley wrote:
> Having looked more closely at our atomics, we seem to have a bogus
> assumption about cache lines.  Our cache is perfectly capable of
> correctly writing to adjacent bytes in different lines even on different
> processors and having the external visibility sequenced accordingly.
> The reason we need the locks is for correctness not for cache coherence
> problems.  This means that we shouldn't hash all locks in the same line
> to the same lock because it introduces unnecessary contention in
> adjacent atomics which could be sorted out much faster by the cache
> logic.
> 
> The original way our hash worked would have been correct if the atomic_t
> were cache line aligned ... meaning only one atomic per cache line, but
> they're not, they have no alignment primitives.
> 
> On the same thought, to reduce atomic contention probabalistically, we
> should have a much larger atomic array, say 64 or 128 ... it's a single
> array of locks, so the amount of space consumed by expanding it isn't
> huge.
> 
> This patch should get rid of the bogus cache assumption and at the same
> time decrease our collision chances.  We should probably do some playing
> around to see what the best size for ATOMIC_HASH_SIZE is.

I haven't done any performance measurements yet, but your patch looks
absolutely correct.

Do you mind sending a full patch including your signed-off line, so that
I can include it?

Thanks,
Helge 

> diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
> index 226f8ca9..de3361b 100644
> --- a/arch/parisc/include/asm/atomic.h
> +++ b/arch/parisc/include/asm/atomic.h
> @@ -19,14 +19,13 @@
>  
>  #ifdef CONFIG_SMP
>  #include <asm/spinlock.h>
> -#include <asm/cache.h>		/* we use L1_CACHE_BYTES */
>  
>  /* Use an array of spinlocks for our atomic_ts.
>   * Hash function to index into a different SPINLOCK.
> - * Since "a" is usually an address, use one spinlock per cacheline.
> + * Since "a" is usually an address, use one spinlock per atomic.
>   */
> -#  define ATOMIC_HASH_SIZE 4
> -#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
> +#  define ATOMIC_HASH_SIZE 64
> +#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/sizeof(atomic_t)) & (ATOMIC_HASH_SIZE-1) ]))
>  
>  extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;

