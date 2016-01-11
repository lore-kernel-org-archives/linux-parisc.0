From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH v4 01/13] tty: serial: 8250: Fix whitespace errors
Date: Mon, 11 Jan 2016 12:54:10 +0000
Message-ID: <yw1x7fjgxonh.fsf@unicorn.mansr.com>
References: <1452275039-18787-1-git-send-email-anton.wuerfel@fau.de>
	<1452275039-18787-2-git-send-email-anton.wuerfel@fau.de>
	<1452515294.26146.10.camel@linux.intel.com>
	<1452516646.26146.22.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"anton.wuerfel\@fau.de" <anton.wuerfel@fau.de>,
	"linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mail\@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
	"desmondl\@broadcom.com" <desmondl@broadcom.com>,
	"Zha\, Qipeng" <qipeng.zha@intel.com>,
	"heikki.krogerus\@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"long.wanglong\@huawei.com" <long.wanglong@huawei.com>,
	"soeren.grunewald\@desy.de" <soeren.grunewald@desy.de>,
	"deller\@gmx.de" <deller@gmx.de>,
	"jslaby\@suse.com" <jslaby@suse.com>,
	"phillip.raffeck\@fau.de" <phillip.raffeck@fau.de>,
	"paul.burton\@imgtec.com" <paul.burton@imgtec.com>,
	"hpeter\@gmail.com" <hpeter@gmail.com>,
	"ralf\@linux-mips.org" <ralf@linux-mips.org>,
	"linux-kernel\@i4.cs.fau.de" <linux-kernel@i4.cs.fau.de>,
	"adam.lee\@canonical.com" <adam.lee@canonical.com>,
	"jej
To: "Shevchenko\, Andriy" <andriy.shevchenko@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452516646.26146.22.camel@intel.com> (Andriy Shevchenko's
	message of "Mon, 11 Jan 2016 12:50:18 +0000")
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

"Shevchenko, Andriy" <andriy.shevchenko@intel.com> writes:

> On Mon, 2016-01-11 at 14:28 +0200, Andy Shevchenko wrote:
>> On Fri, 2016-01-08 at 18:43 +0100, Anton Wuerfel wrote:
>> > This patch fixes whitespace errors reported by checkpatch to
>> > increase
>> > readability. Main focus is on missing spaces after commas in
>> > function headers and macros (like foo,bar edited to foo, bar).
>> >=20
>> > Signed-off-by: Anton W=C3=BCrfel <anton.wuerfel@fau.de>
>> > Signed-off-by: Phillip Raffeck <phillip.raffeck@fau.de>
>> > CC: linux-kernel@i4.cs.fau.de
>>=20
>> Cc: looks more standard.
>>=20
>> > --- a/drivers/tty/serial/8250/8250_accent.c
>> > +++ b/drivers/tty/serial/8250/8250_accent.c
>> > @@ -10,7 +10,7 @@
>> > =C2=A0#include <linux/init.h>
>> > =C2=A0#include <linux/serial_8250.h>
>> > =C2=A0
>> > -#define PORT(_base,_irq)				\
>> > +#define PORT(_base, _irq)				\
>> > =C2=A0	{						\
>> > =C2=A0		.iobase		=3D _base,		\
>> > =C2=A0		.irq		=3D _irq,		=09
>> > \
>
> 8250_PORT()
>
>> >=20
>>=20
>> While those are okay, I would suggest to make a macro in
>> drivers/=E2=80=A6/8250.h one for all, something like this:
>>=20
>> #define 8250_PORT_FLAGS(_base, _irq, _flags)
>> =E2=80=A6
>> 	.flags=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D=
 UPF_BOOT_AUTOCONF | (_flags) \
>>=20
>> #define 8250_PORT(_base, _irq)	8250_PORT_FLAGS(_base, _irq, 0)
>>=20
>> And use it.
>
> #define 8250_FOURPORT(_base, _irq)	8250_PORT_FLAGS(_base, _irq,
> UPF_FOURPORT)

Macro names can't start with a number.

--=20
M=C3=A5ns Rullg=C3=A5rd
