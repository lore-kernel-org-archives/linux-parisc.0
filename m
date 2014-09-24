From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] parisc:Remove unnecessary FIXMES in init.c
Date: Tue, 23 Sep 2014 22:30:36 -0700
Message-ID: <20140924053036.GA30405@roeck-us.net>
References: <1411523383-9820-1-git-send-email-yocto6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, deller@gmx.de, akpm@linux-foundation.org,
	mgorman@suse.de, julia.lawall@lip6.fr, himangi774@gmail.com,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nicholas Krause <yocto6@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1411523383-9820-1-git-send-email-yocto6@gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Sep 23, 2014 at 09:49:43PM -0400, Nicholas Krause wrote:
> This removes the two fixmes in the file, init.c for compiler hints
> for comments related to compiler hints in linux_gateway_page_addr
> and map_hpux_gateway_page to change from FIXME to HINT in order
> for people reading this code to understand that these are compiler
> hints.
> 

"* const" tells the compiler that a pointer is a constant.
It doesn't tell the compiler that the data shall not be treated
as DP-relative.

FIXME as in: We should find a better way to tell the compiler to
not treat this data as DP-relative.

Can you please stop this ?

Guenter

> Signed-off-by: Nicholas Krause <yocto6@gmail.com>
> ---
>  arch/parisc/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index 0bef864..668102e 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -733,7 +733,7 @@ static void __init pagetable_init(void)
>  static void __init gateway_init(void)
>  {
>  	unsigned long linux_gateway_page_addr;
> -	/* FIXME: This is 'const' in order to trick the compiler
> +	/* HINT: This is 'const' in order to trick the compiler
>  	   into not treating it as DP-relative data. */
>  	extern void * const linux_gateway_page;
>  
> @@ -761,7 +761,7 @@ map_hpux_gateway_page(struct task_struct *tsk, struct mm_struct *mm)
>  	unsigned long start_pte;
>  	unsigned long address;
>  	unsigned long hpux_gw_page_addr;
> -	/* FIXME: This is 'const' in order to trick the compiler
> +	/* HINT: This is 'const' in order to trick the compiler
>  	   into not treating it as DP-relative data. */
>  	extern void * const hpux_gateway_page;
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
