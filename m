From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 15/23] Add cmpxchg_local to parisc
Date: Mon, 27 Aug 2007 15:04:32 -0600
Message-ID: <20070827210432.GA22484__14881.2927691781$1416624644$gmane$org@colo.lackof.org>
References: <20070812145434.520271946@polymtl.ca>
	<20070812145840.691277845@polymtl.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: akpm@linux-foundation.org,
 Christoph Lameter <clameter@sgi.com>,
 linux-kernel@vger.kernel.org,
 parisc-linux@parisc-linux.org
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070812145840.691277845@polymtl.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 12, 2007 at 10:54:49AM -0400, Mathieu Desnoyers wrote:
> Use the new generic cmpxchg_local (disables interrupt). Also use the generic
> cmpxchg as fallback if SMP is not set.

Mathieu,
thanks for adding __cmpxchg_local to parisc.... but why do we need it?

By definition, atomic operators are, well, atomic.

I searched for __cmpxchg_local and found this reference:
    http://www.ussg.iu.edu/hypermail/linux/kernel/0612.2/1337.html

but the "root" of that thread (Dec 20, 2006):
    http://www.ussg.iu.edu/hypermail/linux/kernel/0612.2/1334.html

Doesn't explain the difference between "local" and "non-local" either.
Per CPU data should only need memory barriers (in some cases) and
protection against interrupts (in probably more cases). So I'm not
understanding why a new set of APIs is needed.

Can you add a description to Documentation/atomic_ops.txt ?
*sigh* sorry for being "late to the party" on this one...

cheers,
grant

> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
> CC: clameter@sgi.com
> CC: parisc-linux@parisc-linux.org
> ---
>  include/asm-parisc/atomic.h |   29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> Index: linux-2.6-lttng/include/asm-parisc/atomic.h
> ===================================================================
> --- linux-2.6-lttng.orig/include/asm-parisc/atomic.h	2007-07-20 19:44:40.000000000 -0400
> +++ linux-2.6-lttng/include/asm-parisc/atomic.h	2007-07-20 19:44:47.000000000 -0400
> @@ -122,6 +122,35 @@ __cmpxchg(volatile void *ptr, unsigned l
>  				    (unsigned long)_n_, sizeof(*(ptr))); \
>    })
>  
> +#include <asm-generic/cmpxchg-local.h>
> +
> +static inline unsigned long __cmpxchg_local(volatile void *ptr,
> +				      unsigned long old,
> +				      unsigned long new_, int size)
> +{
> +	switch (size) {
> +#ifdef CONFIG_64BIT
> +	case 8:	return __cmpxchg_u64((unsigned long *)ptr, old, new_);
> +#endif
> +	case 4:	return __cmpxchg_u32(ptr, old, new_);
> +	default:
> +		return __cmpxchg_local_generic(ptr, old, new_, size);
> +	}
> +}
> +
> +/*
> + * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
> + * them available.
> + */
> +#define cmpxchg_local(ptr,o,n)					  	\
> +     (__typeof__(*(ptr)))__cmpxchg_local((ptr), (unsigned long)(o),	\
> +			   	 (unsigned long)(n), sizeof(*(ptr)))
> +#ifdef CONFIG_64BIT
> +#define cmpxchg64_local(ptr,o,n) cmpxchg_local((ptr), (o), (n))
> +#else
> +#define cmpxchg64_local(ptr,o,n) __cmpxchg64_local_generic((ptr), (o), (n))
> +#endif
> +
>  /* Note that we need not lock read accesses - aligned word writes/reads
>   * are atomic, so a reader never sees unconsistent values.
>   *
> 
> -- 
> Mathieu Desnoyers
> Computer Engineering Ph.D. Student, Ecole Polytechnique de Montreal
> OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
