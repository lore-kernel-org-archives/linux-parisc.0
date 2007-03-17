From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [PATCH] limit thread stack size with >4K pages
Date: Sat, 17 Mar 2007 08:47:44 -0500
Message-ID: <1174139264.3476.1.camel__33272.1682418652$1416624328$gmane$org@mulgrave.il.steeleye.com>
References: <200703171323.06002.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@mcmartin.ca>
To: Helge Deller <deller@gmx.de>
Return-Path: <James.Bottomley@SteelEye.com>
In-Reply-To: <200703171323.06002.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 2007-03-17 at 13:23 +0100, Helge Deller wrote:
> -#define THREAD_ORDER            2
> +#if defined(CONFIG_PARISC_PAGE_SIZE_4KB)
> +# define THREAD_ORDER  2
> +#elif defined(CONFIG_PARISC_PAGE_SIZE_16KB)
> +# define THREAD_ORDER  0
> +#elif defined(CONFIG_PARISC_PAGE_SIZE_64KB)
> +# define THREAD_ORDER  0
> +#endif

That's a bit ugly ... and would break if someone added new page sizes.
Can't we do something like

#if PAGE_BITS > 16
#define THREAD_ORDER 0
#else
#define THREAD_ORDER (16 - PAGE_BITS)
#endif

?

James
