From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: Compiling a 32bit kernel fails
Date: Fri, 25 Jul 2014 11:24:55 +0200
Message-ID: <7908dab4bb5b426fff78ff508ba341ed@tuxicoman.be>
References: <828ecd1c2a7868e1f1ef7025f9f1e930@tuxicoman.be>
 <BLU436-SMTP252142D10893C7F99D610A697FF0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Cc: linux-parisc@vger.kernel.org, linux-parisc-owner@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP252142D10893C7F99D610A697FF0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org



Hi JDA,


On 2014-07-24 15:19, John David Anglin wrote:
> On 24-Jul-14, at 7:39 AM, Guy Martin wrote:
>> Is the fix to modify the LDCW macro or fix gcc ?
>=20
>=20
> There's not enough info to tell.  In general, arguments in an asm
> can't overlap in register usage with
> registers listed in the clobber list.  Because r1 may be needed to
> reload an argument, the error can
> occur as a result of optimization, etc.  In that case, the macro woul=
d
>  need fixing.
>=20
> It would be helpful to see preprocessed source and full compile=20
> command.


This is the command being ran :

gcc -Wp,-MD,kernel/.signal.o.d  -nostdinc -isystem=20
/usr/lib/gcc/hppa2.0-unknown-linux-gnu/4.8.3/include=20
-I/usr/src/linux-3.15.6-phoenix/arch/parisc/include=20
-Iarch/parisc/include/generated  -Iinclude=20
-I/usr/src/linux-3.15.6-phoenix/arch/parisc/include/uapi=20
-Iarch/parisc/include/generated/uapi=20
-I/usr/src/linux-3.15.6-phoenix/include/uapi -Iinclude/generated/uapi=20
-include /usr/src/linux-3.15.6-phoenix/include/linux/kconfig.h=20
-D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs=20
-fno-strict-aliasing -fno-common -Werror-implicit-function-declaration=20
-Wno-format-security -fno-delete-null-pointer-checks -O2 -pipe=20
-mno-space-regs -mfast-indirect-calls -mdisable-fpregs=20
-ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wframe-larger-than=3D=
1024=20
-fno-stack-protector -Wno-unused-but-set-variable=20
-fno-omit-frame-pointer -fno-optimize-sibling-calls=20
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow=20
-fconserve-stack -Werror=3Dimplicit-int -Werror=3Dstrict-prototypes=20
-DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=3D#s"=20
-D"KBUILD_BASENAME=3DKBUILD_STR(signal)" =20
-D"KBUILD_MODNAME=3DKBUILD_STR(signal)" -c -o kernel/signal.o=20
kernel/signal.c

The preprocessed sources are here :
http://bpaste.net/show/498190/

The full config here :
http://bpaste.net/show/498196/


The error is still this :

kernel/signal.c: In function =E2=80=98get_signal_to_deliver=E2=80=99:
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2:=20
error: can=E2=80=99t find a register in class =E2=80=98R1_REGS=E2=80=99=
 while reloading =E2=80=98asm=E2=80=99
   __asm__ __volatile__(__LDCW " 0(%2),%0"   \
   ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:26:9:=20
note: in expansion of macro =E2=80=98__ldcw=E2=80=99
   while (__ldcw(a) =3D=3D 0)
          ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/ldcw.h:39:2:=20
error: =E2=80=98asm=E2=80=99 operand has impossible constraints
   __asm__ __volatile__(__LDCW " 0(%2),%0"   \
   ^
/usr/src/linux-3.15.6-phoenix/arch/parisc/include/asm/spinlock.h:26:9:=20
note: in expansion of macro =E2=80=98__ldcw=E2=80=99
   while (__ldcw(a) =3D=3D 0)



I tried to play a bit with the __ldcw macro but I still couldn't get it=
=20
to compile.


Regards,
   Guy

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
