From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 13/13] tty: serial: 8250: Fix indentation warnings
Date: Mon, 11 Jan 2016 14:47:43 +0200
Message-ID: <1452516463.26146.20.camel@linux.intel.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	 <1452275039-18787-14-git-send-email-anton.wuerfel@fau.de>
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
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452275039-18787-14-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2016-01-08 at 18:43 +0100, Anton Wuerfel wrote:
> Checkpatch complains about incorrect indentation of switch/case
> statements.
> This patch fixes the corresponding warnings. Additionally some
> indentation
> is changed to match the correct format specified in the Linux Kernel
> Coding Style.
>=20
> Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
> Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
> CC: linux-kernel@i4.cs.fau.de
> ---
> =C2=A0drivers/tty/serial/8250/8250_pci.c=C2=A0=C2=A0| 12 ++++++------
> =C2=A0drivers/tty/serial/8250/8250_pnp.c=C2=A0=C2=A0|=C2=A0=C2=A04 ++=
--
> =C2=A0drivers/tty/serial/8250/8250_port.c |=C2=A0=C2=A06 +++---
> =C2=A03 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_pci.c
> b/drivers/tty/serial/8250/8250_pci.c
> index 09157fa..b0b47f9 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@ -841,12 +841,12 @@ static int pci_netmos_init(struct pci_dev *dev)
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	switch (dev->device) { /* FALLTHROUGH on all */
> -		case PCI_DEVICE_ID_NETMOS_9904:
> -		case PCI_DEVICE_ID_NETMOS_9912:
> -		case PCI_DEVICE_ID_NETMOS_9922:
> -		case PCI_DEVICE_ID_NETMOS_9900:
> -			num_serial =3D pci_netmos_9900_numports(dev);
> -			break;
> +	case PCI_DEVICE_ID_NETMOS_9904:
> +	case PCI_DEVICE_ID_NETMOS_9912:
> +	case PCI_DEVICE_ID_NETMOS_9922:
> +	case PCI_DEVICE_ID_NETMOS_9900:
> +		num_serial =3D pci_netmos_9900_numports(dev);
> +		break;
> =C2=A0
> =C2=A0		default:

You forget to shift above line as well.

> =C2=A0			if (num_serial =3D=3D 0) {

But before doing that I would suggest to refactor the warning message
below in the code: copy it out of 'default:' to below condition and
replace by 'break;' inside the switch-case.

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
