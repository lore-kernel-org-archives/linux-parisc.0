From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [parisc-linux] Re: [PATCH] missing exports
Date: Sat, 10 Jul 2004 20:08:12 +0200 (MEST)
Message-ID: <Pine.GSO.4.58.0407102004350.10242@waterleaf.sonytel.be>
References: <1067288209.3591.1.camel@kars.perseus.home>
 <Pine.GSO.4.58.0407101107240.10242@waterleaf.sonytel.be>
 <20040710130529.GP5889@parcelfarce.linux.theplanet.co.uk>
 <200407101555.18830.deller@gmx.de> <1089477389.2474.129.camel@kars.perseus.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
 Matthew Wilcox <willy@debian.org>,
 Linux/m68k kernel mailing list <linux-m68k@lists.linux-m68k.org>,
 parisc-linux@parisc-linux.org
To: Kars de Jong <jongk@linux-m68k.org>
In-Reply-To: <1089477389.2474.129.camel@kars.perseus.home>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 10 Jul 2004, Kars de Jong wrote:
> On Sat, 2004-07-10 at 15:55, Helge Deller wrote:
> > On Saturday 10 July 2004 15:05, Matthew Wilcox wrote:
> OK, here they are. Nothing to fix the reliability issues though, I'm
> affraid.
>
> I needed remove the __exit marker from hp_sdc_exit() because the linker
> didn't like it being called from hp_sdc_register():
>
> drivers/built-in.o: In function `hp_sdc_register':
> drivers/built-in.o(.init.text+0x396e): undefined reference to `local symbols in discarded section .exit.text'
>
> I don't really know what that means, seems like it doesn't like calling
> an __exit function from an __init function.

Indeed, __exit functions may be discarded.

> --- /tmp/parisc/include/linux/hp_sdc.h	Sat Jul 10 15:47:56 2004
> +++ /usr/src/linux-2.6-m68k-hp/include/linux/hp_sdc.h	Thu Jun 24 21:51:11 2004
> @@ -284,6 +286,9 @@
>  #ifdef __hppa__
>  	struct parisc_device	*dev;
>  	int		dev_err;	/* carries status from registration */
> +#elif defined(__mc68000__)
> +	void		*dev;
> +	int		dev_err;	/* carries status from registration */

You can merge dev_err as well.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
