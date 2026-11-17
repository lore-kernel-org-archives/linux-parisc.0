Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794937630;
	b=r/NmiEkFJUcrDxO5Ap+PXZ+E5KZIk1Low+zfA0jMxMu82ixCFmJ3wQTgXJdrd1TvvE2u
	 UxohZpSJvLxzttfnWtpoOIFKLxystGyGaEfWb8F4WPjqSMdESqbk90ccTFWupcokbbzuX
	 TG45mLtcLhrTg40qekMRJMGs8irLfwUghdtKPwGZkGKZd4SShIglb+YIXv+IUYwCQcAPo
	 32boioyDhfPnRqf+pxZBpgf6LXI0dr7ixZS6UY3VzFASzD2HZVDpUx/nG4LV1RNF4w+Rd
	 k4BD/S11eo6nH1UvhrWt6Fov5CN/V5R+8kX5WD/alAV0VjxnvmlBg7g01rxOy3csW8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
	b=2J9QIYDkJudAB3ZgXIlaAAkzL3IcM+BwKlGRzZY2Rz5R9x70VxEr5Ciba4j7YNjEwwtY
	 2ATBl2KzQpdDVestW1WBTM7/7WYXvDkk3DxY8eCp0WmQqDV7P/W8ojaR+TrfoSzLt0O1j
	 ciAnlUZuEEHhWeCcYO5ZxsGeYu6HqaT+Eckf7pFXVgOKVc6bdGrIVDgIMXkFqFyMgyxbU
	 +li1dJwyD++dP+i3O7FBQClCDAteJn2RvTvBdx2RBqUH2x5W12DtL4Cd8oW1rTmeC/qaZ
	 BRcLBCbsnsccIomGTLvldRFNN2ZvnsWLDfR66iBkabOyZ9DjbhQ1vMqozeb4V6nXRMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJ5KMTG0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E788606A32A
	for <linux-parisc@vger.kernel.org>; Tue, 17 Nov 2026 17:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E788606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IJ5KMTG0
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533202fe429so1541cf.0
        for <linux-parisc@vger.kernel.org>; Tue, 17 Nov 2026 09:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794937628; cv=none;
        d=google.com; s=arc-20260327;
        b=PsQw05nRG1yEDoptQJTWI02/DPTfLpLhpPGIVA7xudsgxssRGW1r4z7NPyeCurk9Qc
         n4GIneIxJlyvMcozVqoijgtmn08SNmtVDxWPjbUHa57IwfCA+nEzNYVjU/2HP7G+eD04
         YokQGF4Huiivx0ilrIqxcrbCMG7H3hPBF6IeDd81aBChW/i+1UQjVLU4RxfZmYmmt+d+
         j7IR2uFrMuvX5IhwqVWGLZmvoKycQriS7z8UPdL0GfaGKZ5LRABS23SRIPc01rziIT6J
         dzfw1Kcu6wRdHb0l7yU3Xd8lA37MfMJ98iJJQodPwmZ3/qh2Mv9nNnnZcLhO9/1PFkgU
         xjPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        fh=3K47fa6eBRdcg1sZCFiWF/Hx3Jk55ldwCYJ95Zocrx8=;
        b=RAB5zQLTk1T5xWNzXZrmFzRO8rb/otQR6Vp5L/iLiJHjFU0sgYxBnnKMRQ9bJ6hwbk
         /c2Hw8D1k/vbmIXw/NTba6c36FICQ9wNNIh33LllhKxbAzytRQKnyMpq36AbfyAhVotw
         Swil9Ijb/a2rbCz78Km5jKO0HHSv59kyFM+8ZOy+bfrgjl7z6h5+G2Hho3R6g18lPucC
         CnYIblmjI/ihp3WTQfXD1cooxJ5Yx5nVUZssika3ACUWBxgMM/uA/VLOVcgou/QTUNDG
         Has4HnjKjUHv+WG1kZug5lFcJvV8W9SIgQBfG8H9QoPg4wbSz2DuPL4pRipQVNhcaUbu
         0SWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794937628; x=1795542428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        b=IJ5KMTG0QbNv/MJY3rTVUnk/O1ALdTRR3BpXXAZcTZP8kynWkquf6pssJOCLPPmJti
         U3p4pc0jyrnxA/W/q1fz2Y++EJU5GrR2NHtVkvgZOyk45pVjkxZOylrZfLVUIf+pshkh
         BdejLYSozOaWDU4TOUL3pqGKEDeycbbH/Ibzu1CNgKlzZUTuWygr6Jj0BQiirOaWKK5/
         6rKgKB2YoDKbtbpgmkBuJPC5LFCfnNCej22yGERJ9cUY5eCg58Gr3am1j4AysmzkBbh3
         hVc0nw4e0Fw93c6Jf/uv2Z/CLp1Jv5GdqEvSUfDf6e3wYemc5ssvv5y2S01fVPb1hkHd
         Ah8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937628; x=1795542428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3uzp4+86b55hehi4XpFs0uw2TeA8qMCUFAPxvdP4xkM=;
        b=zesFhwc89Ppml+Iy2xSqoeYTT7TwORLEnS2SxMxt7pwqCfnbCDYjdNCGbr+tn99jan
         KhAXJnc0d1EXs+zoT64htf82yizPJEIGoiFeceUcKl4yYT9z6lkrE3WlsjS0eneHau3T
         hladuG/iR0eoYsVUDXvNu4WOpk25Suj8OeIb2LwezX2hhY/Vk3v/QpArK1ft2wkNWnqG
         4Do9tMWQU3KryvA6P48Iz6baSrA2qfPm15reERW5mpSCTxkxOykSAj3mvVtsvVFPp9gT
         wXMm1MwOnp7rBoZXdJBqNHXAWVgnGtMkoSPsTefVvTRwOtKKwUibfN+wT3JQFDNpwJ//
         CIAg==
