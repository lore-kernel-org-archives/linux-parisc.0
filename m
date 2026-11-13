Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605059;
	b=z44zz/a8LkdjQ8LOSMvBTp8jPuyoQD2OhiZfo+1iZKQRrBHniGM5XMPqgJCtiV6Obtww
	 dDGtz41N5EiXaXTU/TnorYOWApFAWMxRtoZYAoGXnb97RgqyRzqfCo7XRacqfa0uVGeWR
	 NQDyOGzFhOvKvcl6oN4PoSh3DjF2hB3W+IU/ISUU+mKvbQWD/Ns/SZCtzitpG2ObIEe17
	 Czm7zJdAGhjJAFbZXMBMNL8XtKeWPdGWv1OqX+WIhhqi0jD4cDsxy+s2xDTibuHcRk5aW
	 EkRx6IYWLmizdADHDuhgbzXSdOFITwfNLpojXJ3UgqLkLO1f9rUcBLuRG7Ola5brw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
	b=LAa9OkSclFjZfCx4Dxf2Aa6dKjw0aL5eFbe+IDTHS6F1bvvpTZO1oVcg3SGrqs9ET9KM
	 lxweCZOYJO0qP23vkaXWgEwlosZd0oLNzegELSItAnnsolBlx7Y4Gc9NROLjY+4RhyBGS
	 C05exzKkC37sFwtS99kyip3oDFuBgykkRlaGZRhox4B8JpfyrM7HWVhWDOlZv6K3OQnPF
	 M6wxXGQduQnd9jT8UoyMD3YlA35TdOuir2ujzfg8IrFZbDhIcChVFlw94rgIKQRqk4IQf
	 0jJ0Vln2d5RgBAkaVf55fhV5u1ItD9lwLrgLYTCllKZoW48Q+OedsROJ0oLFppCs6gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIO3iS2R;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B96606A88A
	for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 21:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B96606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIO3iS2R
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b335ef6441so14170577b3.3
        for <linux-parisc@vger.kernel.org>; Fri, 13 Nov 2026 13:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605057; x=1795209857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
        b=RIO3iS2RV7Tpg6eCUSLoRhHJjC8HOazmZ5idRahgh/6DI5mndK/odzajLwB5rXS2PB
         fO5JCXtYGxzIdmG5nIvtJwb4sUEuN71rlTc9poJIFgr0r7/vstHZMF9uwSG2u4JYwZxT
         Qfq7sXk0V3t0DGySNP+FYF7c5tQzLp89rLSJlV4s8cbn9PdIMPfKC4brIz1z8u4CahCx
         OrRo+rnTFuxrGIdaA4+J69IEh7d/YdQAaQ6QFxqpZGrmcYhwGCGyod9Gyc+mKS7WOmac
         2e9B9JTwqYgR39wbJw0wzEZLEIKZxVt6oShjzGylmejTQrKlIrcwHxbH6Qfb6hN7FjMX
         njBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605057; x=1795209857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
        b=fQAHoRnbDXSa/0KKsdms3XWH/RZl3/OJqVwDoPgEZ77IfcrL0FCYYUaVyhbBuxdn3v
         Q9EJ/fLeyZdMqif8PqJVnl1Ki3uHGgoXAnFtna79iS2UitB1qV9hH66LXoKxyVY1U+Pe
         8tj/B79GXRlyM0IcZl0/PSkVfoD1HjfA1/wSjdnK0Ku+bh1/WRo+v0YWLPQQ/Jr8Q6GM
         t/BWeE5+eMGNpmXjamC0JkWvfr9yMBqsvYzd70879d23qdqfnT8m4JaqVKf71a0X4C7b
         Bhot56MIDiKxleOx1ebqjEwXQaUoNWDkxIUqA0KF0+XJngIVQ/p0yjgJj5v2JWwA88z4
         jRKg==
X-Forwarded-Encrypted: i=1; AL+hErElwQMqr09LLwOse8C/yiHC5oVpKmM6LBNw8zey2+gMWxRjRPIc6S214cH71wtbv2nyhJSiHUtI3WaO3DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BY0gHDoh0TsdIfPtCe6gAT512xRqZzKwMbIb55Ms9i22Cuwda
	hDaO5XMB/GqTPJHlY8wL7O0xN8AHMlGobvs0Dgm8PY/pFmRCRAJk1kI1
