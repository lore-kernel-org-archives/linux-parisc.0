From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Sun, 09 Jun 2013 23:49:37 +0200
Message-ID: <3684361.ciEK0E58Qm@donald.sf-tec.de>
References: <20130609210021.GA1009@p100.box>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart16525093.hNv4dRgXvj"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130609210021.GA1009@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart16525093.hNv4dRgXvj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Helge Deller wrote:
> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> The C8000 workstation (64 bit kernel only) has a somewhat different
> serial port configuration that other models.
> Thonmas Bogendoerfers sent a patch to fix this in September 2010, which
> was now minimally modified by me.

Cool, that explains why it doesn't work for me. And it saves me the time to 
debug what _I_ did wrong ;)

> diff --git a/drivers/tty/serial/8250/8250_gsc.c
> b/drivers/tty/serial/8250/8250_gsc.c index 097dff9..bb91b47 100644
> --- a/drivers/tty/serial/8250/8250_gsc.c
> +++ b/drivers/tty/serial/8250/8250_gsc.c
> @@ -30,6 +30,12 @@ static int __init serial_init_chip(struct parisc_device
> *dev) unsigned long address;
>  	int err;
> 
> +#ifdef CONFIG_64BIT
> +	extern int iosapic_serial_irq(int cellnum);
> +	if (!dev->irq && (dev->id.sversion == 0xad))
> +		dev->irq = iosapic_serial_irq(dev->mod_index-1);
> +#endif
> +

Forward declaration in the middle of a function. Is this permitted? By 
standard and by coding style? Looks strange to me.

>  	if (!dev->irq) {
>  		/* We find some unattached serial ports by walking native
>  		 * busses.  These should be silently ignored.  Otherwise,
> @@ -51,7 +57,8 @@ static int __init serial_init_chip(struct parisc_device
> *dev) memset(&uart, 0, sizeof(uart));
>  	uart.port.iotype	= UPIO_MEM;
>  	/* 7.272727MHz on Lasi.  Assumed the same for Dino, Wax and Timi. */
> -	uart.port.uartclk	= 7272727;
> +	uart.port.uartclk	= (dev->id.sversion != 0xad) ?
> +					7272727 : 1843200;

If there is a nice comment explaining 72 another nice comment for the other 
number should be added.

Eike
--nextPart16525093.hNv4dRgXvj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlG0+HsACgkQXKSJPmm5/E635gCgnZBmjTZFW9bSSSJhZV3uXuZr
db8AoKXLAmdGg0IwWqrHN1eveT/E+73u
=AgGd
-----END PGP SIGNATURE-----

--nextPart16525093.hNv4dRgXvj--

