From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [RFC PATCH] 64bit LWS CAS
Date: Thu, 17 Jul 2014 18:51:38 -0400
Message-ID: <BLU436-SMTP161B042AED3FE7A129018E597F40@phx.gbl>
References: <20140717220000.555b2bec@dellete.lux.tuxicoman.be> <53C84085.5020704@gmx.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53C84085.5020704@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 17-Jul-14, at 5:30 PM, Helge Deller wrote:

> On 07/17/2014 10:00 PM, Guy Martin wrote:
> +/* Kernel helper for compare-and-exchange a 64-bit value from  
> ELF32.  */
> +static inline long
> +__kernel_cmpxchg_dword32 (int64_t oldval, int64_t newval, int64_t  
> *mem)
> +{
> +  register unsigned long lws_mem asm("r26") = (unsigned long) (mem);
> +  register long lws_ret_h   asm("r28");
> +  register long lws_ret_l   asm("r29");
> +  register long lws_errno   asm("r21");
> +  register int lws_old_h    asm("r25") = oldval >> 32;
> +  register int lws_old_l    asm("r24") = oldval & 0xffffffff;
> +  register int lws_new_h    asm("r23") = newval >> 32;
> +  register int lws_new_l    asm("r22") = newval & 0xffffffff;
> +  asm volatile (	"ble	0xb0(%%sr2, %%r0)	\n\t"
> +			"ldi	%8, %%r20		\n\t"
> +	: "=r" (lws_ret_h), "=r" (lws_ret_l), "=r" (lws_errno),  
> "=r" (lws_mem),
> +	  "=r" (lws_old_h), "=r" (lws_old_l), "=r" (lws_new_h),  
> "=r" (lws_new_l)
> +	: "i" (2), "3" (lws_mem), "4" (lws_old_h), "5" (lws_old_l),  
> "6" (lws_new_h), "7" (lws_new_l)
> +	: "r1", "r20", "r31", "memory"
> +  );
>
> Just a thought:
> I'm not sure how good gcc optimizes the assignment of the 64bit  
> parameters to their final destination registers (r22-r25) with  
> regard to the shifting and masking, but it might be worth to check  
> if gcc's built-in "R2" functionality (sorry, I don't know the name  
> of this feature!) can help here?
>
> As an example see the __put_kernel_asm64() macro in the the kernel  
> header arch/parisc/include/asm/uaccess.h:
>
> #define __put_kernel_asm64(__val,ptr) do {                  \
>        __asm__ __volatile__ (                              \
>                "\n1:\tstw %2,0(%1)"                        \
>                "\n2:\tstw %R2,4(%1)\n\t"                   \
>                : "=r"(__pu_err)                            \
>                : "r"(ptr), "r"(__val), "0"(__pu_err) \
>                : "r1");


Maybe.  On the other hand, if mem was the third argument in the ble  
call, it likely would be possible to write:

register long long lws_ret asm("r28");
register long long lws_old asm("r25");
register long long lws_new asm("r23");
register unsigned long lws_mem asm("r22");

This is consistent with the parisc calling conventions for 64-bit  
objects.  If it works, the low part of lws_ret, etc,
should automatically get allocated to the correct register and the  
copy done efficiently.  Have to say I have
not tried it.

Dave
--
John David Anglin	dave.anglin@bell.net



