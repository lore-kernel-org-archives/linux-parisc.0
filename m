From: Luis Henriques <luis.henriques@canonical.com>
Subject: Re: [PATCH] parisc: break out SOCK_NONBLOCK define to own asm header
 file
Date: Tue, 3 Dec 2013 19:28:05 +0000
Message-ID: <20131203192805.GA15906@hercules>
References: <20131130224227.GA23795@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: stable@vger.kernel.org, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20131130224227.GA23795@p100.box>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Nov 30, 2013 at 11:42:27PM +0100, Helge Deller wrote:
> Dear stable kernel maintainers,
> 
> Can you please schedule this patch for inclusion starting from kernel 3.7+ ?
> 
> Upstream commit:
>  38c7937 parisc: break out SOCK_NONBLOCK define to own asm header file
> 
> Cherry-picking will probably not work easily because of this patch which went
> in before: 62748f3 net: introduce SO_MAX_PACING_RATE
> 
> Thanks,
> Helge

Thank you, I am queuing this patch for the 3.11 kernel.

Cheers,
--
Luis


> 
> ---------------- parisc: break out SOCK_NONBLOCK define to own asm
> header file
> 
> Break SOCK_NONBLOCK out to its own asm-file as other arches do. This
> fixes build errors with auditd and probably other packages.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/arch/parisc/include/asm/socket.h b/arch/parisc/include/asm/socket.h
> new file mode 100644
> index 0000000..748016c
> --- /dev/null
> +++ b/arch/parisc/include/asm/socket.h
> @@ -0,0 +1,11 @@
> +#ifndef _ASM_SOCKET_H
> +#define _ASM_SOCKET_H
> +
> +#include <uapi/asm/socket.h>
> +
> +/* O_NONBLOCK clashes with the bits used for socket types.  Therefore we
> + * have to define SOCK_NONBLOCK to a different value here.
> + */
> +#define SOCK_NONBLOCK	0x40000000
> +
> +#endif /* _ASM_SOCKET_H */
> diff --git a/arch/parisc/include/uapi/asm/socket.h b/arch/parisc/include/uapi/asm/socket.h
> index 71700e6..9f2174f 100644
> --- a/arch/parisc/include/uapi/asm/socket.h
> +++ b/arch/parisc/include/uapi/asm/socket.h
> @@ -1,5 +1,5 @@
> -#ifndef _ASM_SOCKET_H
> -#define _ASM_SOCKET_H
> +#ifndef _UAPI_ASM_SOCKET_H
> +#define _UAPI_ASM_SOCKET_H
>  
>  #include <asm/sockios.h>
>  
> @@ -75,9 +75,4 @@
>  
>  #define SO_BUSY_POLL		0x4027
>  
> -/* O_NONBLOCK clashes with the bits used for socket types.  Therefore we
> - * have to define SOCK_NONBLOCK to a different value here.
> - */
> -#define SOCK_NONBLOCK   0x40000000
> -
> -#endif /* _ASM_SOCKET_H */
> +#endif /* _UAPI_ASM_SOCKET_H */
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
