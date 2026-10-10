Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6D3EC82B
	for <linux-parisc@vger.kernel.org>; Sat, 10 Oct 2026 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634849; cv=pass; b=mIVBZYPMlm1Y12oBtrcrH4dbL0t53dRn30U515ciH4R3kazusOd//01TC50ZKugC2ynyGC8peC2rEqvKvx83F6kq7X1egg9m0dgbi4YkrQ0SWIWYEvVgb8YlP36UUYFUDup2Qd3sxSczCawG9pcDLFKnwRgM5VxzIE1XhytFldU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634849; c=relaxed/simple;
	bh=lc4UsY1TZLGvC2N0lakWf5ohFA9smFejBK2iwHxxb6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLo6EahdU8FckhoLfB548l0BB92IzDQfBGVJ0tkHOjsPb5B3xosse9/xFo5Ll1pTXFULkerT4O4p73kKweoodSrEcsswFsJIMn73x3PeA1Tfa38jgC/ZEQHS5yZFAVvgLFEfOb0ddTdLcMVdrBSMtP/txXzbN8UXFgyM2lQh6fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZvIAIewd; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZvIAIewd"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5337fa12431so66081cf.1
        for <linux-parisc@vger.kernel.org>; Sat, 10 Oct 2026 05:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791634847; cv=none;
        d=google.com; s=arc-20260327;
        b=Qk4+hO2ZTI2gVvukDewgwTnVAHrZDJQzQ077tWnftsDZ7urIAuF2cJwi5UpITShhat
         AF0JYY2ha6ZO4bgkqpGM3MwZ/rudyyeJ9Ci0zHTy48rnLlTWqeLjYqAXnFwx8sMDJrCW
         F9sETI/uSsS2CWTJOPwX2KjC+l98BVGe51HyVRZOmiOFZVvDng50ZEc4VjqIJwdaL/CZ
         draBY1fAPi77sTHAG80Yh+5jVAYg7dbsrJpd5N2lmcXOzzsHBB1cxruL6n+i4E/DXT7X
         kidFcxG68kpIUCSXwzY6xdlVVVCuRVhDrr/7uYpzrkmmNPu/WsIH0WEEaWOfQcTQGono
         sqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        fh=kt+ZVbe/Jh4JjQhzKBdh9eqFshmLEg6+1uR5yK+KE2s=;
        b=dNYiCkTMQKCHnXs19bt7Sb18n4Ah+bak8EIH8NRCl0TJ4ErMC6Tskk+HErTi8NMbWd
         rD/LjP80tWB/W2H9jsqh4jAw3Dr167TRjj0Ezs6DD8h43ZNrokS7Y0sCzMXGQLvbKTbN
         4IK4W5jwwo2O+NJ9ci45CI0zHo3vsOtjv9OWyxb49VsEy7HZsC4LXi2sDAQk3CueaP3C
         XxCKkcViEVoUq/BKZuTTu+Oeq9gwAaGEamuWnXrha+GAZ3NSzn1MvtA8ai61/c/FZIp4
         PSMRtWB/IyloYkUftJnxERhIE1ezg9uFvECz5UUb1UyfEzyN5SzzgoYtevaB7oUAK1nM
         VVNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791634847; x=1792239647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        b=ZvIAIewdLV5P4Dlh9k6I9ddOCBm/shEpw4jJ3Hmjz7hMvseD9tm1PgWVT7cHXLgbbs
         D+JbmSJuJQwOBxL4/osd1k3xz/9MIPtR9vfcdI8jJBiEmNDgtbp3mocjLkqqYLhykJBE
         +V3YlIBcpKvdPOAInd+t7bY3SKECdOAIwRIdM+TTRo2R7OEF3ewhLbALkhdf2lAnz+fQ
         EwtBqvD6kA2U/d1VJHYkBe5r2BK7BBpHVG2kECeR+LSqn1uCYeCihappkEgbBR/RC6Rp
         zCDVuc6b19Ae6iA4GbNP2/9TMywtGmD9Y5eiNNMNzIOPCRBNZ6VLuZSij+LiWMUFh1ED
         HWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634847; x=1792239647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPFHphyntfv7EujodlAC35Zv0BkEnP7paRj5r0L1kh0=;
        b=H0Fe7hqyl+Fk8pjdelKTw8mHDuPf4OsTnTfcrY+RZUrqDBNrYvnteucwIOzUj8oSPp
         AkElcQ/300IfZxTxW8dzTwSHdvy/iOLziL62tebc5JGXhrbOP5zPF5OsmSFFouGLiTYO
         mpy8x+HN4B8+fTsMYOQ2T5y/UChFaeQ5nur8JSCt84e4O5lzcyp2/fc0YYO0VV0bvWWc
         l2yVtK1VgGopRQaNGwPxziMhV042fmDILQ6aBp67X3aq386Ql2ZCZQsm2gSHyIv06JOx
         OPme4P5QY9vsAw6C9p/h4iGMbOpnHfP3BJgS6ybxAsm5sxZOdi7BWCHSzI/qiVaHdW7a
         EUcg==
