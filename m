From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 04/15] tty: serial: 8250: Fix multiline comment style
Date: Wed, 13 Jan 2016 19:03:33 +0200
Message-ID: <1452704613.26146.70.camel@linux.intel.com>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
	 <1452703171-5632-5-git-send-email-anton.wuerfel@fau.de>
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
In-Reply-To: <1452703171-5632-5-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2016-01-13 at 17:39 +0100, Anton Wuerfel wrote:
> Checkpatch outputs some warnings about incorrect comment style,
> which is fixed by this patch.
>=20


> --- a/drivers/tty/serial/8250/8250_ingenic.c
> +++ b/drivers/tty/serial/8250/8250_ingenic.c
> @@ -152,14 +152,18 @@ static void ingenic_uart_serial_out(struct
> uart_port *p, int offset, int value)
> =C2=A0		break;
> =C2=A0
> =C2=A0	case UART_IER:
> -		/* Enable receive timeout interrupt with the
> -		=C2=A0* receive line status interrupt */
> +		/*
> +		=C2=A0* Enable receive timeout interrupt with the
> +		=C2=A0* receive line status interrupt

I'm pretty sure that at least one word could fit previous line.

Can you re-check your patches with sane editor setting for line
breaking (like 76 characters)?

> +		=C2=A0*/
> =C2=A0		value |=3D (value & 0x4) << 2;
> =C2=A0		break;
> =C2=A0
> =C2=A0	case UART_MCR:
> -		/* If we have enabled modem status IRQs we should
> enable modem
> -		=C2=A0* mode. */
> +		/*
> +		=C2=A0* If we have enabled modem status IRQs we should
> enable modem
> +		=C2=A0* mode.

To check.

> +		=C2=A0*/
>=20

> @@ -367,8 +367,10 @@ static const struct pnp_device_id
> pnp_dev_table[] =3D {
> =C2=A0	{	"PNPCXXX",		UNKNOWN_DEV	},
> =C2=A0	/* More unknown PnP modems */
> =C2=A0	{	"PNPDXXX",		UNKNOWN_DEV	},
> -	/* Winbond CIR port, should not be probed. We should keep
> track
> -	=C2=A0=C2=A0=C2=A0of it to prevent the legacy serial driver from pr=
obing it
> */
> +	/*
> +	=C2=A0* Winbond CIR port, should not be probed. We should keep
> track
> +	=C2=A0* of it to prevent the legacy serial driver from probing it

I would suggest to add dot at the end of sentences. Here and in the
rest of the places.


> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -250,9 +250,11 @@ static const struct serial8250_config
> uart_config[] =3D {
> =C2=A0		.fcr		=3D UART_FCR_ENABLE_FIFO |
> UART_FCR_R_TRIG_10,
> =C2=A0		.flags		=3D UART_CAP_FIFO |
> UART_CAP_AFE,
> =C2=A0	},
> -/* tx_loadsz is set to 63-bytes instead of 64-bytes to implement
> -workaround of errata A-008006 which states that tx_loadsz should=C2=A0=
=C2=A0be
> -configured less than Maximum supported fifo bytes */
> +	/*
> +	=C2=A0* tx_loadsz is set to 63-bytes instead of 64-bytes to
> implement
> +	=C2=A0* workaround of errata A-008006 which states that tx_loadsz
> should be
> +	=C2=A0* configured less than Maximum supported fifo bytes

Ditto.

> --- a/drivers/tty/serial/8250/serial_cs.c
> +++ b/drivers/tty/serial/8250/serial_cs.c
> @@ -441,16 +441,20 @@ static int simple_config(struct pcmcia_device
> *link)
> =C2=A0	struct serial_info *info =3D link->priv;
> =C2=A0	int i =3D -ENODEV, try;
> =C2=A0
> -	/* First pass: look for a config entry that looks normal.
> -	=C2=A0* Two tries: without IO aliases, then with aliases */
> +	/*
> +	=C2=A0* First pass: look for a config entry that looks normal.
> +	=C2=A0* Two tries: without IO aliases, then with aliases

Ditto.

> @@ -480,8 +484,10 @@ static int multi_config_check(struct
> pcmcia_device *p_dev, void *priv_data)
> =C2=A0	if (p_dev->resource[1]->end)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* The quad port cards have bad CIS's, so just look for a
> -	=C2=A0=C2=A0=C2=A0window larger than 8 ports and assume it will be =
right */
> +	/*
> +	=C2=A0* The quad port cards have bad CIS's, so just look for a
> +	=C2=A0* window larger than 8 ports and assume it will be right

Ditto.

> -	/* Another check for dual-serial cards: look for either
> serial or
> -	=C2=A0=C2=A0=C2=A0multifunction cards that ask for appropriate IO p=
ort
> ranges */
> +	/*
> +	=C2=A0* Another check for dual-serial cards: look for either
> serial or
> +	=C2=A0* multifunction cards that ask for appropriate IO port
> ranges

Ditto.

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
