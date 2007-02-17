From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] statfs() problem with glibc-2.5
Date: Sat, 17 Feb 2007 11:06:42 -0500
Message-ID: <20070217160642.GC2880__31003.9598298774$1416624291$gmane$org@athena.road.mcmartin.ca>
References: <20070212102844.f045d760.gmsoft@gentoo.org>
	<20070212153731.846e2ad3.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070212153731.846e2ad3.gmsoft@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

You're missing Signed-off-by, and since you don't have commit access, I
cannot implicitly add it. Please resend the patch with your S-o-b line added.

> diff --git a/arch/parisc/kernel/syscall_table.S b/arch/parisc/kernel/syscall_table.S
> index 5114666..fb6788f 100644
> --- a/arch/parisc/kernel/syscall_table.S
> +++ b/arch/parisc/kernel/syscall_table.S
> @@ -403,5 +403,7 @@
>  	ENTRY_COMP(move_pages)		/* 295 */
>  	ENTRY_SAME(getcpu)
>  	ENTRY_SAME(epoll_pwait)
> +	ENTRY_COMP(statfs64)
> +	ENTRY_COMP(fstatfs64)
>  	/* Nothing yet */
>  
> diff --git a/include/asm-parisc/unistd.h b/include/asm-parisc/unistd.h
> index 7c1bb8b..4369991 100644
> --- a/include/asm-parisc/unistd.h
> +++ b/include/asm-parisc/unistd.h
> @@ -790,6 +790,8 @@
>  #define __NR_move_pages		(__NR_Linux + 295)
>  #define __NR_getcpu		(__NR_Linux + 296)
>  #define __NR_epoll_pwait	(__NR_Linux + 297)
> +#define __NR_statfs64		(__NR_Linux + 298)
> +#define __NR_fstatfs64		(__NR_Linux + 299)
>  
>  #define __NR_Linux_syscalls     298
>  

> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
