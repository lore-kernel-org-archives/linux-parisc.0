From: "J. Bruce Fields" <bfields-vtMw8L3fJ9vSiEDVxGk4TQ@public.gmane.org>
Subject: Re: [PATCH 5/5] vfs: nfsctl.c unused nfsd #includes
Date: Wed, 25 Nov 2009 15:13:15 -0500
Message-ID: <20091125201315.GH32502@fieldses.org>
References: <4B0C1EB7.50508@panasas.com> <4B0C201C.4040400@panasas.com>
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
In-Reply-To: <4B0C201C.4040400-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
List-ID: <linux-nfs.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 24, 2009 at 08:04:12PM +0200, Boaz Harrosh wrote:
> 
> Only linux/nfsd/syscall.h is actually used. Remove the
> other nfsd #includes, so they can be moved to source
> directory.

I guess I'll take this one too.

The arch-specific ones I'm assuming are someone else's problem unless I
hear otherwise.

--b.

> 
> Signed-off-by: Boaz Harrosh <bharrosh-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
> ---
>  fs/nfsctl.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/nfsctl.c b/fs/nfsctl.c
> index 8f9a205..d3854d9 100644
> --- a/fs/nfsctl.c
> +++ b/fs/nfsctl.c
> @@ -7,8 +7,6 @@
>  #include <linux/types.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
> -#include <linux/sunrpc/svc.h>
> -#include <linux/nfsd/nfsd.h>
>  #include <linux/nfsd/syscall.h>
>  #include <linux/cred.h>
>  #include <linux/sched.h>
> -- 
> 1.6.5.2
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
