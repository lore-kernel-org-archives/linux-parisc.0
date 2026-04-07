Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B003375AE;
	Tue,  7 Apr 2026 17:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583192; cv=none; b=CErf5QG8XcoyHVsEcbPryUmdCnpdMKxxHvlgcZ3huA4rRZP2FGBa83HK0bjhEyqg0OgS1hBn+AHxVB+++AqbvnlsPkPQpsTFz/ggYSASa/v0TaUGi3lkkbftvcwTdouYa9wWqcBVf5HFV0bo+BxlpgBrZeQSyEu8TpGlChdKiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583192; c=relaxed/simple;
	bh=dQE+YgOCgJ6DrainDL1Vu+wctldyn+H62+XYtlBh9so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQw79fwRIuHbKdO3C4H/HhvznuYEYcT/ZhwOzs8qhfNXQb3DSmuZ6vOfXNrKZazxwcnFQ1A5jvLC3U3/CYCuI5QBmK6JHauyQjSdXw1wTZoks0Ag8Ljb+6VEsXdPiJAAvyXBHF8Xu7ZR3a5fkmPZ8tIH1NilG6sMhnUH70bA2s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=YzrCsuje; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="YzrCsuje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775583186; x=1776187986; i=deller@gmx.de;
	bh=JnToBlMIfgkd5EzxllSVmVag5pgJQ6VuJIvS34s2xuo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YzrCsujeW+x6LMdOH5qLu3GyNA9bwMEXQOTA0BsGxQ8E6X6c8I3zqyB+WFKdYxP3
	 BNoyRFABBBODKFGwt+tAlI3b/W0lSHbyQ66DMvR7GI6SKiEwrw4ThflrmvJDFVz7o
	 MzrRLdge/JdN9DZhb2bTwzUgHya1enznMpSYCOOQaZfxlc9C+1jm51eGrX1tFZbpv
	 f5wPAGLZPCuZUDyQeIPrSbRghhxphejs3Q8gZ1fdI3gyzG8Ev7G0ev4DdpsNmMkao
	 3gsdfD4Mp64bnDD+kV18ea47bzKsT3b8k8l/XWHk+6oVNLHZ6o2IIB9dzmyMD00ti
	 w26f3SWHxFDfpyjI4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Ed-1vT9N12HqX-011ee2; Tue, 07
 Apr 2026 19:33:06 +0200
Message-ID: <0fad3d18-72fa-4d99-b9ac-477964fdd654@gmx.de>
Date: Tue, 7 Apr 2026 19:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tools/nolibc: add support for 32-bit parisc
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Willy Tarreau <w@1wt.eu>, John David Anglin <dave.anglin@bell.net>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
References: <20260407-nolibc-hppa-v1-0-f70b4509c44a@weissschuh.net>
 <20260407-nolibc-hppa-v1-3-f70b4509c44a@weissschuh.net>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260407-nolibc-hppa-v1-3-f70b4509c44a@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R+Pjg4gZ96UrFMFObdHlmqal1zvkpAtGmCgVuraBc+/eNNCzifr
 P+uInG7fzCNvDT3ISXvNE56KpFMbD5zbJQ2GjEPNZOCNoo+Iin+AAGBXNYzBFvUz0RQRDH3
 bUn7KTL1xVsiQ2uNzIKIpGPUCnpkuEUMozHAQVbFqsxvxNPGah1FrNOiYrMMenVL50DYVGe
 JiRjnatRIOMyePLtFwgWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+m9TtZ/6Iig=;y/QZsKNU/l95tGQ8yW1BEY9WYub
 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
 1cic4Dqbfhio2BxBndJNxR6A==

On 4/7/26 18:37, Thomas Wei=C3=9Fschuh wrote:
> Extend nolibc to target the 32-bit parisc architecture.
> 64-bit is not yet supported.

Adding 64-bit would be very cool.
Dave Anglin is currently working on adding 64-bit userspace support
to gcc/glibc (dynamic loader), but that takes some time.
In the meantime a 64-bit nolibc would be cool for testing.