X-Gm-Gg: AYBFou3IONNZRKbQkdLwWQCCnmQ7wMLIo87/CD0tp+9XptGaMEvKfT1vNbAW84oOevT
	MW2GegCtxtvY4L2OdDjL+bHuSCOFobWqPKesLrnvfvg4e+doVxtiuP1whw09YAGSgEuhBR478Ai
	uQpUzYHMlG2zDlqcmhoe430UBueTkdgP0JYmxaX31WjlyK4EI/w4Ol00J2Sk9kuKX2Ix2WLXL/R
	y3OD4qLahJzNRDnB4wxPlno77U12xY5/u0F9MpwnRh7JY9lHhwkA0NsfX+8Iyo11VPeqfFcJhPB
	u21HOhWTG5D5PGcTzsGoF8nFDU3+irD8M1I+B4hgYEvGOM919YxvWRRNPHkfSb+537xzB1yeypr
	pDC9ZMVYtm1sH6ct1+fZW21R7SqnTXw6vG+9QAL0E7AOxV5UenHrcSNMt5/4irmjsY91WTvfN5v
	TVaQWQImcJUf7KmwwA92LfLGUVKP0JePZdBXBpMh2AaaG4Wut8Pl1XveoOclHsGsWk4fvEBSzOa
	Q6McPI1FpfLvddt/i6A4lGpVL+Y4p1mWP8P4o99QpMVg8mVsEEYKzd7lLUKIECYWjPEnPbmzt21
	sg1FAIHBnrtLrChmtPu81Tcwfb0TQoiS1Q==
X-Received: by 2002:a05:690c:f85:b0:8b3:2af9:11f9 with SMTP id 00721157ae682-8b4aa2dd1a7mr23701777b3.26.1794605057150;
        Fri, 13 Nov 2026 13:24:17 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:16 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 16:24:11 -0500
Subject: [PATCH bpf-next 2/2] bpf, parisc: Add support for BPF_MOVSX in the
 parisc32 JIT
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Post: <mailto:linux-parisc@vger.kernel.org>
List-Help: <mailto:linux-parisc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-parisc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-2-7ecc33cdf1b2@gmail.com>
References: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
In-Reply-To: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

RFC9669 defines BPF_MOV | BPF_X with an offset of 8, 16 or 32 as a
sign-extending move, dst = (s8,s16,s32)src. The parisc32 JIT handles it
like an ordinary register move, so r0 = (s8)r0 with 0x80 gives 128
instead of -128.

Add emit_movsx_r(). It sign-extends the low 8 or 16 bits of the source
low word with extrw,s, or copies the low word for a 32-bit extension,
and fills the high word with the sign for ALU64. For ALU32,
bpf_put_reg32() zeroes the high word unless the verifier inserts the
zero extension.

Under QEMU on a 32-bit kernel, with test_progs built as a static 32-bit
binary with jit_insns only:

  # ./test_progs -t jit_insns -w 0
  [...]
  #201/33  jit_insns/movsx:OK
  [...]
  Summary: 0/40 PASSED, 0 SKIPPED, 2/12 FAILED

Without this change jit_insns/movsx fails as well. The 12 failures left
fail without this change too.

Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp32.c | 41 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index eea0a34a3bfe..9cfbff3e58bb 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -705,6 +705,35 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 	bpf_put_reg32(dst, rd, ctx);
 }
 
+/* dst = sign_extend(src, width) */
+static void emit_movsx_r(const s8 *dst, const s8 *src,
+			 struct hppa_jit_context *ctx, u8 width, bool is64)
+{
+	const s8 *tmp1 = regmap[TMP_REG_1];
+	const s8 *tmp2 = regmap[TMP_REG_2];
+	const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
+	const s8 *rd;
+
+	if (is64)
+		rd = bpf_get_reg64_ref(dst, tmp1, false, ctx);
+	else
+		rd = bpf_get_reg32_ref(dst, tmp1, ctx);
+
+	/* Low word: sign-extend the field, or copy it for a 32-bit extension */
+	if (width == 32)
+		emit_hppa_copy(lo(rs), lo(rd), ctx);
+	else
+		emit(hppa_extrws(lo(rs), 31, 32 - width, lo(rd)), ctx);
+
+	if (is64) {
+		/* High word: copies of the sign bit */
+		emit(hppa_extrws(lo(rd), 0, 31, hi(rd)), ctx);
+		bpf_put_reg64(dst, rd, ctx);
+	} else {
+		bpf_put_reg32(dst, rd, ctx);
+	}
+}
+
 static int emit_branch_r64(const s8 *src1, const s8 *src2, s32 paoff,
 			   struct hppa_jit_context *ctx, const u8 op)
 {
@@ -1145,7 +1174,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 	switch (code) {
 	/* dst = src */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-
+		if (off == 8 || off == 16 || off == 32) {
+			/* Sign-extending mov: dst = (s8,s16,s32)src */
+			emit_movsx_r(dst, src, ctx, off, true);
+			break;
+		}
+		fallthrough;
 	case BPF_ALU64 | BPF_ADD | BPF_X:
 	case BPF_ALU64 | BPF_ADD | BPF_K:
 
@@ -1196,6 +1230,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_zext64(dst, ctx);
 			break;
 		}
+		if (off == 8 || off == 16) {
+			/* Sign-extending mov32: dst = (s8,s16)src */
+			emit_movsx_r(dst, src, ctx, off, false);
+			break;
+		}
 		fallthrough;
 	/* dst = dst OP src */
 	case BPF_ALU | BPF_ADD | BPF_X:

-- 
2.53.0

