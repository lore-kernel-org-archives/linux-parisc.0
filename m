From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 15/15] tty: serial: 8250: Merge duplicate conditions
Date: Wed, 13 Jan 2016 19:28:39 +0200
Message-ID: <1452706119.2521.3.camel@linux.intel.com>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
	 <1452703171-5632-16-git-send-email-anton.wuerfel@fau.de>
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
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452703171-5632-16-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2016-01-13 at 17:39 +0100, Anton Wuerfel wrote:
> This patch refactors a switch case statement by merging an if
> condition
> in the default case into an identical condition right after the
> switch
> statement.
> This comes with a slight change in behaviour: If
> pci_netmos_9900_numports
> returns 0, an additional warning is printed.
>=20

+ Suggested-by:

And I would recommend to put this patch before #13 in the series.

> Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
> Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
> Cc: linux-kernel@i4.cs.fau.de
> ---
> =C2=A0drivers/tty/serial/8250/8250_pci.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_pci.c
> b/drivers/tty/serial/8250/8250_pci.c
> index 1dd607f..50ab301 100644
> --- a/drivers/tty/serial/8250/8250_pci.c
> +++ b/drivers/tty/serial/8250/8250_pci.c
> @@ -854,8 +854,10 @@ static int pci_netmos_init(struct pci_dev *dev)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (num_serial =3D=3D 0)
> +	if (num_serial =3D=3D 0) {
> +		moan_device("unknown NetMos/Mostech device", dev);
> =C2=A0		return -ENODEV;
> +	}

Yep!
However, you forgot to fix switch-case as well.

> =C2=A0
> =C2=A0	return num_serial;
> =C2=A0}

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