Helge

 =20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>   tools/include/nolibc/Makefile                  |   2 +-
>   tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++=
++++++++
>   tools/include/nolibc/arch.h                    |   2 +
>   tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
>   tools/testing/selftests/nolibc/run-tests.sh    |   4 +-
>   5 files changed, 190 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefi=
le
> index 7455097cff69..81187126bf93 100644
> --- a/tools/include/nolibc/Makefile
> +++ b/tools/include/nolibc/Makefile
> @@ -17,7 +17,7 @@ endif
>   # it defaults to this nolibc directory.
>   OUTPUT ?=3D $(CURDIR)/
>  =20
> -architectures :=3D arm arm64 loongarch m68k mips powerpc riscv s390 sh =
sparc x86
> +architectures :=3D arm arm64 loongarch m68k mips parisc powerpc riscv s=
390 sh sparc x86
>   arch_files :=3D arch.h $(addsuffix .h, $(addprefix arch-, $(architectu=
res)))
>   all_files :=3D \
>   		byteswap.h \
> diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/a=
rch-parisc.h
> new file mode 100644
> index 000000000000..5918f45132bb
> --- /dev/null
> +++ b/tools/include/nolibc/arch-parisc.h
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> +/*
> + * parisc/hppa (32 and 64) specific definitions for NOLIBC
> + * Copyright (C) 2026 Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> + */
> +
> +#ifndef _NOLIBC_ARCH_PARISC_H
> +#define _NOLIBC_ARCH_PARISC_H
> +
> +#if defined(__LP64__)
> +#error 64-bit not supported
> +#endif
> +
> +#include "compiler.h"
> +#include "crt.h"
> +
> +/* Syscalls for parisc :
> + *   - syscall number is passed in r20
> + *   - arguments are in r26 to r21
> + *   - the system call is performed by calling "ble 0x100(%sr2, %r0)",
> + *     the instruction after that is executed first, use it to load the=
 number
> + *   - syscall return comes in r28
> + *   - the arguments are cast to long and assigned into the target
> + *     registers which are then simply passed as registers to the asm c=
ode,
> + *     so that we don't have to experience issues with register constra=
ints.
> + */
> +
> +#define _NOLIBC_SYSCALL_CLOBBERLIST \
> +	"memory", "%r1", "%r2", "%r4", "%r20", "%r29", "%r31"
> +
> +#define __nolibc_syscall0(num)                                         =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %1, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret)                                                  \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall1(num, arg1)                                   =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %2, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1)                                                 \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall2(num, arg1, arg2)                             =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +	register long _arg2 __asm__ ("r25") =3D (long)(arg2);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %3, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1), "+r"(_arg2)                                    \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall3(num, arg1, arg2, arg3)                       =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +	register long _arg2 __asm__ ("r25") =3D (long)(arg2);		      \
> +	register long _arg3 __asm__ ("r24") =3D (long)(arg3);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %4, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3)                       \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall4(num, arg1, arg2, arg3, arg4)                 =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +	register long _arg2 __asm__ ("r25") =3D (long)(arg2);		      \
> +	register long _arg3 __asm__ ("r24") =3D (long)(arg3);		      \
> +	register long _arg4 __asm__ ("r23") =3D (long)(arg4);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %5, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4)          \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall5(num, arg1, arg2, arg3, arg4, arg5)           =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +	register long _arg2 __asm__ ("r25") =3D (long)(arg2);		      \
> +	register long _arg3 __asm__ ("r24") =3D (long)(arg3);		      \
> +	register long _arg4 __asm__ ("r23") =3D (long)(arg4);		      \
> +	register long _arg5 __asm__ ("r22") =3D (long)(arg5);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %6, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4),         \
> +		  "+r"(_arg5)                                                 \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#define __nolibc_syscall6(num, arg1, arg2, arg3, arg4, arg5, arg6)     =
       \
