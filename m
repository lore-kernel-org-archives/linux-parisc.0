Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760A3E49EF
	for <linux-parisc@vger.kernel.org>; Fri,  9 Oct 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581340; cv=pass; b=Gcx9udC2W7KSx+8wAe83pSR3Uz2hHZL2ScdaXoM39+jb8Ui/M66WaeQp2tQYGoRi7DfQtW5YYjCwS1KfuhzkH/ZCINvhCoFc26cZhqfH4fC9XnUqKHEtPAUp9nZuh8qlsQoteFVKQ56gDPCrpld8XIi6GbbSZQuLYAKthmKwQt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581340; c=relaxed/simple;
	bh=a/9Q3cvAgoFkNiS3mJRSRUF8fjX4whAD6hwvaRo5yys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOjrbZRm9/+bPO/4HRvFsO4jkPkOKIVXnQL7VYsmzLSVsFj/WWqvljROpEbVm20VJY41I0TnF/YCn9Av5IVXIxStPS9A5Hw30PyDlswkAaFG/r8/Vv0TxyqNM2BKn+oB83CmreTvTr/lJLIBMrXjVuNrgMhc8RtCuNcVx4UBJdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WeoUwBqm; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WeoUwBqm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53584e7c349so8501cf.1
        for <linux-parisc@vger.kernel.org>; Fri, 09 Oct 2026 14:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791581337; cv=none;
        d=google.com; s=arc-20260327;
        b=sXL+2x00Eq9ibrZEXHvdQjFjN6KZCEdJV4nOslh4mTebvLbcOe85APOFQWVvryjSVa
         tlkimAYaEItwAMnO4fXoCOKgrgQfhMYtNrkQzzSiaWFBd6OJt3jG5HN9KrDiRFhMCF7d
         oTiMcbdkOxTdBXXHYt0/sL9/vf0by6vJsdD2YJWMLOHHzXo5d/HZRkUkl0Z2pPr9sZ+d
         NeCyRK+NF8IpItVdBoyi55tg5m8M5DseOBAFvbKMnL0hKnKwjGgFRqeFvNRnFgkCpcJV
         X5r2VZhEoisqjeqs42WhQoiG1hpK9OOYXlglt2WBASG7sjfLkfaAEtkhWecF7+jY9Gv/
         fiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        fh=IxQby9AxsawGDAwezThDTzIpCpeqi/1eqdtwKIQ/c0U=;
        b=W9AXJrFqI12jSTvpeGwn5CotfI2x6m/Iqi0PEpUAw6ftGoby4SAGfG6Mhe6g8ebYRq
         aRNqWMafxt/L0z6TuP82cJ2+HWowbY2oMK3c968QmAliTSW46Y83TP/03xvyR5bTDM1X
         eHnEGzmcW6+FvlZadWdL0gh+XWhil2NkaD3Po9oI4qoa3GiZCpqqaZXH+/UVPVv0VpbZ
         MtcOe9TiRlMvuiMSWO08FDJ+HVdyiOUtIKc2p0sTgtNZdAPomh/3XQkxvyoyRTQTplYR
         etXdDEQd1AdkhQoYEsbMgpmPV/Lyr8B/U2EP1qLneoIe1CgY60Jbnm5dQsMU2jADSgYj
         zHHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791581337; x=1792186137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        b=WeoUwBqmwVsUMZoTtFvLEgJk6Wm30mis+G2ws8Z+ct5b2ApdF+VtYb6De0CZy/AWKn
         1L7TLHcQbyUbioB1fy07USLRPtyOhkE0izz9VOJrHz/bWUaXoyhfPIFLNKhxXs5yUb2H
         /nf0Z47jVubKha0paRRDeep/U9uGFH/JEFQInJDFQqudOuBbeValLEVBbdU9Hh4p08zs
         B3nYlwNzrNoF43VQYT1U+PZXm7nAWRBjAQhC8EB5gXQDcSSDMpXTYMstY2RdjmSaOWS3
         xpAdastUpCp5RJiBTcvBMBqFbd7AExZZvYB6jQKM/guFvKdO+m7mwYoEOH6pPdecQOLe
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581337; x=1792186137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IKZfH3sy4oofpBPlk2oE4c17Byi9lu+cjayFH35PqIM=;
        b=apfk72e9pqI6RpZRDcRps1+kOrclVkmbbyjOUvH3HqAKf5gZH92iKvUH1mxWoffeSn
         u/CwECUNU5sOeuvFlQqBQKNc+zI+aX77g0B0zEwSVabUyrUs8WeG9NFgEbYq8zEB7y6l
         0UK0IzJ75mnRPQtiaAsNDDNmaRaML3itFVc01xQLFttS2ij12PWzkzik/OKbJhMObb75
         gSR4inQzpjWsv5C34vWqFO6BB6GlIyJNgaNH5/gCW5MOR9+u6VaD4NGaTohLb6Z+pDtJ
         5/0o1qvPNTNHOB6Pv0F9NQFEy20Iz7QNKeKLfjWvb4jSRrGeAhtAZbM5vw+u83XdhCfp
         OcHg==
X-Forwarded-Encrypted: i=1; AKwUvBysbM/HAmeod0wD4ZV51ATjsp2tH29c21WoU7R+MegzMoIuKr6/8q/VDvPHxBlwdOstYNIDZhBVljqWNHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMR+k9tlzmc48yxB7ErfhZCEWFuiN4agQuFpbcheQZke/Thjc9
	sR4rcLqUHk5K8vXwwAWcEMF2UQIeNr4uPnPMhfQJcjqi+Zc8hEEFM3+UZ+KdkigfzXK5WiDus3y
	YkefhKAUc3h7Jyyt0HfRQpfvBXea+nffvcPgBdy+b
