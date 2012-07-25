From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] debug: Do not permit CONFIG_DEBUG_STACK_USAGE=y on IA64
 or PARISC
Date: Wed, 25 Jul 2012 09:45:01 +0200
Message-ID: <20120725074501.GB27950@gmail.com>
References: <4a613b26cc402fb3ed8130cd07a37e76f4c133ef.1342634029.git.tony.luck@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	linux-ia64@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>
To: Tony Luck <tony.luck@intel.com>
Return-path: <linux-ia64-owner@vger.kernel.org>
In-Reply-To: <4a613b26cc402fb3ed8130cd07a37e76f4c133ef.1342634029.git.tony.luck@intel.com>
List-ID: <linux-ia64.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


* Tony Luck <tony.luck@intel.com> wrote:

> The stack_not_used() function in <linux/sched.h> assumes that stacks
> grow downwards. This is not true on IA64 or PARISC, so this function
> would walk off in the wrong direction and into the weeds.
> 
> Found on IA64 because of a compilation failure with recursive dependencies
> on IA64_TASKSIZE and IA64_THREAD_INFO_SIZE.
> 
> Fixing the code is possible, but should be combined with other
> infrastructure additions to set up the "canary" at the end of the stack.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com> (failed allmodconfig build)
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  lib/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index ff5bdee..4a18650 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -714,7 +714,7 @@ config STACKTRACE
>  
>  config DEBUG_STACK_USAGE
>  	bool "Stack utilization instrumentation"
> -	depends on DEBUG_KERNEL
> +	depends on DEBUG_KERNEL && !IA64 && !PARISC

The modern way of doing this is by adding an ARCH_SUPPORTS_ 
flag.

Thanks,

	Ingo
