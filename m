From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix a bug when syscall number of tracee is
 __NR_Linux_syscalls
Date: Wed, 27 Apr 2016 21:23:12 +0200
Message-ID: <572111A0.706@gmx.de>
References: <20160427015611.GA23316@altlinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: Mike Frysinger <vapier@gentoo.org>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: "Dmitry V. Levin" <ldv@altlinux.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160427015611.GA23316@altlinux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 27.04.2016 03:56, Dmitry V. Levin wrote:
> Do not load one entry beyond the end of the syscall table when the
> syscall number of a traced process equals to __NR_Linux_syscalls.
> Similar bug with regular processes was fixed by commit 3bb457af4fa8
> ("[PARISC] Fix bug when syscall nr is __NR_Linux_syscalls").
> 
> This bug was found by strace test suite.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

Acked-by: Helge Deller <deller@gmx.de>

Thanks!

Helge

> ---
>  arch/parisc/kernel/syscall.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/parisc/kernel/syscall.S b/arch/parisc/kernel/syscall.S
> index c976ebf..57b4836 100644
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -344,7 +344,7 @@ tracesys_next:
>  #endif
>  
>  	cmpib,COND(=),n -1,%r20,tracesys_exit /* seccomp may have returned -1 */
> -	comiclr,>>=	__NR_Linux_syscalls, %r20, %r0
> +	comiclr,>>	__NR_Linux_syscalls, %r20, %r0
>  	b,n	.Ltracesys_nosys
>  
>  	LDREGX  %r20(%r19), %r19
> 

