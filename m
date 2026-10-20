Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792514339;
	b=obbCExcclsG7E0G03l1HjySWWo0R5TEtK2qJX3tdMeOFt12fZz2Ui0IOoJSomax5utxD
	 98EFZEkJDVaPCHwWDkoxZOJfjIhM0S5Guo+Sj/qiYpXabFuYSDLA6sKyCVZFTc96Tbc/H
	 LIb6YvagwrgGuK+5Dkm9orm2pNBRwmEKSBjO+TX7TcD3da8kTTrssv/D9F0VVpGGpNrSo
	 GEDnEtyf7ilc1QIop3IaVcS8bzgeA0Rsao2AZBOsVLQ8yjYRAHGtuprPgLCOfZ/2tT48N
	 Gjd25/907tJZ3/qxt53RsUU6nvTsumipYCbtcK0Xzdr0xm9MVZb8YPkzzeN3w3S4wlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
	b=WMf3eIH4H3e0gxZJOBT+WwTiIlCs6mueloUDYeLQUyth8AR/7megRR39mc//FWMgr2nj
	 XQDaOq9fCCt2n0dsT7TgdhuxVR78iR3YMUl3/wnZiuhOktjBbTq8XIK9C+SzbcXsRQVt/
	 PmSy/Fw3PFdHgCyr4ysRHkU0b69NajVV2MNyD8ZZN9722UtVfVVDXvjYo9YmOUx7xOYHK
	 Xd0jFIJKQVdSyyZaZjFX8UFDAYCdSDBK1eNgbQ9f5l1AzFssJYA+8d0xFSsJ4QrnQf7MF
	 ovpljaxSX1g266EYhSWQLfL7KgTEl2pMzZcOl6FVmtDbXk3kQqMajPzD7lSBWLduygQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bhrjRpWu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9C606D50C
	for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 16:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F9C606D50C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bhrjRpWu
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e901e114fdso17356345ad.2
        for <linux-parisc@vger.kernel.org>; Tue, 20 Oct 2026 09:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792514338; cv=none;
        d=google.com; s=arc-20260327;
        b=TkSvBIeNFXsNrgybl8W5+rbqF9uxnT8VMOWuLD+X8+gMO+pWJ0LKFz/D4UJQgOX6TX
         lFM4MA8g+gvD53jdJhBrtvnBJR5xs74pjSCooO1GYWarCE367RXPorlX8V6ryJ/KEWl+
         fzU3n/rJokaLbnMOb5+DISr1JW75nVWtIvEfjuWlXJvIutPmvrR7p1y6dMXFN1e25bgk
         n3UHkrIjl2TgPu7Gg6cwd0G1SR4oBWcXVnG2Owk6P1dB21NIT5Wv1iOmdRZGhurbDE9t
         PeTVglDO3wc/oEMhD6SenWNwEg3nP5coj9SDz8seF31FBUJAO6y8oDA3h2BBoc6dZbQ8
         dYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        fh=mjWrsAoCnrj62uGAryUdUQjurb/BlLhgpEOBPw7o7Mc=;
        b=s+KVyoRcRJ5ME2KrKBgqth/yg02cqnNh0yxXP8a2FRcDk1IZ1qUIpTlVnp6wzY9MhI
         IR6ZXOgPlxtJUVOhIgzxe3SnhZRsZmA7LveZ28c62DDUlySKEq3tsVqn1zBlFHKenQCI
         wCiHJdlWDseWadeArPWtTxDbJCKwizUqKGRraESAWv5lkjmT7PA20MAF9A/Yy6ojWRtS
         QORxpkFBXMJsnD9h+prgIBdvurdAqJg0+5pbRYqxFh9GTjC/A4uGMbit2xdR8p3J0JhX
         BQ+EPtFiEOUlfozUjpivQS+PY39o3gPELxsJ7ZbYnWUZittC5g4RVjfg5oLo2QtB8/zJ
         goMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1792514338; x=1793119138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=bhrjRpWu0eGR0mE7t1R2EKK44MSLwYJnxjk1nLcJSyE/TvEcfeILcndt+mxPFeuKeB
         Df4RyXiHl/+WXMqlKsBueqEOOQ3aDIO/t7Xw0Z9sahm02g0cft37HjB7TVWezuXphO0z
         faGcorPxu4XbN6jQqDP57MOboPDy4HvG0Ph0CtCWlfANenPIWK0uxvDbNsdvH4ZAPghC
         cf/A2DTYknM0OTs4gGHIS9mTYwGeHIVQkY7KcXxSK1XvA/Nfi0WYjy6F4Vyd2quPZzMv
         xJ6EEn3y5cc9ObmLNEJjyfuZnuVMJyzTbo7CcXub186JnkbfzOkwdW6RLUFiF/dpGsTj
         WVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514338; x=1793119138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5h6v8PMV52XAIibb0bLKm7PVGjK4muo/m4wCC4Oc5nw=;
        b=xJs+ZimR4oEUXxXTOhlrkRhpwPqk3x7xDg7l3v/7QSuMijzzINtNtTXS4Qu3mSJRDb
         3fqO0abOqkBG8PG/sAJtxA24JBbT3gy/AEsN3jZIxQjJK8fSCYNCKWUOlVm8W/E+Zh2W
         2ET1wHCNV2rwvgNmEfgu48Z/ktbdI5u88Ot+nk9dJ/GTkGJk3iNIgNyoSlXPb0/Uku9F
         fLaktGsvrGNG+q78iMflbWflgfENiP2K0z1k7tcktcpELO38EhZ4lXI6V1b7+0Zfk9RR
         WEEMqJhG/v0mUNr3o1DIm0MxgJCabQxf3W/zt7feca35R+3NaKpclYA2EeidNTKGwZH6
         833g==
