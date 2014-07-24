From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Compiling a 32bit kernel fails
Date: Thu, 24 Jul 2014 09:19:30 -0400
Message-ID: <BLU436-SMTP252142D10893C7F99D610A697FF0@phx.gbl>
References: <828ecd1c2a7868e1f1ef7025f9f1e930@tuxicoman.be>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=WINDOWS-1252;
	format=flowed	delsp=yes
Cc: linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <828ecd1c2a7868e1f1ef7025f9f1e930@tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 24-Jul-14, at 7:39 AM, Guy Martin wrote:

>
>
> I've been trying to compile a 3.15.6 kernel but I did not managed to =
=20
> do so with either gcc 4.7.3 or 4.8.3.
>
>
> This is the error I get :
>
> In file included from /usr/src/linux-3.15.6-phoenix/arch/parisc/=20
> include/asm/spinlock.h:5:0,
>                 from /usr/src/linux-3.15.6-phoenix/arch/parisc/=20
> include/asm/atomic.h:20,
>                 from include/linux/atomic.h:4,
>                 from /usr/src/linux-3.15.6-phoenix/arch/parisc/=20
> include/asm/bitops.h:11,
>                 from include/linux/bitops.h:33,
>                 from include/linux/kernel.h:10,
>                 from /usr/src/linux-3.15.6-phoenix/arch/parisc/=20
> include/asm/bug.h:4,
>                 from include/linux/bug.h:4,
>                 from include/linux/thread_info.h:11,
>                 from include/asm-generic/preempt.h:4,
>                 from arch/parisc/include/generated/asm/preempt.h:1,
>                 from include/linux/preempt.h:18,
>                 from include/linux/spinlock.h:50,
>                 from include/linux/mmzone.h:7,
>                 from include/linux/gfp.h:5,
>                 from include/linux/slab.h:14,
>                 from kernel/signal.c:13:
> kernel/signal.c: In function =91get_signal_to_deliver=92:
> /usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2: =20
> error: can=92t find a register in class =91R1_REGS=92 while reloading=
 =91asm=92
>  __asm__ __volatile__(__LDCW " 0(%2),%0"   \
>  ^
> /usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:=20
> 26:9: note: in expansion of macro =91__ldcw=92
>  while (__ldcw(a) =3D=3D 0)
>         ^
> /usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2: =20
> error: =91asm=92 operand has impossible constraints
>  __asm__ __volatile__(__LDCW " 0(%2),%0"   \
>  ^
> /usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:=20
> 26:9: note: in expansion of macro =91__ldcw=92
>  while (__ldcw(a) =3D=3D 0)
>         ^
>
> As far as I can tell, it looks familiar :
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D60925
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D35193
>
>
> Is the fix to modify the LDCW macro or fix gcc ?


There's not enough info to tell.  In general, arguments in an asm =20
can't overlap in register usage with
registers listed in the clobber list.  Because r1 may be needed to =20
reload an argument, the error can
occur as a result of optimization, etc.  In that case, the macro would =
=20
need fixing.

It would be helpful to see preprocessed source and full compile command=
=2E

Dave
--
John David Anglin	dave.anglin@bell.net



--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