X-Gm-Gg: AYBFou0a6wS7k8bHaTErGdyQI7EBveSOoZb0JoVnfCX4BvuL2MYIX+sZsyrnhPJAn/H
	hxvIjtAF8g3JmZOpvyug/070HaHwDwNQHQixPUh20ARYuUbNvwAB1Gbm1j6xbgC58HwD6O+3zwb
	NlHaJRXdbxRFS7bklES7EMlz4BQIqtwsbq1mVE+/xshKMXiiYN82j3kZCXcz8W4xr8XH/0Y/N2W
	LqJb8n6gs5dGjVWRkeThotrj2Ob/rKX1C76oI5HECnhZr/tcrnjoCiCws6anS015jI+x1cHwVTs
	hTJ1jcYr3Eza4fjKsyS+LxaDRP0a6PrthVD6G9QbXw6ZYzq/Ck1ETmUg9ZqphvAuVEtO
X-Received: by 2002:a05:622a:a0c:b0:52f:9ed4:8d75 with SMTP id
 d75a77b69052e-535b170f724mr1981601cf.15.1791581336767; Fri, 09 Oct 2026
 14:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
In-Reply-To: <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 9 Oct 2026 14:28:45 -0700
X-Gm-Features: AclHuK-VUSoSdxF2IRUEKAo-_KUdN5wKF6M9V7O0h8No-t-g9WPWd7vmeaN_iwI
Message-ID: <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:00=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Oct 6, 2026, at 14:31, Marc Kleine-Budde wrote:
> > Cc+ Arnd
>
> Thanks for the Cc!
>
> > On 28.09.2026 17:39:15, Stefan Kerkmann wrote:
> >> Hi Ian,
> >>
> >> On 10/16/25 22:51, Ian Rogers wrote:
> >> > Type punning is necessary for get/put unaligned but the use of a
> >> > packed struct violates strict aliasing rules, requiring
> >> > -fno-strict-aliasing to be passed to the C compiler. Switch to using
> >> > memcpy so that -fno-strict-aliasing isn't necessary.
> >> >
> >> > Signed-off-by: Ian Rogers <irogers@google.com>
> >> > ---
> >
> >> Is this an accepted trade-off? My understanding is that the kernel is =
always
> >> built with -fno-strict-aliasing, so the packed-struct type punning was=
 well
> >> defined there, and the __packed annotation is what lets GCC generate v=
alid
> >> code for the unaligned access.
>
> The previous upstream version was the result of endless discussions, and =
it
> looks like changing it to the memcpy version was premature. At the time w=
e
> unified all architectures to use a common implentation, this was the only=
 one
> that resulted in correct and fast code on all architectures, so I don't
> understand why this was just applied without including everyone who was
> involved in coming up with the version that was replaced.
>
> My feeling is that we should just revert this. I'm not sure about the
> motivation for the change. It sounds like this was meant to be
> used in userland code, and that clashed with assumptions we make
> in the kernel, but I don't think that is sufficient reason for
> regressing kernel code.

So the original motivation for the change was that the perf tool had
an OpenSSL dependency for the sake of doing a hash when copying jitted
code into a fake ELF file for the purpose of disassembly and
symbolization. The kernel contained the same hash function, and using
the kernel function allowed the perf tool to avoid an OpenSSL
dependency. Linus asked the perf tool to minimize its dependencies, so
we pursued this change. The kernel hash function used the
get_unaligned code for unaligned memory accesses, meaning the change
required the perf tool to add -fno-strict-aliasing to its build flags
until we could have a strict aliasing safe get_unaligned. The strict
aliasing safe code is what we're discussing here and when originally
written it sat on the mailing list not really doing anything. To my
surprise Thomas Gleixner picked it up 6 months later, and I believe
something other than the perf tool motivated this.

There was an issue with the original series on Power IIRC, they had a
char global variable that they knew was an int through linker tricks.
The change caused a correct compiler error of a 4 byte copy to a byte
sized address, and I forget if we used pragmas or a local packed
struct get_unaligned implementation to work around this. I didn't have
a way to replicate the problem locally, I was glad others were helping
with the series!

Am i going to be able to convince people builtin_memcpy is a better
unaligned choice than a packed struct? Well memcpy is the expected C
way to solve this problem, and C compilers like clang implicitly emit
memcpy intrinsics when copying things like aggregate values. The
packed struct requires a cast to a pointer type violating strict
aliasing rules, but has been sound for many years because of
-fno-strict-aliasing. We'd like the perf tool to be clean for things
like undefined behavior sanitizers, but separate userland code could
support this. I was trying to be as useful as possible and I don't
think the patches were rushed at any point.

What the bug report shows is that there is a lowering problem for
memcpy with GCC on ARMv5, presumably as ARMv5 lacks unaligned memory
operations. It seems the packed code shows how we can teach the faster
unaligned lowering to GCC for ARMv5. Fixing the lowering issue in GCC
will likely win performance improvements elsewhere on code compiled
for ARMv5, as optimal memcpy codegen is an expectation for things like
copying an aggregate value.

Fixing GCC would be best but a workaround is to use the packed
unaligned functions:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/linux/unaligned/packed_struct.h
I guess this could be a pain if there are regressions elsewhere in the
kernel that also need fixing.

I believe I spoke to Stefan at LPC on Tuesday and explained all of
this, suggesting the packed unaligned functions as a workaround. It
would be interesting to hear of other motivations for memcpy that
Thomas may know. Perhaps some config value defaulted to memcpy and
switching to packed structs works for everyone. Maybe separating the
user and kernel code makes most sense.

Thanks,
Ian

>        Arnd