> +({                                                                     =
       \
> +	register long _ret __asm__ ("r28");                                   =
\
> +	register long _arg1 __asm__ ("r26") =3D (long)(arg1);		      \
> +	register long _arg2 __asm__ ("r25") =3D (long)(arg2);		      \
> +	register long _arg3 __asm__ ("r24") =3D (long)(arg3);		      \
> +	register long _arg4 __asm__ ("r23") =3D (long)(arg4);		      \
> +	register long _arg5 __asm__ ("r22") =3D (long)(arg5);		      \
> +	register long _arg6 __asm__ ("r21") =3D (long)(arg6);		      \
> +									      \
> +	__asm__ volatile (                                                    =
\
> +		"ble 0x100(%%sr2, %%r0)\n\t"                                  \
> +		"ldi %7, %%r20\n\t"                                           \
> +		: "=3Dr"(_ret),                                                 \
> +		  "+r"(_arg1), "+r"(_arg2), "+r"(_arg3), "+r"(_arg4),         \
> +		  "+r"(_arg5), "+r"(_arg6)                                    \
> +		: "i"(num)                                                    \
> +		: _NOLIBC_SYSCALL_CLOBBERLIST                                 \
> +	);                                                                    =
\
> +	_ret;                                                                 =
\
> +})
> +
> +#ifndef NOLIBC_NO_RUNTIME
> +/* startup code */
> +void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_pro=
tector _start(void)
> +{
> +	__asm__ volatile (
> +		".import $global$\n"           /* Set up the dp register */
> +		"ldil L%$global$, %dp\n"
> +		"ldo R%$global$(%r27), %dp\n"
> +
> +		"ldo -4(%r24), %r26\n"         /* The sp register is special on paris=
c.
> +						* r24 points to argv. Subtract 4 to get &argc.
> +						* Pass that as first argument to _start_c.
> +						*/
> +
> +		"b,n _start_c\n"
> +	);
> +	__nolibc_entrypoint_epilogue();
> +}
> +#endif /* NOLIBC_NO_RUNTIME */
> +
> +#endif /* _NOLIBC_ARCH_PARISC_H */
> diff --git a/tools/include/nolibc/arch.h b/tools/include/nolibc/arch.h
> index a3adaf433f2c..6dc45a78e972 100644
> --- a/tools/include/nolibc/arch.h
> +++ b/tools/include/nolibc/arch.h
> @@ -28,6 +28,8 @@
>   #include "arch-m68k.h"
>   #elif defined(__sh__)
>   #include "arch-sh.h"
> +#elif defined(__hppa__)
> +#include "arch-parisc.h"
>   #else
>   #error Unsupported Architecture
>   #endif
> diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/test=
ing/selftests/nolibc/Makefile.nolibc
> index f30bc68470cc..e9494f3cbc03 100644
> --- a/tools/testing/selftests/nolibc/Makefile.nolibc
> +++ b/tools/testing/selftests/nolibc/Makefile.nolibc
> @@ -64,6 +64,7 @@ ARCH_s390x       =3D s390
>   ARCH_sparc32     =3D sparc
>   ARCH_sparc64     =3D sparc
>   ARCH_sh4         =3D sh
> +ARCH_parisc32    =3D parisc
>   ARCH            :=3D $(or $(ARCH_$(XARCH)),$(XARCH))
>  =20
>   # kernel image names by architecture
> @@ -92,6 +93,7 @@ IMAGE_sparc32    =3D arch/sparc/boot/image
>   IMAGE_sparc64    =3D arch/sparc/boot/image
>   IMAGE_m68k       =3D vmlinux
>   IMAGE_sh4        =3D arch/sh/boot/zImage
> +IMAGE_parisc32   =3D vmlinux
>   IMAGE            =3D $(objtree)/$(IMAGE_$(XARCH))
>   IMAGE_NAME       =3D $(notdir $(IMAGE))
>  =20
> @@ -121,6 +123,7 @@ DEFCONFIG_sparc32    =3D sparc32_defconfig
>   DEFCONFIG_sparc64    =3D sparc64_defconfig
>   DEFCONFIG_m68k       =3D virt_defconfig
>   DEFCONFIG_sh4        =3D rts7751r2dplus_defconfig
> +DEFCONFIG_parisc32   =3D defconfig
>   DEFCONFIG            =3D $(DEFCONFIG_$(XARCH))
>  =20
>   EXTRACONFIG_x32       =3D -e CONFIG_X86_X32_ABI
> @@ -159,6 +162,7 @@ QEMU_ARCH_sparc32    =3D sparc
>   QEMU_ARCH_sparc64    =3D sparc64
>   QEMU_ARCH_m68k       =3D m68k
>   QEMU_ARCH_sh4        =3D sh4
> +QEMU_ARCH_parisc32   =3D hppa
>   QEMU_ARCH            =3D $(QEMU_ARCH_$(XARCH))
>  =20
>   QEMU_ARCH_USER_ppc64le =3D ppc64le
> @@ -199,6 +203,7 @@ QEMU_ARGS_sparc32    =3D -M SS-5 -m 256M -append "co=
nsole=3DttyS0,115200 panic=3D-1 $(
>   QEMU_ARGS_sparc64    =3D -M sun4u -append "console=3DttyS0,115200 pani=
c=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>   QEMU_ARGS_m68k       =3D -M virt -append "console=3DttyGF0,115200 pani=
c=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
>   QEMU_ARGS_sh4        =3D -M r2d -serial file:/dev/stdout -append "cons=
ole=3DttySC1,115200 panic=3D-1 $(TEST:%=3DNOLIBC_TEST=3D%)"
> +QEMU_ARGS_parisc32   =3D -append "console=3DttyS0 panic=3D-1 $(TEST:%=
=3DNOLIBC_TEST=3D%)"

