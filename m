From: "Helge Deller" <deller@gmx.de>
Subject: Aw: Re: [PATCH] parisc,metag: Do not hardcode maximum userspace
 stack size
Date: Thu, 1 May 2014 20:08:43 +0200
Message-ID: <trinity-76250833-dcae-4a03-b601-f20768eaede4-1398967722991@3capp-gmx-bs06>
References: <20140430212602.GA20601@p100.fritz.box>,
 <53622DBA.807@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	"James Bottomley" <James.Bottomley@HansenPartnership.com>,
	"John David Anglin" <dave.anglin@bell.net>,
	linux-metag@vger.kernel.org
To: "James Hogan" <james.hogan@imgtec.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53622DBA.807@imgtec.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi James,

> I'd like to take this patch and submit upstream for v3.15, and mark for stable.
> Would that be okay with you?
> [...]
> How does the v2 below look?

Your patch looks good.
Thanks for cleaning it up and moving the config option to the better place.
I just tested it on parisc and it works as expected.

I'm absolutely fine if you push your version of the patch through the metag git tree upstream.

Thanks!
Helge  

 
> From c34f0ec062ae1a2c9fca3eddbc705f6b0faf97ca Mon Sep 17 00:00:00 2001
> From: Helge Deller <deller@gmx.de>
> Date: Wed, 30 Apr 2014 23:26:02 +0200
> Subject: [PATCH v2] parisc,metag: Do not hardcode maximum userspace stack
>  size
> 
> This patch affects only architectures where the stack grows upwards
> (currently parisc and metag only). On those do not hardcode the maximum
> initial stack size to 1GB, but make it configurable via a config option.
> 
> The main problem with the hardcoded stack size is, that we have two
> memory regions which grow upwards: stack and heap. To keep most of the
> memory available for heap in a flexmap memoy layout, it makes no sense
> to hard allocate up to 1GB of the memory for stack which can't be used
> as heap then.
> 
> This patch makes the stack size configurable and uses 80MB as default
> value which has been in use during the last few years on parisc and
> which didn't showed any problems yet.
> 
> This also fixes a BUG on metag if the RLIMIT_STACK hard limit is
> increased beyond a safe value by root. E.g. when starting a process
> after running "ulimit -H -s unlimited" it will then attempt to use a
> stack size of the maximum 1GB which is far too big for metag's limited
> user virtual address space (stack_top is usually 0x3ffff000):
> BUG: failure at fs/exec.c:589/shift_arg_pages()!
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-metag@vger.kernel.org
> Cc: John David Anglin <dave.anglin@bell.net>
> Cc: stable@vger.kernel.org
> ---
> v2 (James Hogan):
>  - updated description to mention BUG on metag.
>  - added custom range limit for METAG.
>  - moved Kconfig symbol to mm/Kconfig and reworded.
>  - fixed "matag" typo.
> ---
>  arch/parisc/kernel/sys_parisc.c |  6 +++---
>  fs/exec.c                       |  6 +++---
>  mm/Kconfig                      | 15 +++++++++++++++
>  3 files changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
> index 31ffa9b55322..9f040261151e 100644
> --- a/arch/parisc/kernel/sys_parisc.c
> +++ b/arch/parisc/kernel/sys_parisc.c
> @@ -72,10 +72,10 @@ static unsigned long mmap_upper_limit(void)
>  {
>  	unsigned long stack_base;
> 
> -	/* Limit stack size to 1GB - see setup_arg_pages() in fs/exec.c */
> +	/* Limit stack size - see setup_arg_pages() in fs/exec.c */
>  	stack_base = rlimit_max(RLIMIT_STACK);
> -	if (stack_base > (1 << 30))
> -		stack_base = 1 << 30;
> +	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
> +		stack_base = CONFIG_MAX_STACK_SIZE_MB*1024*1024;
> 
>  	return PAGE_ALIGN(STACK_TOP - stack_base);
>  }
> diff --git a/fs/exec.c b/fs/exec.c
> index 476f3ebf437e..994108cc60f3 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -657,10 +657,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
>  	unsigned long rlim_stack;
> 
>  #ifdef CONFIG_STACK_GROWSUP
> -	/* Limit stack size to 1GB */
> +	/* Limit stack size */
>  	stack_base = rlimit_max(RLIMIT_STACK);
> -	if (stack_base > (1 << 30))
> -		stack_base = 1 << 30;
> +	if (stack_base > CONFIG_MAX_STACK_SIZE_MB*1024*1024)
> +		stack_base = CONFIG_MAX_STACK_SIZE_MB*1024*1024;
> 
>  	/* Make sure we didn't let the argument array grow too large. */
>  	if (vma->vm_end - vma->vm_start > stack_base)
> diff --git a/mm/Kconfig b/mm/Kconfig
> index ebe5880c29d6..e80075979530 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -581,3 +581,18 @@ config PGTABLE_MAPPING
> 
>  config GENERIC_EARLY_IOREMAP
>  	bool
> +
> +config MAX_STACK_SIZE_MB
> +	int "Maximum user stack size (MB)"
> +	default 80
> +	range 8 256 if METAG
> +	range 8 2048
> +	depends on STACK_GROWSUP
> +	help
> +	  This is the maximum stack size in Megabytes in the VM layout of user
> +	  processes when the stack grows upwards (currently only on parisc and
> +	  metag arch). The stack will be located at the highest memory address
> +	  minus the given value, unless the RLIMIT_STACK hard limit is changed
> +	  to a smaller value in which case that is used.
> +
> +	  A sane initial value is 80 MB.
> -- 
