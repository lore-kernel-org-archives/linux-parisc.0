From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc] ptrace breakage
Date: Sun, 09 Dec 2012 10:19:51 +0000
Message-ID: <1355048391.10297.3.camel@dabdike>
References: <20121209061614.GE4939@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20121209061614.GE4939@ZenIV.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2012-12-09 at 06:16 +0000, Al Viro wrote:
> 	1) PTRACE_SYSCALL doesn't work for 64bit process on parisc64.
> Compat syscall table is used instead of 64bit one.  IMO we should either
> refuse to allow PTRACE_SYSCALL for 64bit processes or duplicate the
> logics choosing the right syscall table into .Ltracesys.

We don't have a 64 bit userspace (except for a toy one I created to test
out a few thing), so I'd be happy returning -ENOSYS.

> 	2) if you have let the tracee run with PTRACE_SYSCALL and
> it had stopped, you can use PTRACE_POKEUSR to modify syscall number
> (r20) and arguments 1--4 (r26--r23).  Modifications will have effect.
> However, modifying arguments 5 and 6 (r22 and r21 resp.) works only
> when process (32bit one) runs on 64bit host - on 32bit one it has no
> effect.  AFAICS, the diff below should fix that one.
> 
> 	Comments?
> 
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index 86742df..5e05524 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -309,10 +309,13 @@ tracesys_next:
>  	LDREG   TASK_PT_GR25(%r1), %r25
>  	LDREG   TASK_PT_GR24(%r1), %r24
>  	LDREG   TASK_PT_GR23(%r1), %r23
> -#ifdef CONFIG_64BIT
>  	LDREG   TASK_PT_GR22(%r1), %r22
>  	LDREG   TASK_PT_GR21(%r1), %r21
> +#ifdef CONFIG_64BIT
>  	ldo	-16(%r30),%r29			/* Reference param save area */
> +#else
> +	stw     %r22, -52(%r30)                 /* 5th argument */
> +	stw     %r21, -56(%r30)                 /* 6th argument */
>  #endif

I'll defer to the glibc guys on this.  The code before you modified it
is correct according to the ABI, but it does look like gate calls are
done with 8 args in registers on 32 bit in which case the above would be
correct.

James


