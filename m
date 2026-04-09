Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E402EAD1B;
	Thu,  9 Apr 2026 08:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723937; cv=none; b=jt6gM4wekJvtn4mxkLD5klw5Ni43UA1cohW9TGkKkHpVZwlt9l/Xjt6OkK98VuMk2dU2saQa6qX+jh7P/AT7bEA2iP3sy8O0pcRArkd7oK0B7USodpypnFy+FLLdmnSKf8iBrA0j0GZYBBa3X3EQt8UguRsUVkY017PHp745qqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723937; c=relaxed/simple;
	bh=CvTAP++7DT3bGr+MraRHY/qiJlhmfLPpPTmYM0xn++c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4A6Cb4pbOLUHZ2Mw2OZlMIr7pkhoUF8jFMBBAMtLmAaxwjZ1DGymXadRJFFzbBEqqaSRGbaRwwUzPIOZ3T2GWnSVJhy2tfJbfZNVv85NWeXbGK3PivRuZJk8EtvpcsSadxPCu/6vBBahaSgK2jpKdsTuDm4660REeajIjtSRo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XZAvTWug; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XZAvTWug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775723932;
	bh=CvTAP++7DT3bGr+MraRHY/qiJlhmfLPpPTmYM0xn++c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XZAvTWugZbBvbXGQGW5slFfDD/Nd/TK3rl0nVVBfKMAT6AgSD1VLoulWp+GdArHUk
	 Kf7DSRa2rlTET/YwLOqeH+ZasYv/WoTY/i/+QVCM0s5fMfZJEgjVSLxvsGVaXR5A9N
	 9WFmxnnm1wgt9ghs8nAsBLupJ++kS2yC/U50bblE=
Date: Thu, 9 Apr 2026 10:38:49 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Helge Deller <deller@kernel.org>
Cc: Helge Deller <deller@gmx.de>, Willy Tarreau <w@1wt.eu>, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] tools/nolibc: add support for 32-bit parisc
Message-ID: <9ce29573-1c0a-47ec-8c0b-4706205cecbc@t-8ch.de>
References: <20260408-nolibc-hppa-v3-0-961f3754b506@weissschuh.net>
 <20260408-nolibc-hppa-v3-2-961f3754b506@weissschuh.net>
 <adbTmisC4ICO_RLD@p100>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adbTmisC4ICO_RLD@p100>

