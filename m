Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E90E5482B
	for <parisc-linux@parisc-linux.org>; Tue, 19 Jun 2001 10:16:30 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] fbcon diff
Date: Tue, 19 Jun 2001 18:15:41 +0200
References: <20010618200635.P10186@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20010618200635.P10186@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Message-Id: <20010619161630.E90E5482B@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Hi Matthew,

I absolutely agree with you.

The part behind "#elif defined(__hppa__) && !(USE_HPPA_IOREMAP)" should and 
will go away anyway, but the change from direct memory addressing to 
readX()/writeX() modifies generic linux code, could break other arches and 
should IMHO be discussed with Geert, Alan Cox or Linus directly and not be 
changed reclusively in our tree.

Greetings,
Helge


On Monday, 18. June 2001 21:06, Matthew Wilcox wrote:

> IMO, fbcon.h should look more like this:
>
> Index: include/video/fbcon.h
> ===================================================================
> RCS file: /home/cvs/parisc/linux/include/video/fbcon.h,v
> retrieving revision 1.7
> diff -u -p -r1.7 fbcon.h
> --- fbcon.h	2001/06/17 22:27:04	1.7
> +++ fbcon.h	2001/06/18 19:05:09
> @@ -205,19 +205,6 @@ extern int set_all_vcs(int fbidx, struct
>  #define fb_writel sbus_writel
>  #define fb_memset sbus_memset_io
>
> -#elif defined(__hppa__) && !(USE_HPPA_IOREMAP)
> -
> -/* When we switch to ioremap() usage the following defines will
> - * be removed and we'll use the arch-independend generic
> - * functions below instead. */
> -#define fb_readb gsc_readb
> -#define fb_readw gsc_readw
> -#define fb_readl gsc_readl
> -#define fb_writeb gsc_writeb
> -#define fb_writew gsc_writew
> -#define fb_writel gsc_writel
> -#define fb_memset gsc_memset_io
> -
>  #elif defined(__i386__) || defined(__alpha__)
>
>  #define fb_readb __raw_readb
> @@ -230,13 +217,13 @@ extern int set_all_vcs(int fbidx, struct
>
>  #else
>
> -#define fb_readb(addr) (*(volatile u8 *) (addr))
> -#define fb_readw(addr) (*(volatile u16 *) (addr))
> -#define fb_readl(addr) (*(volatile u32 *) (addr))
> -#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
> -#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
> -#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
> -#define fb_memset memset
> +#define fb_readb(addr) readb(addr)
> +#define fb_readw(addr) readw(addr)
> +#define fb_readl(addr) readl(addr)
> +#define fb_writeb(b,addr) writeb(b,addr)
> +#define fb_writew(b,addr) writew(b,addr)
> +#define fb_writel(b,addr) writel(b,addr)
> +#define fb_memset(addr, c, len) memset_io((unsigned long)addr, c, len)
>
>  #endif