X-Forwarded-Encrypted: i=1; AKwUvBzb5lLHSIGpYWtV3LN0BTHBDETBIDIa9sBmDZqazAYtqQThzBuThjc1vQGusGROKJP7rNzHTDt5bBiDyWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJfZ8rtTyePUEJJrQnMUmcc6GshNXiMTY9q2e+xwHnhFhU/YTL
	aMibdPtI68qaDdsLZfklcnEiDl/tg+WealXf2CvYV/lGhKcCfOruDF6LCMqCzXuZjafNDSJtKv3
	5C538mVw6i/26h20HtquqqgiYiM5xa0aN85pFAUKF
X-Gm-Gg: AYBFou38zw1HTTDPSvccR99avDLPKOj9Dk9+ZJ/nTAYs32e+SzyN5XvcO0f81hxr00w
	UjsmH3CpLdrtGCjdnLyG8WHFGNJviH112zvl6V/WwCh6sUtEdDfTInpzKzFckyQBEU8zkdYXoaH
	rTXTYNpWakIwk2i7nS65lJJHZinUP1d8P+fIVmuiXaFZ/C69IipKTma40Kt/vftlhpF4XIwop6J
	hFIG2Jrr7jiKpMFPotIbxPH3XOZr0VR4m1CgtoLTr/bhRg1iP1no37zAuVxGhCiSYmlKbGuyykE
	P6KdH7pF0WDFF/290dVHCX471Y2wRqv/LoXuPl+t4r2hjKcX0yjQeBce
X-Received: by 2002:a05:622a:4cc:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-535b2910266mr7700761cf.0.1791634846455; Sat, 10 Oct 2026
 05:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <620331f5-c576-4895-b4a8-7bd0baddbde8@kernel.org>
In-Reply-To: <620331f5-c576-4895-b4a8-7bd0baddbde8@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Sat, 10 Oct 2026 05:20:34 -0700
X-Gm-Features: AclHuK9Se0rWE6CksnCr93m6yCZdqzjvzXuHkfM3w-HeKaeFOS0TfWGW9tcRQsc
Message-ID: <CAP-5=fVOJNtg99B0_xoSZFCf6ex_YBf_ohhXSdzZvPXU2NTWXQ@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 3:26=E2=80=AFAM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Le 09/10/2026 =C3=A0 23:28, Ian Rogers a =C3=A9crit :
> > On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wr=
ote:
> >>
> >> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> >>> Cc+ Arnd
> >>
> >> Thanks for the Cc!
> >>
> >>> On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> >>>> Hi Ian,
> >>>>
> >>>> On 10/16/25 22:51, Ian Rogers wrote:
> >>>>> Type punning is necessary for get/put unaligned but the use of a
> >>>>> packed struct violates strict aliasing rules, requiring
> >>>>> -fno-strict-aliasing to be passed to the C compiler. Switch to usin=
g
> >>>>> memcpy so that -fno-strict-aliasing isn't necessary.
> >>>>>
> >>>>> Signed-off-by: Ian Rogers <irogers@google.com>
> >>>>> ---
> >>>
> >>>> Is this an accepted trade-off? My understanding is that the kernel i=
s always
> >>>> built with -fno-strict-aliasing, so the packed-struct type punning w=
as well
> >>>> defined there, and the __packed annotation is what lets GCC generate=
 valid