On 2026-04-09 00:15:54+0200, Helge Deller wrote:
> * Thomas Weißschuh <linux@weissschuh.net>:
> > Extend nolibc to target the 32-bit parisc architecture.
> > 64-bit is not yet supported.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  tools/include/nolibc/Makefile                  |   2 +-
> >  tools/include/nolibc/arch-parisc.h             | 178 +++++++++++++++++++++++++
> >  tools/include/nolibc/arch.h                    |   2 +
> >  tools/testing/selftests/nolibc/Makefile.nolibc |   6 +
> >  tools/testing/selftests/nolibc/run-tests.sh    |   8 +-
> >  5 files changed, 194 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
> > index 7455097cff69..81187126bf93 100644
> > --- a/tools/include/nolibc/Makefile
> > +++ b/tools/include/nolibc/Makefile
> > @@ -17,7 +17,7 @@ endif
> >  # it defaults to this nolibc directory.
> >  OUTPUT ?= $(CURDIR)/
> >  
> > -architectures := arm arm64 loongarch m68k mips powerpc riscv s390 sh sparc x86
> > +architectures := arm arm64 loongarch m68k mips parisc powerpc riscv s390 sh sparc x86
> >  arch_files := arch.h $(addsuffix .h, $(addprefix arch-, $(architectures)))
> >  all_files := \
> >  		byteswap.h \
> > diff --git a/tools/include/nolibc/arch-parisc.h b/tools/include/nolibc/arch-parisc.h
> > new file mode 100644
> > index 000000000000..8580be5c9c58
> > --- /dev/null
> > +++ b/tools/include/nolibc/arch-parisc.h
> > @@ -0,0 +1,178 @@
> > +/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
> > +/*
> > + * parisc/hppa (32-bit) specific definitions for NOLIBC
> > + * Copyright (C) 2026 Thomas Weißschuh <linux@weissschuh.net>
> > + */
> > +
> > +#ifndef _NOLIBC_ARCH_PARISC_H
> > +#define _NOLIBC_ARCH_PARISC_H
> > +
> > +#if defined(__LP64__)
> > +#error 64-bit not supported
> > +#endif
> > +
> > +#include "compiler.h"
> > +#include "crt.h"
> > +
> > +/* Syscalls for parisc :
> > + *   - syscall number is passed in r20
> > + *   - arguments are in r26 to r21
> > + *   - the system call is performed by calling "ble 0x100(%sr2, %r0)",
> > + *     the instruction after that is executed first, use it to load the number
> better:
>    the instruction after that is in the delay slot and executed before the jump
>    to 0x100 actually happens.

Ack.

> > + *   - syscall return comes in r28
> > + *   - the arguments are cast to long and assigned into the target
> > + *     registers which are then simply passed as registers to the asm code,
> > + *     so that we don't have to experience issues with register constraints.
> 
> side-note:
> this is actually really tricky.
> I've seen cases, where the syscalls were not using the given registers,
> because the callers were too complicated and the compiler could not guarantee
> to actually use the given register.

This is weird. We are using the same pattern for all other
architectures, too and so far that worked fine.
Was it a compiler bug?

(...)

> > +#ifndef NOLIBC_NO_RUNTIME
> > +/* startup code */
> > +void __attribute__((weak, noreturn)) __nolibc_entrypoint __no_stack_protector _start(void)
> > +{
> > +	__asm__ volatile (
> > +		".import $global$\n"           /* Set up the dp register */
> > +		"ldil L%$global$, %dp\n"
> > +		"ldo R%$global$(%r27), %dp\n"
> > +
> > +		"ldo -4(%r24), %r26\n"         /* The sp register is special on parisc.
> > +						* r24 points to argv. Subtract 4 to get &argc.
> > +						* Pass that as first argument to _start_c.
> > +						*/
> > +
> > +		"b,n _start_c\n"
> 
> you can change that to "b _start_c\" (without ",n") and move it
> one line up before the "ldo -4..." instruction. It's a little bit faster".
> The ldo is then in the delay slot.

Ack.

> > +	);
> > +	__nolibc_entrypoint_epilogue();
> > +}
> > +#endif /* NOLIBC_NO_RUNTIME */

(...)

> >  QEMU_ARCH_USER_ppc64le = ppc64le
> > @@ -199,6 +203,7 @@ QEMU_ARGS_sparc32    = -M SS-5 -m 256M -append "console=ttyS0,115200 panic=-1 $(
> >  QEMU_ARGS_sparc64    = -M sun4u -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> >  QEMU_ARGS_m68k       = -M virt -append "console=ttyGF0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> >  QEMU_ARGS_sh4        = -M r2d -serial file:/dev/stdout -append "console=ttySC1,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> > +QEMU_ARGS_parisc32   = -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> 
> You could change that to (untested):
> QEMU_ARGS_parisc32   = -M B160L -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)" -nographic

Will try.

> >  QEMU_ARGS            = -m 1G $(QEMU_ARGS_$(XARCH)) $(QEMU_ARGS_BIOS) $(QEMU_ARGS_EXTRA)
> >  
> >  # OUTPUT is only set when run from the main makefile, otherwise
> > @@ -215,6 +220,7 @@ CFLAGS_i386 = $(call cc-option,-m32)
> >  CFLAGS_x32 = -mx32
> >  CFLAGS_arm = -marm
> >  CFLAGS_armthumb = -mthumb -march=armv6t2
> > +CFLAGS_parisc32 = -mfast-indirect-calls
> 
> would be good if we could go without this...
> But for the beginning it's ok.

Why? As nolibc is compiled again for each application, any users which
don't want this don't get it. For nolibc-test it avoids a dependency on
libgcc.


Thomas
