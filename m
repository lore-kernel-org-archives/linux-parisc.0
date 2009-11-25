From: "J. Bruce Fields" <bfields-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>
Subject: Re: [PATCH 4/5] lockd: Remove unused nfsd headers #includes
Date: Wed, 25 Nov 2009 15:10:11 -0500
Message-ID: <20091125201011.GG32502@fieldses.org>
References: <4B0C1EB7.50508@panasas.com> <4B0C1FE0.8040105@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	linux-parisc <linux-parisc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	sparclinux <sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	linux-s390 <linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	NFS list <linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
	pNFS Mailing List <pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org>,
	Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
To: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B0C1FE0.8040105-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
List-ID: <linux-nfs.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 24, 2009 at 08:03:12PM +0200, Boaz Harrosh wrote:
> 
> In what history where these ever needed? Well not
> any more.

Applied, thanks.--b.

> 
> Signed-off-by: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
> ---
>  fs/lockd/svc4proc.c |    4 ----
>  fs/lockd/svcproc.c  |    4 ----
>  2 files changed, 0 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/lockd/svc4proc.c b/fs/lockd/svc4proc.c
> index bd173a6..a7966ee 100644
> --- a/fs/lockd/svc4proc.c
> +++ b/fs/lockd/svc4proc.c
> @@ -11,10 +11,6 @@
>  #include <linux/time.h>
>  #include <linux/slab.h>
>  #include <linux/smp_lock.h>
> -#include <linux/in.h>
> -#include <linux/sunrpc/svc.h>
> -#include <linux/sunrpc/clnt.h>
> -#include <linux/nfsd/nfsd.h>
>  #include <linux/lockd/lockd.h>
>  #include <linux/lockd/share.h>
>  
> diff --git a/fs/lockd/svcproc.c b/fs/lockd/svcproc.c
> index e1d28dd..56c9519 100644
> --- a/fs/lockd/svcproc.c
> +++ b/fs/lockd/svcproc.c
> @@ -11,10 +11,6 @@
>  #include <linux/time.h>
>  #include <linux/slab.h>
>  #include <linux/smp_lock.h>
> -#include <linux/in.h>
> -#include <linux/sunrpc/svc.h>
> -#include <linux/sunrpc/clnt.h>
> -#include <linux/nfsd/nfsd.h>
>  #include <linux/lockd/lockd.h>
>  #include <linux/lockd/share.h>
>  
> -- 
> 1.6.5.2
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
