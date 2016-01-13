From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 05/15] tty: serial: 8250: Remove else after return
Date: Wed, 13 Jan 2016 19:05:22 +0200
Message-ID: <1452704722.26146.73.camel@linux.intel.com>
References: <1452703171-5632-1-git-send-email-anton.wuerfel@fau.de>
	 <1452703171-5632-6-git-send-email-anton.wuerfel@fau.de>
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
In-Reply-To: <1452703171-5632-6-git-send-email-anton.wuerfel@fau.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2016-01-13 at 17:39 +0100, Anton Wuerfel wrote:
> This patch fixes checkpatch warnings about unnecessary else blocks
> after
> return statements.
>=20

> @@ -816,12 +816,11 @@ static int pci_netmos_9900_numports(struct
> pci_dev *dev)
> =C2=A0		=C2=A0* advertising the same function 3 as the 4s+2s1p
> config.
> =C2=A0		=C2=A0*/
> =C2=A0		sub_serports =3D dev->subsystem_device & 0xf;
> -		if (sub_serports > 0) {
> +		if (sub_serports > 0)
> =C2=A0			return sub_serports;
> -		} else {
> -			dev_err(&dev->dev, "NetMos/Mostech serial
> driver ignoring port on ambiguous config.\n");
> -			return 0;
> -		}
> +
> +		dev_err(&dev->dev, "NetMos/Mostech serial driver
> ignoring port on ambiguous config.\n");

Here you may put the literal on the next line and indent it properly to
&. It might not fit the 80 character limit, but I think still worth to
do.

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
