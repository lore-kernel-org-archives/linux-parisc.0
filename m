From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 08/11] tty: serial: 8250: Add parentheses to macro
Date: Fri, 18 Dec 2015 14:35:15 +0200
Message-ID: <1450442115.30729.211.camel@linux.intel.com>
References: <1450280177-4460-1-git-send-email-anton.wuerfel@fau.de>
	 <1450280177-4460-9-git-send-email-anton.wuerfel@fau.de>
	 <1450365401.30729.142.camel@linux.intel.com>
	 <99efe3549ef3d0b399b78b2f8f66947c.squirrel@faumail.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-kernel@i4.cs.fau.de, phillip.raffeck@fau.de
To: anton.wuerfel@fau.de
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <99efe3549ef3d0b399b78b2f8f66947c.squirrel@faumail.uni-erlangen.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2015-12-18 at 12:36 +0100, anton.wuerfel@fau.de wrote:
> Hello Andy,
>=20
> > What about the rest of the drivers under drivers/tty/serial?
> >=20
> > What do you propose to do with, for example, the following
> >=20
> > drivers/tty/serial/cpm_uart/cpm_uart_core.c:1392:#define
> > CPM_UART_CONSOLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&cpm_scc_=
uart_console
> > drivers/tty/serial/cpm_uart/cpm_uart_core.c:1394:#define
> > CPM_UART_CONSOLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0NULL
> >=20
> > > =C2=A0#else
> > > =C2=A0#define SERIAL8250_CONSOLE	NULL
> > > =C2=A0#endif
> >=20
>=20
> thanks for your reply. Phillip and me are newcomers to kernel
> development,

Welcome!

> so we tried to touch as few files as possible and gain some
> experience in
> creating patches and communication on LKML. We will consider sending
> further patches in the future.

I see.

I don't know which way is preferable for such patches, I think Greg
usually likes when one patch touches one driver. So, this one is okay,
and other drivers can be fixed later.



> Regards,
> Phillip Raffeck
> Anton Wuerfel
>=20
> > --
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Intel Finland Oy
> >=20
> >=20
>=20
>=20

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
