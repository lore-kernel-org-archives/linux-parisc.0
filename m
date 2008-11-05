From: Christoph Hellwig <hch@lst.de>
Subject: Re: [RFC] remove dead code from sys_parisc32.c
Date: Wed, 5 Nov 2008 15:08:10 +0100
Message-ID: <20081105140810.GA5411@lst.de>
References: <20080817024151.GA24129@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080817024151.GA24129@lst.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Anyone wants to pick this one up?

On Sun, Aug 17, 2008 at 04:41:51AM +0200, Christoph Hellwig wrote:
> Unless I'm totally missing something get_fd_set32/set_fd_set32 are
> completely unused.
> 
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Index: linux-2.6/arch/parisc/kernel/sys_parisc32.c
> ===================================================================
> --- linux-2.6.orig/arch/parisc/kernel/sys_parisc32.c	2008-08-16 23:40:26.000000000 -0300
> +++ linux-2.6/arch/parisc/kernel/sys_parisc32.c	2008-08-16 23:40:46.000000000 -0300
> @@ -284,68 +284,6 @@ int cp_compat_stat(struct kstat *stat, s
>  	return err;
>  }
>  
> -/*** copied from mips64 ***/
> -/*
> - * Ooo, nasty.  We need here to frob 32-bit unsigned longs to
> - * 64-bit unsigned longs.
> - */
> -
> -static inline int
> -get_fd_set32(unsigned long n, u32 *ufdset, unsigned long *fdset)
> -{
> -	n = (n + 8*sizeof(u32) - 1) / (8*sizeof(u32));
> -	if (ufdset) {
> -		unsigned long odd;
> -
> -		if (!access_ok(VERIFY_WRITE, ufdset, n*sizeof(u32)))
> -			return -EFAULT;
> -
> -		odd = n & 1UL;
> -		n &= ~1UL;
> -		while (n) {
> -			unsigned long h, l;
> -			__get_user(l, ufdset);
> -			__get_user(h, ufdset+1);
> -			ufdset += 2;
> -			*fdset++ = h << 32 | l;
> -			n -= 2;
> -		}
> -		if (odd)
> -			__get_user(*fdset, ufdset);
> -	} else {
> -		/* Tricky, must clear full unsigned long in the
> -		 * kernel fdset at the end, this makes sure that
> -		 * actually happens.
> -		 */
> -		memset(fdset, 0, ((n + 1) & ~1)*sizeof(u32));
> -	}
> -	return 0;
> -}
> -
> -static inline void
> -set_fd_set32(unsigned long n, u32 *ufdset, unsigned long *fdset)
> -{
> -	unsigned long odd;
> -	n = (n + 8*sizeof(u32) - 1) / (8*sizeof(u32));
> -
> -	if (!ufdset)
> -		return;
> -
> -	odd = n & 1UL;
> -	n &= ~1UL;
> -	while (n) {
> -		unsigned long h, l;
> -		l = *fdset++;
> -		h = l >> 32;
> -		__put_user(l, ufdset);
> -		__put_user(h, ufdset+1);
> -		ufdset += 2;
> -		n -= 2;
> -	}
> -	if (odd)
> -		__put_user(*fdset, ufdset);
> -}
> -
>  struct msgbuf32 {
>      int mtype;
>      char mtext[1];
---end quoted text---
