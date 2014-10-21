From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix out-of-register compiler error in ldcw inline
 assembler function
Date: Tue, 21 Oct 2014 16:01:00 -0400
Message-ID: <BLU436-SMTP234E0B9D24642C60497B1EB97940@phx.gbl>
References: <20141021194614.GA14418@ls3530.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141021194614.GA14418@ls3530.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/21/2014 3:46 PM, Helge Deller wrote:
>   /* LDCW, the only atomic read-write operation PA-RISC has. *sigh*.  */
> -#define __ldcw(a) ({						\
> -	unsigned __ret;						\
> -	__asm__ __volatile__(__LDCW " 0(%2),%0"			\
> -		: "=r" (__ret), "+m" (*(a)) : "r" (a));		\
> -	__ret;							\
> -})
> +static inline unsigned int __ldcw(volatile unsigned int *address)
> +{
> +	unsigned int ret;
> +	register volatile unsigned int *a = address;
> +	__asm__ __volatile__(__LDCW " 0(%2),%0"
> +		: "=r" (ret), "+m" (*(a)) : "r" (a));
> +	return ret;
> +}
You could keep the old macro version for 32-bit builds as the problem 
shouldn't occur there.

Dave

-- 
John David Anglin    dave.anglin@bell.net

