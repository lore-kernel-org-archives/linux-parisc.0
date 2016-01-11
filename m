From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 10/13] tty: serial: 8250: Suitably replace printk
Date: Mon, 11 Jan 2016 14:38:34 +0200
Message-ID: <1452515914.26146.14.camel@linux.intel.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	 <1452275039-18787-11-git-send-email-anton.wuerfel@fau.de>
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
In-Reply-To: <1452275039-18787-11-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2016-01-08 at 18:43 +0100, Anton Wuerfel wrote:
> From: Phillip Raffeck <phillip.raffeck@fau.de>
>=20
> This patch replaces printk by the corresponding variant of dev_* in
> order
> to fix checkpatch warnings. If no suitable device pointer is present,
> the
> corresponding pr_* variant is used.
>=20

> --- a/drivers/tty/serial/8250/8250_hp300.c
> +++ b/drivers/tty/serial/8250/8250_hp300.c
>=20

> @@ -141,13 +141,13 @@ int __init hp300_setup_serial_console(void)
> =C2=A0		if (DIO_ID(pa + DIO_VIRADDRBASE) & 0x80)
> =C2=A0			add_preferred_console("ttyS", port.line,
> "9600n8");
> =C2=A0#else
> -		printk(KERN_WARNING "Serial console is DCA but
> support is disabled (CONFIG_HPDCA)!\n");
> +		pr_warn("Serial console is DCA but support is
> disabled (CONFIG_HPDCA)!\n");
> =C2=A0		return 0;
> =C2=A0#endif
> =C2=A0	}
> =C2=A0
> =C2=A0	if (early_serial_setup(&port) < 0)
> -		printk(KERN_WARNING "hp300_setup_serial_console():
> early_serial_setup() failed.\n");
> +		pr_warn("hp300_setup_serial_console():
> early_serial_setup() failed.\n");

%s:=E2=80=A6, __func__ ?

> =C2=A0	return 0;
> =C2=A0}
> =C2=A0#endif /* CONFIG_SERIAL_8250_CONSOLE */
> @@ -179,8 +179,9 @@ static int hpdca_init_one(struct dio_dev *d,
> =C2=A0	line =3D serial8250_register_8250_port(&uart);
> =C2=A0
> =C2=A0	if (line < 0) {
> -		printk(KERN_NOTICE "8250_hp300: register_serial()
> DCA scode %d"
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0" irq %d failed\n", d->s=
code, uart.port.irq);
> +		dev_notice(&d->dev,
> +			=C2=A0=C2=A0"8250_hp300: register_serial() DCA scode
> %d irq %d failed\n",
> +			=C2=A0=C2=A0d->scode, uart.port.irq);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> @@ -260,8 +261,8 @@ static int __init hp300_8250_init(void)
> =C2=A0		line =3D serial8250_register_8250_port(&uart);
> =C2=A0
> =C2=A0		if (line < 0) {
> -			printk(KERN_NOTICE "8250_hp300:
> register_serial() APCI"
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0" %d irq %d failed\n", =
i,
> uart.port.irq);
> +			pr_notice("8250_hp300: register_serial()
> APCI %d irq %d failed\n",
> +				=C2=A0=C2=A0i, uart.port.irq);

Inconsistent with dev_notice() above. Choose one which is most suitable
here.

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