X-Forwarded-Encrypted: i=1; AKwUvByq9bGKkE9ANBQFD2N9Q3I/NWqZBOL5dj1NeZLi77qo/U0D+SpK8S3/6XMDBuB1OehPKlU727l7WXpZyLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFJ6KOC1JNIx/RILZeDbxjaDO9aSQdMKVFjMChAgkC8WbsH4hS
	MwvwcK9+dlG8zDrNNHhbpA7K044Mgp1/EwtcEKu6duxze2UxurV8DN1tRj7Ie2V87FvoAZc/uXj
	BVkZvWmrCoSd7vYgGmwPHz9JL/1hcFl+QNc6Ya4uH
X-Gm-Gg: AYBFou0/2/PzyQ9IlSEdyhr3npoSs4vOsg9itZ18hzW7i/S7Imk2HVqTetcqKQ1R9DA
	St57ejjvIT5SUEKDiU8oqQcyFeFQ8w9vrqW4/S/02uHPV48zKwSSWs3fDgTs863a0Ng50TKbmtu
	kPThHYk42Fv/No6a1P5K/soGmoIU0aLP9naX15Q7agfJsO1ACX6lUY14jjW0Q3KNZgGteEUfz+Q
	j5ir7ysD3YsYWb/85OSVybIAdEnwGIJ93ZrsfKhB68CLqoLi3HXnvWoqf7DSq8ZiAylJwLiRnUE
	nZybyy31XknTEkD9H0ZV4SEfQxR0a6fhz2G/4F1IJQjWGi+IANh6kJ3lje0ekNy1JKtKxuAwg97
	q+azgW9mCB7E=
X-Received: by 2002:a17:903:1111:b0:2e6:dcce:8227 with SMTP id
 d9443c01a7336-2e9a6c1a30dmr99034965ad.37.1792514336247; Tue, 20 Oct 2026
 09:38:56 -0700 (PDT)
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com> <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
 <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
In-Reply-To: <CAABTaaBL=TScs8Qqu3b8F6KZPGMyvwy6cBC3teDaBL6MGMucNg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 Oct 2026 12:38:41 -0400
X-Gm-Features: AclHuK9ZakV6IFm9eD67kaqUic0iU1MgVPLS7VN6RgjPgTRZmZP6_X_XOYOX9ZU
Message-ID: <CAHC9VhROsmzbm+AP63Sm7mqCokgEy6Zu0AVMY0gxp8qY75Pqiw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:36=E2=80=AFAM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
> On Thu, Oct 1, 2026 at 6:06=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> > On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redha=
t.com> wrote:

...

> > * As pointed out by Sashiko, when you were converting all of the
> > arches, it looks like you missed alpha.  I took a quick look and it
> > appears that it should be a pretty straightforward conversion like
> > most of the others.
>
> I've actually dropped the alpha patch as per Magnus's request [1].
>
> [1] https://lore.kernel.org/audit/CA+=3DFv5T4826T2sd0Gbh-nfZsqcWK_phdBKy4=
BLWOvDTt92t5Eg@mail.gmail.com/

The problem is that as things stand, this patchset breaks the build on
Alpha.  Perhaps this gets resolved during the current merge window,
but as you know we can't break the kernel build ...

https://lore.kernel.org/oe-kbuild-all/202610041836.6TatRQSm-lkp@intel.com

--=20
paul-moore.com
