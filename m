Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA22369
	for <parisc-linux@puffin.external.hp.com>; Mon, 15 Jan 2001 13:21:33 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A63562E.2DA228AC@uswest.net>
Date: Mon, 15 Jan 2001 12:57:35 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Greg Ingram <ingram@symsys.com>
CC: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting C100
References: <Pine.LNX.4.21.0101151256070.23322-100000@maestro.symsys.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Greg,

The ccio detection via GSC port is really a hack.   I will commit your patch
since we do not have a better way to detect the driver atm :)  Hopefully my
local tree will shape up today, and I can commit a new and improved ccio
driver.  Than I will start working on the I/O tree to eliminate this hack.

Thanks for the patch!

- Ryan



Greg Ingram wrote:

> Okay, I grabbed the cross-compiler and various sources and managed to
> build a booting image.  Woohoo!  I also tried the lifimage you just posted
> to the FTP site.  Both kernels died at GSC detection because it didn't
> know the address f5fbf000.  I made this little change to ccio-dma.c:
>
> --- arch/parisc/kernel/ccio-dma.c.orig  Mon Jan 15 12:40:05 2001
> +++ arch/parisc/kernel/ccio-dma.c       Mon Jan 15 13:05:01 2001
> @@ -1174,6 +1174,7 @@
>  ** that can't be detected by PA/EISA/PCI bus walks.
>  */
>         switch((long) d->hpa) {
> +       case 0xf5fbf000L:       /* C1O0 (wild guess!) */
>         case 0xf7fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>         case 0xf3fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>                 /* ccio_hpa same as C200 IOA0 */
>
> It got past that point but crashed later.  Full boot log follows. I'm
> looking at excluding the GSC stuff to see if the problem goes
> away.  Updates at 11.
>
> - Greg
>

[bootlog snipped]
