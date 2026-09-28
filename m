Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9554E80A9
	for <linux-parisc@vger.kernel.org>; Mon, 28 Sep 2026 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611153; cv=pass; b=nCzkVvUEGaNMSnGr+6qmioNmgLFoSGBfggzacp1MZzzxqY8RWvF64Q7ImJXDK8So4uM06WVnTjPYmMY/AX5/JxtJmvGec/ygbvZUYh96FItJwXUdKlboevGA3jvx1WVjxtGMHbv5U9Gv0KX3fA6VtKZpVi4X9djL/72lkQGefeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611153; c=relaxed/simple;
	bh=3R0bnUDCIfG5AB/zI6SVEdqlvDxRk1RhQmI3kuQGWBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plbYK9keycKwYDWortkg4vUlUPETOw0BINU/H7rwMPTWJh/MDLDuVPBnTVz6znJ3SMrNsTV+mvJAL85dJj90zssR98yzWJEQqc3n6Fj2bnyhvFBx8F2receN9SaCbjdoUM68SjHskk/xsD5DVUnyxo9j1rRkiPdPDeEJKHmOFbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A1GWxLDW; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A1GWxLDW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so86045ad.1
        for <linux-parisc@vger.kernel.org>; Mon, 28 Sep 2026 08:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611151; cv=none;
        d=google.com; s=arc-20260327;
        b=gIzgoGJPtnXUcFvhwXmuizDfgW5Jk6qg2srBYv/cFS+KKVwGKR8ZMMDmtjwoCxoXFC
         RYOYO9U5FI9Vwbas+WIW/WiFRbBfM8KUqxfw/B4Tuoetvr/N8oDnYBZqzbtJHp6AM4w4
         NkB8PGQkAgU39ijKqjcXy0Ug3P+FTYt9lL2+sP9n3ZW7x0QyxqATdqkpQBUEEaWGYFGC
         /QKtyS71aw5oFpSD8Uylg/e1XMzZAQ+t89rkfxOa5DHb5/b1jrpg+PJzDfbTtAScnjkB
         cbJLm2zpJ+FqVhPQidHrpCE2fb+W2jRK1S0cCYH8nW3NcDbXR+mWV6xgU7wmNTs9+dE4
         HlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        fh=39mIUikj0f2EyNoZbYEgDrhkwIjVJsXUJMMgm/eOock=;
        b=WiFLCXmpLzUn9msM7eM0QmkHhQrO63dVo0+uCM3VeiI/hvz9Cy6cm4cO3eU+IqHpPs
         DHHwlZTY4Tpky21mugprzN/J20SU8oJ222w7C7qMU6xOMWAmqV1OmDkcYAuzqPKaeu4t
         qgpWAOtcu6ChK5lNrB0agqgCbCrOAQIJ5A5mfGYu+taafULgwMm9pGG4enZuzQy1iXo2
         kZX/GD54yALjPLLlMAbF7w8sgplDzNqq4A2mxjuGlB/lHXisDHaVIcEa0IoShTwOfniE
         t+HjM/x5SzmYsb5fboqdA3gKGXU+kTMRZvULw4kL0ThXbLEogdUTy76zS0f3xb0Zw6ZH
         gDgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790611151; x=1791215951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        b=A1GWxLDWXd6nns7krLcj8xc5CZo4eIiNay5RL+VWGElhMGdokhu/XwPQWezVjkc2M5
         jGEKz0C02tab/tRR60LZYSLMQKs9a3jcP93G/gOOjTc2C/lH6GkIWyWQrwHvLMEivR1V
         948wbqDPcOCic9IBpOQVEmsznrqVQOMwGXEpPVX9OAWNQUY6vlhxEa0yDqETDk8hi3NS
         clPc3NR8HKTgywslo2B8wO+foaqTumMtJUWl39k0VXP91VbcIfB8hBstev5lstKwbsAr
         C+ooj/DTgP1Ro5tHsTKgebQn3vpuivmTFiuaxXVsb96TwVFqU+eaQmwmWfDiKqSrkLw+
         dfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611151; x=1791215951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aePuW6SdMhb4ew66W72zQFU5ACf7q5ldJc5VJ/cdC7o=;
        b=UwQ5vrQAgK7ms2Bk9zeZu9zVuK4qsPW7EYXfCqjI+5UP36FV3Adcov6yexmoZ8nlE+
         fvIBYgZhuWghPWnft78yioBYMOEZ1ijJMFc4oRumyJE8q+GWxrPmqyoHrBUGBsrZiBMd
         0UqNhVDfc4yLeVrzGr0BZRywmCL34sCe9t7UNbEdupypFuxkCD9stagJblOHx7BYOVgj
         smB7MvudnqWbkZrO5qwzRuZu5hH2XTuGM6SkCB1+IGGc227mshlEe+JFdJLC3x9mP2WX
         NP8fMlr/jhYpLvEF8dxL9xwHs8WdCnTXhSKnT0nk+bwmS4KWFJgJesnQC86zstJ4uH6p
         +wNA==
