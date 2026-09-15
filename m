Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com [74.125.228.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51DA455194
	for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 19:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789502299; cv=pass; b=APogp8N8vH+NETwQ1Rx2UmLw0Rsby0dI8YWBJn5VAoJaYlZUBb9cNvRcHUDmcl9VeiWVv9vJOix3iFPO2ZZagpasazaJ5GksZxb3jobQpbbbqoBUpo+8POCGEzkkRyCNl6YD8pjTgK4rxVOOy93Z/h9n/gLgeQZ8XIgOS1PaVOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789502299; c=relaxed/simple;
	bh=FAzpqMwwi6sl1VtdlXZIoUcU/qbo27j0XppRaT5WpEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENRUQ56JmQwrhCbWPlzGLLB/w+5jNzMXuiu6CcirC3HnzOQfc6X3pV/mtTe7sS0i0TVOaZx3/RFrlJgsne69Iu6baH55yIBCHq6iAymvwiui4vdIg4JXGr4XT8gn8lZcjNNFX6/7VHGDH94Zdh3n1MnefLk4/T84Jkjxjn4Kygw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HikUK9bw; arc=pass smtp.client-ip=74.125.228.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HikUK9bw"
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so35654666b.2
        for <linux-parisc@vger.kernel.org>; Tue, 15 Sep 2026 12:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789502295; cv=none;
        d=google.com; s=arc-20260327;
        b=ldOeFfPQ58NcbYWSnL88OajzK8sP5Bryk+FQxBs0xIt3MpjmXIgJqcNRV+otv7qm8n
         usRISK/Si+cXaXXJWKxr3z5hcb12a6JrfMSnIq9qLgVvJzvErBBMU5xKkKx4S4ZTTbdz
         0hTa3oUSlN8EwKfrFgNcQhqWQlzNpiGEV61vAUogm4E3duGBPTRHgLiZnph6rIUGgiiD
         Z4rcPBuVnaO09rTKpf6esCYTZJjtnpnx9ZjusgQnDAqa885eusyE1+9675E3tP2u3YhT
         C9G56JJUVLHwILp/0xY3le2H0hgGPud1+NyHX2VOqapIlWWe2iYpMxEgeYzPCSAfLVx5
         wZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        fh=OarHmhUUfTpleQOUgs55qZgftYM0DY4qLSH04zv7IIw=;
        b=gCX9HjXG80kgtq4C8tb6Kq84rsDJiJ+vvvt3nmUmt60Bedb5rxVBzBfPsYI/OhmI3f
         ISg/ETDEJSeGml+mlXKiMux1NWOtrBOkoIY6EjyKw1K9SHL9NaAjqIVOOoqydzk7Vc95
         4RbMcoZqKFBdR32xXj9G2/T6JL0tVZ6S3jor8toVS7ZT2Uu/EiSn9fS3uE0/ychiKZJ4
         wOxCriHIML7MmricsvWL26oPJkPKGBLfPsAaGtPs8/u8dsJD/m5IuQqKcEzTyHVn1Cph
         zMOjoeXMhAqc/aJdpsugbP2xc7maCiXzJqCnnQPWEQDasvFkTZZoEieeid2uYLZlDgCi
         UhYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789502295; x=1790107095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        b=HikUK9bwFipO7qeORpqKUhq/UGbHnkvXJ9iKuc4JiGJ+MAze5OqHKubqBOaOuAvWnG
         gIpuqCaI9uwqxYXbgyDaQkHfKfUJuxLR+GJ8o0XeR4CVZGKBei5RhA5f3ZP9ywuAdYDd
         X28ATabr4ia4s1N47mnDqdJ719BBiKAizUbeLbEE40tEJ9aqziVn1uX7v9n4WZ0KidEl
         980zf0r0d6ECTUtNI6LAO9UnhTlK8lf/xpT6YabKgke3QAg7JVyltx2aQ5kfeqyRURkP
         EPBA1Z5eKGYOsyTk7feJSg5tMu0EX5ZY8GLCmjTVGrE0LksHcJayLBh1+j6PQM+hEVjM
         2xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789502295; x=1790107095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgDjIW7K6yfw9H2uuq39mJuCV9xfXKip2q8+G3ZS+/Q=;
        b=WwsG3cDazZzizjmtlN3omykr00JgT2KE/gM7VfbjstWPId0kKzjcdGNdYtITia0/8a
         ChDaMTuG2uxsmXiQMFWeWCgCeI9fcAwAerhjfpqVNp+yJQOggda2UcT7/O+ztSTJrKnV
         cK79Y1GINHyS9Z++/KNfYiBQQ/mWehpI/+ejoZBuDp13nKePTvObVmFfY5RvoaugsoON
         jGHbJTgtYyLBPGoXywNHroljauiy2sIwV9hkqfZX7o3AiVMSZXa6HjnQOqG7Eblkkff8
         ztDu0KxKhSlOuRgzZicQWUMTU8BnwDHOEFqTO/TJecAhjdYkyMKSunbgWuoqfr7Qi4b5
         Cplg==
X-Forwarded-Encrypted: i=1; AKwUvBxt230ZEamXd72nr98Ajcpk1bvzgpZFv5qrJz2AMpcvih+Tokg7ouQGvztUhAlK8bH1Mo/Ln2VuHIUto24=@vger.kernel.org
X-Gm-Message-State: AFuF++lLr14xlosOTVSsg9t/NkEdR1bTsEk6Ow2BZ1Xuufo2J6PJUG8R
	2SxSBV5RlflB1tmfU24EdK6XdowZfsITm9+xT1gHRyiqV7E6il1GUqSJbtXJVAnpAq+iX7nuLLL
	arlIn2m5bwiRa7MWfrRtIARZyNYs8j7g=
X-Gm-Gg: AYBFou2bV9kGDxBWCmCxel3WtH3dQe9GwVWeQs8g7WpH1+LP+TFP0u+ZKBQuFdmnVzn
	uQOjzKXrSoggYNvK1trKCjLQzExvs4OydmB45QdmzAMpLEgoRZ4EPTcecru7z9j0EsgLkVs+nL4
	DQdGEQl/cInFnX9tDKMGP5Cpqwj8W3aeb5p45sCL9ItcMHV5AsAZDyc6I4orycEabuCN2VrfPPT
	ul6L6H34dk8q9JTX0AnChCvBkbg3olhkvmRL3Lvh6KQ+HXDzLUlvt3aMwXskZLfnTtUDDpdQexb
	KvKKJIrdG0RrKcq3QnU7YlE5gAiFpdOUp/+imue7lcvg2cG7KLV7Bg==
X-Received: by 2002:a17:907:a089:b0:c25:c7a9:7b8a with SMTP id
 a640c23a62f3a-c29b86b80b0mr897677666b.12.1789502294655; Tue, 15 Sep 2026
 12:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915022905.1535566-3-main.kalliope@gmail.com> <491fb0b335c0814e914b3d041b8cee9fda122c37567bd20e456fd3758fb51568@mail.kernel.org>
In-Reply-To: <491fb0b335c0814e914b3d041b8cee9fda122c37567bd20e456fd3758fb51568@mail.kernel.org>
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Tue, 15 Sep 2026 15:58:03 -0400
X-Gm-Features: AcwNN1X8inw4eXVBgVo2LOS-mWKdLjd8l2uN2YGRgK2WHAH0Wh8vRRWq_n5o6G4
Message-ID: <CAJZwKkj62Oq+rdXWboGYTucw0mDYqFB=M1MhcjaGumyLTyYLgA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf, parisc: Add support for BPF_SDIV and
 BPF_SMOD in the parisc32 JIT
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	bpf@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, visitorckw@gmail.com, martin.lau@kernel.org, 
	mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2026, bot+bpf-ci@kernel.org wrote:
> This looks like a bug fix for the parisc32 JIT's handling of signed
> division and modulo operations. Should this include a Fixes: tag?
>
>   Fixes: 847b98421362 ("adding ci files")

847b98421362 only adds CI files, not parisc JIT changes.

I submitted this as missing instruction support to bpf-next without Fixes,
following the RV32/i386 guidance [1,2], as explained on parisc v1 [3].
The current unsigned results for signed operations are still incorrect.

> This isn't a bug, but would it be worth naming the sibling commit (or
> saying "the previous patch") instead of "patch 1" here, so the reference
> still makes sense once the series is applied?

Agreed. Please replace "helpers added in patch 1 (64-bit)" with
"signed 64-bit helpers" when applying. The preceding text already names
hppa_sdiv64() and hppa_sdiv64_rem().

BPF maintainers: please consider both patches for stable after mainline
inclusion, patch 2 needs patch 1's helpers. Per the BPF guide, I'm requesting
this here rather than adding a Cc: stable trailer.

Thank you,
Nicholas

[1] https://lore.kernel.org/bpf/fa8a040f-64c4-484f-9538-fb0ec287639f@huawei.com/
[2] https://lore.kernel.org/bpf/alWEj2hDtxz8RW-l@google.com/
[3] https://lore.kernel.org/bpf/CAJZwKkgG2Ct3KipN4cRgg4v=QQwj9LhA8pveqQvT_gQ_GpzJ3w@mail.gmail.com/