Does it make sense to use the qemu "-nographic" option for parisc (and som=
e other architectures) ?
That way everything runs much faster on the text console, and (at least) f=
or parisc you don't need the "console=3DttyS0" entry.

>   QEMU_ARGS            =3D -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS)=
 $(QEMU_ARGS_EXTRA)
>  =20
>   # OUTPUT is only set when run from the main makefile, otherwise
> @@ -215,6 +220,7 @@ CFLAGS_i386 =3D $(call cc-option,-m32)
>   CFLAGS_x32 =3D -mx32
>   CFLAGS_arm =3D -marm
>   CFLAGS_armthumb =3D -mthumb -march=3Darmv6t2
> +CFLAGS_parisc32 =3D -mfast-indirect-calls
>   CFLAGS_ppc =3D -m32 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
>   CFLAGS_ppc64 =3D -m64 -mbig-endian -mno-vsx $(call cc-option,-mmultipl=
e)
>   CFLAGS_ppc64le =3D -m64 -mlittle-endian -mno-vsx $(call cc-option,-mab=
i=3Delfv2)
> diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing=
/selftests/nolibc/run-tests.sh
> index 3917cfb8fdc4..981a680cebfb 100755
> --- a/tools/testing/selftests/nolibc/run-tests.sh
> +++ b/tools/testing/selftests/nolibc/run-tests.sh
> @@ -28,6 +28,7 @@ all_archs=3D(
>   	sparc32 sparc64
>   	m68k
>   	sh4
> +	parisc32
>   )
>   archs=3D"${all_archs[@]}"
>  =20
> @@ -116,6 +117,7 @@ crosstool_arch() {
>   	s390*) echo s390;;
>   	sparc*) echo sparc64;;
>   	x32*) echo x86_64;;
> +	parisc32) echo hppa;;
>   	*) echo "$1";;
>   	esac
>   }
> @@ -185,7 +187,7 @@ test_arch() {
>   			exit 1
>   	esac
>   	printf '%-15s' "$arch:"
> -	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" ] && [ "$llvm" =3D "1" ];=
 then
> +	if [ "$arch" =3D "m68k" -o "$arch" =3D "sh4" -o "$arch" =3D "parisc32"=
 ] && [ "$llvm" =3D "1" ]; then
>   		echo "Unsupported configuration"
>   		return
>   	fi
>=20

