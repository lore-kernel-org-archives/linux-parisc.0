Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B13DD86C
	for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784327252; cv=pass; b=e/feT9mO8uuzA04i2qJmHaAICl0gwP7urFRW4X8FkZ492Oja/jXz/tPwRQiI+SKW6S6EoqmgkxHgZzXt+zjgcBHzI6n0upZLbXKWmlNOaRCMWJp2V0uuRgHickR+5sM54IP4RUueV+9ZdY4rjy8obV/+xFXhlKQ8D2w9uZd4hlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784327252; c=relaxed/simple;
	bh=bjghg48MCQnWfaww4o0x4WM8WDb7dld4aNeQe9GF5iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ73gu/yid4sNRRZLWaU+X8jWx0evsnRHMHVo7iEdHC74IBZAG993SwK4hJMe455VeNMtqHSIH/oKi4O6LCGBj68xvoYLzJoHjkxxvefaEtgb1GbMcMNekbZce7OQJut2OxEflrKjYpjlcUGDVBupLb6bTejtx3WYQAX7NqZKt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVN6z4mC; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVN6z4mC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so5807227a12.1
        for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 15:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784327249; cv=none;
        d=google.com; s=arc-20260327;
        b=VS7NOrvuJk8ol+5Q2N5ZCsIlwLHAJ8WzAUCmbdBf28FmlymcL8QBzyWIKnJcfwVqo3
         t1MjGx1sGiYbMUPI8JLNIoJIcbGj9nG404LEV+hFwSs7FO6FiD8CWxydEnTZJaR5fpdL
         lwRIpKU28A/OePFrhOeqkqA1sbEUX9p5yOng/ftKlVIihjQy4ss3wSVitsJFqniyVyU+
         kNVIYsaWhN6A4PZRNtXlNymS5KmWdQoZVO2eC3+MidlValGVn5t+cQpY4QIXLiboe9+X
         k6DeVZE93rMKTmRpqORe24z4hcsFksqn64p/zKL/msLyIZgSE0GG7LQ/HbMq30iZOrlM
         RI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YZKl/gN+TySOtwCRRmaPismCx9J0DS4d88EwVV/LDg=;
        fh=BeslpP8MqPozR1DdbqrnzesMTdWE6G0ZIzcx5NVVGsw=;
        b=MNyj8xcq6lMvogdp2HFfebybHKIXjaUc6pEkSTpbNIHU9uJ0y62lpMMlitiR+sGL00
         hM/4xbHY17MmEomoE9zA+A9tSWP7sCEcnhSNElZ1P8QHLvMLEIy+Y3XRyr5q6LL0sMk+
         QyDFdAUqNLVF+CB3/x9jTbF9EntJVSw2S1PdsIAVSqucO6/gzlixHHAHgsAbSchs5E9M
         8vTCd3LqHwWjXMcolqcEGl0GywmIw/NKaEkTVSjrAOgAvU2fymvUTgyG/OEyjjxRf71W
         6hqngk7sikgQg+TGHouNSYl0lL7Gb3k3ekAVS7qYcJ02899meCNRws0fxw1Vn5wEfv4O
         EIkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784327249; x=1784932049; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YZKl/gN+TySOtwCRRmaPismCx9J0DS4d88EwVV/LDg=;
        b=nVN6z4mCy6O9kRcTcGAA2oMYfwtn4gHlFEr/wfJuA4JbGjH3klIoJSb0SutEAVzLps
         1NVAHJLmZ5jSc7Mh+XIeOh4VftCdi2TKKfu60bW2vOlmo4DoqP2tvHTmc1Dr94AZRspo
         bQwU0sD/Z5HcgrsbEwwZ2fRVq2cp2USKDWkUFGwYsvnqwzEH3ZLexO9hWs0kMUs9C55M
         ATnD4PdemJg5cruqD5+FB3qZqL5+e6+AAllAWcKV93HkJ8p32rOVeWJ6os46bxC3gNXs
         bkwrUvMz4wOX5wJnR+JQzHl1dwVZ4zc/q750q0Bnpq+RZNtWdKRUny1Jj9/jV06kDo9S
         WdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784327249; x=1784932049;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YZKl/gN+TySOtwCRRmaPismCx9J0DS4d88EwVV/LDg=;
        b=hIXxovrItrIDfvMGOyvlehov4N57Xek8DQ1IRyQGRfHG8mPka1v075CH2xkzvoNSph
         HfL0/DK4fYJto7UZrfDo/d9PGLQC3CX+n6P9J+0Q0NnEbiR2FFJXe4efDqUr3ztfSLpE
         Wnbbn14LooPi8HAMPNG7uiuvaC1KRIMs29KnAJxJMO0BhBd6g5IaBmRSXPVU5ayGBoiJ
         a1yulYmHzsdhMZGq2ljL8fsriGqsVQXS+ddDR2MVWco+/mhpsdwaSIQkrUaEaEeRuQZ7
         j/jzuwAgmIkhtnpAyv1i+BM9ENA6KTf4YTwWiSIFHfb4YuxVOFZZmybyQRecFEEJwTP2
         d+DQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGpW8Ub5kllklh4Jf8FqTQBpH5aKrtEj4x9vVuB2rizoDIisGhJIzBreyI9zg6ia+pUpfD8mjyjcJxYx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3DL5WB9N9Nap8p3gY/l74mNCB5Wjy+c1tsmOEgeJfocpcGt1F
	Pg+LtUVX/ao1QcpWOFnrl34wtt/gZk22ucNPPyolc0OL3jAg6ZmX1b1ZhRkdlcjLITr9IQZHCp9
	SK2NnV5rPqJ/+tkD3vbDkfLBvADqkb5k=