X-Forwarded-Encrypted: i=1; AKwUvBy3+evEvaiOwuSJGY8HvMeMfo0wyAtFj1+3b6q80VstE11Mwi9Vl1nT8jXWeQ9aVu9LzfphV6KIoKbGCjw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnUZ+KH0pLMG5T2zpCNnik7bDdZalbTa6uuxOaR11OUsXVI07L
	k5Tr3GcnhzzQuAHq6yN5XCCwrG0NWVs8MT/8uuEyUV7T84U9aMp/upWjQhBLJ57cmA7nW9FPxQ9
	txrysp+cABU7INW3/0+xr587tv01MKUjm6N0j3DDk
X-Gm-Gg: AYBFou2Q6IaMcrxlEpKa7pYcl/9kqeBL8B01kOB4qWCgitAjbVJP/v+nB5phNkRIAhm
	+SNbHlglWmTfJaOzLrT6nAbjdG5BTFJoe7rL+hSWHaHYm0soRJ95RtV1hWNuoSC6U+Sf0dXeZnq
	e0ED2oYvNMUgJXBxNCe62nvyDH0pVhMis9zTTeOOpgZXNH5PIBzKvhsKlvhcpe1bK1k5buDiIU+
	YpkszVYcsT8WDeq1EjkQ3EIUdIoX9cS9duI+sc5ljmHlZw3wJrmyr7yWAMppANfKjHoLFG7UZm4
	pwvbr8bdlRROc6c/VwH78s7EkQD1ssTWOGsL9JH+yRGzt/SNC+Qzv99ZO3yOqGNSOTv1aOdx066
	itxwUtNhA
X-Received: by 2002:a17:903:1aa3:b0:2d5:db38:800f with SMTP id
 d9443c01a7336-2dfa6227507mr7954595ad.14.1790611150463; Mon, 28 Sep 2026
 08:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
In-Reply-To: <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Mon, 28 Sep 2026 08:58:57 -0700
X-Gm-Features: AclHuK8PY4tYRy8xE2PQkLwp-Hd2yqHo30sGWzuk88EQmRBlMd_99GCwO19cbdY
Message-ID: <CAP-5=fVBLzMG7bPAHAiYtfx-NLUTgUo+fxP87SrQ=eH2saKzxA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:39=E2=80=AFAM Stefan Kerkmann
<s.kerkmann@pengutronix.de> wrote:
>
> Hi Ian,
>
> On 10/16/25 22:51, Ian Rogers wrote:
> > Type punning is necessary for get/put unaligned but the use of a
> > packed struct violates strict aliasing rules, requiring
> > -fno-strict-aliasing to be passed to the C compiler. Switch to using
> > memcpy so that -fno-strict-aliasing isn't necessary.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  include/vdso/unaligned.h | 41 ++++++++++++++++++++++++++++++++++------
> >  1 file changed, 35 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/vdso/unaligned.h b/include/vdso/unaligned.h
> > index ff0c06b6513e..9076483c9fbb 100644
> > --- a/include/vdso/unaligned.h
> > +++ b/include/vdso/unaligned.h
> > @@ -2,14 +2,43 @@
> >  #ifndef __VDSO_UNALIGNED_H
> >  #define __VDSO_UNALIGNED_H
> >
> > -#define __get_unaligned_t(type, ptr) ({                               =
                       \
> > -     const struct { type x; } __packed * __get_pptr =3D (typeof(__get_=
pptr))(ptr);     \
> > -     __get_pptr->x;                                                   =
               \
