Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A3E3CAE88
	for <linux-parisc@vger.kernel.org>; Tue,  7 Apr 2026 16:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579257; cv=pass; b=DTV6RBCX4mnzvcs182oapBXyQFKJt+usanoywDnhLxLoZ3ekmMZArn5SNQXhnWDTQtBVtpsao7D8fOXX2D3iPfse9n3nIC2ahj01RlaHs++7x+dhaFvW5txkl9xC4oX2Znwa/vcJN4URdSAYaEbF2x7Pl6EbcCvs4ejFYPKVuME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579257; c=relaxed/simple;
	bh=jjliaUW/bCmoGseWy4e9nHUvSFUIgSqJlttWlRrdXbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/pGB09O91t7BD9ovzWL1khbe7DTlIx2ZWSWTc5wDvGgyvsgUaOk1gsbnM5BV0ICKo8250Agw9TefaYXFWSLGSMQjV79NpMeChHHuYbNWWsYGv/PtEGQVNIA7N+o57he0ROZyBCUgdJjCXdIAqRvyr/OLTNZ34eMyEp2O4qSZjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R8T3qkV/; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R8T3qkV/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so293555e9.0
        for <linux-parisc@vger.kernel.org>; Tue, 07 Apr 2026 09:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775579254; cv=none;
        d=google.com; s=arc-20240605;
        b=da+TFDLSx2iP6BvNywJIh0EUrJXNP/LqQS8jkZuN1/dv3+Xec/niFjxdMxpPgimg9Q
         bKMd0Tzf3cy15sgdAYsG+1o2EYB+tG6oNjdg8ygzzzEc3/8wrXshiltCvUIe5McxJYM7
         8JW8kQxQIrhbzk49A9dioF9p0+1kSeqTxAPrlfut8eX57u+F0KJZ192UqV/nAIvRX9Pc
         6hR26urJmtkG4Xh1Tzcw6IcyvLLHJE2nXdbdnxMduRnxYB97oyAnSxMabr97DNzBUlJP
         ak/qmi8lWSSbpZiHAag/oG6FeOnug2AnT/GNOgR4kkmKDUTON6hvl3KwRr1JXH26iZR7
         DiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FGtNlqpJcxcfn9EsC+uRndBkewaQ7VxazH34/2e0wAM=;
        fh=VHpnf/b7tVtgoHoZ59OD+G/YraP72AVyXDBROUbEn/8=;
        b=Qq0I1D88I/zX6/pVOoP5tTes1uCCMJwol5KKFzBYoiaYRmMqramdE+2X9BLYe7/54W
         PqwVz6kVkVJvO6b8PjjtRWrXvIT79TmJZf0pSuYEkM5zzp2TuQgD7u8XQeuHUprVxVfU
         4Dbx+mUGuxm3ekpvLlUQ/EegZyy42Du1Pu+D8DQPMIsuxv9PoUHJ5HYhC5FCxuKJLPXa
         N9INmuEsF+VI1aZvUDdkNTqqrjnDSDPJziHrTN6po4ECeASDBPEgBb5dYhbXCaWxmhm1
         W/8yvVe6nie3FdBpHtzeDh/UZSStfKBVwVn7FOEqfB1LXDX8Kl7rSuAd3n1zZ3uSicC4
         zlAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775579254; x=1776184054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGtNlqpJcxcfn9EsC+uRndBkewaQ7VxazH34/2e0wAM=;
        b=R8T3qkV/jAdbK3xqxxIYJ3G2WsRfDQF/OSysORgYcuQTu2hXrPCm5rTI/ijEv8DEIR
         csIM5zu77hVz0ZCfy/xF3/Jmefj1eiYpnQi8KCofjoSFt3P2nGDnZf+o51aNlgiS8/uF
         WonJR5QVrBn8vWA0rpaDKJnCrXavwMq7m29Q0LKY8RaUG+mU0/pG+4K0KG8LCCfYBRsD
         H327sNGVQAb9IwKY7johXlHTB4J+XQdBKTI6q6vn0mMeg+VQWAGrEoEDOG70EzPcvP9P
         vniTzXLDibMyecxpz+anoxl2Vvf/p4BzdMsBF7T4f9EGBymLa2eP8v8bF5Is4am9vfZy
         tXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579254; x=1776184054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FGtNlqpJcxcfn9EsC+uRndBkewaQ7VxazH34/2e0wAM=;
        b=cQJtks2ObSrFIne/KFBhbjKD0oKF5OoILZBdbPaivo3N+ni0Ycwbl6U/SAjBRUrfNH
         rzLbKHJLZroVTGcTkCMxpva0oxET11RxeOgzOXVyovrgrgsdrTgolG1LhUoivwIjTXYH
         Itt6TXrz2Ja0SM4bG4Lv+kJpAFPFK5IogyLzRoBGa6t73kARpRtbugZBPJNQNuV0VPLd
         l5684WROjd7sHeIml5LlNbpO5goxdrzcb/Cnne3Df3dfihSKWS2Ld+25RRtHpf4qL9wq
         HZMNyM3ObM0d8luhVJvN4Uf2b7SXWLj4Z7Aisanlrc5ItUanZd445i2yy4SVtuN1EfIT
         tlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMmuIC3EpGpg7yUioTQ10SaHyjMvIWA5kAu8uu75W8yQUq5VuxZOifRnt7y+2Dp6osXVlxXL57oYh+BiA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmq5vJ6F39E5s6Zz4lLhwe45nH2Y4urHEeeasl/8XUQ/MaRaHw
	FTFrvNM+iJv3VLcoVhWRJCIg+L1nmOit6YTtFZCyjOgsiHSwr+UIsH7sQre4W+jRJMb5tKdZgH3
	/z0balgHK8jRspViXA6mtgMSjCc/pyABrkNf5gHz5