X-Gm-Gg: AfdE7ckrV3kKbrmPw8PbxtTwPuqalTfeIPrmWUdQcLCnYupN/o4zho4jbxhB2PxB7Sy
	IZh0tw4OsWPYe3yXe1LtiKIuiy1/4QSicqWAp0N24/hG8Vfz5hltGb6PMTFTQd3OsH4AiFJR2pM
	Mx6K7UPS2jbqSADFUJBI5/qVaYIR9k7GPc3fwW2XMUCSCGKs6uGQr27Hvm8kEAHq2JQbusNaCVP
	saVNp7TN0tlV9flSZVG8MoVLFS8cXXINVKc2vfEBqX/FQD50Bsaf3uZ7VXTPajQ
X-Received: by 2002:a17:907:3f22:b0:c12:330e:ea76 with SMTP id
 a640c23a62f3a-c16b47c4aa8mr188756566b.37.1784327249022; Fri, 17 Jul 2026
 15:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717190544.257306-2-main.kalliope@gmail.com> <730b11181226fe2aa47c5add541431bb8bd4b4fa6af6e3b41bd8a09161d2f51c@mail.kernel.org>
In-Reply-To: <730b11181226fe2aa47c5add541431bb8bd4b4fa6af6e3b41bd8a09161d2f51c@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 17 Jul 2026 18:27:17 -0400
X-Gm-Features: AUfX_mzdlcMM_kt_muK1iCKqT25JZxMJD6-eLCFt_e0NS7uPIuvrJHYlbzOH2Rc
Message-ID: <CAJZwKkgG2Ct3KipN4cRgg4v=QQwj9LhA8pveqQvT_gQ_GpzJ3w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc64 JIT
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, deller@gmx.de, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, visitorckw@gmail.com, martin.lau@kernel.org, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2026, bot+bpf-ci@kernel.org wrote:
> Should this carry a Fixes: tag?
>   Fixes: c95e269773b3 ("parisc: Add 64-bit eBPF JIT compiler")

Sorry, my previous reply here was meant for the earlier Sashiko bot.

On the Fixes tag: this follows the review guidance on the i386 patch to
treat these signed div/mod additions as added JIT support, target
bpf-next, and drop the Fixes tag (Pu Lehui's suggestion [1], relayed by
Kuan-Wei Chiu). The sparc64 and mips patches were sent the same way.

[1] https://lore.kernel.org/bpf/fa8a040f-64c4-484f-9538-fb0ec287639f@huawei.com/

Nicholas
