Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D89C7482A
	for <parisc-linux@parisc-linux.org>; Tue, 16 Oct 2001 22:35:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15tiQn-00069G-00; Wed, 17 Oct 2001 05:35:49 +0100
Date: Wed, 17 Oct 2001 05:35:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>,
	Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new glibc dpatch
Message-ID: <20011017053549.A22885@parcelfarce.linux.theplanet.co.uk>
References: <20011017004218.K15532@parcelfarce.linux.theplanet.co.uk> <20011017001453.A11826@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011017001453.A11826@megatonmonkey.net>; from carlos@megatonmonkey.net on Wed, Oct 17, 2001 at 12:14:53AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 17, 2001 at 12:14:53AM -0400, Carlos O'Donell Jr. wrote:
> Just a comment about your changes to ./sysdeps/ia64/dl-fptr.c
> 
> =====
> --- glibc22-hppa.dpatch	Tue Oct 16 20:52:02 2001
> +++ glibc22-hppa.dpatch.mw	Tue Oct 16 21:05:27 2001
> @@ -1135,7 +1135,7 @@
>       unsigned int npages;		/* # of pages to allocate */
>   #ifdef _LIBC_REENTRANT
>  -    volatile int lock;
> -+    __atomic_lock_t lock;
> ++    static __atomic_lock_t lock = __ATOMIC_LOCK_INIT;
>       sigset_t full_sigset;
>   #endif
>       /* the next to members MUST be consecutive! */
> =====

I'm not sure what meaning static would have in this context.  It doesn't
have to be initialised because every arch other than PA defines an
unlocked lock to be 0.  If it gets initialised, it gets put in .data
(instead of .bss), even if you're initialising it to 0.  Stupid, I know.

-- 
Revolutions do not require corporate support.
