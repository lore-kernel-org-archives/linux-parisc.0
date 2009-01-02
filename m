From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Remove gcc 4.1.0 quirk from init/main.c
Date: Fri, 2 Jan 2009 19:05:59 +0100
Message-ID: <20090102180559.GA5905@uranus.ravnborg.org>
References: <alpine.LFD.2.00.0812310942110.5086@localhost.localdomain> <20081231.141408.60544902.davem@davemloft.net> <20090102115547.GB3027@elte.hu> <200901021443.58769.bzolnier@gmail.com> <20090102152124.GA19091@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	David Miller <davem@davemloft.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	akpm@linux-foundation.org, rdreier@cisco.com,
	ian.campbell@citrix.com, jeremy.fitzhardinge@citrix.com,
	deller@gmx.de, rusty@rustcorp.com.au, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kyle@mcmartin.ca, randolph@tausq.org,
	dave@hiauly1.hia.nrc.ca
To: Ingo Molnar <mingo@elte.hu>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102152124.GA19091@elte.hu>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> From d23cbaaa342e5555a919a543095d656415a55950 Mon Sep 17 00:00:00 2001
> From: Ingo Molnar <mingo@elte.hu>
> Date: Fri, 2 Jan 2009 16:16:16 +0100
> Subject: [PATCH] kbuild: Remove gcc 4.1.0 quirk from init/main.c
> 
> Impact: cleanup
> 
> We now have a cleaner check for gcc 4.1.0/4.1.1 trouble in
> include/linux/compiler.h, so remove the 4.1.0 quirk from
> init/main.c.
> 
> Reported-by: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
> Signed-off-by: Ingo Molnar <mingo@elte.hu>

This should be applied despite Linus' different approach in compiler.h.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  init/main.c |    9 ---------
>  1 files changed, 0 insertions(+), 9 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 2a7ce0f..5ced153 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -75,15 +75,6 @@
>  #include <asm/smp.h>
>  #endif
>  
> -/*
> - * This is one of the first .c files built. Error out early if we have compiler
> - * trouble.
> - */
> -
> -#if __GNUC__ == 4 && __GNUC_MINOR__ == 1 && __GNUC_PATCHLEVEL__ == 0
> -#warning gcc-4.1.0 is known to miscompile the kernel.  A different compiler version is recommended.
> -#endif
> -
>  static int kernel_init(void *);
>  
>  extern void init_IRQ(void);