> > +#include <linux/compiler_types.h>
> > +
> > +/**
> > + * __get_unaligned_t - read an unaligned value from memory.
> > + * @type:    the type to load from the pointer.
> > + * @ptr:     the pointer to load from.
> > + *
> > + * Use memcpy to affect an unaligned type sized load avoiding undefine=
d behavior
> > + * from approaches like type punning that require -fno-strict-aliasing=
 in order
> > + * to be correct. As type may be const, use __unqual_scalar_typeof to =
map to a
> > + * non-const type - you can't memcpy into a const type. The
> > + * __get_unaligned_ctrl_type gives __unqual_scalar_typeof its required
> > + * expression rather than type, a pointer is used to avoid warnings ab=
out mixing
> > + * the use of 0 and NULL. The void* cast silences ubsan warnings.
> > + */
> > +#define __get_unaligned_t(type, ptr) ({                               =
       \
> > +     type *__get_unaligned_ctrl_type __always_unused =3D NULL;        =
 \
> > +     __unqual_scalar_typeof(*__get_unaligned_ctrl_type) __get_unaligne=
d_val; \
> > +     __builtin_memcpy(&__get_unaligned_val, (void *)(ptr),           \
> > +                      sizeof(__get_unaligned_val));                  \
> > +     __get_unaligned_val;                                            \
> >  })
> >
> > -#define __put_unaligned_t(type, val, ptr) do {                        =
                       \
> > -     struct { type x; } __packed * __put_pptr =3D (typeof(__put_pptr))=
(ptr);           \
> > -     __put_pptr->x =3D (val);                                         =
                 \
> > +/**
> > + * __put_unaligned_t - write an unaligned value to memory.
> > + * @type:    the type of the value to store.
> > + * @val:     the value to store.
> > + * @ptr:     the pointer to store to.
> > + *
> > + * Use memcpy to affect an unaligned type sized store avoiding undefin=
ed
> > + * behavior from approaches like type punning that require -fno-strict=
-aliasing
> > + * in order to be correct. The void* cast silences ubsan warnings.
> > + */
> > +#define __put_unaligned_t(type, val, ptr) do {                        =
       \
> > +     type __put_unaligned_val =3D (val);                              =
 \