> >>>> code for the unaligned access.
> >>
> >> The previous upstream version was the result of endless discussions, a=
nd it
> >> looks like changing it to the memcpy version was premature. At the tim=
e we
> >> unified all architectures to use a common implentation, this was the o=
nly one
> >> that resulted in correct and fast code on all architectures, so I don'=
t
> >> understand why this was just applied without including everyone who wa=
s
> >> involved in coming up with the version that was replaced.
> >>
> >> My feeling is that we should just revert this. I'm not sure about the
> >> motivation for the change. It sounds like this was meant to be
> >> used in userland code, and that clashed with assumptions we make
> >> in the kernel, but I don't think that is sufficient reason for
> >> regressing kernel code.
> >
> > So the original motivation for the change was that the perf tool had
> > an OpenSSL dependency for the sake of doing a hash when copying jitted
> > code into a fake ELF file for the purpose of disassembly and
> > symbolization. The kernel contained the same hash function, and using
> > the kernel function allowed the perf tool to avoid an OpenSSL
> > dependency. Linus asked the perf tool to minimize its dependencies, so
> > we pursued this change. The kernel hash function used the
> > get_unaligned code for unaligned memory accesses, meaning the change
> > required the perf tool to add -fno-strict-aliasing to its build flags
> > until we could have a strict aliasing safe get_unaligned. The strict
> > aliasing safe code is what we're discussing here and when originally
> > written it sat on the mailing list not really doing anything. To my
> > surprise Thomas Gleixner picked it up 6 months later, and I believe
> > something other than the perf tool motivated this.
> >
> > There was an issue with the original series on Power IIRC, they had a
> > char global variable that they knew was an int through linker tricks.
> > The change caused a correct compiler error of a 4 byte copy to a byte
> > sized address, and I forget if we used pragmas or a local packed
> > struct get_unaligned implementation to work around this. I didn't have
> > a way to replicate the problem locally, I was glad others were helping
> > with the series!
> >
>
> I can't remember any special issue with powerpc, I've looked into the
> history and couldn't find anything either.
>
> As far as I can see the only problem we had was with your version v1
> where you were using memcpy() instead of builtin_memcpy(), leading to a
> VDSO link failure due to missing memcpy() function.
>
> But if you think about other problems with powerpc let me know and I'll
> look at it.

Thanks Christophe! The issues weren't performance regressions, as here
with ARMv5, but build bots that failed due to warnings about the
memcpy source or destination being invalid.

You are right that PowerPC wasn't the architecture that failed; it was
PA-RISC. Here is what I could find in the LKML history:

PA-RISC build error:
https://lore.kernel.org/lkml/CAP-5=3DfVEp8UPS-B3X=3D66AwYbbbs8559AHEObpQZSV=
nSnVYSxhA@mail.gmail.com/
PA-RISC workaround:
https://lore.kernel.org/lkml/20251016205126.2882625-2-irogers@google.com/
MIPS failure with suggested workaround:
https://lore.kernel.org/lkml/CAP-5=3DfVBZPBz6J1omfvSS4JLkueRGqCdouLji6gsFLT=
eu9nJTw@mail.gmail.com/

Thanks,
Ian

>  > VDSO build fails with this patch:
>  >
>  >    VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
>  > arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not
>  > supported
>  > make[2]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kerne=
l/
>  > vdso/vdso32.so.dbg] Error 1
>  >
>  > Behind the relocation issue, calling memcpy() for a single 4-bytes wor=
d
>  > kills performance.
>  >
>  >   170:   7f e4 fb 78     mr      r4,r31
>  >   174:   38 a0 00 04     li      r5,4
>  >   178:   38 61 00 10     addi    r3,r1,16
>  >   17c:   93 81 00 10     stw     r28,16(r1)
>  >   180:   48 00 00 01     bl      180 <__c_kernel_getrandom+0x180>
>  >                          180: R_PPC_REL24        memcpy
>  >   184:   38 81 00 10     addi    r4,r1,16
>
> Christophe
