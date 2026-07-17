Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174F25F98A
	for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 20:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321923; cv=pass; b=FXJ13F9lrkVhZq1n2QST2+kcf8P6c4yXmF7prLNtAixxcTOEDcyT4Gr65ZRwDWiGv5FpqOeIYHhpmMroS0DFSFIxgcmA6s4dJzcYMs0WuMPimTe2uTNEdS3NHrkxlktxNqqyY9PkRuTdpgyZuIS3uM5iBuBt9FeCfsWJyZ5ScZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321923; c=relaxed/simple;
	bh=AaHe0iwVYVtFnnVoU1xS/Nv4RLKGQrG7mpCjW+za+D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXAGSNeT43qWoIN80rSc8BRMEcMET2N5m8J+0NMXQxVkmeWzz0DQfkfwSX3icJd7sqEqjdtuTxA6GYVWPkVMo1MB7ixHpCjdCD9sFvfu0hKUYm7lAJjUI7qz+7crSlebhjyn/wRQJXl6cfXf9eCqlrUPpSHsrE+I3Fa2tBLK3pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVpeC9nd; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVpeC9nd"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69c5fda04a8so13220434a12.1
        for <linux-parisc@vger.kernel.org>; Fri, 17 Jul 2026 13:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784321920; cv=none;
        d=google.com; s=arc-20260327;
        b=CUG+4WcY/Z92jg6Gxo0IiM1TExOARwxIV8LQun5IbQsEp1CWRUyfLOix4mr6HxMPd6
         Zyb9giQk2j3b/0T3aix965FR7KJ7nJwe67yW6gbH17xZamQo0dP9D84g5ZKnIy2J9w+G
         CzqO5KoxvrAxt9tmLwKOkwaTEIWSa7wEqR9jtVRMwCS3Srlro5eZFPoq5TVm503DU4Yh
         RBrPSjjY+vGSulUkA7kCLn9dv9tuOQHbn6BDTQuoEkj1tVeWiejQLOJoyWMvuKX/Es2B
         /uQiwTo/McHwe3olIMhSY6QQddsEXpO5sN8NBOv/ibeYbXXIZezktuoNVXIOLN490uVc
         4Y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AaHe0iwVYVtFnnVoU1xS/Nv4RLKGQrG7mpCjW+za+D0=;
        fh=3UfKdDasVgrt/EjRw1T3KhCxhC7hlcrEiEoA/ISvcKE=;
        b=oKsKJgHRsWKPfclEkWj+lKfot6qWEd+JGKRwTrE2gb9/bkAOMgT6kcQcHHsqN8ogT2
         eyYJvKHeoSy/QONL2/VYo0z1YurNArSaeaxz+zx30R1Ujpr8Hn8YRSMpld6dOz8yusZ3
         uh2S18ESUI6mWHOntyATGgQ1DRSPYUkGW2m+zCwf6/Hw4vZJ4mlOkpmIEoOFUyAyGEbG
         X+/lf+BQCNSAcZQPtSwgKAplq1MFo8n14x3dPgLbCUAFePMHjSUA4QbdWsRR0FeDTCvQ
         ba0OuvCtcvPyd1klJps5ZVNXMlX5apgf38XQS1Rq4LR7xKO/Eb98te0CFMyB3zpX52SM
         UjlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784321920; x=1784926720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaHe0iwVYVtFnnVoU1xS/Nv4RLKGQrG7mpCjW+za+D0=;
        b=RVpeC9ndGQDpzZfDpKyYMtGrZtjpJBZ94QRdXTHCTGgwVoZr+T0js/EvFsRQcjO9XQ
         LMXq7Dsezne9S3fLoKwn7NLsnr/aGxgTSI0y9l8hMXaCuacRiQic5ZP/MmaUvATT3Rq5
         DA5bXUVIVFwrHJYwviag556pXKmLA7V2en/lT0QrUhwIGSlhnM55n+jQXNmZVIxWu0Oc
         QhMUKV1S83Tv97PLkjvq2wvwIUHxg49l4X0EPvXKwSLzYOMQe23/PtaBwZE/gpE0JqTP
         vTJ3s0Z5L27/meSZdssRIinHYs9cby+VH6g1oLyPP8LgctvyUo83Gkq1tNDodM0i3+3f
         7GeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784321920; x=1784926720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaHe0iwVYVtFnnVoU1xS/Nv4RLKGQrG7mpCjW+za+D0=;
        b=PKgzl9vYhbqzpA40AgfACt5oXOMSopMR3YlujTrt6XRSC++GbtTUgJA70i0qvFQKMp
         NnddwWPLxf7Xsw9OFXyIAZzEZ0c8DIs25aXD4C1QXB9qu4MXIcL5jzqZPO7YGvM/rBUB
         +JY2ZdF8jDRRjWL/TWkzJKkjUp/4QcX/yt4O/ILLy8b7X++IV60BlvUcJUf5WGzFBInI
         jc1F1nOYH6GvGHveYU3QCUkH5zADHpPfTrSbfP1W8w2RugCWJGWH+cfQltSpyrAzzs+d
         tHhgBEpC/KZros7m9yb9IBFXsdyG4RvIhDOzVUQMFn3GeavneK84geYZTYvovb8UPfw2
         +5+A==
