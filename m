From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 09/15] tty: serial: 8250: Fix multi-line strings
Date: Wed, 13 Jan 2016 19:08:58 +0200
Message-ID: <1452704938.26146.76.camel@linux.intel.com>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
	 <1452703171-5632-10-git-send-email-anton.wuerfel@fau.de>
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
	Phillip Raffeck <phillip.raffeck@fau.de>
To: Anton Wuerfel <anton.wuerfel@fau.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1452703171-5632-10-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2016-01-13 at 17:39 +0100, Anton Wuerfel wrote:
> Merged user-visible multi-line strings into a single line according
> to the
> Linux Kernel Coding Style, which allows user-visible strings to
> exceed the
> maximum line length of 80 characters. The main reason for this is to
> facilitate grepping for these strings.
> However, some strings were ignored in this patch, because the use of
> format specifiers breaks the ability to grep anyway.
>=20

> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -1173,8 +1173,7 @@ MODULE_LICENSE("GPL");
> =C2=A0MODULE_DESCRIPTION("Generic 8250/16x50 serial driver");
> =C2=A0
> =C2=A0module_param(share_irqs, uint, 0644);
> -MODULE_PARM_DESC(share_irqs, "Share IRQs with other non-8250/16x50
> devices"
> -	" (unsafe)");
> +MODULE_PARM_DESC(share_irqs, "Share IRQs with other non-8250/16x50
> devices (unsafe)");

This one looks nice in one line.

> --- a/drivers/tty/serial/8250/serial_cs.c
> +++ b/drivers/tty/serial/8250/serial_cs.c
> @@ -533,8 +533,7 @@ static int multi_config(struct pcmcia_device
> *link)
> =C2=A0		info->multi =3D 2;
> =C2=A0		if (pcmcia_loop_config(link,
> multi_config_check_notpicky,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&base2)) {
> -			dev_warn(&link->dev, "no usable port range "
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"found, giving up\n");
> +			dev_warn(&link->dev, "no usable port range
> found, giving up\n");

But here I would comment as in patch 5, i.e. move literal to next line
it it doesn't fit on the dev_warn() line.

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
