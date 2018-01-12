From: Kees Cook <keescook@chromium.org>
Subject: Re: [GIT PULL] parisc architecture fixes for 4.15-rc7
Date: Fri, 12 Jan 2018 14:26:56 -0800
Message-ID: <CAGXu5jKdn2CdyqxB9Y6VNGTy8BugAGXtT7Zi6WHTG=EA6xfQ2g@mail.gmail.com>
References: <20180107162123.GA9715@ls3530.fritz.box> <CAGXu5jJ=s8NBBpd9fxr37T+HV8SNunq71AgGwu+Cy7WogPH=xA@mail.gmail.com>
 <20180112215715.GA8246@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20180112215715.GA8246@ls3530.fritz.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 12, 2018 at 1:57 PM, Helge Deller <deller@gmx.de> wrote:
>
>
> Subject: [PATCH] parisc: Hide virtual kernel memory layout
>
> For security reasons do not expose the virtual kernel memory layout to
> userspace.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Cc: stable@vger.kernel.org # 4.15

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

>
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index 48f41399fc0b..cab32ee824d2 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -629,7 +629,12 @@ void __init mem_init(void)
>  #endif
>
>         mem_init_print_info(NULL);
> -#ifdef CONFIG_DEBUG_KERNEL /* double-sanity-check paranoia */
> +
> +#if 0
> +       /*
> +        * Do not expose the virtual kernel memory layout to userspace.
> +        * But keep code for debugging purposes.
> +        */
>         printk("virtual kernel memory layout:\n"
>                "    vmalloc : 0x%px - 0x%px   (%4ld MB)\n"
>                "    memory  : 0x%px - 0x%px   (%4ld MB)\n"



-- 
Kees Cook
Pixel Security
