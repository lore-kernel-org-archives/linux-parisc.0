From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH 4/6] parisc: drop include of asm/pdc.h from asm/hardware.h
Date: Mon, 23 Apr 2012 18:34:11 -0700
Message-ID: <CANEJEGsZdHBRRBnXp0-ETQiv6J7m-FHNn_qCxDNXEq_dL0LkAQ@mail.gmail.com>
References: <3154414.psmJh6J2U2@donald.sf-tec.de>
	<1908845.8gGWeWu9U7@donald.sf-tec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1908845.8gGWeWu9U7@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Apr 21, 2012 at 11:17 AM, Rolf Eike Beer <eike-kernel@sf-tec.de=
> wrote:
> It seems none of the symbols defined by pdc.h is needed,

Rolf,
I looked through both files and I agree whatever dependency might have
exsisted, doesn't appear to now.

thanks for cleaning this up,
grant

> but it introduces an
> include loop causing compile errors:
>
> In file included from /home/buildbot/repos/linux/arch/parisc/include/=
asm/spinlock.h:4:0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/include/asm/atomic.h:20,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/include/linux/atomic.h:4,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/include/asm/bitops.h:56,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/include/linux/bitops.h:35,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/include/asm-generic/getorder.h:7,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/include/asm/page.h:162,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/include/asm/pdc.h:346,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/include/asm/hardware.h:5,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /home/bu=
ildbot/repos/linux/arch/parisc/kernel/hardware.c:30:
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:74:16:=
 error: field =E2=80=98cpu_type=E2=80=99 has incomplete type
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:77:20:=
 error: field =E2=80=98model=E2=80=99 has incomplete type
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h: In fu=
nction =E2=80=98parisc_requires_coherency=E2=80=99:
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:349:36=
: error: =E2=80=98mako=E2=80=99 undeclared (first use in this function)
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:349:36=
: note: each undeclared identifier is reported only once for each funct=
ion it appears in
> /home/buildbot/repos/linux/arch/parisc/include/asm/processor.h:350:30=
: error: =E2=80=98mako2=E2=80=99 undeclared (first use in this function=
)
>
> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>
> ---
> =C2=A0arch/parisc/include/asm/hardware.h | =C2=A0 =C2=A01 -
> =C2=A01 file changed, 1 deletion(-)
>
> diff --git a/arch/parisc/include/asm/hardware.h b/arch/parisc/include=
/asm/hardware.h
> index 036e703..d1d864b 100644
> --- a/arch/parisc/include/asm/hardware.h
> +++ b/arch/parisc/include/asm/hardware.h
> @@ -2,7 +2,6 @@
> =C2=A0#define _PARISC_HARDWARE_H
>
> =C2=A0#include <linux/mod_devicetable.h>
> -#include <asm/pdc.h>
>
> =C2=A0#define HWTYPE_ANY_ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PA_HWTY=
PE_ANY_ID
> =C2=A0#define HVERSION_ANY_ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0PA_HVERSION_ANY_ID
> --
> 1.7.9.2
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-paris=
c" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
