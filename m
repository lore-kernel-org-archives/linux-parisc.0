From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] fix atomic64 on PA-RISC
Date: Tue, 26 Jul 2011 20:27:36 -0400
Message-ID: <CAEdQ38F89xnmG3L_2q3WDY2NnygfVOn8goNndK32no+0Y31daQ@mail.gmail.com>
References: <alpine.DEB.2.00.1106290043170.32272@artax.karlin.mff.cuni.cz> <alpine.DEB.2.00.1107270157040.660@artax.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1107270157040.660@artax.karlin.mff.cuni.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 26, 2011 at 7:57 PM, Mikulas Patocka
<mikulas@artax.karlin.mff.cuni.cz> wrote:
> Fix atomic64 on PA-RISC
>
> Signed-off-by: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>
>
> ---
> =A0arch/parisc/include/asm/atomic.h | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
>
> Index: linux-3.0-devel/arch/parisc/include/asm/atomic.h
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-3.0-devel.orig/arch/parisc/include/asm/atomic.h =A0 =A0 =A0=
 2011-07-27 01:27:03.000000000 +0200
> +++ linux-3.0-devel/arch/parisc/include/asm/atomic.h =A0 =A02011-07-2=
7 01:30:44.000000000 +0200
> @@ -259,10 +259,10 @@ static __inline__ int atomic_add_unless(
>
> =A0#define ATOMIC64_INIT(i) ((atomic64_t) { (i) })
>
> -static __inline__ int
> +static __inline__ s64
> =A0__atomic64_add_return(s64 i, atomic64_t *v)
> =A0{
> - =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 s64 ret;
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0_atomic_spin_lock_irqsave(v, flags);

An identical patch was sent on June 11, titled '[PATCH] parisc, fix
return type of __atomic64_add_return'. If it's not in James tree (or
upstream) by now, I'm not sure why.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
