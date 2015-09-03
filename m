From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc: adjust L1_CACHE_BYTES to 128 bytes on PA8800
 and PA8900 CPUs
Date: Thu, 03 Sep 2015 06:30:43 -0700
Message-ID: <1441287043.2235.6.camel@HansenPartnership.com>
References: <20150902162000.GC2444@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150902162000.GC2444@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2015-09-02 at 18:20 +0200, Helge Deller wrote:
> PA8800 and PA8900 processors have a cache line length of 128 bytes.
> 
> Reported-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
> index 47f11c7..a775f60 100644
> --- a/arch/parisc/include/asm/cache.h
> +++ b/arch/parisc/include/asm/cache.h
> @@ -7,17 +7,19 @@
>  
> 
>  /*
> - * PA 2.0 processors have 64-byte cachelines; PA 1.1 processors have
> - * 32-byte cachelines.  The default configuration is not for SMP anyway,
> - * so if you're building for SMP, you should select the appropriate
> - * processor type.  There is a potential livelock danger when running
> - * a machine with this value set too small, but it's more probable you'll
> - * just ruin performance.
> + * Most PA 2.0 processors have 64-byte cachelines, but PA8800 and PA8900
> + * processors have a cache line length of 128 bytes.
> + * PA 1.1 processors have 32-byte cachelines.
> + * There is a potential livelock danger when running a machine with this value
> + * set too small, but it's more probable you'll just ruin performance.
>   */
> -#ifdef CONFIG_PA20
> +#if defined(CONFIG_PA8X00)
> +#define L1_CACHE_BYTES 128
> +#define L1_CACHE_SHIFT 7
> +#elif defined(CONFIG_PA20)
>  #define L1_CACHE_BYTES 64
>  #define L1_CACHE_SHIFT 6
> -#else
> +#else /* PA7XXX */
>  #define L1_CACHE_BYTES 32
>  #define L1_CACHE_SHIFT 5
>  #endif
> 
> diff --git a/arch/parisc/include/asm/atomic.h b/arch/parisc/include/asm/atomic.h
> index 226f8ca9..b2bc4b7 100644
> --- a/arch/parisc/include/asm/atomic.h
> +++ b/arch/parisc/include/asm/atomic.h
> @@ -19,14 +19,14 @@
>  
>  #ifdef CONFIG_SMP
>  #include <asm/spinlock.h>
> -#include <asm/cache.h>		/* we use L1_CACHE_BYTES */
> +#include <asm/cache.h>		/* we use L1_CACHE_SHIFT */
>  
>  /* Use an array of spinlocks for our atomic_ts.
>   * Hash function to index into a different SPINLOCK.
>   * Since "a" is usually an address, use one spinlock per cacheline.
>   */
>  #  define ATOMIC_HASH_SIZE 4
> -#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a))/L1_CACHE_BYTES) & (ATOMIC_HASH_SIZE-1) ]))
> +#  define ATOMIC_HASH(a) (&(__atomic_hash[ (((unsigned long) (a)) >> L1_CACHE_SHIFT) & (ATOMIC_HASH_SIZE-1) ]))
>  
>  extern arch_spinlock_t __atomic_hash[ATOMIC_HASH_SIZE] __lock_aligned;

This doesn't look to be correct.  The L1_CACHE_BYTES is compile time not
runtime, so it's the Architectural not the Actual width.  For us, there
are only two architectural widths governed by our compile classes, which
are PA1 and PA2 at 32 and 64.  There's no config way to produce a PA2
kernel which is PA88/89 only, so we should follow the PA2 architectural
width because the kernel can be booted on any PA2 system, not just
PA88/89.  Even if we could produce a PA88/89 only kernel and would wish
to, there's still not much point because 128 is the cache burst width.
PA988/89 work perfectly OK with the architectural width, so the extra
space is likely added for no benefit.

James


