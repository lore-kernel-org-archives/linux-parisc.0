From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Fri, 14 May 2010 13:20:15 -0600
Message-ID: <20100514192015.GB14840@lackof.org>
References: <4BE86174.1080008@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE86174.1080008@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 10, 2010 at 09:41:40PM +0200, Helge Deller wrote:
> Since PARISC is the only Linux architecture which has different values
> for EAGAIN and EWOULDBLOCK, we are running in various issues.
> 
> One of them is, that e.g. glibc checks for EAGAIN instead of EWOULDBLOCK
> (and vise versa) in nptl/pthread_mutex_trylock.c. This doesn't hurt
> other architectures, but it hurts parisc.
> 
> I was planning to send the patch below to linux kernel mailing list.
> But before I do it, I would like to get feedback from the kernel
> hackers here on the list.
> 
> What do you think?

Do it.
We kept them distinct to enable support for HPUX binaries.
This is never going to happen.

> Is this patch useful?

Yes.

> Or will people just call me an idiot if I ask if this patch could be applied?
> If you think it's useful, maybe another patch description would be more appropriate?

Could we just equate like other arcthitectures so the kernel only ever
returns one of those and not both?

> Any feedback is welcome...

Thanks for bringing this up! :)

cheers,
grant

> 
> Helge
> 
> -----------------------
> [PATCH] futex.c: return EAGAIN instead of EWOULDBLOCK
> 
> Patch summary:
> In the Linux kernel all architectures beside the PARISC architecture 
> define EWOULDBLOCK as EAGAIN:
> 
> arch/sparc/include/asm/errno.h:#define  EWOULDBLOCK     EAGAIN  /* Operation would block */
> arch/mips/include/asm/errno.h:#define   EWOULDBLOCK     EAGAIN  /* Operation would block */
> arch/alpha/include/asm/errno.h:#define  EWOULDBLOCK     EAGAIN  /* Operation would block */
> include/asm-generic/errno.h:#define     EWOULDBLOCK     EAGAIN  /* Operation would block */
> 
> The only exception is PARISC, which tries to keep HP-UX compatibility:
> arch/parisc/include/asm/errno.h:#define EWOULDBLOCK     246     /* Operation would block (Linux returns EAGAIN) */
> 
> This difference leads to various problems with userspace, which often 
> thinks that EWOULDBLOCK and EGAIN are of the same value. To avoid problems
> userspace sometimes has to check the return value for both values.
> 
> The following patch cleans up the Linux kernel futex implementation to
> always return EAGAIN instead of EWOULDBLOCK.
> Binary compatibility for all architectures beside PARISC is still kept,
> but on PARISC this will ease life a lot.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> 
> diff --git a/kernel/futex.c b/kernel/futex.c
> index e7a35f1..28d14ff 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -1732,7 +1732,7 @@ static void futex_wait_queue_me(struct futex_hash_bucket *hb, struct futex_q *q,
>   *
>   * Returns:
>   *  0 - uaddr contains val and hb has been locked
> - * <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is unlcoked
> + * <1 - -EFAULT or -EAGAIN (uaddr does not contain val) and hb is unlcoked
>   */
>  static int futex_wait_setup(u32 __user *uaddr, u32 val, int fshared,
>  			   struct futex_q *q, struct futex_hash_bucket **hb)
> @@ -1784,7 +1784,7 @@ retry_private:
>  
>  	if (uval != val) {
>  		queue_unlock(q, *hb);
> -		ret = -EWOULDBLOCK;
> +		ret = -EAGAIN;
>  	}
>  
>  out:
> @@ -1969,7 +1969,7 @@ retry_private:
>  	else {
>  		ret = rt_mutex_trylock(&q.pi_state->pi_mutex);
>  		/* Fixup the trylock return value: */
> -		ret = ret ? 0 : -EWOULDBLOCK;
> +		ret = ret ? 0 : -EAGAIN;
>  	}
>  
>  	spin_lock(q.lock_ptr);
> @@ -2154,7 +2154,7 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
>  		plist_del(&q->list, &q->list.plist);
>  
>  		/* Handle spurious wakeups gracefully */
> -		ret = -EWOULDBLOCK;
> +		ret = -EAGAIN;
>  		if (timeout && !timeout->task)
>  			ret = -ETIMEDOUT;
>  		else if (signal_pending(current))
> @@ -2196,7 +2196,7 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
>   * 7) timeout
>   * 8) other lock acquisition failure
>   *
> - * If 6, return -EWOULDBLOCK (restarting the syscall would do the same).
> + * If 6, return -EAGAIN (restarting the syscall would do the same).
>   *
>   * If 4 or 7, we cleanup and return with -ETIMEDOUT.
>   *
> @@ -2318,10 +2318,10 @@ static int futex_wait_requeue_pi(u32 __user *uaddr, int fshared,
>  		 * We've already been requeued, but cannot restart by calling
>  		 * futex_lock_pi() directly. We could restart this syscall, but
>  		 * it would detect that the user space "val" changed and return
> -		 * -EWOULDBLOCK.  Save the overhead of the restart and return
> -		 * -EWOULDBLOCK directly.
> +		 * -EAGAIN.  Save the overhead of the restart and return
> +		 * -EAGAIN directly.
>  		 */
> -		ret = -EWOULDBLOCK;
> +		ret = -EAGAIN;
>  	}
>  
>  out_put_keys:
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
