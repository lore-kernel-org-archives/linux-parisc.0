From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 12/13] tty: serial: 8250: Removed warning in debug
 output
Date: Mon, 11 Jan 2016 14:42:12 +0200
Message-ID: <1452516132.26146.16.camel@linux.intel.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	 <1452275039-18787-13-git-send-email-anton.wuerfel@fau.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: Jiri Slaby <jslaby@suse.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	Peter Hurley <peter@hurleysoftware.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Qipeng Zha <qipeng.zha@intel.com>,
	Desmond Liu <desmondl@broadcom.com>,
	Wang Long <long.wanglong@huawei.com>,
	Matt Redfearn <matt.redfearn@imgtec.com>,
	Paul Burton <paul.burton@imgtec.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Peter Hung <hpeter@gmail.com>,
	Soeren Grunewald <soeren.grunewald@desy.de>,
	Adam Lee <adam.lee@canonical.com>,
	"Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
	Mans Rullgard <mans@mansr.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-kernel@i4.cs.fau.de,
	phillip.raffeck@fau.de
To: Anton Wuerfel <anton.wuerfel@fau.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1452275039-18787-13-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2016-01-08 at 18:43 +0100, Anton Wuerfel wrote:
> This patch fixes type warnings in a debug output in 8250_pnp.c.
> Those warnings never got triggered, because the command was nested
> in an #ifdef, which is removed by a patch of this series.

Would be nice to cite the warning line from compiler or sparse (which
one, btw?)

Also, patch does not fix a warning. Rephrase title and commit message
in an appropriate way.

>=20
> Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
> Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
> CC: linux-kernel@i4.cs.fau.de
> ---
> =C2=A0drivers/tty/serial/8250/8250_pnp.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_pnp.c
> b/drivers/tty/serial/8250/8250_pnp.c
> index ba3a1af..e99282f 100644
> --- a/drivers/tty/serial/8250/8250_pnp.c
> +++ b/drivers/tty/serial/8250/8250_pnp.c
> @@ -465,8 +465,8 @@ serial_pnp_probe(struct pnp_dev *dev, const
> struct pnp_device_id *dev_id)
> =C2=A0		return -ENODEV;
> =C2=A0
> =C2=A0	dev_dbg(&dev->dev,
> -		=C2=A0"Setup PNP port: port %x, mem 0x%lx, irq %d, type
> %d\n",
> -		=C2=A0uart.port.iobase, uart.port.mapbase,
> +		=C2=A0"Setup PNP port: port %lx, mem 0x%lx, irq %d, type
> %d\n",
> +		=C2=A0uart.port.iobase, (unsigned long)
> uart.port.mapbase,

No need to have a space after ).

> =C2=A0		=C2=A0uart.port.irq, uart.port.iotype);
> =C2=A0
> =C2=A0	if (flags & CIR_PORT) {

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
