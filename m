From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 01/13] tty: serial: 8250: Fix whitespace errors
Date: Mon, 11 Jan 2016 14:28:14 +0200
Message-ID: <1452515294.26146.10.camel@linux.intel.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	 <1452275039-18787-2-git-send-email-anton.wuerfel@fau.de>
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
In-Reply-To: <1452275039-18787-2-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2016-01-08 at 18:43 +0100, Anton Wuerfel wrote:
> This patch fixes whitespace errors reported by checkpatch to increase
> readability. Main focus is on missing spaces after commas in
> function headers and macros (like foo,bar edited to foo, bar).
>=20
> Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
> Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
> CC: linux-kernel@i4.cs.fau.de

Cc: looks more standard.

> --- a/drivers/tty/serial/8250/8250_accent.c
> +++ b/drivers/tty/serial/8250/8250_accent.c
> @@ -10,7 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/serial_8250.h>
> =C2=A0
> -#define PORT(_base,_irq)				\
> +#define PORT(_base, _irq)				\
> =C2=A0	{						\
> =C2=A0		.iobase		=3D _base,		\
> =C2=A0		.irq		=3D _irq,			\
>=20

While those are okay, I would suggest to make a macro in
drivers/=E2=80=A6/8250.h one for all, something like this:

#define 8250_PORT_FLAGS(_base, _irq, _flags)
=E2=80=A6
	.flags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D =
UPF_BOOT_AUTOCONF | (_flags) \

#define 8250_PORT(_base, _irq)	8250_PORT_FLAGS(_base, _irq, 0)

And use it.

> --- a/drivers/tty/serial/8250/8250_boca.c
> +++ b/drivers/tty/serial/8250/8250_boca.c
> @@ -10,7 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/serial_8250.h>
> =C2=A0
> -#define PORT(_base,_irq)				\
> +#define PORT(_base, _irq)				\
> =C2=A0	{						\
> =C2=A0		.iobase		=3D _base,		\
> =C2=A0		.irq		=3D _irq,			\
>=20

> --- a/drivers/tty/serial/8250/8250_exar_st16c554.c
> +++ b/drivers/tty/serial/8250/8250_exar_st16c554.c
> @@ -13,7 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/serial_8250.h>
> =C2=A0
> -#define PORT(_base,_irq)				\
> +#define PORT(_base, _irq)				\
> =C2=A0	{						\
> =C2=A0		.iobase		=3D _base,		\
> =C2=A0		.irq		=3D _irq,			\
>=20

> --- a/drivers/tty/serial/8250/8250_fourport.c
> +++ b/drivers/tty/serial/8250/8250_fourport.c
> @@ -10,7 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/serial_8250.h>
> =C2=A0
> -#define PORT(_base,_irq)					=09
> \
> +#define PORT(_base, _irq)					=09
> \
> =C2=A0	{							=09
> \
> =C2=A0		.iobase		=3D _base,		=09
> 	\
> =C2=A0		.irq		=3D _irq,			=09
> 	\



--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