X-Forwarded-Encrypted: i=1; AL+hErGMdWcMdEwFq3cZMDYOf0c3gIMoNszrHLGP7MWkADU2S5U0m8qvKqCShneJ6QJRdMljnReD6mNBwvNteOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6PENcbDef00ik6pJrju5TUz/cxQiao/95IkTdQHjbBAe2sbvw
	4nMJ1epbjE6stNV5xZ5x6EF5fu4DxTrizhpP6SAVsBIqYDW0jttnGMJ0OfROctI27ivUYuVqOnL
	+KKIotPVHLipbSaE0dCFC+FItI3UVpK+9yo2YhJVu
X-Gm-Gg: AYBFou0aQmigAKJmpPyU37VyJ9DCklACrOydtwrMRUgJ22wB1OUEN1CmdIN9N2OSB5L
	uZg7Qha1KqU1OUjn3g7+Uue2uo8y33dNAA1D8pUObKyasPZtTmOXbwes+Q3yF5KC1JFp6fBU91V
	euSeq39qktHbPKnfslD9lw3Df+XPZDKUqKfB1K/B3HPigsfaaVumVxtVd7KQgXvAoyydICPlKmD
	SrV7wnpSAiotL4aLhZrYNnxt2Z3J9zfU4ri1Ezs6q1m/hQluER+r9jaCvpI4JAOb8ge8PSfHZB/
	Qkt2p/Cc9g7CGaxtrMXewf0wN7lWcP+lZD07G5MVueUVID64k7T8cPlLk+7Qu/8Zu2O01n0mkrK
	HYG4o3/Xbr6/cgXzE2TFNis0AX3y0iz/B0V0IqIu+gY6z40hPYyO34/+ZPerzkMne7g==
X-Received: by 2002:a05:622a:4d93:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-55d5a579e20mr102551cf.0.1794937627637; Tue, 17 Nov 2026
 09:47:07 -0800 (PST)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20251016205126.2882625-1-irogers@google.com> <20251016205126.2882625-3-irogers@google.com>
 <47f8c30b-e326-4ff0-a2bc-5683209a9e2d@pengutronix.de> <20261006-dynamic-succinct-woodpecker-a36c7f-mkl@pengutronix.de>
 <2f6094ff-f585-4b8b-8c25-20c11d1bfc7d@app.fastmail.com> <CAP-5=fVt81pYz_EXj+QNG+hFGomb-xcpm-6=ZNzNm+c2sbP6UA@mail.gmail.com>
 <b2a50293-d6f7-41eb-854c-c43bc9874ffa@app.fastmail.com> <CAP-5=fW25k8uOeamGRhwbFUUZ8D0D1n5YK-NFF7_2JMJcGOsiw@mail.gmail.com>
 <20261019-rapid-loutish-porpoise-ac4efb-mkl@pengutronix.de> <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
In-Reply-To: <20261117-refreshing-convivial-chupacabra-60bcc1-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 09:46:55 -0800
X-Gm-Features: AclHuK_pWCOlG4ab-5-H08lA17LztOZgzs1IbjyYwWDE0LVG_vDvfj3-KsHEHKY
Message-ID: <CAP-5=fWKo4QwAc2Ozp4ScvDdF4eKj_J3Ba06Sd2af=TwyHJO4A@mail.gmail.com>
Subject: Re: [Regression] [PATCH v5 2/4] vdso: Switch get/put unaligned from
 packed struct to memcpy
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:19=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix=
.de> wrote:
>
> On 19.10.2026 14:37:17, Marc Kleine-Budde wrote:
> > > I was trying to reach an implementation that avoided undefined
> > > behavior and benefited both user and kernel code. Performance
> > > regressions aren't a benefit and fixing compilers can be tricky, so
> > > work remains. I'd prefer to avoid undefined behavior at least in user
> > > land. I'd also prefer to avoid config values, so using packed structs
> > > for __KERNEL__ code is a possibility. It seems a little sad that we'v=
e
> > > lived with a strict-aliasing-compliant implementation for a year, and
> > > we could regress that for the sake of ARMv5. I don't feel strongly
> > > enough to argue for kernel land; hopefully, Thomas can say what
> > > motivated moving the patch series forward as I'm pretty certain it
> > > wouldn't be undefined behavior in the perf tool :-)
> >
> > Can we revert commit a339671db64b ("vdso: Switch get/put_unaligned()
> > from packed struct to memcpy()")? It touches "include/vdso/unaligned.h"
> > only, so the perf header will be unaffected. Or is there an automagic
> > copying to "tools/include/vdso/unaligned.h" happening?
>
> There was discussion and I learned a lot about the nitty gritty details
> of compilers, optimization and UB. But the problem is still in the
> mainline tree. What can we do about it? Is reverting an option?

I see the config option was picked up here:
https://lore.kernel.org/lkml/179423891136.2093942.13129678709622655290.tip-=
bot2@tip-bot2/

Thanks,
Ian


> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