X-Gm-Gg: AeBDieuTB00Xotc6J1MaXOgyimiNJgUK4qw/dDZaAGg11ELmXXndGWAdHjhxWoO7ACw
	qKFhmMgedcDuQH9L5WEz16rxd+yEe2+1I6PCYXgxovpVgTFZWfkPEzezEoD2uGizH4vaNsPrWap
	bnEjeeN+0uylnjLDgu40Uf2n3dTSvZmvKRMro6V6/CnO3CxtEe76RhN9EMxs9+cM5mDYHijcWwh
	fOzpdfYUa4fJWSsJgwUAhyEV6IQ4+mJKa0wibhpGbiJTF8iqizvOSBL83lv78IKCwlvuR2TO8vT
	5fF0
X-Received: by 2002:a05:600c:3108:b0:485:1a54:9407 with SMTP id
 5b1f17b1804b1-48899eda575mr4184305e9.0.1775579253471; Tue, 07 Apr 2026
 09:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <adFuw1E4iVyiXLf_@p100>
In-Reply-To: <adFuw1E4iVyiXLf_@p100>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 7 Apr 2026 09:26:57 -0700
X-Gm-Features: AQROBzABvcI_2GGYiVYCekmkhftWI3XYcqIECaEq7sar_6AXldhe60V3vvobbpE
Message-ID: <CABCJKucmXyTUxE6fApftqLOTwOgOLu166Gd_K-JeBqAZenou1A@mail.gmail.com>
Subject: Re: [PATCH] module.lds.S: Fix modules on 32-bit parisc architecture
To: Helge Deller <deller@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Helge,

On Sat, Apr 4, 2026 at 1:04=E2=80=AFPM Helge Deller <deller@kernel.org> wro=
te:
>
> On the 32-bit parisc architecture, we always used the
> -ffunction-sections compiler option to tell the compiler to put the
> functions into seperate text sections. This is necessary, otherwise
> "big" kernel modules like ext4 or ipv6 fail to load because some
> branches won't be able to reach their stubs.
>
> Commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and relate=
d
> macros") broke this for parisc because all text sections will get
> unconditionally merged now.
>
> Fix the issue by avoiding the text section merge for 32-bit parisc while =
still
> allowing it for all other architectures.
>
> Fixes: 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and relate=
d macros")
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: stable@vger.kernel.org # v6.19+
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> diff --git a/scripts/module.lds.S b/scripts/module.lds.S
> index 054ef99e8288..41e13e9cbb9d 100644
> --- a/scripts/module.lds.S
> +++ b/scripts/module.lds.S
> @@ -41,9 +41,11 @@ SECTIONS {
>         __kcfi_traps            : { KEEP(*(.kcfi_traps)) }
>  #endif
>
> +#if !defined(CONFIG_PARISC) || defined(CONFIG_64BIT)

Instead of adding parisc-specific policies to the main module linker
script, could we add a separate config flag for this and have parisc
select that in its own Kconfig for !64BIT? Perhaps something like
ARCH_WANTS_MODULE_TEXT_SECTIONS?

Sami