> > +     __builtin_memcpy((void *)(ptr), &__put_unaligned_val,           \
> > +                      sizeof(__put_unaligned_val));                  \
> >  } while (0)
> >
> >  #endif /* __VDSO_UNALIGNED_H */
>
> commit a339671db64b ("vdso: Switch get/put_unaligned() from packed struct=
 to
> memcpy()"), which landed in 7.0, causes a performance regression on an NX=
P
> i.MX25 (ARMv5TE) SoC.
>
> I found it while updating a client's board from 6.12 to 7.0. A fio 4k ran=
dwrite
> benchmark on a NAND storage with UBI and UBIFS filesystem was the only wo=
rkload
> that showed a clear regression between those two versions, so I bisected =
with
> it:
>
> perf stat -e irq:irq_handler_entry --filter 'irq =3D=3D 49' -a \
>     -- \
>     fio --name=3Drw \
>     --filename=3D/var/stat/testfile \
>     --size=3D8M \
>     --rw=3Drandwrite \
>     --bs=3D4k \
>     --direct=3D0 \
>     --fsync=3D1 \
>     --numjobs=3D4 \
>     --group_reporting
>
> | kernel | irq_handler_entry | fio bw   |
> | ------ | ----------------- | -------- |
> | 6.12   | 155783            | 401KiB/s |
> | 6.13   | 162317            | 395KiB/s |
> | 6.14   | 168741            | 392KiB/s |
> | 6.15   | 168556            | 401KiB/s |
> | 6.16   | 166090            | 403KiB/s |
> | 6.17   | 162541            | 385KiB/s |
> | 6.18   | 157527            | 386KiB/s |
> | 6.19   | 183675            | 381KiB/s |
> | 7.0    | 190372            | 297KiB/s |
>
> The bisect targeted the large drop between 6.19 and 7.0; the smaller 6.17
> regression predates this commit and is unrelated. Reverting a339671db64b
> restores throughput to the 6.17 level (~385 KiB/s). The commit is still
> present in 7.3-rc5, and the same codegen problem reproduces there.
>
> Digging deeper, I built 7.3-rc5 with my config and GCC 16.2, with and wit=
hout
> the commit, and compared the object files: 114 of them differ. As
> <vdso/unaligned.h> is included by <linux/unaligned.h>, every
> get/put_unaligned() call site depends on it transitively. GCC did not inl=
ine
> __builtin_memcpy() and turned it into a function call, e.g. in crypto/crc=
32c.c
> (__chksum_finup(), inlined into chksum_digest()):
>
> Without the commit:
>
> <chksum_digest>:
>                    str    lr, [sp, #-0x4]!
>                    sub    sp, sp, #12
>                    str    lr, [sp, #-0x4]!
>                    bl    0xc0 <chksum_digest+0xc> @ imm =3D #-0x8
>         R_ARM_CALL    __gnu_mcount_nc
>                    ldr    r0, [r0]
>                    str    r3, [sp, #0x4]
>                    ldr    r0, [r0, #0x20]
>                    bl    0xd0 <chksum_digest+0x1c> @ imm =3D #-0x8
>         R_ARM_CALL    crc32c
>                    mvn    r2, r0
>                    mov    r0, #0
>                    ldr    r3, [sp, #0x4]
>                    lsr    r12, r2, #8
>                    lsr    r1, r2, #16
>                    strb    r2, [r3]
>                    lsr    r2, r2, #24
>                    strb    r12, [r3, #0x1]
>                    strb    r1, [r3, #0x2]
>                    strb    r2, [r3, #0x3]
>                    add    sp, sp, #12
>                    ldr    pc, [sp], #4
>
> With the commit:
>
> <chksum_digest>:
>                    push    {r4, lr}
>                    sub    sp, sp, #8
>                    str    lr, [sp, #-0x4]!
>                    bl    0x124 <chksum_digest+0xc> @ imm =3D #-0x8
>         R_ARM_CALL    __gnu_mcount_nc
>                    ldr    r0, [r0]
>                    ldr    r12, [pc, #0x54]        @ 0x188 <chksum_digest+=
0x70>
>                    ldr    r0, [r0, #0x20]
>                    mov    r4, r3
>                    ldr    r12, [r12]
>                    str    r12, [sp, #0x4]
>                    mov    r12, #0
>                    bl    0x144 <chksum_digest+0x2c> @ imm =3D #-0x8
>         R_ARM_CALL    crc32c
>                    mvn    r3, r0
>                    mov    r2, #4
>                    mov    r0, r4
>                    mov    r1, sp
>                    str    r3, [sp]
>                    bl    0x15c <chksum_digest+0x44> @ imm =3D #-0x8
>         R_ARM_CALL    memcpy
>                    ldr    r3, [pc, #0x20]         @ 0x188 <chksum_digest+=
0x70>
>                    ldr    r2, [r3]
>                    ldr    r3, [sp, #0x4]
>                    eors    r2, r3, r2
>                    mov    r3, #0
>                    bne    0x184 <chksum_digest+0x6c> @ imm =3D #0x8
>                    mov    r0, #0
>                    add    sp, sp, #8
>                    pop    {r4, pc}
>                    bl    0x184 <chksum_digest+0x6c> @ imm =3D #-0x8
>         R_ARM_CALL    __stack_chk_fail
>      188: 00 00 00 00      .word    0x00000000
>         R_ARM_ABS32    __stack_chk_guard
>
> Is this an accepted trade-off? My understanding is that the kernel is alw=
ays
> built with -fno-strict-aliasing, so the packed-struct type punning was we=
ll
> defined there, and the __packed annotation is what lets GCC generate vali=
d
> code for the unaligned access.

Hi Stefan,

and sorry for the performance regression! I largely work on the perf
tool which is in the tools/ directory but uses kernel header files,
such as for unaligned accesses. My work was motivated by trying to
avoid using -fno-strict-aliasing in the perf tool.

As the compiler is given __builtin_memcpy of a fixed memory size then
the lowering should match that of using the packed struct. Are there
compiler flags you are using that disable compiler optimizations? This
feels like a compiler bug, a workaround is to use the packed struct
helpers in linux/unaligned/packed_struct.h

Thanks,
Ian

> Best regards,
> Stefan
>
> --
> Pengutronix e.K.                       | Stefan Kerkmann             |
> Steuerwalder Str. 21                   | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany              | Phone: +49-5121-206917-128  |
> Amtsgericht Hildesheim, HRA 2686       | Fax:   +49-5121-206917-9    |
>
