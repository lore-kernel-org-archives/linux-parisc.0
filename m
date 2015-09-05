From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Align locks for LWS syscalls to L1 cache size
Date: Sat, 5 Sep 2015 23:48:30 +0200
Message-ID: <55EB632E.9090009@gmx.de>
References: <20150902193840.GA4499@ls3530.box>
 <BLU437-SMTP56D79424A5305ECD3DC75F97690@phx.gbl>
 <20150902202911.GA5164@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20150902202911.GA5164@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 02.09.2015 22:29, Helge Deller wrote:
> parisc: Align locks for LWS syscalls to L1 cache size (v2)
> 
> Align the locks for the Light-weight-syscall (LWS) which are used
> for atomic userspace operations (e.g. gcc atomic builtins) on L1 cache
> boundaries. This should speed up LWS calls on PA20 systems.
> 
> Reported-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>


Any objections to this patch ?
One idea below...


> 
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 7ef22e3..80c2306 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -561,9 +561,9 @@ lws_compare_and_swap:
>  	extru  %r26, 27, 4, %r20
>  
>  	/* Find lock to use, the hash is either one of 0 to
> -	   15, multiplied by 16 (keep it 16-byte aligned)
> +	   15, multiplied by L1_CACHE_BYTES (keep it L1 cache aligned)
>  	   and add to the lock table offset. */
> -	shlw	%r20, 4, %r20
> +	shlw	%r20, L1_CACHE_SHIFT, %r20
>  	add	%r20, %r28, %r20
>  
>  # if ENABLE_LWS_DEBUG
> @@ -751,9 +751,9 @@ cas2_lock_start:
>  	extru  %r26, 27, 4, %r20
>  
>  	/* Find lock to use, the hash is either one of 0 to
> -	   15, multiplied by 16 (keep it 16-byte aligned)
> +	   15, multiplied by L1_CACHE_BYTES (keep it L1 cache aligned)
>  	   and add to the lock table offset. */
> -	shlw	%r20, 4, %r20
> +	shlw	%r20, L1_CACHE_SHIFT, %r20
>  	add	%r20, %r28, %r20
>  
>  	rsm	PSW_SM_I, %r0			/* Disable interrupts */
> @@ -931,11 +931,9 @@ END(sys_call_table64)
>  ENTRY(lws_lock_start)
>  	/* lws locks */
>  	.rept 16
> -	/* Keep locks aligned at 16-bytes */
> +	/* Keep locks aligned to L1_CACHE_BYTES */
>  	.word 1
> -	.word 0 
> -	.word 0
> -	.word 0
> +	.align	L1_CACHE_BYTES
>  	.endr

I think this alignment/increase of each array entry to size of L1_CACHE_BYTES 
should be limited to the SMP case only... For UP 16 bytes would be ok. 

Helge



>  END(lws_lock_start)
>  	.previous
> 
> 
> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
> index 49df148..47b075c 100644
> --- a/arch/parisc/include/asm/futex.h
> +++ b/arch/parisc/include/asm/futex.h
> @@ -15,7 +15,7 @@ static inline void
>  _futex_spin_lock_irqsave(u32 __user *uaddr, unsigned long int *flags)
>  {
>  	extern u32 lws_lock_start[];
> -	long index = ((long)uaddr & 0xf0) >> 2;
> +	long index = (((long)uaddr & 0xf0) >> 4) << (L1_CACHE_SHIFT-2);
>  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
>  	local_irq_save(*flags);
>  	arch_spin_lock(s);
> @@ -25,7 +25,7 @@ static inline void
>  _futex_spin_unlock_irqrestore(u32 __user *uaddr, unsigned long int *flags)
>  {
>  	extern u32 lws_lock_start[];
> -	long index = ((long)uaddr & 0xf0) >> 2;
> +	long index = (((long)uaddr & 0xf0) >> 4) << (L1_CACHE_SHIFT-2);
>  	arch_spinlock_t *s = (arch_spinlock_t *)&lws_lock_start[index];
>  	arch_spin_unlock(s);
>  	local_irq_restore(*flags);