X-Forwarded-Encrypted: i=1; AHgh+RpyL6lC5KAa8RF5FMnDN0SWQ+xiZITS7kwxAIppWOd2uUJr59z0B1acbB6qCG/HQUmLqpATVpPYPWWcmqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEGlc2jt8iDNkuV2crC4fRps6XjyIcw9HGJGL6hlpCNUlBR8Ft
	8iaXpsEhv/6l6KTbnlGp25O8pVmFugPpmA/wuzsQjjVa654pjeTYvQTOgHuxqn2H6RvOIDRjyqr
	sdKI2YohDPZdj+HSiw7u8H0OTndqBPoE=
X-Gm-Gg: AfdE7cmrznMl+d6vyKi6qbENiDL5tdoGOKpXU2naxCiqS3kqhPnP/aNKnrvUYykXeVz
	EMMETvYSU7k7qLstk7DmI6aC+N4suW5IUelscFxiZsiQZad9fRhQTJNDi6DK1dNcC6PhekGODiq
	Aas498FJjkPaZ4kIp5uMNNvaBxH67yRj2zUxbzWZThLAF/gV3XCT7LLOaq/vd3HhlcNHEFL3J9T
	YslzSSuFS/yCqO3hp8KGAr+EVimV29pDXCH9y9Y23gigomSg+5mJ5BXjJP3THcn
X-Received: by 2002:a17:907:e84a:b0:c16:e3b:7d6 with SMTP id
 a640c23a62f3a-c16b4807dfbmr161386766b.54.1784321919929; Fri, 17 Jul 2026
 13:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717190544.257306-2-main.kalliope@gmail.com> <730b11181226fe2aa47c5add541431bb8bd4b4fa6af6e3b41bd8a09161d2f51c@mail.kernel.org>
In-Reply-To: <730b11181226fe2aa47c5add541431bb8bd4b4fa6af6e3b41bd8a09161d2f51c@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 17 Jul 2026 16:58:27 -0400
X-Gm-Features: AUfX_mw5OXvfAs5aw8AM7JmHJ5eQ_cpkeps9DzlUhM-9RWXoRJOLw6wcPpuOJ-w
Message-ID: <CAJZwKkjUR3FLKwY-WBSwFgK_nLrV20nGGtHZOt3Jf6SXpgyurg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc64 JIT
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, deller@gmx.de, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, visitorckw@gmail.com, martin.lau@kernel.org, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2026 at 19:16 UTC, sashiko-bot@kernel.org wrote:
> [High] The patch implements BPF_SDIV and BPF_SMOD for the 64-bit
> PA-RISC JIT but omits the 32-bit JIT, causing signed divisions to be
> silently miscompiled as unsigned.

This is a 2-patch series, and patch 2/2 ("bpf, parisc: Add support for
BPF_SDIV and BPF_SMOD in the parisc32 JIT") is the one that modifies
bpf_jit_comp32.c. It threads is_signed = (insn->off == 1) through
emit_alu_r32()/emit_alu_r64() and uses the $$divI/$$remI signed
millicode (ALU32) and the hppa_sdiv64()/hppa_sdiv64_rem() helpers
(ALU64) on the signed path instead of $$divU/$$remU/hppa_div64().

Patch 1/2 adds those shared helpers in bpf_jit_core.c, which is why it
does not touch bpf_jit_comp32.c. With both patches applied the parisc32
JIT returns the signed result the verifier and interpreter compute; the
ALU32/ALU64 SDIV/SMOD test_bpf cases pass.

Nicholas
