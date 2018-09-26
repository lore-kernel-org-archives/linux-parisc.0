From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] parisc: Remove PTE load and fault check from L2_ptep
 macro
Date: Tue, 25 Sep 2018 20:21:01 -0700
Message-ID: <20180926032101.GA2458@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: jejb@parisc-linux.org, Helge Deller <deller@gmx.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Sun, Sep 23, 2018 at 10:55:18AM -0400, John David Anglin wrote:
> This change removes the PTE load and present check from the L2_ptep
> macro.  The load and check for kernel pages is now done in the tlb_lock
> macro.  This avoids a double load and check for user pages.  The load
> and check for user pages is now done inside the lock so the fault
> handler can't be called while the entry is being updated.
> 

This patch causes my parisc qemu tests to fail.
Unfortunately I don't have any useful log output; the failure
is silent. Reverting the patch fixes the problem.

Guenter

> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  arch/parisc/kernel/entry.S | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
> index eeee1d2c4b8e..3371472379a6 100644
> --- a/arch/parisc/kernel/entry.S
> +++ b/arch/parisc/kernel/entry.S
> @@ -431,8 +431,6 @@
>  	extru		\va,31-PAGE_SHIFT,ASM_BITS_PER_PTE,\index
>  	dep		%r0,31,PAGE_SHIFT,\pmd  /* clear offset */
>  	shladd		\index,BITS_PER_PTE_ENTRY,\pmd,\pmd /* pmd is now pte */
> -	LDREG		%r0(\pmd),\pte
> -	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
>  	.endm
>  
>  	/* Look up PTE in a 3-Level scheme.
> @@ -463,7 +461,7 @@
>  	L2_ptep		\pgd,\pte,\index,\va,\fault
>  	.endm
>  
> -	/* Acquire pa_tlb_lock lock and recheck page is still present. */
> +	/* Acquire pa_tlb_lock lock and check page is present. */
>  	.macro		tlb_lock	spc,ptp,pte,tmp,tmp1,fault
>  #ifdef CONFIG_SMP
>  	cmpib,COND(=),n	0,\spc,2f
> @@ -472,10 +470,12 @@
>  	cmpib,COND(=)	0,\tmp1,1b
>  	nop
>  	LDREG		0(\ptp),\pte
> -	bb,<,n		\pte,_PAGE_PRESENT_BIT,2f
> +	bb,<,n		\pte,_PAGE_PRESENT_BIT,3f
>  	b		\fault
>  	stw		 \spc,0(\tmp)
> -2:
> +2:	LDREG		0(\ptp),\pte
> +	bb,>=,n		\pte,_PAGE_PRESENT_BIT,\fault
> +3:
>  #endif
>  	.endm
>  
> -- 
> 2.7.4
