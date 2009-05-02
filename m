From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 3/5] parisc: use new macros for .data.init_task.
Date: Sat, 02 May 2009 07:13:37 +0200
Message-ID: <49FBD681.9080605@gmx.de>
References: <1241135719-9286-1-git-send-email-tabbott@mit.edu> <1241135719-9286-2-git-send-email-tabbott@mit.edu> <1241135719-9286-3-git-send-email-tabbott@mit.edu> <1241135719-9286-4-git-send-email-tabbott@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sam Ravnborg <sam@ravnborg.org>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Anders Kaseorg <andersk@mit.edu>,
	Waseem Daher <wdaher@mit.edu>,
	Denys Vlasenko <vda.linux@googlemail.com>,
	Jeff Arnold <jbarnold@mit.edu>,
	Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Tim Abbott <tabbott@MIT.EDU>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1241135719-9286-4-git-send-email-tabbott@mit.edu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Tim Abbott wrote:
> .data.init_task should not need a separate output section; this change
> moves it into the .data section.
> 
> Signed-off-by: Tim Abbott <tabbott@mit.edu>
> Cc: Kyle McMartin <kyle@mcmartin.ca>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org


I think this patch is wrong, although it is theoretically correct.

IIRC, gcc on hppa is not able to provide an alignment >= 8k, which is
why we have done the 16k alignment inside the linker script.
So, I think this change will prevent the parisc kernel to boot up.
Needs testing.

Helge

> ---
>  arch/parisc/kernel/init_task.c   |    2 +-
>  arch/parisc/kernel/vmlinux.lds.S |   10 ++--------
>  2 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/parisc/kernel/init_task.c b/arch/parisc/kernel/init_task.c
> index 1e25a45..8ee17ea 100644
> --- a/arch/parisc/kernel/init_task.c
> +++ b/arch/parisc/kernel/init_task.c
> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(init_mm);
>   * "init_task" linker map entry..
>   */
>  union thread_union init_thread_union
> -	__attribute__((aligned(128))) __attribute__((__section__(".data.init_task"))) =
> +	__attribute__((aligned(128))) __init_task_data =
>  		{ INIT_THREAD_INFO(init_task) };
>  
>  #if PT_NLEVELS == 3
> diff --git a/arch/parisc/kernel/vmlinux.lds.S b/arch/parisc/kernel/vmlinux.lds.S
> index b5936c9..c8a528d 100644
> --- a/arch/parisc/kernel/vmlinux.lds.S
> +++ b/arch/parisc/kernel/vmlinux.lds.S
> @@ -103,6 +103,8 @@ SECTIONS
>  	. = ALIGN(L1_CACHE_BYTES);
>  	/* Data */
>  	.data : {
> +		/* assembler code expects init_task to be 16k aligned */
> +		INIT_TASK_DATA(16384)
>  		NOSAVE_DATA
>  		CACHELINE_ALIGNED_DATA(L1_CACHE_BYTES)
>  		DATA_DATA
> @@ -133,14 +135,6 @@ SECTIONS
>  	}
>  	__bss_stop = .;
>  
> -
> -	/* assembler code expects init_task to be 16k aligned */
> -	. = ALIGN(16384);
> -	/* init_task */
> -	.data.init_task : {
> -		*(.data.init_task)
> -	}
> -
>  #ifdef CONFIG_64BIT
>  	. = ALIGN(16);
>  	/* Linkage tables */

