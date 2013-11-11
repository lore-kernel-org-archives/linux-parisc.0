From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: implement full version of access_ok()
Date: Mon, 11 Nov 2013 22:40:21 +0100
Message-ID: <52814EC5.6030107@gmx.de>
References: <20130629120314.GA29350@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130629120314.GA29350@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I pushed this patch upstream to Linus for 3.13-rc1:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=63379c135331c724d40a87b98eb62d2122981341

Now, after some more testing it seems this patch breaks userspace 
when booted with a 64bit kernel on machines >= 4GB RAM.
All my machines with less than 4GB are OK. 

So, in case someone tries 3.13-rcX, please drop this patch if your 
machine has >= 4GB RAM...

I still need to understand why it breaks and will follow up 
with a revert or a fix.

Helge

On 06/29/2013 02:03 PM, Helge Deller wrote:
> Up to now PA-RISC could live with a trivial version of access_ok().
> Our fault handlers can correctly handle fault cases.
> 
> But testcases showed that we need a better access check else we won't
> always return correct errno failure codes to userspace.
> 
> Problem showed up during 32bit userspace tests in which writev() used a
> 32bit memory area and length which would then wrap around on 64bit
> kernel.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/uaccess.h b/arch/parisc/include/asm/uaccess.h
> index e0a8235..37ca987 100644
> --- a/arch/parisc/include/asm/uaccess.h
> +++ b/arch/parisc/include/asm/uaccess.h
> @@ -4,11 +4,14 @@
>  /*
>   * User space memory access functions
>   */
> +#include <asm/processor.h>
>  #include <asm/page.h>
>  #include <asm/cache.h>
>  #include <asm/errno.h>
>  #include <asm-generic/uaccess-unaligned.h>
>  
> +#include <linux/sched.h>
> +
>  #define VERIFY_READ 0
>  #define VERIFY_WRITE 1
>  
> @@ -33,12 +36,43 @@ extern int __get_user_bad(void);
>  extern int __put_kernel_bad(void);
>  extern int __put_user_bad(void);
>  
> -static inline long access_ok(int type, const void __user * addr,
> -		unsigned long size)
> +
> +/*
> + * Test whether a block of memory is a valid user space address.
> + * Returns 0 if the range is valid, nonzero otherwise.
> + */
> +static inline int __range_not_ok(unsigned long addr, unsigned long size,
> +				 unsigned long limit)
>  {
> -	return 1;
> +	unsigned long __newaddr = addr + size;
> +	return (__newaddr < addr || __newaddr > limit || size > limit);
>  }
>  
> +/**
> + * access_ok: - Checks if a user space pointer is valid
> + * @type: Type of access: %VERIFY_READ or %VERIFY_WRITE.  Note that
> + *        %VERIFY_WRITE is a superset of %VERIFY_READ - if it is safe
> + *        to write to a block, it is always safe to read from it.
> + * @addr: User space pointer to start of block to check
> + * @size: Size of block to check
> + *
> + * Context: User context only.  This function may sleep.
> + *
> + * Checks if a pointer to a block of memory in user space is valid.
> + *
> + * Returns true (nonzero) if the memory block may be valid, false (zero)
> + * if it is definitely invalid.
> + *
> + * Note that, depending on architecture, this function probably just
> + * checks that the pointer is in the user space range - after calling
> + * this function, memory access functions may still return -EFAULT.
> + */
> +#define access_ok(type, addr, size)					\
> +(	__chk_user_ptr(addr),						\
> +	!__range_not_ok((unsigned long) (__force void *) (addr),	\
> +			size, user_addr_max())				\
> +)
> +
>  #define put_user __put_user
>  #define get_user __get_user
>  
> @@ -218,7 +252,11 @@ extern long lstrnlen_user(const char __user *,long);
>  /*
>   * Complex access routines -- macros
>   */
> -#define user_addr_max() (~0UL)
> +#ifdef CONFIG_COMPAT
> +#define user_addr_max() (TASK_SIZE)
> +#else
> +#define user_addr_max() (DEFAULT_TASK_SIZE)
> +#endif
>  
>  #define strnlen_user lstrnlen_user
>  #define strlen_user(str) lstrnlen_user(str, 0x7fffffffL)
> 

